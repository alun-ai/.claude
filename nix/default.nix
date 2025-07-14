# Enhanced Claude Code Nix Configuration
# Provides a comprehensive development environment with reproducible dependencies

{ pkgs ? import <nixpkgs> { }
, lib ? pkgs.lib
, stdenv ? pkgs.stdenv
}:

let
  # Pin specific versions for reproducibility
  nodeVersion = "20"; # LTS version
  pythonVersion = "3.11";
  
  # Project detection utilities
  projectTypes = {
    hasNodeProject = builtins.pathExists ./package.json;
    hasPythonProject = builtins.pathExists ./pyproject.toml || builtins.pathExists ./requirements.txt || builtins.pathExists ./setup.py;
    hasRustProject = builtins.pathExists ./Cargo.toml;
    hasGoProject = builtins.pathExists ./go.mod;
    hasJavaProject = builtins.pathExists ./pom.xml || builtins.pathExists ./build.gradle;
    hasDockerProject = builtins.pathExists ./Dockerfile;
    hasSupabaseProject = builtins.pathExists ./supabase;
    hasVercelProject = builtins.pathExists ./vercel.json;
  };

  # Core development tools (always included)
  coreTools = with pkgs; [
    # Version control and collaboration
    git
    gh # GitHub CLI
    
    # Text processing and utilities
    jq
    yq
    ripgrep
    fd
    tree
    
    # Network and API tools
    curl
    wget
    
    # Development utilities
    direnv
    just # Command runner
    
    # Security tools
    age # Encryption
    sops # Secret management
  ];

  # Language-specific tools based on project detection
  languageTools = with pkgs; lib.flatten [
    # Node.js ecosystem
    (lib.optionals projectTypes.hasNodeProject [
      nodejs_20
      nodePackages.npm
      nodePackages.pnpm
      nodePackages.yarn
      nodePackages.typescript
      nodePackages.eslint
      nodePackages.prettier
      nodePackages."@commitlint/cli"
    ])
    
    # Python ecosystem
    (lib.optionals projectTypes.hasPythonProject [
      (python3.withPackages (ps: with ps; [
        pip
        virtualenv
        black
        flake8
        mypy
        pytest
        requests
      ]))
      poetry
      ruff # Fast Python linter
    ])
    
    # Rust ecosystem
    (lib.optionals projectTypes.hasRustProject [
      rustc
      cargo
      clippy
      rustfmt
    ])
    
    # Go ecosystem  
    (lib.optionals projectTypes.hasGoProject [
      go
      golangci-lint
      delve # Go debugger
    ])
    
    # Java ecosystem
    (lib.optionals projectTypes.hasJavaProject [
      openjdk17
      maven
      gradle
    ])
    
    # Docker tools
    (lib.optionals projectTypes.hasDockerProject [
      docker
      docker-compose
      hadolint # Dockerfile linter
    ])
    
    # Supabase tools
    (lib.optionals projectTypes.hasSupabaseProject [
      supabase-cli
      postgresql_15
    ])
  ];

  # Development environment packages
  devPackages = coreTools ++ languageTools;

  # Claude Code specific configuration
  claudeCodeConfig = {
    # Hook configurations for automatic code quality
    hooks = {
      pre-commit = {
        enable = true;
        commands = lib.flatten [
          (lib.optionals projectTypes.hasNodeProject [
            "npm run lint"
            "npm run typecheck"
          ])
          (lib.optionals projectTypes.hasPythonProject [
            "ruff check ."
            "black --check ."
            "mypy ."
          ])
          (lib.optionals projectTypes.hasRustProject [
            "cargo clippy"
            "cargo fmt --check"
          ])
          (lib.optionals projectTypes.hasGoProject [
            "golangci-lint run"
            "go fmt ./..."
          ])
        ];
      };
      
      post-checkout = {
        enable = true;
        commands = [
          "direnv allow"
        ] ++ lib.optionals projectTypes.hasNodeProject [
          "npm install"
        ];
      };
    };
    
    # Environment variables for optimal development
    environment = {
      # Node.js optimizations
      NODE_ENV = "development";
      NODE_OPTIONS = "--max-old-space-size=4096";
      
      # Python optimizations
      PYTHONPATH = "./src";
      PYTHONDONTWRITEBYTECODE = "1";
      
      # Development tool configurations
      EDITOR = "code";
      PAGER = "less -R";
      
      # Claude Code specific
      CLAUDE_CODE_PROJECT_TYPE = lib.concatStringsSep "," (
        lib.filter (x: x != "") (
          lib.mapAttrsToList (name: enabled: if enabled then name else "") projectTypes
        )
      );
    };
    
    # Shell aliases for common operations
    shellAliases = {
      # Git shortcuts
      gs = "git status";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline";
      
      # Development shortcuts
      dev = if projectTypes.hasNodeProject then "npm run dev" else "echo 'No dev script found'";
      build = if projectTypes.hasNodeProject then "npm run build" else "echo 'No build script found'";
      test = if projectTypes.hasNodeProject then "npm test" else "echo 'No test script found'";
      
      # Utility shortcuts
      ll = "ls -la";
      grep = "rg";
      find = "fd";
    };
  };

  # Shell initialization script
  shellInit = ''
    # Welcome message with project information
    echo "🚀 Claude Code Development Environment"
    echo "Project types detected: $CLAUDE_CODE_PROJECT_TYPE"
    echo "Available commands: dev, build, test, gs, gc, gp"
    echo ""
    
    # Auto-activate direnv if .envrc exists
    if [ -f .envrc ]; then
      direnv allow 2>/dev/null || true
    fi
    
    # Set up project-specific paths
    export PATH="./node_modules/.bin:$PATH"
    export PATH="./venv/bin:$PATH"
    
    # Load project-specific environment
    if [ -f .env.local ]; then
      set -a
      source .env.local
      set +a
    fi
  '';

in

pkgs.mkShell {
  name = "claude-code-dev-env";
  
  buildInputs = devPackages;
  
  shellHook = shellInit;
  
  # Environment variables
  inherit (claudeCodeConfig.environment) NODE_ENV NODE_OPTIONS PYTHONPATH PYTHONDONTWRITEBYTECODE EDITOR PAGER CLAUDE_CODE_PROJECT_TYPE;
  
  # Shell aliases
  shellAliases = claudeCodeConfig.shellAliases;
  
  # Meta information
  meta = with lib; {
    description = "Enhanced Claude Code development environment with smart project detection";
    maintainers = [ "claude-code" ];
    platforms = platforms.unix;
  };
  
  # Development tools summary
  passthru = {
    detectedProjects = projectTypes;
    availableTools = map (pkg: pkg.name or pkg.pname or "unknown") devPackages;
    hooks = claudeCodeConfig.hooks;
  };
}