# Shared Nix Development Environment Setup

Set up the shared Nix-based development environment that works across all projects with intelligent project detection, performance optimization, security scanning, and advanced command management.

## Usage

```
/m-nix-setup [mode]
```

### Parameters

- `mode` (optional): Setup mode
  - `install` - Install Nix and configure shared environment
  - `init` - Initialize project with shared Nix setup
  - `update` - Update shared Nix configuration
  - `status` - Check current Nix environment status
  - `link` - Link current project to shared configuration

## Features

- **Shared Configuration**: One Nix environment serves all projects
- **Smart Project Detection**: Automatically detects and configures for Node.js, Python, Rust, Go, Java, Docker
- **Performance Optimization**: Parallel processing, intelligent caching, incremental builds
- **Security Integration**: Automated vulnerability scanning with multiple tools
- **Command Intelligence**: AI-powered command suggestions and metrics
- **Workflow Automation**: Predefined development workflows
- **Comprehensive Testing**: Automated configuration validation and monitoring

## Examples

```bash
# Install shared Nix environment (run once)
/m-nix-setup install

# Link current project to shared environment
/m-nix-setup link

# Check status from any project
/m-nix-setup status

# Update shared configuration
/m-nix-setup update
```

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