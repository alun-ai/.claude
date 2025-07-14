# Claude Code Nix Configuration Setup Guide

This guide walks you through setting up the enhanced Claude Code Nix configuration system from scratch.

## Prerequisites

1. **Nix Package Manager** (required)
   ```bash
   # Install Nix (multi-user installation recommended)
   curl -L https://nixos.org/nix/install | sh -s -- --daemon
   
   # Verify installation
   nix --version
   ```

2. **Direnv** (recommended for automatic environment activation)
   ```bash
   # Install direnv
   nix-env -iA nixpkgs.direnv
   
   # Add to shell (bash)
   echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
   
   # Add to shell (zsh)
   echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
   ```

3. **Git** (for project management)
   ```bash
   nix-env -iA nixpkgs.git
   ```

## Installation Methods

### Method 1: Automatic Setup (Recommended)

1. **Download the installer script**:
   ```bash
   curl -sSL https://raw.githubusercontent.com/your-repo/claude-code-nix/main/install.sh | bash
   ```

2. **Follow the interactive prompts**:
   - Choose your primary programming languages
   - Configure performance settings
   - Enable security scanning
   - Set up workflows

### Method 2: Manual Setup

1. **Create the nix directory in your project**:
   ```bash
   mkdir -p nix/modules nix/lib nix/docs
   ```

2. **Copy the configuration files**:
   ```bash
   # Copy all files from this configuration to your project's nix/ directory
   cp -r /path/to/claude-code-nix/* ./nix/
   ```

3. **Create shell.nix**:
   ```bash
   cat > shell.nix <<EOF
   # Import the Claude Code Nix configuration
   import ./nix/default.nix
   EOF
   ```

4. **Set up direnv (optional but recommended)**:
   ```bash
   cat > .envrc <<EOF
   # Use the Nix shell for this project
   use nix
   
   # Additional environment variables
   export CLAUDE_CODE_PROJECT_NAME="$(basename $(pwd))"
   export CLAUDE_CODE_AUTO_INIT=true
   EOF
   
   # Allow direnv to manage this directory
   direnv allow
   ```

### Method 3: Home Manager Integration

If you use Home Manager, you can integrate this configuration system-wide:

1. **Add to your Home Manager configuration**:
   ```nix
   # ~/.config/nixpkgs/home.nix
   { config, pkgs, ... }:
   
   {
     imports = [
       ./claude-code-nix/configuration.nix
     ];
     
     claudeCode = {
       enable = true;
       user = {
         name = "Your Name";
         email = "your.email@example.com";
       };
       
       # Enable features globally
       performance.enable = true;
       security.enable = true;
       commands.enable = true;
     };
   }
   ```

2. **Apply the configuration**:
   ```bash
   home-manager switch
   ```

## Initial Configuration

### 1. Basic Configuration

Create a local configuration file to customize your setup:

```bash
cat > nix/local-config.nix <<EOF
# Local Claude Code Configuration
{ config, lib, pkgs, ... }:

{
  claudeCode = {
    enable = true;
    
    # Your information
    user = {
      name = "$(git config user.name || echo "Developer")";
      email = "$(git config user.email || echo "dev@example.com")";
    };
    
    # Language support (enable what you use)
    languages = {
      nodejs.enable = $(test -f package.json && echo "true" || echo "false");
      python.enable = $(test -f requirements.txt -o -f pyproject.toml && echo "true" || echo "false");
      rust.enable = $(test -f Cargo.toml && echo "true" || echo "false");
      go.enable = $(test -f go.mod && echo "true" || echo "false");
    };
    
    # Performance features
    performance = {
      enable = true;
      parallelJobs = 4;  # Adjust based on your CPU cores
      
      caching = {
        enable = true;
        maxSize = "2G";
        ttl = 86400;  # 24 hours
      };
      
      incremental = {
        enable = true;
        changeThreshold = 10;
      };
    };
    
    # Security features
    security = {
      enable = true;
      scanning = {
        enable = true;
        tools = [ "trivy" "safety" "audit" ];
        schedule = "pre-commit";
        severity = "MEDIUM";
      };
      
      secrets.detection = true;
      compliance.enable = true;
    };
    
    # Command system
    commands = {
      enable = true;
      metrics.enable = true;
      automation.enable = true;
      intelligence.enable = true;
      monitoring.enable = true;
    };
  };
}
EOF
```

### 2. Project-Specific Configuration

For project-specific settings, you can override the configuration:

```bash
cat > nix/project-config.nix <<EOF
# Project-specific Claude Code Configuration
{ config, lib, pkgs, ... }:

{
  imports = [
    ./local-config.nix
  ];
  
  claudeCode = {
    # Override for this specific project
    performance.parallelJobs = lib.mkForce 8;
    
    # Add project-specific tools
    tools.optional = config.claudeCode.tools.optional ++ [
      "docker"
      "kubernetes"
      "terraform"
    ];
    
    # Project-specific workflows
    commands.automation.workflows = {
      deploy = {
        description = "Deploy to production";
        commands = [
          "npm run build"
          "docker build -t myapp ."
          "kubectl apply -f k8s/"
        ];
        condition = "test -f Dockerfile && test -d k8s";
      };
    };
  };
}
EOF
```

### 3. Update your default.nix

Modify the main configuration to use your local settings:

```bash
cat > nix/default.nix <<EOF
# Enhanced Claude Code Nix Configuration with local overrides
{ pkgs ? import <nixpkgs> { }
, lib ? pkgs.lib
, stdenv ? pkgs.stdenv
}:

let
  # Import base configuration
  baseConfig = import ./configuration.nix { inherit pkgs lib stdenv; };
  
  # Import local overrides if they exist
  localConfig = if builtins.pathExists ./local-config.nix
    then import ./local-config.nix { inherit pkgs lib stdenv; }
    else {};
    
  # Import project-specific overrides if they exist
  projectConfig = if builtins.pathExists ./project-config.nix
    then import ./project-config.nix { inherit pkgs lib stdenv; }
    else {};

in
  # Merge configurations with proper precedence
  lib.mkMerge [
    baseConfig
    localConfig
    projectConfig
  ]
EOF
```

## First Run

1. **Enter the development environment**:
   ```bash
   nix-shell
   # or if using direnv, just cd into the directory
   ```

2. **Initialize the system**:
   ```bash
   # Initialize command system and metrics
   claude-cmd init
   
   # Initialize cache system
   cache-init
   
   # Run initial security scan
   security
   
   # Check project analysis
   inc-status
   ```

3. **Verify everything works**:
   ```bash
   # Check available commands
   claude-cmd help
   
   # View project detection results
   echo $CLAUDE_CODE_PROJECT_TYPE
   
   # Test a simple workflow
   workflow dev
   
   # Check metrics dashboard
   dashboard
   ```

## Customization Examples

### Adding Custom Tools

```nix
# In your local-config.nix
claudeCode.tools.core = config.claudeCode.tools.core ++ [
  "custom-tool"
  "my-linter"
  "special-formatter"
];
```

### Custom Project Detection

```nix
# Add custom framework detection
claudeCode.projectDetection.customRules.myFramework = {
  files = [ "my-framework.config.js" "mf.json" ];
  priority = 5;
  packages = [ "my-framework-cli" "my-framework-dev" ];
};
```

### Custom Workflows

```bash
# Create custom workflow
mkdir -p ~/.config/claude-code/workflows

cat > ~/.config/claude-code/workflows/my-workflow.json <<EOF
{
  "description": "My custom development workflow",
  "condition": "test -f my-config.json",
  "parallel": false,
  "commands": [
    "echo 'Starting my workflow'",
    "my-custom-build",
    "my-custom-test",
    "my-custom-deploy"
  ]
}
EOF
```

### Custom Security Rules

```nix
# Add custom security scanning tools
claudeCode.security.scanning.tools = [
  "trivy"
  "safety"
  "audit"
  "my-custom-scanner"
];

# Custom secret patterns
claudeCode.security.secrets.patterns = [
  "password"
  "secret"
  "api_key"
  "my_custom_secret_pattern"
];
```

## Environment Variables

The configuration supports various environment variables for customization:

```bash
# Core settings
export CLAUDE_CODE_PROJECT_NAME="My Project"
export CLAUDE_CODE_AUTO_INIT=true
export CLAUDE_CODE_DEBUG=true

# Performance settings
export CLAUDE_CODE_PARALLEL_JOBS=8
export CLAUDE_CODE_CACHE_SIZE="4G"

# Security settings
export CLAUDE_CODE_SECURITY_LEVEL="HIGH"
export SECURITY_REPORT_DIR="./security-reports"

# Command system settings
export CLAUDE_CODE_METRICS_ENABLED=true
export CLAUDE_CODE_LEARNING_ENABLED=true
```

## Integration with Existing Projects

### For Node.js Projects

```bash
# Add to package.json scripts
{
  "scripts": {
    "dev:nix": "nix-shell --run 'npm run dev'",
    "build:nix": "nix-shell --run 'workflow ci'",
    "security": "nix-shell --run 'security'",
    "metrics": "nix-shell --run 'dashboard'"
  }
}
```

### For Python Projects

```bash
# Add to pyproject.toml
[tool.claude-code]
enabled = true
security_scan = true
incremental_builds = true
cache_dependencies = true
```

### For Rust Projects

```bash
# Add to Cargo.toml
[package.metadata.claude-code]
parallel_builds = true
security_audit = true
performance_monitoring = true
```

## Continuous Integration

### GitHub Actions Integration

```yaml
# .github/workflows/claude-code.yml
name: Claude Code CI

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: cachix/install-nix-action@v18
      - name: Run Claude Code CI workflow
        run: nix-shell --run 'workflow ci'
      - name: Upload security reports
        uses: actions/upload-artifact@v3
        with:
          name: security-reports
          path: .security-reports/
```

### GitLab CI Integration

```yaml
# .gitlab-ci.yml
claude-code-ci:
  image: nixos/nix
  before_script:
    - nix-channel --update
  script:
    - nix-shell --run 'workflow ci'
  artifacts:
    paths:
      - .security-reports/
    reports:
      junit: .security-reports/junit-*.xml
```

## Troubleshooting Setup

### Common Issues

1. **Nix not found**:
   ```bash
   # Make sure Nix is in PATH
   echo $PATH | grep nix
   
   # Source the nix profile
   source ~/.nix-profile/etc/profile.d/nix.sh
   ```

2. **Permission denied**:
   ```bash
   # Fix nix store permissions
   sudo chown -R $(whoami) /nix/store
   
   # Or run with sudo if needed
   sudo nix-shell
   ```

3. **Configuration errors**:
   ```bash
   # Validate Nix syntax
   nix-instantiate --parse nix/default.nix
   
   # Check for missing imports
   nix-instantiate --eval nix/default.nix
   ```

4. **Package not found**:
   ```bash
   # Search for packages
   nix search nixpkgs package-name
   
   # Update channel
   nix-channel --update
   ```

### Debug Mode

Enable debug output for troubleshooting:

```bash
export NIX_DEBUG=1
export CLAUDE_CODE_DEBUG=1
nix-shell --verbose
```

### Getting Help

1. Check the logs:
   ```bash
   # Nix logs
   journalctl -u nix-daemon
   
   # Claude Code logs
   ls -la ~/.cache/claude-code/logs/
   ```

2. Validate configuration:
   ```bash
   # Test configuration loading
   nix-shell --dry-run
   
   # Check specific modules
   nix-instantiate --eval -A claudeCode nix/default.nix
   ```

3. Reset to defaults:
   ```bash
   # Backup current config
   cp -r nix nix.backup
   
   # Reset to minimal configuration
   echo 'import <nixpkgs> {}' > nix/default.nix
   nix-shell
   ```

## Next Steps

After successful setup:

1. **Explore the features**: Try different commands and workflows
2. **Customize for your needs**: Add project-specific tools and workflows
3. **Set up CI/CD integration**: Automate your development workflow
4. **Monitor and optimize**: Use the metrics dashboard to improve performance
5. **Share with team**: Document your configuration for team members

See the main [README.md](../README.md) for detailed usage instructions and advanced features.