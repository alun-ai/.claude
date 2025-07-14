# Claude Code Nix Configuration

A comprehensive, modular Nix configuration system for Claude Code development environments with intelligent project detection, performance optimization, security scanning, and advanced command management.

## 🚀 Features

### 🎯 Phase 1: Foundation
- **Smart Project Detection**: Automatically detects project types (Node.js, Python, Rust, Go, Java, Docker, etc.)
- **Declarative Package Management**: Reproducible development environments with pinned versions
- **Robust Error Handling**: Graceful fallbacks and comprehensive validation
- **Modular Architecture**: Clean separation of concerns with reusable modules

### ⚡ Phase 2: Performance
- **Parallel Processing**: Multi-language builds and tests run concurrently
- **Intelligent Caching**: Advanced dependency caching with automatic optimization
- **Incremental Processing**: Smart detection of changes for faster development cycles
- **Resource Optimization**: Memory and CPU usage optimization across all tools

### 🔒 Phase 3: Advanced Features
- **Security Scanning**: Integrated vulnerability detection with multiple tools (Trivy, Semgrep, etc.)
- **Command Intelligence**: AI-powered command suggestions and learning
- **Metrics Collection**: Comprehensive development metrics and performance insights
- **Workflow Automation**: Predefined and custom development workflows

### 📚 Phase 4: Polish
- **Comprehensive Documentation**: Detailed guides and examples
- **Testing Framework**: Automated testing of configurations
- **Monitoring Dashboard**: Real-time insights into development performance
- **Best Practices**: Industry-standard development patterns

## 🛠 Quick Start

### Installation

1. **Clone or copy the configuration**:
   ```bash
   # In your project directory
   mkdir -p nix
   # Copy the nix configuration files here
   ```

2. **Enable the configuration**:
   ```bash
   # Create a shell.nix file
   echo 'import ./nix/default.nix' > shell.nix
   
   # Or use direnv (recommended)
   echo 'use nix' > .envrc
   direnv allow
   ```

3. **Enter the development environment**:
   ```bash
   nix-shell
   # or if using direnv, just cd into the directory
   ```

### Basic Usage

The configuration automatically detects your project type and sets up the appropriate tools:

```bash
# The shell provides intelligent aliases
dev        # Start development server
build      # Build the project
test       # Run tests
lint       # Run linting

# Security scanning
security   # Run comprehensive security scan
sec-quick  # Quick security check

# Performance tools
cache-status    # Check cache status
inc-status      # Incremental processing status
dashboard       # View metrics dashboard

# Command system
cmd run "npm install"  # Execute with monitoring
workflow dev          # Run development workflow
suggest              # Get command suggestions
```

## 📁 Project Structure

```
nix/
├── default.nix                 # Main configuration entry point
├── configuration.nix           # Core configuration module
├── modules/                    # Feature modules
│   ├── project-detection.nix   # Smart project type detection
│   ├── error-handling.nix      # Robust error handling
│   ├── performance.nix         # Performance optimizations
│   ├── security.nix           # Security scanning
│   └── commands.nix           # Advanced command system
├── lib/                       # Utility libraries
│   ├── project-analyzer.nix   # Project analysis utilities
│   ├── cache-manager.nix      # Caching system
│   └── incremental-processor.nix # Incremental processing
└── README.md                  # This file
```

## ⚙️ Configuration

### Basic Configuration

Create a `nix/local-config.nix` file to customize your setup:

```nix
{
  claudeCode = {
    enable = true;
    
    user = {
      name = "Your Name";
      email = "your.email@example.com";
    };
    
    languages = {
      nodejs.enable = true;
      python.enable = true;
      rust.enable = false;
    };
    
    performance = {
      enable = true;
      parallelJobs = 8;
      caching.enable = true;
      incremental.enable = true;
    };
    
    security = {
      enable = true;
      scanning.tools = [ "trivy" "safety" "audit" ];
    };
    
    commands = {
      enable = true;
      metrics.enable = true;
    };
  };
}
```

### Advanced Configuration

For more advanced setups, you can override specific modules:

```nix
# nix/local-config.nix
{ config, lib, pkgs, ... }:

{
  imports = [
    ./configuration.nix
  ];
  
  claudeCode = {
    # Enable all features
    enable = true;
    
    # Custom project detection rules
    projectDetection.customRules = {
      myFramework = {
        files = [ "my-framework.json" ];
        priority = 5;
        packages = [ "my-custom-tool" ];
      };
    };
    
    # Performance tuning
    performance = {
      enable = true;
      parallelJobs = lib.mkForce 12;
      
      caching = {
        enable = true;
        maxSize = "4G";
        ttl = 172800; # 48 hours
      };
    };
    
    # Security configuration
    security = {
      enable = true;
      scanning = {
        severity = "LOW";
        excludePatterns = [ "vendor/*" "third-party/*" ];
      };
    };
  };
}
```

## 🔧 Available Tools

### Core Development Tools
- **Git**: Version control with optimized configuration
- **GitHub CLI**: Repository management
- **Ripgrep**: Fast text search
- **fd**: Fast file finding
- **Tree**: Directory visualization
- **jq/yq**: JSON/YAML processing

### Language-Specific Tools

#### Node.js
- Node.js (configurable version)
- npm/yarn/pnpm (auto-detected)
- TypeScript
- ESLint
- Prettier

#### Python
- Python (configurable version)
- pip/poetry (auto-detected)
- Black (formatter)
- Ruff (fast linter)
- pytest (testing)

#### Rust
- rustc/cargo
- clippy (linter)
- rustfmt (formatter)
- sccache (compilation cache)

#### Go
- Go compiler
- golangci-lint
- delve (debugger)

### Security Tools
- **Trivy**: Vulnerability scanner
- **Semgrep**: Static analysis
- **Safety**: Python dependency scanning
- **Bandit**: Python security linting
- **gosec**: Go security analyzer

### Performance Tools
- **hyperfine**: Benchmarking
- **htop**: System monitoring
- **parallel**: Parallel execution
- **sccache/ccache**: Compilation caching

## 📊 Metrics and Monitoring

The system collects comprehensive metrics about your development workflow:

### Command Metrics
- Execution times
- Memory usage
- CPU utilization
- Success/failure rates
- Command frequency

### Performance Metrics
- Build times
- Test execution times
- Cache hit rates
- Incremental processing efficiency

### Security Metrics
- Vulnerability counts by severity
- Scan coverage
- Compliance status

### Viewing Metrics

```bash
# Command dashboard
dashboard

# Detailed metrics
cmd metrics

# Cache status
cache-status

# Security reports
sec-report
```

## 🔄 Workflows

Pre-defined workflows for common development tasks:

### Development Workflow
```bash
workflow dev
```
Runs: `git pull` → `lint` → `build` → `test`

### CI/CD Simulation
```bash
workflow ci
```
Runs: `lint` + `test` + `security scan` (parallel)

### Release Preparation
```bash
workflow release
```
Runs: `test` → `security scan` → `build` → `tag`

### Custom Workflows

Create custom workflows in `~/.config/claude-code/workflows/`:

```json
{
  "description": "My custom workflow",
  "condition": "test -f my-config.json",
  "parallel": false,
  "commands": [
    "echo 'Starting custom workflow'",
    "my-custom-build-command",
    "my-custom-test-command"
  ]
}
```

## 🚨 Security Features

### Automated Scanning
- **Pre-commit hooks**: Automatic security checks before commits
- **Dependency scanning**: Vulnerability detection in dependencies
- **Secret detection**: Prevent accidental secret commits
- **Compliance checking**: OWASP, CIS, NIST standards

### Configuration

```bash
# Quick security scan
sec-quick

# Full security audit
sec-full

# View security reports
sec-report

# Clean old reports
sec-clean
```

### Security Reports

Reports are saved in `.security-reports/` with timestamps:
- `trivy_fs_*.json`: Filesystem vulnerabilities
- `npm_audit_*.json`: Node.js dependency issues
- `safety_*.json`: Python dependency vulnerabilities
- `secrets_*.json`: Potential secret leaks

## 🏎 Performance Optimization

### Caching System

Intelligent caching for all major package managers:

```bash
# Initialize caches
cache-init

# Check cache status
cache-status

# Optimize cache usage
cache-optimize

# Clean old cache data
cache-clean
```

### Incremental Processing

Smart change detection for faster development:

```bash
# Check incremental status
inc-status

# Force incremental build
build

# Watch mode with incremental processing
claude_watch build
```

### Parallel Execution

Multi-language projects automatically use parallel processing:

```bash
# Parallel build for multi-language project
build  # Automatically detects and runs builds in parallel

# Manual parallel execution
claude_parallel "npm run build" "cargo build" "go build"
```

## 🔍 Troubleshooting

### Common Issues

1. **Package not found**:
   ```bash
   # Check available packages
   nix search nixpkgs package-name
   
   # Add custom package to configuration
   ```

2. **Cache issues**:
   ```bash
   # Clean and reinitialize cache
   cache-clean
   cache-init
   ```

3. **Permission errors**:
   ```bash
   # Check directory permissions
   ls -la $CLAUDE_CODE_CACHE_DIR
   
   # Fix permissions
   chmod -R u+w $CLAUDE_CODE_CACHE_DIR
   ```

4. **Performance issues**:
   ```bash
   # Check system resources
   htop
   
   # Adjust parallel jobs
   export MAKEFLAGS="-j4"
   ```

### Debug Mode

Enable debug mode for verbose output:

```bash
export CLAUDE_CODE_DEBUG=1
nix-shell
```

### Log Files

Check log files for detailed information:
- `~/.cache/claude-code/logs/`: General logs
- `.security-reports/`: Security scan logs
- `~/.config/claude-code/`: Configuration logs

## 📈 Advanced Features

### Command Learning

The system learns from your command usage:

```bash
# Get suggestions based on project type
suggest

# Learn a command for current context
cmd learn "nodejs" "npm run dev"

# View command history analysis
analyze_history
```

### Project Analysis

Detailed project analysis and recommendations:

```bash
# Analyze current project
claude-analyze-project

# Get tool recommendations
claude-recommend-tools

# Check project health
claude-project-health
```

### Integration with External Tools

#### VS Code Integration
```bash
# Install VS Code extensions for detected languages
code --install-extension ms-vscode.vscode-typescript-next
```

#### Docker Integration
```bash
# Automatic Dockerfile analysis and optimization
claude-docker-optimize
```

#### CI/CD Integration
```bash
# Generate GitHub Actions workflow
claude-generate-github-actions

# Generate GitLab CI configuration
claude-generate-gitlab-ci
```

## 🤝 Contributing

To extend or modify the configuration:

1. **Add new language support**: Create detection rules in `modules/project-detection.nix`
2. **Add new tools**: Update package lists in `configuration.nix`
3. **Add new workflows**: Create JSON files in workflows directory
4. **Add new security tools**: Update `modules/security.nix`

### Development Setup

```bash
# Test configuration changes
nix-shell --pure

# Validate configuration
nix-instantiate nix/default.nix

# Format Nix files
nixfmt nix/*.nix
```

## 📄 License

This configuration is provided as-is for use with Claude Code. Modify and distribute freely.

## 🆘 Support

For issues and questions:
1. Check the troubleshooting section above
2. Review log files for error details
3. Test with a minimal configuration
4. Ensure all required tools are available

## 🔗 See Also

- [Nix Package Manager](https://nixos.org/manual/nix/stable/)
- [Home Manager](https://github.com/nix-community/home-manager)
- [Claude Code Documentation](https://docs.anthropic.com/claude-code)
- [DevShell Examples](https://github.com/numtide/devshell)