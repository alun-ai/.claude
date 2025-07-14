# Performance Enhancement Module
# Provides parallel processing, caching, and incremental features

{ config, lib, pkgs, ... }:

let
  cfg = config.claudeCode.performance;
  inherit (lib) mkOption mkEnableOption types;

in {
  options.claudeCode.performance = {
    enable = mkEnableOption "performance optimizations";

    parallelJobs = mkOption {
      type = types.int;
      default = 4;
      description = "Number of parallel jobs for multi-language processing";
    };

    caching = {
      enable = mkEnableOption "dependency and build caching";
      
      cacheDir = mkOption {
        type = types.str;
        default = "$HOME/.cache/claude-code";
        description = "Directory for storing cache files";
      };

      maxSize = mkOption {
        type = types.str;
        default = "2G";
        description = "Maximum cache size";
      };

      ttl = mkOption {
        type = types.int;
        default = 86400; # 24 hours in seconds
        description = "Cache time-to-live in seconds";
      };
    };

    incremental = {
      enable = mkEnableOption "incremental processing for large projects";
      
      changeThreshold = mkOption {
        type = types.int;
        default = 10;
        description = "Number of changed files that triggers incremental mode";
      };

      excludePatterns = mkOption {
        type = types.listOf types.str;
        default = [ "*.log" "*.tmp" "node_modules/*" ".git/*" "target/*" "dist/*" ];
        description = "File patterns to exclude from incremental processing";
      };
    };

    optimization = {
      enableLTO = mkEnableOption "Link Time Optimization for native builds";
      enableParallelBuilds = mkEnableOption "parallel builds where supported";
      memoryLimit = mkOption {
        type = types.str;
        default = "4G";
        description = "Memory limit for resource-intensive operations";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    # Performance environment variables
    environment.sessionVariables = {
      # General performance settings
      MAKEFLAGS = "-j${toString cfg.parallelJobs}";
      CARGO_BUILD_JOBS = toString cfg.parallelJobs;
      NPM_CONFIG_JOBS = toString cfg.parallelJobs;
      
      # Node.js optimizations
      NODE_OPTIONS = "--max-old-space-size=${lib.removeSuffix "G" cfg.optimization.memoryLimit}000";
      UV_THREADPOOL_SIZE = toString (cfg.parallelJobs * 2);
      
      # Python optimizations
      PYTHONOPTIMIZE = "1";
      PYTHONDONTWRITEBYTECODE = "1";
      
      # Rust optimizations
      CARGO_INCREMENTAL = if cfg.incremental.enable then "1" else "0";
      RUSTC_WRAPPER = lib.optionalString cfg.caching.enable "sccache";
      
      # Go optimizations
      GOPROXY = "direct";
      GOSUMDB = "sum.golang.org";
      
      # Cache directory
      CLAUDE_CODE_CACHE_DIR = cfg.caching.cacheDir;
    };

    # Performance-oriented packages
    environment.systemPackages = with pkgs; [
      # Parallel processing tools
      parallel
      
      # Caching tools
      (lib.optionals cfg.caching.enable [
        sccache # Rust compilation cache
        ccache  # C/C++ compilation cache
      ])
      
      # Performance monitoring
      hyperfine  # Benchmarking
      time       # Time measurement
      htop       # System monitoring
      
      # Fast alternatives to common tools
      ripgrep    # Fast grep
      fd         # Fast find
      bat        # Fast cat with syntax highlighting
      exa        # Fast ls
      zoxide     # Fast cd
      
      # Build acceleration
      ninja      # Fast build system
      
      # Memory profiling
      valgrind   # Memory debugging
    ];

    # Shell functions for performance features
    programs.bash.initExtra = ''
      # Claude Code Performance Functions
      
      # Parallel command execution for multi-language projects
      claude_parallel() {
        local max_jobs=${toString cfg.parallelJobs}
        local commands=("$@")
        
        if command -v parallel >/dev/null 2>&1; then
          printf '%s\n' "''${commands[@]}" | parallel -j "$max_jobs"
        else
          # Fallback: run commands sequentially
          for cmd in "''${commands[@]}"; do
            echo "Running: $cmd"
            eval "$cmd"
          done
        fi
      }
      
      # Incremental processing helper
      claude_incremental() {
        local threshold=${toString cfg.incremental.changeThreshold}
        local exclude_patterns=(${lib.concatStringsSep " " (map (p: "\"${p}\"") cfg.incremental.excludePatterns)})
        
        if ! command -v git >/dev/null 2>&1; then
          echo "Git not available, running full processing"
          return 1
        fi
        
        # Count changed files since last commit
        local changed_files
        changed_files=$(git diff --name-only HEAD~1 2>/dev/null | wc -l)
        
        if [[ "$changed_files" -gt "$threshold" ]]; then
          echo "Found $changed_files changed files (threshold: $threshold), using incremental processing"
          return 0
        else
          echo "Only $changed_files changed files, running full processing"
          return 1
        fi
      }
      
      # Cache management functions
      ${lib.optionalString cfg.caching.enable ''
      claude_cache_clean() {
        local cache_dir="${cfg.caching.cacheDir}"
        local max_size="${cfg.caching.maxSize}"
        
        if [[ -d "$cache_dir" ]]; then
          echo "Cleaning cache directory: $cache_dir"
          
          # Remove files older than TTL
          find "$cache_dir" -type f -mtime +$((${toString cfg.caching.ttl} / 86400)) -delete 2>/dev/null || true
          
          # Check cache size and clean if necessary
          local current_size
          current_size=$(du -sh "$cache_dir" 2>/dev/null | cut -f1)
          echo "Current cache size: $current_size (max: $max_size)"
        fi
      }
      
      claude_cache_init() {
        local cache_dir="${cfg.caching.cacheDir}"
        mkdir -p "$cache_dir"/{npm,cargo,go,pip,nix}
        
        # Set up cache environment variables
        export NPM_CONFIG_CACHE="$cache_dir/npm"
        export CARGO_HOME="$cache_dir/cargo"
        export GOCACHE="$cache_dir/go"
        export PIP_CACHE_DIR="$cache_dir/pip"
        
        echo "✓ Cache initialized at $cache_dir"
      }
      ''}
      
      # Performance-optimized development commands
      claude_dev_fast() {
        if claude_incremental; then
          echo "🚀 Starting development with incremental optimizations"
          
          # Multi-language parallel development
          if [[ -f package.json ]] && [[ -f Cargo.toml ]]; then
            claude_parallel "npm run dev" "cargo watch -x run"
          elif [[ -f package.json ]]; then
            npm run dev
          elif [[ -f Cargo.toml ]]; then
            cargo watch -x run
          else
            echo "No recognized development setup found"
          fi
        else
          echo "🔄 Starting full development environment"
          claude_dev_standard
        fi
      }
      
      claude_build_fast() {
        echo "🔨 Fast build with performance optimizations"
        
        # Parallel builds for multi-language projects
        local build_commands=()
        
        [[ -f package.json ]] && build_commands+=("npm run build")
        [[ -f Cargo.toml ]] && build_commands+=("cargo build --release")
        [[ -f go.mod ]] && build_commands+=("go build -ldflags='-s -w' ./...")
        [[ -f pyproject.toml ]] && build_commands+=("python -m build")
        
        if [[ ''${#build_commands[@]} -gt 1 ]]; then
          echo "Running parallel builds for multiple languages"
          claude_parallel "''${build_commands[@]}"
        elif [[ ''${#build_commands[@]} -eq 1 ]]; then
          echo "Running single build: ''${build_commands[0]}"
          eval "''${build_commands[0]}"
        else
          echo "No build configuration found"
        fi
      }
      
      claude_test_fast() {
        echo "🧪 Fast testing with performance optimizations"
        
        # Parallel tests for multi-language projects
        local test_commands=()
        
        [[ -f package.json ]] && test_commands+=("npm test")
        [[ -f Cargo.toml ]] && test_commands+=("cargo test")
        [[ -f go.mod ]] && test_commands+=("go test ./...")
        [[ -f pyproject.toml ]] && test_commands+=("python -m pytest")
        
        if [[ ''${#test_commands[@]} -gt 1 ]]; then
          echo "Running parallel tests for multiple languages"
          claude_parallel "''${test_commands[@]}"
        elif [[ ''${#test_commands[@]} -eq 1 ]]; then
          echo "Running single test suite: ''${test_commands[0]}"
          eval "''${test_commands[0]}"
        else
          echo "No test configuration found"
        fi
      }
      
      # Initialize cache on shell startup
      ${lib.optionalString cfg.caching.enable "claude_cache_init"}
      
      # Performance aliases
      alias dev="claude_dev_fast"
      alias build="claude_build_fast"
      alias test="claude_test_fast"
      alias bench="hyperfine"
      alias monitor="htop"
      alias ls="exa --color=auto"
      alias ll="exa -la --color=auto"
      alias tree="exa --tree --color=auto"
      alias cat="bat --style=plain"
      alias cd="z" # Use zoxide for fast directory switching
    '';

    # Nix-specific optimizations
    nix.settings = lib.mkIf cfg.optimization.enableParallelBuilds {
      cores = cfg.parallelJobs;
      max-jobs = cfg.parallelJobs;
      auto-optimise-store = true;
    };

    # Git configuration for performance
    programs.git.extraConfig = {
      core.preloadindex = true;
      core.fscache = true;
      gc.auto = 256;
      fetch.parallel = cfg.parallelJobs;
      submodule.fetchJobs = cfg.parallelJobs;
    };

    # Systemd services for cache maintenance (on NixOS)
    systemd.user.services = lib.mkIf (cfg.caching.enable && pkgs.stdenv.isLinux) {
      claude-code-cache-cleanup = {
        description = "Claude Code cache cleanup";
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${pkgs.bash}/bin/bash -c 'claude_cache_clean'";
        };
      };
    };

    systemd.user.timers = lib.mkIf (cfg.caching.enable && pkgs.stdenv.isLinux) {
      claude-code-cache-cleanup = {
        description = "Daily Claude Code cache cleanup";
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "daily";
          Persistent = true;
        };
      };
    };
  };
}