# Claude Code Configuration Entry Point
# Provides modular configuration system with comprehensive error handling

{ config, lib, pkgs, ... }:

let
  cfg = config.claudeCode;
  inherit (lib) mkOption mkEnableOption types;

in {
  imports = [
    ./modules/project-detection.nix
    ./modules/error-handling.nix
  ];

  options.claudeCode = {
    enable = mkEnableOption "Claude Code development environment";

    projectPath = mkOption {
      type = types.str;
      default = ".";
      description = "Path to the project root directory";
    };

    user = {
      name = mkOption {
        type = types.str;
        default = "developer";
        description = "Developer name for git and other tools";
      };

      email = mkOption {
        type = types.str;
        default = "";
        description = "Developer email for git configuration";
      };
    };

    tools = {
      core = mkOption {
        type = types.listOf types.str;
        default = [
          "git" "gh" "curl" "wget" "jq" "yq" 
          "ripgrep" "fd" "tree" "direnv" "just" "jira-cli" "gemini-cli"
        ];
        description = "Core development tools to always include";
      };

      optional = mkOption {
        type = types.listOf types.str;
        default = [ "age" "sops" "docker" "kubectl" ];
        description = "Optional tools that may not be available on all systems";
      };
    };

    languages = {
      nodejs = {
        enable = mkEnableOption "Node.js support";
        version = mkOption {
          type = types.str;
          default = "20";
          description = "Node.js version to use";
        };
        packageManager = mkOption {
          type = types.enum [ "npm" "yarn" "pnpm" ];
          default = "npm";
          description = "Package manager to use";
        };
      };

      python = {
        enable = mkEnableOption "Python support";
        version = mkOption {
          type = types.str;
          default = "3.11";
          description = "Python version to use";
        };
      };

      rust = {
        enable = mkEnableOption "Rust support";
      };

      go = {
        enable = mkEnableOption "Go support";
      };
    };

    hooks = {
      preCommit = {
        enable = mkEnableOption "pre-commit hooks";
        commands = mkOption {
          type = types.listOf types.str;
          default = [];
          description = "Commands to run before commit";
        };
      };

      postCheckout = {
        enable = mkEnableOption "post-checkout hooks";
        commands = mkOption {
          type = types.listOf types.str;
          default = [ "direnv allow" ];
          description = "Commands to run after checkout";
        };
      };
    };

    security = {
      enableScanning = mkEnableOption "security vulnerability scanning";
      tools = mkOption {
        type = types.listOf types.str;
        default = [ "trivy" "safety" "audit" ];
        description = "Security scanning tools to include";
      };
    };

    performance = {
      enableParallelism = mkEnableOption "parallel processing for multi-language projects";
      cacheEnabled = mkEnableOption "dependency caching";
      incrementalProcessing = mkEnableOption "incremental processing for large projects";
    };

    monitoring = {
      enableMetrics = mkEnableOption "development metrics collection";
      tools = mkOption {
        type = types.listOf types.str;
        default = [ "hyperfine" "time" ];
        description = "Performance monitoring tools";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    # Ensure error handling is enabled
    errorHandling.enable = true;

    # Auto-detect languages based on project files
    claudeCode.languages = lib.mkDefault {
      nodejs.enable = lib.errorHandling.safePackage "nodejs" null != null && builtins.pathExists "${cfg.projectPath}/package.json";
      python.enable = lib.errorHandling.safePackage "python3" null != null && (
        builtins.pathExists "${cfg.projectPath}/pyproject.toml" ||
        builtins.pathExists "${cfg.projectPath}/requirements.txt"
      );
      rust.enable = lib.errorHandling.safePackage "rustc" null != null && builtins.pathExists "${cfg.projectPath}/Cargo.toml";
      go.enable = lib.errorHandling.safePackage "go" null != null && builtins.pathExists "${cfg.projectPath}/go.mod";
    };

    # Configure git if user details are provided
    programs.git = lib.mkIf (cfg.user.email != "") {
      enable = true;
      userName = cfg.user.name;
      userEmail = cfg.user.email;
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "code --wait";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };

    # Shell environment
    programs.bash = {
      enable = true;
      shellAliases = {
        # Git shortcuts
        gs = "git status";
        gc = "git commit";
        gp = "git push";
        gl = "git log --oneline";
        gd = "git diff";
        
        # Development shortcuts
        dev = "npm run dev 2>/dev/null || echo 'No dev script found'";
        build = "npm run build 2>/dev/null || echo 'No build script found'";
        test = "npm test 2>/dev/null || echo 'No test script found'";
        
        # Utility shortcuts
        ll = "ls -la";
        la = "ls -la";
        grep = "rg";
        find = "fd";
        cat = "bat --style=plain";
      };
      
      initExtra = ''
        # Claude Code Development Environment
        echo "🚀 Claude Code Development Environment"
        echo "Project: $(basename $(pwd))"
        
        # Load project-specific environment
        if [[ -f .env.local ]]; then
          set -a
          source .env.local
          set +a
          echo "✓ Loaded .env.local"
        fi
        
        # Auto-activate direnv
        if [[ -f .envrc ]] && command -v direnv >/dev/null; then
          direnv allow 2>/dev/null
          echo "✓ Activated direnv"
        fi
        
        # Project-specific PATH extensions
        export PATH="./node_modules/.bin:$PATH"
        export PATH="./venv/bin:$PATH"
        export PATH="./.local/bin:$PATH"
        
        # Development optimizations
        export NODE_OPTIONS="--max-old-space-size=4096"
        export PYTHONDONTWRITEBYTECODE=1
        export RUST_BACKTRACE=1
        export GO111MODULE=on
      '';
    };

    # Environment packages
    environment.systemPackages = with pkgs; 
      # Core tools
      (map (tool: lib.errorHandling.safePackage tool pkgs.hello) cfg.tools.core) ++
      
      # Optional tools (with fallbacks)
      (lib.filter (pkg: pkg != null) (map (tool: lib.errorHandling.safePackage tool null) cfg.tools.optional)) ++
      
      # Language-specific tools
      (lib.optionals cfg.languages.nodejs.enable [
        (lib.errorHandling.safePackage "nodejs_${cfg.languages.nodejs.version}" nodejs)
        (lib.errorHandling.safePackage "nodePackages.${cfg.languages.nodejs.packageManager}" nodePackages.npm)
        nodePackages.typescript
        nodePackages.eslint
        nodePackages.prettier
      ]) ++
      
      (lib.optionals cfg.languages.python.enable [
        (python3.withPackages (ps: with ps; [
          pip virtualenv black flake8 mypy pytest requests
        ]))
        poetry
        ruff
      ]) ++
      
      (lib.optionals cfg.languages.rust.enable [
        rustc cargo clippy rustfmt
      ]) ++
      
      (lib.optionals cfg.languages.go.enable [
        go golangci-lint delve
      ]) ++
      
      # Security tools
      (lib.optionals cfg.security.enableScanning (
        lib.filter (pkg: pkg != null) (map (tool: lib.errorHandling.safePackage tool null) cfg.security.tools)
      )) ++
      
      # Monitoring tools
      (lib.optionals cfg.monitoring.enableMetrics (
        lib.filter (pkg: pkg != null) (map (tool: lib.errorHandling.safePackage tool null) cfg.monitoring.tools)
      ));

    # System environment variables
    environment.sessionVariables = {
      CLAUDE_CODE_ENABLED = "true";
      CLAUDE_CODE_PROJECT_PATH = cfg.projectPath;
      EDITOR = "code";
      PAGER = "less -R";
    };
  };
}