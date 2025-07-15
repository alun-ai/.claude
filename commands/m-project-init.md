# Project Initialization: Intelligent Development Environment Setup

**Target:** $ARGUMENTS (Default: auto-detect project type, optional template and project name)

**Scope:** Initialize new or existing projects with Claude Code shared configuration, Nix environment, and development tools

## Overview

Intelligently sets up development environments for new or existing projects by analyzing project structure, applying appropriate templates, and configuring shared Claude Code + Nix environment. Provides a consistent, powerful development experience across different project types and languages.

**Key Benefits:**
- **Auto-Detection**: Intelligently identifies project type and requirements
- **Template System**: Pre-configured setups for popular stacks
- **Shared Environment**: Consistent tools across all projects
- **Zero-Config**: Works out of the box with sensible defaults
- **Extensible**: Easy to customize for specific needs

## Help Documentation

To see this help documentation, run:
```bash
/m-project-init --help
```

## Core Features

### 1. Intelligent Project Detection
- **Language Detection**: Identify primary programming languages
- **Framework Recognition**: Detect Next.js, React, Node.js, Python, etc.
- **Dependency Analysis**: Parse package.json, requirements.txt, Cargo.toml
- **Build Tool Identification**: npm, yarn, pip, cargo, go mod

### 2. Template System
- **Pre-configured Stacks**: Popular development combinations
- **Best Practices**: Industry-standard configurations
- **Security Defaults**: Secure configurations out of the box
- **Performance Optimized**: Efficient development and build settings

### 3. Shared Environment Integration
- **Nix Environment**: Consistent tool versions across projects
- **Claude Code Commands**: Full command suite available
- **Development Tools**: Linters, formatters, debuggers
- **Shell Integration**: Automatic environment activation

### 4. Configuration Management
- **Project-Specific**: Local overrides and customizations
- **Environment Variables**: Secure environment configuration
- **Tool Configuration**: Pre-configured development tools
- **Documentation**: Generated setup and usage documentation

## Usage Examples

### Basic Initialization
```bash
# Auto-detect and initialize current project
/m-project-init

# Initialize with specific template
/m-project-init nextjs-supabase

# Create new project from template
/m-project-init nextjs-supabase my-new-app

# Force re-initialization
/m-project-init --force
```

### Template-Specific Initialization
```bash
# Next.js with Supabase
/m-project-init nextjs-supabase my-saas-app

# Node.js TypeScript project
/m-project-init nodejs my-api-server

# Python with Poetry
/m-project-init python my-data-project

# Rust project
/m-project-init rust my-cli-tool
```

### Advanced Options
```bash
# Initialize with custom configuration
/m-project-init --config custom-config.json

# Skip certain setup steps
/m-project-init --skip-nix --skip-git

# Verbose initialization
/m-project-init --verbose
```

### Parameters

- `template` (optional): Project template to use
  - `nextjs-supabase` - Next.js with Supabase backend
  - `nodejs` - Node.js/TypeScript project
  - `python` - Python project with poetry
  - `rust` - Rust project with cargo
  - `go` - Go project with modules
  - `generic` - Generic project with basic tools
- `project-name` (optional): Name for new project (if creating from template)

## Features

- **Automatic Detection**: Analyzes existing project structure
- **Template Application**: Creates new projects from predefined templates
- **Shared Configuration**: Links to shared Claude Code + Nix environment
- **Project-Specific Settings**: Creates appropriate local configuration
- **Environment Setup**: Configures direnv and shell integration
- **Dependency Detection**: Auto-detects and configures package managers

## Examples

```bash
# Initialize current project (auto-detect type)
/m-project-init

# Initialize with specific template
/m-project-init nextjs-supabase

# Create new project from template
/m-project-init nextjs-supabase my-new-app

# Initialize generic project
/m-project-init generic
```

## What Gets Created

### For Existing Projects
1. **shell.nix**: Links to shared Nix environment
2. **`.envrc`**: Configures automatic environment activation
3. **`.claude/settings.local.json`**: Project-specific Claude configuration
4. **Environment detection**: Auto-detects project type and tools

### For New Projects
1. **All of the above**, plus:
2. **Project structure**: Based on selected template
3. **Configuration files**: Package.json, tsconfig.json, etc.
4. **Example code**: Basic starter files
5. **Documentation**: README and setup instructions

## Project Types Detected

- **Next.js + Supabase**: `package.json` + `supabase/config.toml`
- **Node.js/TypeScript**: `package.json` + `tsconfig.json`
- **React**: `package.json` + React dependencies
- **Python**: `pyproject.toml`, `requirements.txt`, or `setup.py`
- **Rust**: `Cargo.toml`
- **Go**: `go.mod`
- **Docker**: `Dockerfile` or `docker-compose.yml`

## Configuration Generated

### Project-Specific Claude Settings
```json
{
  "extends": "../.claude/settings.base.json",
  "projectName": "detected-name",
  "projectType": "detected-type",
  "permissions": {
    "allow": [
      // Project-specific permissions
    ]
  },
  "environment": {
    "PROJECT_TYPE": "detected-type",
    "FRAMEWORK": "detected-framework"
  }
}
```

### Environment Configuration
```bash
# Auto-generated .envrc
use nix ../.claude/nix/
export PROJECT_NAME="project-name"
export PROJECT_TYPE="detected-type"
# ... additional project-specific variables
```

## Integration with Shared System

After initialization, projects automatically get:

### Shared Commands
- All `/m-*` commands work immediately
- Security scanning with project-specific configuration
- Performance monitoring and metrics
- Development workflows

### Shared Environment
- Nix development environment with all tools
- Intelligent caching across projects
- Consistent linting, formatting, testing
- Unified security scanning

### Project Customization
- Override shared settings as needed
- Add project-specific commands
- Configure custom workflows
- Extend environment variables

## Template Details

### nextjs-supabase
- Next.js 14+ with TypeScript
- Supabase integration and types
- Tailwind CSS
- ESLint + Prettier
- Vercel deployment ready

### nodejs
- TypeScript configuration
- Jest testing setup
- ESLint + Prettier
- NPM scripts for common tasks

### python
- Poetry dependency management
- Black code formatting
- pytest testing framework
- Type checking with mypy

### rust
- Cargo workspace setup
- Clippy linting
- rustfmt formatting
- Basic project structure

### go
- Go modules setup
- golangci-lint configuration
- Basic project structure
- Testing setup

## Post-Initialization

After running `/m-project-init`:

1. **Activate environment**:
   ```bash
   # Automatically with direnv
   cd .
   
   # Or manually
   nix-shell ../.claude/nix/
   ```

2. **Verify setup**:
   ```bash
   /m-nix-setup status
   ```

3. **Start developing**:
   ```bash
   # Use any shared command
   /m-orchestrated-dev
   /m-security-scan
   dashboard
   ```

## Troubleshooting

### Common Issues

**Project type not detected**:
- Manually specify template: `/m-project-init nodejs`
- Check for required files (package.json, etc.)

**Environment not activating**:
- Ensure direnv is installed and configured
- Manually run: `direnv allow`

**Shared configuration missing**:
- Verify shared setup: `ls -la ../.claude/`
- Run shared setup if needed

**Permission errors**:
- Check file permissions
- Ensure write access to project directory

### Validation

```bash
# Check project initialization
claude-test validate

# Verify shared integration
/m-nix-setup status

# Test environment
nix-shell ../.claude/nix/ --run "echo 'Environment works'"
```

## Advanced Usage

### Custom Templates

Create custom templates in `../.claude/templates/`:
```bash
mkdir ../.claude/templates/my-template
# Add template files...
/m-project-init my-template
```

### Environment Overrides

Customize project environment in `.envrc`:
```bash
# Add after generated content
export CUSTOM_VAR="value"
export PATH="./custom-bin:$PATH"
```

### Configuration Inheritance

Projects inherit from shared base and can override:
```json
{
  "extends": "../.claude/settings.base.json",
  "permissions": {
    "allow": [
      // Adds to base permissions
    ],
    "deny": [
      // Overrides base permissions
    ]
  }
}
```

---

*Project initialization creates a seamless integration between your project and the shared Claude Code + Nix development environment.*