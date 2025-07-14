# Shared Claude Code Configuration

This is a shared Claude Code configuration system that provides reusable development tools and workflows across all projects in this directory structure.

## 🚀 Architecture

```
Documents/Github/
├── .claude/                    # Shared Claude configuration
│   ├── nix/                   # Nix development environments
│   ├── commands/              # Reusable Claude commands
│   ├── templates/             # Project templates
│   ├── scripts/               # Utility scripts
│   ├── workflows/             # Development workflows
│   └── docs/                  # Documentation
├── project1/
│   └── .claude/               # Project-specific settings
│       └── settings.local.json
├── project2/
│   └── .claude/               # Project-specific settings
│       └── settings.local.json
└── ...
```

## 📁 Directory Structure

### `/nix/` - Development Environments
Comprehensive Nix configurations providing:
- **Smart Project Detection**: Automatically configures for detected technologies
- **Performance Optimization**: Parallel processing, caching, incremental builds
- **Security Integration**: Automated vulnerability scanning
- **Command Intelligence**: AI-powered suggestions and metrics
- **Testing Framework**: Comprehensive validation and monitoring

### `/commands/` - Reusable Commands
Claude Code slash commands available across all projects (all use `/m-*` prefix):

#### Core Development Workflow
- `/m-orchestrated-dev` - Multi-agent development workflow
- `/m-commit-push` - Intelligent commit and push
- `/m-bug-fix` - Comprehensive bug analysis and fixing
- `/m-project-init` - Initialize project with shared configuration

#### Code Quality & Security  
- `/m-security-scan` - Security vulnerability scanning
- `/m-test-generation` - Automated test creation
- `/m-review-code` - Code quality review
- `/m-project-cleanup` - Project maintenance and cleanup

#### Planning & Analysis
- `/m-task-planner` - Task analysis and planning
- `/m-tdd-planner` - Test-driven development planning
- `/m-next-task` - Next action recommendations
- `/m-next-context` - Context compilation and analysis

#### Architecture & Design
- `/m-debate-architecture` - Architecture review and analysis
- `/m-debate-code` - Tactical code review

#### Project Management
- `/m-document-update` - Documentation maintenance
- `/m-branch-prune` - Branch cleanup and management
- `/m-branch-prune-lite` - Lightweight branch cleanup

#### Environment & Tools
- `/m-nix-setup` - Nix environment management
- `/m-help` - Context-aware help and command discovery

### `/templates/` - Project Templates
Ready-to-use project templates with Claude configuration:
- Node.js/TypeScript projects
- Python projects
- Rust projects
- Full-stack applications
- Supabase projects

### `/scripts/` - Utility Scripts
Automation scripts for common tasks:
- Project initialization
- Environment setup
- Cross-project operations
- Maintenance tasks

### `/workflows/` - Development Workflows
Predefined development workflows:
- CI/CD pipelines
- Release processes
- Security workflows
- Testing strategies

## 🛠 Setup for New Projects

### Option 1: Using Templates
```bash
# Create new project from template
./scripts/new-project.sh my-new-project typescript-next

# Navigate to project
cd my-new-project

# Project is automatically configured
```

### Option 2: Manual Setup
```bash
# In your existing project
mkdir -p .claude
echo '{}' > .claude/settings.local.json

# Link to shared configuration (automatic via parent lookup)
```

### Option 3: Using Claude Commands
```bash
# From any project directory
/m-project-init
```

## 🎯 Project-Specific Configuration

Each project can have its own settings in `.claude/settings.local.json`:

```json
{
  "extends": "../.claude/settings.base.json",
  "permissions": {
    "allow": [
      "project-specific permissions here"
    ]
  },
  "environment": {
    "PROJECT_TYPE": "nextjs",
    "CUSTOM_SETTING": "value"
  }
}
```

## 🚀 Getting Started

### For Existing Projects
1. **Check current setup**:
   ```bash
   /m-nix-setup status
   ```

2. **Install Nix environment** (if needed):
   ```bash
   /m-nix-setup install
   ```

3. **Initialize project**:
   ```bash
   /m-project-init
   ```

### For New Projects
1. **Use project template**:
   ```bash
   /m-project-init nextjs-supabase my-app
   ```

2. **Or start from scratch**:
   ```bash
   mkdir my-app && cd my-app
   /m-project-init
   ```

## 🔧 Available Nix Environments

The shared Nix configuration provides specialized environments:

### Default Development Environment
```bash
nix-shell ../.claude/nix/
```
Full-featured environment with auto-detected tools.

### Specialized Environments  
```bash
# Performance-focused
nix-shell ../.claude/nix/ -A performance

# Security-focused  
nix-shell ../.claude/nix/ -A security

# CI/CD simulation
nix-shell ../.claude/nix/ -A ci

# Minimal environment
nix-shell ../.claude/nix/ -A minimal
```

### Flake Support
```bash
# Modern Nix flakes
nix develop ../.claude/nix/

# Specific environments
nix develop ../.claude/nix/#performance
nix develop ../.claude/nix/#security
```

## 📊 Command Integration

All shared commands automatically work from any project directory and adapt to the local project configuration:

### Development Workflow
```bash
/m-task-planner           # Analyze requirements
/m-orchestrated-dev       # Coordinated development
/m-commit-push           # Intelligent commits
/m-bug-fix              # Comprehensive debugging
```

### Quality Assurance
```bash
/m-security-scan         # Vulnerability scanning
/m-test-generation       # Automated testing
/m-review-code          # Code quality review
/m-project-cleanup      # Maintenance
```

### Planning & Architecture
```bash
/m-tdd-planner          # Test-driven development
/m-debate-architecture   # Architecture review
/m-debate-code          # Tactical code review
/m-next-task            # Next action planning
```

### Project Management
```bash
/m-document-update      # Documentation sync
/m-branch-prune         # Branch management
/m-next-context         # Context compilation
/m-help                 # Interactive help
```

## 🎛 Configuration Inheritance

Projects automatically inherit shared configuration while allowing local overrides:

1. **Base Configuration**: `../.claude/settings.base.json`
2. **Project Override**: `.claude/settings.local.json`
3. **Runtime Detection**: Automatic project type detection
4. **Environment Variables**: Project-specific environment

## 🧪 Testing

Test the shared configuration:

```bash
# From any project
claude-test run           # Comprehensive testing
claude-test validate      # Quick validation
claude-test benchmark     # Performance testing
```

## 🔄 Updates

Update the shared configuration:

```bash
# Update Nix packages
/m-nix-setup update

# Update shared commands
git pull # if using git for configuration management
```

## 🤝 Contributing

To add new shared functionality:

1. **Commands**: Add to `/commands/`
2. **Templates**: Add to `/templates/`
3. **Scripts**: Add to `/scripts/`
4. **Documentation**: Update relevant docs

## 🆘 Troubleshooting

### Common Issues

**Commands not found**:
```bash
# Check Claude path resolution
/m-nix-setup status
```

**Environment not activating**:
```bash
# Reinstall Nix integration
/m-nix-setup install
```

**Project-specific issues**:
```bash
# Validate local configuration
claude-test validate
```

### Getting Help

- Check project-specific `.claude/settings.local.json`
- Review shared configuration documentation
- Use `/m-help` for context-aware assistance
- Run diagnostic commands for specific issues

---

*This shared configuration system enables consistent, powerful development environments across all your projects while maintaining project-specific flexibility.*