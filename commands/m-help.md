# Claude Code Help System

Context-aware help and command discovery for the Claude Code development environment.

## Usage

```
/m-help [topic] [context]
```

### Parameters

- `topic` (optional): Specific help topic
  - `commands` - List all available commands
  - `nix` - Nix environment help
  - `security` - Security tools and scanning
  - `performance` - Performance optimization
  - `workflows` - Development workflows
  - `setup` - Setup and configuration
  - `troubleshooting` - Common issues and solutions
- `context` (optional): Current context for targeted help
  - `project` - Project-specific help
  - `error` - Error resolution help
  - `newbie` - Beginner-friendly explanations

## Features

- **Context-Aware**: Provides help based on current project and environment
- **Interactive Discovery**: Suggests relevant commands and workflows
- **Error Resolution**: Helps diagnose and fix common issues
- **Learning Path**: Guides users from basic to advanced usage
- **Quick Reference**: Fast access to command syntax and examples

## Examples

```bash
# General help
/m-help

# List all commands
/m-help commands

# Get help for beginners
/m-help setup newbie

# Security-specific help
/m-help security

# Troubleshooting help
/m-help troubleshooting

# Project-specific help
/m-help workflows project
```

## Available Commands

### Core Development Workflow
- **`/m-orchestrated-dev`** - Multi-agent development workflow
- **`/m-commit-push`** - Intelligent commit and push
- **`/m-bug-fix`** - Comprehensive bug analysis and fixing
- **`/m-project-init`** - Initialize project with shared configuration

### Code Quality & Security
- **`/m-security-scan`** - Security vulnerability scanning
- **`/m-test-generation`** - Automated test creation
- **`/m-review-code`** - Code quality review
- **`/m-project-cleanup`** - Project maintenance and cleanup

### Planning & Analysis
- **`/m-task-planner`** - Task analysis and planning
- **`/m-tdd-planner`** - Test-driven development planning
- **`/m-next-task`** - Next action recommendations
- **`/m-next-context`** - Context compilation and analysis

### Architecture & Design
- **`/m-debate-architecture`** - Architecture review and analysis
- **`/m-debate-code`** - Tactical code review

### Project Management
- **`/m-document-update`** - Documentation maintenance
- **`/m-branch-prune`** - Branch cleanup and management
- **`/m-branch-prune-lite`** - Lightweight branch cleanup

### Environment & Tools
- **`/m-nix-setup`** - Nix environment management
- **`/m-help`** - This help system

## Quick Start Guide

### New to Claude Code?

1. **Initialize your project**:
   ```bash
   /m-project-init
   ```

2. **Set up development environment**:
   ```bash
   /m-nix-setup install
   ```

3. **Start your first workflow**:
   ```bash
   /m-task-planner
   /m-orchestrated-dev
   ```

### Daily Development

1. **Morning routine**:
   ```bash
   /m-next-task          # See what's pending
   /m-security-scan      # Quick security check
   ```

2. **Development cycle**:
   ```bash
   /m-orchestrated-dev   # Main development workflow
   /m-test-generation    # Add tests
   /m-commit-push        # Commit changes
   ```

3. **Maintenance**:
   ```bash
   /m-project-cleanup    # Regular cleanup
   /m-document-update    # Keep docs current
   ```

## Environment Help

### Nix Environment

Check environment status:
```bash
/m-nix-setup status
```

Common Nix commands:
```bash
nix-shell ../.claude/nix/    # Enter environment
direnv allow                  # Auto-activation
dashboard                     # View metrics
security                      # Quick security scan
```

### Shared Configuration

Your project uses shared configuration at `../.claude/`:
- **Commands**: Reusable across all projects
- **Nix Environment**: Comprehensive development tools
- **Security**: Unified vulnerability scanning
- **Performance**: Shared caching and optimization

## Troubleshooting Quick Reference

### Common Issues

**Command not found**:
```bash
# Check if in correct directory
pwd
# Verify shared configuration
ls -la ../.claude/
# Check command list
/m-help commands
```

**Environment not loading**:
```bash
# Check Nix status
/m-nix-setup status
# Activate manually
nix-shell ../.claude/nix/
# Reset direnv
direnv allow
```

**Permission errors**:
```bash
# Check Claude settings
cat .claude/settings.local.json
# Verify shared base
cat ../.claude/settings.base.json
```

**Build/test failures**:
```bash
# Check project setup
/m-project-init
# Run diagnostics
claude-test validate
# Clean and rebuild
/m-project-cleanup
```

### Getting More Help

1. **Detailed troubleshooting**:
   ```bash
   /m-help troubleshooting
   ```

2. **Command-specific help**:
   ```bash
   # Most commands have detailed documentation
   /m-orchestrated-dev --help
   ```

3. **Environment diagnostics**:
   ```bash
   claude-test run        # Comprehensive testing
   dashboard             # System metrics
   /m-nix-setup status   # Environment status
   ```

## Context-Aware Suggestions

Based on your current environment:

### If you're in a Next.js project:
- Use `/m-orchestrated-dev` for full-stack development
- Try `/m-security-scan` for web security checks
- Consider `/m-test-generation` for component testing

### If you're in a new project:
- Start with `/m-project-init` to set up properly
- Use `/m-task-planner` to organize work
- Run `/m-nix-setup` for development environment

### If you're debugging:
- Use `/m-bug-fix` for systematic debugging
- Try `/m-review-code` for code analysis
- Consider `/m-debate-code` for detailed review

## Advanced Features

### Command Chaining

Many commands work well together:
```bash
# Full development cycle
/m-task-planner → /m-orchestrated-dev → /m-test-generation → /m-commit-push

# Code quality cycle  
/m-review-code → /m-project-cleanup → /m-document-update

# Architecture review
/m-debate-architecture → /m-debate-code → /m-task-planner
```

### Environment Integration

Commands automatically adapt to:
- **Project type**: Different behavior for Node.js vs Python vs Rust
- **Current state**: Aware of git status, build state, test results
- **Available tools**: Uses project-specific and shared tools
- **Previous context**: Learns from command history

### Metrics and Learning

The system tracks:
- **Command usage patterns**: Suggests optimal workflows
- **Performance metrics**: Identifies bottlenecks
- **Error patterns**: Improves error handling
- **Success rates**: Optimizes command sequences

## Getting Started Paths

### For New Projects
```bash
/m-project-init          # Set up project
/m-nix-setup install     # Development environment  
/m-task-planner         # Plan your work
/m-orchestrated-dev     # Start developing
```

### For Existing Projects
```bash
/m-project-init          # Integrate with shared config
/m-review-code          # Assess current state
/m-security-scan        # Security audit
/m-project-cleanup      # Clean up technical debt
```

### For Teams
```bash
/m-document-update      # Ensure docs are current
/m-branch-prune         # Clean up branches
/m-test-generation      # Improve test coverage
/m-security-scan        # Team security review
```

---

*This help system provides context-aware assistance for the Claude Code development environment. Use `/m-help [topic]` for specific guidance on any aspect of the system.*