# Error Handling Module
# Provides robust error handling and validation for Claude Code configurations

{ lib, pkgs, ... }:

let
  inherit (lib) types mkOption;

in {
  options = {
    errorHandling = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable enhanced error handling and validation";
      };

      validatePackages = mkOption {
        type = types.bool;
        default = true;
        description = "Validate that all requested packages are available";
      };

      fallbackBehavior = mkOption {
        type = types.enum [ "strict" "warn" "ignore" ];
        default = "warn";
        description = "Behavior when packages are not available: strict (fail), warn (continue with warning), ignore (silent)";
      };

      logLevel = mkOption {
        type = types.enum [ "debug" "info" "warn" "error" ];
        default = "info";
        description = "Logging level for error handling";
      };
    };
  };

  config = lib.mkIf (config.errorHandling.enable or true) {
    # Validation functions
    assertions = [
      {
        assertion = config.errorHandling.validatePackages -> (builtins.length (config.environment.systemPackages or []) > 0);
        message = "No packages specified for the development environment";
      }
    ];

    # Error handling utilities
    lib.errorHandling = {
      # Safely attempt to get a package, with fallback
      safePackage = packageName: fallback:
        if builtins.hasAttr packageName pkgs
        then builtins.getAttr packageName pkgs
        else if config.errorHandling.fallbackBehavior == "strict"
        then throw "Package '${packageName}' not found and fallbackBehavior is 'strict'"
        else if config.errorHandling.fallbackBehavior == "warn"
        then builtins.trace "Warning: Package '${packageName}' not found, using fallback" fallback
        else fallback;

      # Validate project structure
      validateProject = projectPath:
        let
          requiredFiles = [ ".git" ];
          missingFiles = lib.filter (file: !builtins.pathExists (projectPath + "/${file}")) requiredFiles;
        in
        if builtins.length missingFiles > 0
        then throw "Missing required files: ${lib.concatStringsSep ", " missingFiles}"
        else true;

      # Log messages with levels
      log = level: message:
        let
          levels = { debug = 0; info = 1; warn = 2; error = 3; };
          currentLevel = levels.${config.errorHandling.logLevel};
          messageLevel = levels.${level};
        in
        if messageLevel >= currentLevel
        then builtins.trace "[${lib.toUpper level}] Claude Code: ${message}" null
        else null;

      # Gracefully handle missing commands
      safeCommand = command: alternatives:
        let
          available = lib.filter (cmd: builtins.pathExists "${pkgs.${cmd}}/bin/${cmd}") ([command] ++ alternatives);
        in
        if builtins.length available > 0
        then builtins.head available
        else throw "None of the following commands are available: ${lib.concatStringsSep ", " ([command] ++ alternatives)}";

      # Check system compatibility
      checkCompatibility = 
        let
          supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
          currentSystem = pkgs.system or "unknown";
        in
        if lib.elem currentSystem supportedSystems
        then lib.errorHandling.log "info" "System ${currentSystem} is supported"
        else lib.errorHandling.log "warn" "System ${currentSystem} may not be fully supported";
    };

    # Environment validation
    environment.sessionVariables = {
      CLAUDE_CODE_ERROR_HANDLING = "enabled";
      CLAUDE_CODE_LOG_LEVEL = config.errorHandling.logLevel;
    };

    # Shell hook for runtime validation
    programs.bash.initExtra = ''
      # Claude Code error handling utilities
      claude_code_check_deps() {
        local missing_deps=()
        
        # Check for essential tools
        for tool in git curl jq; do
          if ! command -v "$tool" >/dev/null 2>&1; then
            missing_deps+=("$tool")
          fi
        done
        
        if [[ ''${#missing_deps[@]} -gt 0 ]]; then
          echo "⚠️  Missing dependencies: ''${missing_deps[*]}"
          echo "Consider updating your Nix configuration"
        fi
      }
      
      # Auto-check on shell startup
      claude_code_check_deps
    '';
  };
}