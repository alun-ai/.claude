# Shared Nix Development Environment Setup: Unified Development Infrastructure

**Mode:** $ARGUMENTS (Default: status check and guided setup)

**Scope:** Comprehensive Nix-based development environment with intelligent project detection, performance optimization, and cross-project tooling

## Overview

Transforms Claude into a Senior DevOps Engineer specializing in Nix ecosystem management and development environment optimization. This command creates and manages a unified, shared development environment that works seamlessly across all projects while providing intelligent project detection, performance optimization, security scanning, and advanced command management.

**Key Benefits:**
- **Unified Environment**: One Nix environment serves all projects with consistent tooling
- **Intelligent Detection**: Automatically detects and configures for multiple programming languages
- **Performance Optimization**: Parallel processing, intelligent caching, and incremental builds
- **Security Integration**: Automated vulnerability scanning with comprehensive security tools
- **Cross-Project Benefits**: Shared caching, unified metrics, and consistent development experience

## Help Documentation

To see this help documentation, run:
```bash
/m-nix-setup --help
```

## Core Features

### 1. Unified Development Environment
- **Shared Configuration**: Single Nix environment configuration for all projects
- **Automatic Project Linking**: Seamless integration with existing and new projects
- **Consistent Tooling**: Same development tools and versions across all projects
- **Environment Isolation**: Project-specific variables within shared environment

### 2. Intelligent Multi-Language Support
- **Smart Project Detection**: Automatically detects Node.js, Python, Rust, Go, Java, Docker projects
- **Language-Specific Tooling**: Optimized tool selection for each programming language
- **Version Management**: Intelligent version selection and compatibility management
- **Development Workflow Integration**: Language-specific development and testing workflows

### 3. Advanced Performance Optimization
- **Intelligent Caching**: Shared dependency caching across all projects
- **Parallel Processing**: Optimized build and test execution
- **Incremental Builds**: Smart build optimization and dependency tracking
- **Resource Management**: Efficient memory and CPU usage across projects

### 4. Comprehensive Security and Quality
- **Automated Security Scanning**: Built-in vulnerability scanning with multiple tools
- **Code Quality Tools**: Integrated linting, formatting, and analysis tools
- **Dependency Auditing**: Continuous monitoring of package vulnerabilities
- **Security Policy Enforcement**: Consistent security standards across projects

## Usage Examples

### Basic Setup Operations
```bash
# Check current status
/m-nix-setup
/m-nix-setup status

# Install shared environment (one-time setup)
/m-nix-setup install

# Link current project to shared environment
/m-nix-setup link
```

### Environment Management
```bash
# Initialize new project with shared setup
/m-nix-setup init

# Update shared configuration
/m-nix-setup update

# Validate environment setup
/m-nix-setup validate
```

### Advanced Operations
```bash
# Force complete reinstallation
/m-nix-setup install --force

# Update with latest tools
/m-nix-setup update --latest

# Diagnostics and troubleshooting
/m-nix-setup diagnose
```

## Command Options

```yaml
setup_modes:
  install: "Install Nix and configure shared environment"
  init: "Initialize project with shared Nix setup"
  update: "Update shared Nix configuration and tools"
  status: "Check current Nix environment status (default)"
  link: "Link current project to shared configuration"
  validate: "Validate environment setup and configuration"
  diagnose: "Run comprehensive diagnostics"
  uninstall: "Remove shared environment (with confirmation)"

installation_options:
  --force: "Force reinstallation even if Nix exists"
  --minimal: "Install minimal environment only"
  --full: "Install comprehensive development environment (default)"
  --custom: "Interactive custom installation"
  --system-wide: "Install for all users on system"
  --user-only: "Install for current user only"

update_options:
  --latest: "Update to latest available tool versions"
  --security: "Priority updates for security patches"
  --incremental: "Incremental updates preserving compatibility (default)"
  --rollback: "Rollback to previous configuration"
  --sync-projects: "Sync all linked projects after update"

project_options:
  --auto-detect: "Automatically detect project type and configure (default)"
  --manual-config: "Manual project configuration"
  --preserve-existing: "Preserve existing project configuration"
  --force-override: "Override existing configuration"
  --template: "Use specific project template"

validation_options:
  --quick: "Quick validation of essential components"
  --comprehensive: "Full validation including all tools (default)"
  --performance: "Performance benchmarking and optimization"
  --security: "Security configuration validation"
  --compatibility: "Cross-project compatibility check"

diagnostic_options:
  --environment: "Environment variable and path diagnostics"
  --permissions: "File and directory permission checks"
  --network: "Network connectivity and package access"
  --integration: "IDE and tool integration diagnostics"
  --performance: "Performance analysis and bottleneck detection"
  --all: "Run all diagnostic checks"

shared_environment_options:
  --cache-optimization: "Optimize shared caching strategies"
  --resource-monitoring: "Enable resource usage monitoring"
  --parallel-builds: "Configure parallel build optimization"
  --security-hardening: "Apply security hardening configurations"
```

## Execution Framework

### 1. **Environment Assessment and Planning**
- **System Analysis**: Detect operating system, architecture, and existing tools
- **Compatibility Check**: Verify system requirements and potential conflicts
- **Resource Planning**: Assess disk space, network connectivity, and system resources
- **Security Assessment**: Evaluate security implications and hardening requirements

### 2. **Nix Installation and Configuration**
- **Package Manager Setup**: Install or update Nix package manager
- **Channel Configuration**: Configure appropriate Nix channels and repositories
- **Security Hardening**: Apply security configurations and access controls
- **Performance Optimization**: Configure parallel builds and caching strategies

### 3. **Shared Environment Creation**
- **Tool Selection**: Install comprehensive development toolchain
- **Language Support**: Configure multi-language development environments
- **Security Tools**: Install vulnerability scanners and security analysis tools
- **Performance Tools**: Setup monitoring and profiling capabilities

### 4. **Project Integration and Linking**
- **Project Detection**: Automatically detect project types and requirements
- **Configuration Generation**: Create project-specific configuration files
- **Environment Linking**: Link projects to shared Nix environment
- **Validation Testing**: Test environment activation and tool availability

### 5. **Cross-Project Optimization**
- **Shared Caching**: Implement intelligent dependency caching
- **Resource Pooling**: Optimize shared resource utilization
- **Performance Monitoring**: Setup metrics collection and analysis
- **Automation Integration**: Connect with existing development workflows

### 6. **Quality Assurance and Validation**
- **Comprehensive Testing**: Validate all tools and configurations
- **Performance Benchmarking**: Measure environment performance
- **Security Validation**: Verify security configurations
- **Documentation Generation**: Create setup documentation and troubleshooting guides

## Integration Features

### Development Environment Integration
- **IDE Support**: Seamless integration with VS Code, JetBrains, Vim, and Emacs
- **Shell Integration**: Enhanced bash, zsh, and fish shell support
- **Editor Plugins**: Automatic configuration for popular editor plugins
- **Debugger Support**: Integrated debugging tools for multiple languages

### CI/CD Pipeline Integration
- **GitHub Actions**: Pre-configured workflows for Nix environments
- **CircleCI Integration**: Optimized CircleCI configurations
- **Docker Compatibility**: Container-based development support
- **Build Optimization**: Cached builds across CI/CD pipelines

### Team Collaboration Features
- **Environment Consistency**: Identical environments across team members
- **Shared Tool Versions**: Consistent tool versions and configurations
- **Collaborative Caching**: Team-wide dependency caching
- **Knowledge Sharing**: Shared documentation and best practices

### Security and Compliance
- **Vulnerability Scanning**: Automated security scanning integration
- **Compliance Checking**: Industry standard compliance validation
- **Access Control**: Role-based access to development tools
- **Audit Logging**: Comprehensive environment usage logging

## Best Practices

### Environment Management
1. **Regular Updates**: Update shared environment weekly or bi-weekly
2. **Validation Testing**: Test environment after updates across all projects
3. **Backup Strategies**: Maintain rollback capabilities for environment changes
4. **Performance Monitoring**: Track environment performance and resource usage

### Project Integration
1. **Consistent Linking**: Ensure all team projects use shared environment
2. **Custom Overrides**: Use project-specific overrides sparingly and document them
3. **Environment Variables**: Manage project-specific variables properly
4. **Dependency Management**: Leverage shared dependencies while maintaining project isolation

### Team Collaboration
1. **Environment Standards**: Establish team standards for environment configuration
2. **Documentation**: Maintain current documentation for environment setup
3. **Training**: Ensure team members understand Nix concepts and workflows
4. **Troubleshooting**: Develop team troubleshooting procedures and knowledge base

### Security and Maintenance
1. **Security Updates**: Prioritize security patches in environment updates
2. **Access Control**: Implement proper access controls for shared configurations
3. **Audit Trails**: Maintain logs of environment changes and access
4. **Compliance**: Ensure environment meets organizational security requirements

## Shared Architecture

```
Documents/Github/
├── .claude/
│   ├── nix/                    # Shared Nix configuration
│   └── commands/               # Shared commands
├── project1/
│   ├── shell.nix              # → ../claude/nix/
│   └── .envrc                 # → use nix ../.claude/nix/
├── project2/
│   ├── shell.nix              # → ../claude/nix/
│   └── .envrc                 # → use nix ../.claude/nix/
└── ...
```

## Integration with Existing Commands

After setup, the following commands become available in ANY project:
- `claude-cmd` - Advanced command system with metrics
- `security` - Comprehensive security scanning
- `cache-status` - Intelligent dependency caching
- `dashboard` - Development metrics dashboard
- `workflow dev` - Automated development workflow

## Prerequisites

- macOS or Linux
- Git repository
- Internet connection for Nix installation

## What Gets Installed

1. **Nix Package Manager** (if not present)
2. **Shared Tools Pool** for all project types:
   - Node.js ecosystem (npm, TypeScript, ESLint, Prettier)
   - Python tools (pip, poetry, black, ruff, pytest)
   - Rust toolchain (cargo, clippy, rustfmt)
   - Go development tools
   - Security scanners (Trivy, Semgrep, Safety)
   - Performance monitoring tools
   - Database tools (PostgreSQL, SQLite)
   - Container tools (Docker, Docker Compose)

3. **Smart Configuration**:
   - Per-project environment activation
   - Shared intelligent caching system
   - Cross-project security scanning
   - Unified development metrics

## Per-Project Setup

Each project gets minimal configuration that links to shared environment:

### shell.nix (per project)
```nix
# Link to shared Nix environment
import ../.claude/nix/default.nix
```

### .envrc (per project)
```bash
# Use shared Nix environment
use nix ../.claude/nix/

# Project-specific variables
export PROJECT_NAME="$(basename $(pwd))"
export CLAUDE_CODE_PROJECT_ROOT="$(pwd)"
```

## Post-Setup

After successful setup in any project:

1. **Enter development environment**: `nix-shell` or `cd .` (with direnv)
2. **View available features**: `claude-cmd help`
3. **Check system status**: `dashboard`
4. **Run security scan**: `security`
5. **View project analysis**: `inc-status`

## Environment Activation

### Automatic (Recommended)
```bash
# Install direnv once
brew install direnv  # or nix-env -iA nixpkgs.direnv

# Add to shell profile
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc

# Navigate to any project - environment auto-activates
cd my-project  # Automatically loads shared Nix environment
```

### Manual
```bash
# From any project directory
nix-shell ../.claude/nix/
```

### Flakes (Modern Nix)
```bash
# From any project directory
nix develop ../.claude/nix/
```

## Cross-Project Benefits

### Shared Caching
- Dependencies cached once, used by all projects
- Faster builds across all projects
- Efficient disk usage

### Unified Tooling
- Same development tools across all projects
- Consistent linting, formatting, testing
- Shared security scanning results

### Metrics & Monitoring
- Development metrics across all projects
- Performance comparisons between projects
- Shared command learning and suggestions

## Troubleshooting

### Common Issues

**Nix not found**:
```bash
/m-nix-setup install  # Installs Nix automatically
```

**Project not linked**:
```bash
/m-nix-setup link     # Creates project link files
```

**Environment not activating**:
```bash
# Check direnv status
direnv status

# Manually allow
direnv allow
```

**Shared config missing**:
```bash
# Verify shared configuration
ls -la ../.claude/nix/
```

### Diagnostics

```bash
# Check overall status
/m-nix-setup status

# Test shared environment
nix-shell ../.claude/nix/ --run "claude-cmd help"

# Validate configuration
claude-test validate
```

## Integration Points

### Enhanced Claude Commands
- **`/m-security-scan`** → Uses shared security tools
- **`/m-orchestrated-dev`** → Benefits from shared performance optimization
- **`/m-commit-push`** → Enhanced with shared metrics and caching
- **`/m-project-cleanup`** → Works with shared caching system

### Project-Specific Adaptation
- Automatically detects project type
- Configures appropriate tools
- Maintains project-specific settings
- Preserves existing workflows

### Cross-Project Workflows
```bash
# Run command across all projects
for project in */; do
  (cd "$project" && workflow test)
done

# Compare metrics across projects
dashboard --compare

# Shared security reporting
security --all-projects
```

## Advanced Usage

### Custom Project Environments
```bash
# Create project-specific overrides
echo '{ pkgs }: (import ../.claude/nix/default.nix { inherit pkgs; }) // { customTool = pkgs.myTool; }' > shell.nix
```

### Specialized Environments
```bash
# Performance-focused environment
nix-shell ../.claude/nix/ -A performance

# Security-focused environment
nix-shell ../.claude/nix/ -A security

# CI simulation environment
nix-shell ../.claude/nix/ -A ci
```

## Migration from Project-Specific Setups

If you have existing project-specific Nix configurations:

1. **Backup existing config**: `mv nix nix.backup`
2. **Link to shared**: `/m-nix-setup link`
3. **Test compatibility**: `nix-shell --run "your-test-command"`
4. **Migrate customizations** to shared config if needed

---

*This shared Nix environment provides consistent, powerful development capabilities across all your projects while maintaining the flexibility for project-specific needs.*