# Claude Code Commands Reference

Complete reference for all available Claude Code commands with consistent `/m-*` prefix.

## 📋 Complete Command List

All commands are now standardized with the `/m-*` prefix for consistency:

| Command | Category | Description |
|---------|----------|-------------|
| `/m-help` | System | Context-aware help and command discovery |
| `/m-project-init` | Setup | Initialize project with shared configuration |
| `/m-nix-setup` | Environment | Nix environment management |
| `/m-orchestrated-dev` | Development | Multi-agent development workflow |
| `/m-commit-push` | Development | Intelligent commit and push |
| `/m-bug-fix` | Development | Comprehensive bug analysis and fixing |
| `/m-security-scan` | Security | Security vulnerability scanning |
| `/m-test-generation` | Testing | Automated test creation |
| `/m-review-code` | Quality | Code quality review |
| `/m-project-cleanup` | Maintenance | Project maintenance and cleanup |
| `/m-task-planner` | Planning | Task analysis and planning |
| `/m-tdd-planner` | Planning | Test-driven development planning |
| `/m-next-task` | Planning | Next action recommendations |
| `/m-next-context` | Planning | Context compilation and analysis |
| `/m-debate-architecture` | Architecture | Architecture review and analysis |
| `/m-debate-code` | Architecture | Tactical code review |
| `/m-document-update` | Documentation | Documentation maintenance |
| `/m-branch-prune` | Git | Branch cleanup and management |
| `/m-branch-prune-lite` | Git | Lightweight branch cleanup |

## 🎯 Command Categories

### Core Development Workflow
Essential commands for daily development:
- **`/m-orchestrated-dev`** - Multi-agent coordinated development
- **`/m-commit-push`** - Smart commits with conventional messages
- **`/m-bug-fix`** - Systematic debugging and issue resolution
- **`/m-project-init`** - Set up new or existing projects

### Code Quality & Security
Ensuring code quality and security:
- **`/m-security-scan`** - Comprehensive vulnerability scanning
- **`/m-test-generation`** - Automated test creation with coverage
- **`/m-review-code`** - Detailed code quality analysis
- **`/m-project-cleanup`** - Technical debt reduction

### Planning & Analysis
Strategic planning and analysis:
- **`/m-task-planner`** - Requirements analysis and task decomposition
- **`/m-tdd-planner`** - Test-driven development planning
- **`/m-next-task`** - Intelligent next action recommendations
- **`/m-next-context`** - Context compilation for complex tasks

### Architecture & Design
High-level design and architecture:
- **`/m-debate-architecture`** - Strategic architecture review
- **`/m-debate-code`** - Implementation-level code analysis

### Project Management
Project organization and maintenance:
- **`/m-document-update`** - Keep documentation current
- **`/m-branch-prune`** - Clean up merged branches
- **`/m-branch-prune-lite`** - Quick branch cleanup

### Environment & Tools
Development environment management:
- **`/m-nix-setup`** - Manage shared Nix environments
- **`/m-help`** - Context-aware help system

## 🚀 Quick Start Workflows

### New Project Setup
```bash
/m-project-init nextjs-supabase    # Create from template
/m-nix-setup link                  # Link to shared environment
/m-task-planner                    # Plan initial work
/m-orchestrated-dev                # Start development
```

### Daily Development
```bash
/m-next-task                       # Check what's next
/m-orchestrated-dev                # Main development cycle
/m-test-generation                 # Add tests
/m-security-scan                   # Security check
/m-commit-push                     # Commit changes
```

### Code Quality Review
```bash
/m-review-code                     # Analyze code quality
/m-debate-code                     # Detailed implementation review
/m-project-cleanup                 # Clean up issues
/m-document-update                 # Update documentation
```

### Architecture Planning
```bash
/m-debate-architecture             # Review system design
/m-task-planner                    # Plan improvements
/m-tdd-planner                     # Design test strategy
/m-orchestrated-dev                # Implement changes
```

### Project Maintenance
```bash
/m-security-scan                   # Security audit
/m-branch-prune                    # Clean up branches
/m-project-cleanup                 # Technical debt cleanup
/m-document-update                 # Documentation refresh
```

## 💡 Command Usage Tips

### Chaining Commands
Many commands work well in sequence:
```bash
# Full development cycle
/m-task-planner → /m-orchestrated-dev → /m-test-generation → /m-commit-push

# Quality assurance cycle
/m-review-code → /m-security-scan → /m-project-cleanup → /m-document-update

# Architecture review cycle
/m-debate-architecture → /m-debate-code → /m-task-planner → /m-tdd-planner
```

### Context Awareness
Commands automatically adapt to:
- **Project type** (Next.js, Python, Rust, etc.)
- **Current git state** (branch, uncommitted changes)
- **Available tools** (package managers, frameworks)
- **Previous command history** (learning from usage patterns)

### Parallel Execution
Some commands can run simultaneously:
- Security scanning while development continues
- Documentation updates alongside code reviews
- Branch cleanup during inactive development periods

## 🔧 Advanced Usage

### Custom Parameters
Most commands accept optional parameters:
```bash
/m-security-scan dependencies       # Focus on dependency vulnerabilities
/m-review-code src/auth deep        # Deep review of auth module
/m-test-generation unit 90%         # Generate unit tests with 90% coverage
/m-bug-fix #123                     # Fix specific GitHub issue
```

### Environment Integration
Commands integrate with shared Nix environment:
```bash
# Environment tools available during command execution
dashboard                          # View development metrics
security                          # Quick security check
cache-status                      # Check dependency cache
monitor                           # System monitoring
```

### Project-Specific Behavior
Commands adapt based on project configuration:
- **Next.js projects**: Include Vercel deployment, Supabase integration
- **Python projects**: Use Poetry, pytest, Black formatting
- **Rust projects**: Cargo workflows, clippy linting
- **Go projects**: Module management, golangci-lint

## 🎛 Configuration

### Shared Configuration
All commands inherit from `../.claude/settings.base.json`:
- Common permissions and security settings
- Shared environment variables
- Standard command aliases

### Project Overrides
Each project can customize in `.claude/settings.local.json`:
```json
{
  "extends": "../.claude/settings.base.json",
  "permissions": {
    "allow": [
      // Project-specific permissions
    ]
  },
  "workflows": {
    "custom-workflow": ["command1", "command2"]
  }
}
```

### Command Aliases
Shortcuts available for all commands:
```bash
# Short forms (without /m- prefix)
help                              # → /m-help
security-scan                     # → /m-security-scan
orchestrated-dev                  # → /m-orchestrated-dev
# ... etc
```

## 🆘 Getting Help

### General Help
```bash
/m-help                           # Context-aware help
/m-help commands                  # List all commands
/m-help troubleshooting          # Common issues
```

### Command-Specific Help
```bash
/m-help security                  # Security-related help
/m-help workflows                 # Development workflows
/m-help setup                     # Setup and configuration
```

### Context-Specific Help
```bash
/m-help project                   # Project-specific guidance
/m-help newbie                    # Beginner-friendly explanations
/m-help error                     # Error resolution help
```

## 📊 Command Metrics

The system tracks command usage and provides insights:
- **Frequency**: Most-used commands per project
- **Success rates**: Command completion statistics
- **Performance**: Execution times and optimization opportunities
- **Patterns**: Common command sequences and workflows

Access metrics through:
```bash
dashboard                         # Overall development metrics
claude-cmd metrics               # Detailed command statistics
/m-help usage                    # Usage pattern analysis
```

---

*All commands follow the consistent `/m-*` prefix pattern and integrate seamlessly with the shared Claude Code + Nix development environment.*