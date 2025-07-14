# Flake configuration for modern Nix workflows
# Provides reproducible, lockable Claude Code environments

{
  description = "Enhanced Claude Code development environment with comprehensive tooling";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    
    # Optional: Home Manager for system-wide integration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        
        # Import our configuration system
        claudeCodeConfig = import ./configuration.nix {
          inherit pkgs;
          lib = pkgs.lib;
          stdenv = pkgs.stdenv;
        };

        # Create the development shell
        devShell = pkgs.mkShell {
          name = "claude-code-dev-env";
          
          # Import all packages from our configuration
          buildInputs = claudeCodeConfig.environment.systemPackages or [];
          
          # Shell initialization
          shellHook = ''
            # Welcome message
            echo "🚀 Claude Code Development Environment (Flake)"
            echo "=============================================="
            echo "System: ${system}"
            echo "Nixpkgs: ${nixpkgs.rev or "unknown"}"
            echo "Flake: ${self.rev or "dirty"}"
            echo
            
            # Set up environment variables
            export CLAUDE_CODE_FLAKE_ENABLED=true
            export CLAUDE_CODE_SYSTEM="${system}"
            export CLAUDE_CODE_NIXPKGS_REV="${nixpkgs.rev or "unknown"}"
            
            # Initialize our systems
            ${claudeCodeConfig.programs.bash.initExtra or ""}
            
            # Auto-initialize if enabled
            if [[ "$CLAUDE_CODE_AUTO_INIT" == "true" ]]; then
              echo "🔧 Auto-initializing Claude Code systems..."
              
              # Initialize command system
              claude-cmd init >/dev/null 2>&1 || true
              
              # Initialize cache
              cache-init >/dev/null 2>&1 || true
              
              # Quick validation
              claude-test validate >/dev/null 2>&1 || echo "⚠️  Initial validation had issues"
              
              echo "✅ Initialization complete"
            fi
            
            echo
            echo "Available commands: dev, build, test, lint, security, monitor"
            echo "Type 'help' or 'claude-cmd help' for more information"
            echo
          '';
          
          # Environment variables from our configuration
          shellAliases = claudeCodeConfig.programs.bash.shellAliases or {};
        };

        # Create specialized development shells for different purposes
        shells = {
          # Minimal shell with just core tools
          minimal = pkgs.mkShell {
            name = "claude-code-minimal";
            buildInputs = with pkgs; [ git curl jq ripgrep fd tree ];
            shellHook = ''
              echo "🧰 Claude Code Minimal Environment"
              export CLAUDE_CODE_MODE="minimal"
            '';
          };

          # Performance-focused shell
          performance = pkgs.mkShell {
            name = "claude-code-performance";
            buildInputs = devShell.buildInputs ++ (with pkgs; [ 
              hyperfine stress sysbench perf-tools 
            ]);
            shellHook = devShell.shellHook + ''
              export CLAUDE_CODE_MODE="performance"
              export CLAUDE_CODE_PERFORMANCE_FOCUS=true
              
              # Enable performance monitoring
              claude-monitor start &
              MONITOR_PID=$!
              
              # Cleanup on exit
              trap "kill $MONITOR_PID 2>/dev/null || true" EXIT
            '';
          };

          # Security-focused shell
          security = pkgs.mkShell {
            name = "claude-code-security";
            buildInputs = devShell.buildInputs ++ (with pkgs; [
              trivy semgrep gitleaks age sops
            ]);
            shellHook = devShell.shellHook + ''
              export CLAUDE_CODE_MODE="security"
              export CLAUDE_CODE_SECURITY_FOCUS=true
              
              # Auto-run security scan
              echo "🔒 Running security scan..."
              claude-security-scan quick || echo "⚠️  Security scan had issues"
            '';
          };

          # CI/CD simulation shell
          ci = pkgs.mkShell {
            name = "claude-code-ci";
            buildInputs = devShell.buildInputs;
            shellHook = ''
              echo "🚀 Claude Code CI/CD Environment"
              export CLAUDE_CODE_MODE="ci"
              export CI=true
              export CLAUDE_CODE_STRICT_MODE=true
              
              # Run CI workflow
              echo "Running CI workflow..."
              claude-cmd workflow ci
            '';
          };
        };

        # Apps that can be run with `nix run`
        apps = {
          # Default app runs the development workflow
          default = {
            type = "app";
            program = "${pkgs.writeShellScript "claude-code-dev" ''
              echo "🚀 Starting Claude Code development workflow"
              ${devShell.shellHook}
              claude-cmd workflow dev
            ''}";
          };

          # Security scanning app
          security-scan = {
            type = "app";
            program = "${pkgs.writeShellScript "claude-security" ''
              ${devShell.shellHook}
              claude-security-scan full
            ''}";
          };

          # Performance benchmark app
          benchmark = {
            type = "app";
            program = "${pkgs.writeShellScript "claude-benchmark" ''
              ${devShell.shellHook}
              claude-test benchmark
            ''}";
          };

          # System monitor app
          monitor = {
            type = "app";
            program = "${pkgs.writeShellScript "claude-monitor" ''
              ${devShell.shellHook}
              claude-monitor start
            ''}";
          };
        };

        # Packages that can be installed
        packages = {
          # Main Claude Code environment package
          default = pkgs.buildEnv {
            name = "claude-code-env";
            paths = claudeCodeConfig.environment.systemPackages or [];
            pathsToLink = [ "/bin" "/share" ];
          };

          # Individual tool packages
          claude-cmd = pkgs.writeShellScriptBin "claude-cmd" ''
            # Claude Code command system
            ${builtins.readFile ./modules/commands.nix}
          '';

          claude-security = pkgs.writeShellScriptBin "claude-security-scan" ''
            # Claude Code security scanner
            ${builtins.readFile ./modules/security.nix}
          '';

          claude-cache = pkgs.writeShellScriptBin "claude-cache-manager" ''
            # Claude Code cache manager
            ${builtins.readFile ./lib/cache-manager.nix}
          '';

          claude-test = pkgs.writeShellScriptBin "claude-test" ''
            # Claude Code testing framework
            ${builtins.readFile ./modules/testing.nix}
          '';
        };

        # Checks that run in CI
        checks = {
          # Configuration validation
          config-validation = pkgs.runCommand "claude-code-config-check" {} ''
            echo "Validating Claude Code configuration..."
            
            # Check Nix syntax
            ${pkgs.nix}/bin/nix-instantiate --parse ${./default.nix} > /dev/null
            
            # Check evaluation
            ${pkgs.nix}/bin/nix-instantiate --eval ${./default.nix} > /dev/null
            
            echo "✅ Configuration validation passed"
            touch $out
          '';

          # Shell script validation
          shell-script-check = pkgs.runCommand "claude-code-shell-check" {
            buildInputs = [ pkgs.shellcheck ];
          } ''
            echo "Checking shell scripts..."
            
            # Find and check all shell scripts
            find ${./.} -name "*.sh" -type f -exec shellcheck {} \;
            
            echo "✅ Shell script validation passed"
            touch $out
          '';

          # Documentation check
          docs-check = pkgs.runCommand "claude-code-docs-check" {
            buildInputs = [ pkgs.pandoc ];
          } ''
            echo "Validating documentation..."
            
            # Check README can be parsed
            pandoc ${./README.md} -t html > /dev/null
            pandoc ${./docs/SETUP.md} -t html > /dev/null
            
            echo "✅ Documentation validation passed"
            touch $out
          '';
        };

        # Development tools
        devTools = {
          # Formatter for Nix files
          format = pkgs.writeShellScriptBin "format-nix" ''
            echo "Formatting Nix files..."
            find . -name "*.nix" -type f -exec ${pkgs.nixfmt}/bin/nixfmt {} \;
            echo "✅ Formatting complete"
          '';

          # Update flake inputs
          update = pkgs.writeShellScriptBin "update-flake" ''
            echo "Updating flake inputs..."
            nix flake update
            echo "✅ Flake updated"
          '';

          # Build all outputs
          build-all = pkgs.writeShellScriptBin "build-all" ''
            echo "Building all flake outputs..."
            nix build .#default
            nix build .#claude-cmd
            nix build .#claude-security
            echo "✅ All outputs built successfully"
          '';
        };

      in {
        # Default development shell
        devShells.default = devShell;
        
        # Specialized shells
        devShells.minimal = shells.minimal;
        devShells.performance = shells.performance;
        devShells.security = shells.security;
        devShells.ci = shells.ci;

        # Runnable apps
        apps = apps;

        # Installable packages
        packages = packages // devTools;

        # CI checks
        checks = checks;

        # Formatter (for `nix fmt`)
        formatter = pkgs.nixfmt;
      }
    ) // {
      # Home Manager module for system-wide integration
      homeManagerModules.default = { config, lib, pkgs, ... }: {
        imports = [ ./configuration.nix ];
        
        # Enable Home Manager integration
        home.packages = config.claudeCode.environment.systemPackages or [];
        
        # Shell integration
        programs.bash.initExtra = config.claudeCode.programs.bash.initExtra or "";
        programs.bash.shellAliases = config.claudeCode.programs.bash.shellAliases or {};
        
        # Git configuration
        programs.git = lib.mkIf (config.claudeCode.user.email != "") {
          enable = true;
          userName = config.claudeCode.user.name;
          userEmail = config.claudeCode.user.email;
          extraConfig = config.claudeCode.programs.git.extraConfig or {};
        };
      };

      # Overlay for adding Claude Code tools to nixpkgs
      overlays.default = final: prev: {
        claude-code = self.packages.${final.system}.default;
        claude-cmd = self.packages.${final.system}.claude-cmd;
        claude-security = self.packages.${final.system}.claude-security;
        claude-cache = self.packages.${final.system}.claude-cache;
        claude-test = self.packages.${final.system}.claude-test;
      };

      # NixOS module for system-wide integration
      nixosModules.default = { config, lib, pkgs, ... }: {
        imports = [ ./configuration.nix ];
        
        # System packages
        environment.systemPackages = config.claudeCode.environment.systemPackages or [];
        
        # System environment variables
        environment.variables = config.claudeCode.environment.sessionVariables or {};
        
        # Enable for all users
        programs.bash.shellInit = config.claudeCode.programs.bash.initExtra or "";
      };
    };
}