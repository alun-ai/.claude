# Incremental Processing System
# Provides smart incremental builds and processing for large projects

{ config, lib, pkgs, ... }:

let
  cfg = config.claudeCode.performance.incremental;
  inherit (lib) types;

  # File change tracking utilities
  changeTracker = ''
    # Change tracking utilities
    get_project_hash() {
      local project_root="''${1:-.}"
      local exclude_patterns=(${lib.concatStringsSep " " (map (p: "'${p}'") cfg.excludePatterns)})
      
      # Create a hash of all relevant files
      find "$project_root" -type f \( ${lib.concatStringsSep " -o " (map (p: "-path '${p}'") cfg.excludePatterns)} \) -prune -o -type f -print0 | \
        xargs -0 stat -c '%Y %n' 2>/dev/null | \
        sort | \
        sha256sum | \
        cut -d' ' -f1
    }
    
    get_changed_files() {
      local since_commit="''${1:-HEAD~1}"
      local project_root="''${2:-.}"
      
      if command -v git >/dev/null 2>&1 && [[ -d "$project_root/.git" ]]; then
        git -C "$project_root" diff --name-only "$since_commit" 2>/dev/null || echo ""
      else
        # Fallback: use find with mtime
        find "$project_root" -type f -mtime -1 2>/dev/null || echo ""
      fi
    }
    
    should_use_incremental() {
      local threshold=${toString cfg.changeThreshold}
      local changed_files
      changed_files=$(get_changed_files | wc -l)
      
      if [[ $changed_files -lt $threshold ]]; then
        echo "true"
        return 0
      else
        echo "false"
        return 1
      fi
    }
    
    get_affected_modules() {
      local changed_files="$1"
      local project_root="''${2:-.}"
      local affected_modules=()
      
      # Language-specific module detection
      while IFS= read -r file; do
        [[ -z "$file" ]] && continue
        
        case "$file" in
          src/*)
            affected_modules+=("src")
            ;;
          lib/*)
            affected_modules+=("lib")
            ;;
          components/*)
            affected_modules+=("components")
            ;;
          pages/*)
            affected_modules+=("pages")
            ;;
          app/*)
            affected_modules+=("app")
            ;;
          tests/*)
            affected_modules+=("tests")
            ;;
          *.rs)
            affected_modules+=("rust")
            ;;
          *.go)
            affected_modules+=("go")
            ;;
          *.py)
            affected_modules+=("python")
            ;;
          *.js|*.ts|*.jsx|*.tsx)
            affected_modules+=("javascript")
            ;;
          package.json|yarn.lock|pnpm-lock.yaml)
            affected_modules+=("dependencies")
            ;;
          Cargo.toml|Cargo.lock)
            affected_modules+=("rust-deps")
            ;;
          go.mod|go.sum)
            affected_modules+=("go-deps")
            ;;
          pyproject.toml|requirements.txt)
            affected_modules+=("python-deps")
            ;;
        esac
      done <<< "$changed_files"
      
      # Remove duplicates and echo
      printf '%s\n' "''${affected_modules[@]}" | sort -u
    }
  '';

  # Incremental build strategies
  buildStrategies = ''
    # Incremental build strategies for different project types
    
    incremental_npm_build() {
      local affected_modules="$1"
      local use_incremental="$2"
      
      if [[ "$use_incremental" == "true" ]] && command -v npm >/dev/null 2>&1; then
        if echo "$affected_modules" | grep -q "dependencies"; then
          echo "📦 Dependencies changed, full npm install required"
          npm install
        fi
        
        if echo "$affected_modules" | grep -q -E "(javascript|src|components|pages|app)"; then
          echo "🔨 Running incremental TypeScript compilation"
          npx tsc --incremental --build
        fi
        
        if [[ -f "turbo.json" ]]; then
          echo "🚀 Using Turbo for incremental builds"
          npx turbo build --filter="[HEAD~1]"
        elif [[ -f "nx.json" ]]; then
          echo "🚀 Using Nx for affected builds"
          npx nx affected --target=build
        else
          echo "🔨 Standard incremental build"
          npm run build
        fi
      else
        echo "🔄 Full npm build"
        npm run build
      fi
    }
    
    incremental_cargo_build() {
      local affected_modules="$1"
      local use_incremental="$2"
      
      if [[ "$use_incremental" == "true" ]] && command -v cargo >/dev/null 2>&1; then
        if echo "$affected_modules" | grep -q "rust-deps"; then
          echo "📦 Rust dependencies changed, cleaning target directory"
          cargo clean
        fi
        
        echo "🦀 Running incremental Cargo build"
        CARGO_INCREMENTAL=1 cargo build --release
      else
        echo "🔄 Full Cargo build"
        cargo build --release
      fi
    }
    
    incremental_go_build() {
      local affected_modules="$1"
      local use_incremental="$2"
      
      if [[ "$use_incremental" == "true" ]] && command -v go >/dev/null 2>&1; then
        if echo "$affected_modules" | grep -q "go-deps"; then
          echo "📦 Go dependencies changed, updating modules"
          go mod download
        fi
        
        echo "🐹 Running incremental Go build"
        go build -o ./bin/ ./...
      else
        echo "🔄 Full Go build"
        go build -o ./bin/ ./...
      fi
    }
    
    incremental_python_build() {
      local affected_modules="$1"
      local use_incremental="$2"
      
      if [[ "$use_incremental" == "true" ]] && command -v python >/dev/null 2>&1; then
        if echo "$affected_modules" | grep -q "python-deps"; then
          echo "📦 Python dependencies changed, reinstalling"
          if command -v poetry >/dev/null 2>&1; then
            poetry install
          else
            pip install -r requirements.txt
          fi
        fi
        
        echo "🐍 Running incremental Python build"
        if [[ -f "pyproject.toml" ]]; then
          python -m build --wheel
        fi
      else
        echo "🔄 Full Python build"
        if [[ -f "pyproject.toml" ]]; then
          python -m build
        fi
      fi
    }
  '';

  # Test optimization strategies
  testOptimization = ''
    # Incremental testing strategies
    
    incremental_test() {
      local affected_modules="$1"
      local use_incremental="$2"
      
      echo "🧪 Starting incremental test execution"
      
      if [[ "$use_incremental" == "true" ]]; then
        echo "📊 Running tests for affected modules: $(echo "$affected_modules" | tr '\n' ' ')"
        
        # Run tests based on affected modules
        while IFS= read -r module; do
          [[ -z "$module" ]] && continue
          
          case "$module" in
            "javascript"|"src"|"components"|"pages"|"app")
              if command -v npm >/dev/null 2>&1; then
                echo "🧪 Running JavaScript/TypeScript tests"
                if [[ -f "jest.config.js" || -f "jest.config.json" ]]; then
                  npx jest --changedSince=HEAD~1 --passWithNoTests
                elif [[ -f "vitest.config.js" || -f "vitest.config.ts" ]]; then
                  npx vitest run --changed HEAD~1
                else
                  npm test
                fi
              fi
              ;;
            "rust")
              if command -v cargo >/dev/null 2>&1; then
                echo "🦀 Running Rust tests"
                cargo test --lib
              fi
              ;;
            "go")
              if command -v go >/dev/null 2>&1; then
                echo "🐹 Running Go tests"
                go test ./...
              fi
              ;;
            "python")
              if command -v python >/dev/null 2>&1; then
                echo "🐍 Running Python tests"
                if command -v pytest >/dev/null 2>&1; then
                  pytest --lf --tb=short
                else
                  python -m unittest discover
                fi
              fi
              ;;
            "tests")
              echo "🧪 Test files changed, running full test suite"
              run_full_tests
              return
              ;;
          esac
        done <<< "$affected_modules"
      else
        echo "🔄 Running full test suite"
        run_full_tests
      fi
    }
    
    run_full_tests() {
      # Run all available test suites
      [[ -f package.json ]] && npm test
      [[ -f Cargo.toml ]] && cargo test
      [[ -f go.mod ]] && go test ./...
      [[ -f pyproject.toml || -f requirements.txt ]] && python -m pytest 2>/dev/null || python -m unittest discover 2>/dev/null
    }
  '';

  # Lint optimization
  lintOptimization = ''
    # Incremental linting strategies
    
    incremental_lint() {
      local changed_files="$1"
      local use_incremental="$2"
      
      if [[ "$use_incremental" == "true" ]] && [[ -n "$changed_files" ]]; then
        echo "🔍 Running incremental linting on changed files"
        
        # Lint only changed files
        while IFS= read -r file; do
          [[ -z "$file" ]] && continue
          [[ ! -f "$file" ]] && continue
          
          case "$file" in
            *.js|*.ts|*.jsx|*.tsx)
              if command -v eslint >/dev/null 2>&1; then
                echo "🔍 Linting: $file"
                eslint "$file" --fix 2>/dev/null || true
              fi
              if command -v prettier >/dev/null 2>&1; then
                prettier --write "$file" 2>/dev/null || true
              fi
              ;;
            *.rs)
              if command -v cargo >/dev/null 2>&1; then
                echo "🦀 Formatting: $file"
                cargo fmt
                cargo clippy --fix --allow-dirty 2>/dev/null || true
              fi
              ;;
            *.go)
              if command -v go >/dev/null 2>&1; then
                echo "🐹 Formatting: $file"
                go fmt "$file"
                if command -v golangci-lint >/dev/null 2>&1; then
                  golangci-lint run "$file" 2>/dev/null || true
                fi
              fi
              ;;
            *.py)
              if command -v black >/dev/null 2>&1; then
                echo "🐍 Formatting: $file"
                black "$file" 2>/dev/null || true
              fi
              if command -v ruff >/dev/null 2>&1; then
                ruff check --fix "$file" 2>/dev/null || true
              fi
              ;;
          esac
        done <<< "$changed_files"
      else
        echo "🔄 Running full linting"
        run_full_lint
      fi
    }
    
    run_full_lint() {
      # Run all available linters
      [[ -f package.json ]] && npm run lint 2>/dev/null || true
      [[ -f Cargo.toml ]] && cargo clippy && cargo fmt
      [[ -f go.mod ]] && go fmt ./... && golangci-lint run 2>/dev/null || true
      [[ -f pyproject.toml || -f requirements.txt ]] && black . 2>/dev/null || true && ruff check . 2>/dev/null || true
    }
  '';

in {
  # Main incremental processor script
  incrementalProcessorScript = pkgs.writeShellScriptBin "claude-incremental" ''
    #!/bin/bash
    
    # Incremental processing configuration
    INCREMENTAL_THRESHOLD=${toString cfg.changeThreshold}
    PROJECT_ROOT="''${1:-.}"
    CACHE_DIR="''${CLAUDE_CODE_CACHE_DIR:-$HOME/.cache/claude-code}"
    
    ${changeTracker}
    ${buildStrategies}
    ${testOptimization}
    ${lintOptimization}
    
    # Main incremental processing function
    run_incremental_process() {
      local command="$1"
      local project_root="''${2:-.}"
      
      echo "🚀 Claude Code Incremental Processing"
      echo "Project: $(basename "$(realpath "$project_root")")"
      echo "Command: $command"
      echo
      
      # Check if incremental processing should be used
      local use_incremental
      use_incremental=$(should_use_incremental)
      
      if [[ "$use_incremental" == "true" ]]; then
        echo "✅ Using incremental processing (< $INCREMENTAL_THRESHOLD changed files)"
      else
        echo "🔄 Using full processing (≥ $INCREMENTAL_THRESHOLD changed files)"
      fi
      
      # Get changed files and affected modules
      local changed_files
      changed_files=$(get_changed_files)
      
      local affected_modules
      affected_modules=$(get_affected_modules "$changed_files" "$project_root")
      
      if [[ "$use_incremental" == "true" ]] && [[ -n "$affected_modules" ]]; then
        echo "📊 Affected modules: $(echo "$affected_modules" | tr '\n' ' ')"
      fi
      
      echo
      
      # Execute the requested command
      case "$command" in
        "build")
          echo "🔨 Starting incremental build process"
          
          # Run builds for detected project types
          [[ -f package.json ]] && incremental_npm_build "$affected_modules" "$use_incremental"
          [[ -f Cargo.toml ]] && incremental_cargo_build "$affected_modules" "$use_incremental"
          [[ -f go.mod ]] && incremental_go_build "$affected_modules" "$use_incremental"
          [[ -f pyproject.toml || -f requirements.txt ]] && incremental_python_build "$affected_modules" "$use_incremental"
          ;;
          
        "test")
          echo "🧪 Starting incremental test process"
          incremental_test "$affected_modules" "$use_incremental"
          ;;
          
        "lint")
          echo "🔍 Starting incremental lint process"
          incremental_lint "$changed_files" "$use_incremental"
          ;;
          
        "all")
          echo "🚀 Running full incremental development cycle"
          run_incremental_process "lint" "$project_root"
          echo
          run_incremental_process "build" "$project_root"
          echo
          run_incremental_process "test" "$project_root"
          ;;
          
        "status")
          echo "📊 Incremental Processing Status"
          echo "================================"
          echo "Project root: $project_root"
          echo "Threshold: $INCREMENTAL_THRESHOLD files"
          echo "Use incremental: $use_incremental"
          echo
          
          if [[ -n "$changed_files" ]]; then
            echo "Changed files:"
            echo "$changed_files" | head -10
            [[ $(echo "$changed_files" | wc -l) -gt 10 ]] && echo "... and $(( $(echo "$changed_files" | wc -l) - 10 )) more"
          else
            echo "No changed files detected"
          fi
          
          if [[ -n "$affected_modules" ]]; then
            echo
            echo "Affected modules:"
            echo "$affected_modules"
          fi
          ;;
          
        *)
          echo "Claude Code Incremental Processor"
          echo "Usage: $0 {build|test|lint|all|status} [project_root]"
          echo
          echo "Commands:"
          echo "  build   - Run incremental builds"
          echo "  test    - Run incremental tests"
          echo "  lint    - Run incremental linting"
          echo "  all     - Run complete incremental cycle"
          echo "  status  - Show incremental processing status"
          ;;
      esac
      
      echo
      echo "✅ Incremental processing complete"
    }
    
    # Execute main function
    run_incremental_process "''${@}"
  '';

  # Shell aliases and functions for incremental processing
  incrementalShellInit = ''
    # Claude Code Incremental Processing
    
    # Smart aliases that automatically use incremental processing
    alias build="claude-incremental build"
    alias test="claude-incremental test"
    alias lint="claude-incremental lint"
    alias dev-cycle="claude-incremental all"
    alias inc-status="claude-incremental status"
    
    # Watch mode with incremental processing
    claude_watch() {
      local command="''${1:-build}"
      echo "👀 Watching for changes, running incremental $command"
      
      if command -v watchexec >/dev/null 2>&1; then
        watchexec -w . -i .git -i node_modules -i target -i dist -- claude-incremental "$command"
      elif command -v inotifywait >/dev/null 2>&1; then
        while inotifywait -r -e modify,create,delete .; do
          claude-incremental "$command"
        done
      else
        echo "⚠️  No file watcher available. Install watchexec or inotify-tools"
        echo "Running one-time incremental $command"
        claude-incremental "$command"
      fi
    }
    
    # Pre-commit hook integration
    claude_precommit() {
      echo "🔍 Running pre-commit incremental checks"
      claude-incremental lint
      if [[ $? -eq 0 ]]; then
        claude-incremental test
      else
        echo "❌ Linting failed, skipping tests"
        return 1
      fi
    }
    
    # Performance measurement
    claude_benchmark() {
      local command="''${1:-build}"
      echo "⏱️  Benchmarking incremental vs full $command"
      
      if command -v hyperfine >/dev/null 2>&1; then
        hyperfine \
          --warmup 1 \
          --export-json "benchmark-$command.json" \
          "claude-incremental $command" \
          "FORCE_FULL=1 claude-incremental $command"
      else
        echo "Installing hyperfine for benchmarking..."
        # Time both approaches manually
        echo "Timing incremental approach:"
        time claude-incremental "$command"
        echo
        echo "Timing full approach:"
        FORCE_FULL=1 time claude-incremental "$command"
      fi
    }
    
    # Export incremental functions
    export -f claude_watch claude_precommit claude_benchmark
  '';
}