# Claude Code Help System: Intelligent Development Assistant

**Topic:** $ARGUMENTS (Default: comprehensive help overview)

**Scope:** Context-aware help and command discovery for the Claude Code development environment

## Overview

Transforms Claude into an Expert Development Mentor with comprehensive knowledge of the Claude Code ecosystem, commands, workflows, and best practices. This command provides intelligent, context-aware assistance tailored to your current project state and development needs.

**Key Benefits:**
- **Context-Aware Guidance**: Provides help based on current project and environment state
- **Interactive Discovery**: Suggests relevant commands and optimal workflows
- **Learning Pathways**: Guides users from basic to advanced usage patterns
- **Troubleshooting Expert**: Comprehensive error resolution and diagnostics
- **Quick Reference Hub**: Fast access to command syntax and examples

## Help Documentation

To see this help documentation, run:
```bash
/m-help --help
```

## Core Features

### 1. Intelligent Context Analysis
- **Environment Detection**: Recognize project type, tech stack, and current state
- **User Proficiency Assessment**: Adapt explanations to user experience level
- **Workflow Optimization**: Suggest optimal command sequences for current tasks
- **Progress Tracking**: Understand where you are in development cycles

### 2. Command Discovery and Guidance
- **Smart Recommendations**: Suggest relevant commands based on current context
- **Usage Examples**: Provide practical, project-specific examples
- **Best Practices**: Share expert tips and optimal usage patterns
- **Integration Guidance**: Explain how commands work together

### 3. Learning and Development Support
- **Skill Progression**: Guide users from beginner to expert
- **Concept Explanation**: Explain underlying concepts and methodologies
- **Troubleshooting Assistance**: Systematic problem-solving approaches
- **Resource Recommendations**: Point to relevant documentation and learning materials

### 4. Comprehensive Reference System
- **Command Catalog**: Complete reference of all available commands
- **Quick Syntax**: Fast syntax lookup for experienced users
- **Error Solutions**: Common issues and their resolutions
- **Environment Setup**: Detailed setup and configuration guidance

## Usage Examples

### Basic Help Access
```bash
# General help overview
/m-help

# Get help for specific topic
/m-help commands
/m-help security
/m-help workflows
```

### Context-Specific Help
```bash
# Help tailored to beginners
/m-help setup newbie

# Project-specific guidance
/m-help workflows project

# Error-focused help
/m-help troubleshooting error
```

### Learning Pathways
```bash
# Start learning journey
/m-help getting-started

# Advanced usage patterns
/m-help advanced-workflows

# Best practices guidance
/m-help best-practices
```

## Usage

```
/m-help [topic] [context]
```

## Command Options

```yaml
help_topics:
  commands: "Complete list of available commands with descriptions"
  nix: "Nix environment setup and management"
  security: "Security tools, scanning, and best practices"
  performance: "Performance optimization and monitoring"
  workflows: "Development workflows and command sequences"
  setup: "Setup, configuration, and environment preparation"
  troubleshooting: "Common issues, solutions, and diagnostics"
  getting-started: "Complete beginner's guide and learning path"
  advanced-workflows: "Expert-level usage patterns and optimization"
  best-practices: "Industry best practices and recommendations"

context_modes:
  project: "Project-specific help based on current codebase"
  error: "Error-focused help and resolution guidance"
  newbie: "Beginner-friendly explanations with detailed steps"
  expert: "Concise, advanced guidance for experienced developers"
  team: "Team collaboration and workflow guidance"
  ci-cd: "Continuous integration and deployment help"

help_depth:
  --quick: "Brief overview and essential information"
  --detailed: "Comprehensive explanation with examples"
  --interactive: "Interactive help with step-by-step guidance"
  --reference: "Quick reference format for experienced users"

learning_modes:
  --beginner: "Complete beginner's guide with explanations"
  --intermediate: "Assumes basic knowledge, focuses on integration"
  --advanced: "Expert-level concepts and optimization"
  --troubleshoot: "Problem-solving focused guidance"

output_format:
  --markdown: "Structured markdown format (default)"
  --checklist: "Action-oriented checklist format"
  --examples: "Example-heavy format with code samples"
  --reference-card: "Compact reference card format"
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

## Learning Pathways and Skill Development

### Beginner Learning Path
```yaml
beginner_journey:
  step_1:
    title: "Environment Setup"
    commands: ["/m-project-init", "/m-nix-setup"]
    concepts: ["project_structure", "development_environment"]
    
  step_2:
    title: "Basic Workflows"
    commands: ["/m-task-planner", "/m-commit-push"]
    concepts: ["task_management", "version_control"]
    
  step_3:
    title: "Code Quality"
    commands: ["/m-review-code", "/m-test-generation"]
    concepts: ["code_review", "testing_strategies"]
    
  step_4:
    title: "Advanced Development"
    commands: ["/m-orchestrated-dev", "/m-security-scan"]
    concepts: ["multi_agent_development", "security_practices"]
```

### Expert Optimization Strategies
```yaml
expert_patterns:
  productivity_workflows:
    daily_routine: ["/m-next-task", "/m-orchestrated-dev", "/m-commit-push"]
    weekly_maintenance: ["/m-project-cleanup", "/m-security-scan", "/m-document-update"]
    
  troubleshooting_patterns:
    build_issues: ["/m-fix-build", "/m-review-code"]
    bug_hunting: ["/m-fix-bug", "/m-test-generation"]
    
  team_collaboration:
    code_review_cycle: ["/m-review-code", "/m-debate-code", "/m-commit-push"]
    planning_sessions: ["/m-task-planner", "/m-next-context", "/m-debate-architecture"]
```

## Context-Aware Intelligence

### Environment Detection
```yaml
project_recognition:
  next_js_projects:
    indicators: ["package.json", "next.config.js", "pages/", "app/"]
    recommendations: ["web_security_focus", "performance_optimization"]
    
  typescript_projects:
    indicators: ["tsconfig.json", ".ts", ".tsx"]
    recommendations: ["type_safety_focus", "build_optimization"]
    
  multi_tenant_saas:
    indicators: ["organizations", "teams", "brands", "rbac"]
    recommendations: ["security_priority", "data_isolation_focus"]
```

### Smart Recommendations Engine
```yaml
recommendation_logic:
  based_on_git_status:
    uncommitted_changes: "Suggest /m-commit-push or /m-review-code"
    merge_conflicts: "Recommend /m-fix-bug and conflict resolution help"
    clean_state: "Suggest /m-next-task or /m-orchestrated-dev"
    
  based_on_recent_activity:
    heavy_coding: "Recommend /m-test-generation and /m-review-code"
    bug_reports: "Suggest /m-fix-bug and /m-security-scan"
    planning_phase: "Recommend /m-task-planner and /m-debate-architecture"
    
  based_on_project_health:
    test_coverage_low: "Prioritize /m-test-generation"
    security_alerts: "Urgent /m-security-scan recommendation"
    outdated_docs: "Suggest /m-document-update"
```

## Advanced Help Features

### Interactive Troubleshooting
- **Diagnostic Wizards**: Step-by-step problem diagnosis
- **Solution Trees**: Decision trees for complex problems
- **Context Preservation**: Remember previous help sessions
- **Learning Adaptation**: Adapt to user's growing expertise

### Integration with Development Tools
- **IDE Integration**: Context from current file and cursor position
- **Git Integration**: Help based on repository state
- **Build System Awareness**: Understand current build status
- **Error Log Analysis**: Parse and explain error messages

### Collaboration Features
- **Team Knowledge Sharing**: Share help patterns across team
- **Custom Help Topics**: Create project-specific help content
- **Learning Progress Tracking**: Track team skill development
- **Best Practice Evolution**: Learn from team usage patterns

## Troubleshooting Guide

### Common Help Scenarios

**"I'm new to Claude Code"**
```bash
/m-help getting-started newbie
/m-help setup --beginner
```

**"My build is failing"**
```bash
/m-help troubleshooting error
/m-fix-build
```

**"How do I optimize my workflow?"**
```bash
/m-help workflows --advanced
/m-help best-practices expert
```

**"What's the best command for my current task?"**
```bash
/m-help --interactive
/m-next-task
```

### Emergency Quick Reference
```bash
# Most common commands
/m-help commands              # See all commands
/m-orchestrated-dev          # Main development workflow  
/m-fix-bug "error message"   # Fix specific issues
/m-security-scan             # Security check
/m-commit-push               # Save and push changes

# Environment issues
/m-nix-setup status          # Check environment
/m-project-init              # Reset project setup
/m-help troubleshooting      # Common problems

# Learning and improvement
/m-help getting-started      # New user guide
/m-help best-practices       # Expert tips
/m-next-task                 # What to do next
```

## Integration Patterns

### Command Sequencing
```yaml
optimal_sequences:
  morning_startup:
    - "/m-help --quick"           # Quick status overview
    - "/m-next-task"             # See pending work
    - "/m-orchestrated-dev"      # Start development
    
  code_review_prep:
    - "/m-review-code"           # Self-review first
    - "/m-test-generation"       # Ensure test coverage
    - "/m-security-scan"         # Security check
    - "/m-commit-push"           # Clean commit
    
  debugging_workflow:
    - "/m-help troubleshooting"  # Get debugging strategy
    - "/m-fix-bug"              # Systematic bug fixing
    - "/m-test-generation"       # Prevent regression
    - "/m-review-code"           # Validate fix quality
```

### Learning Integration
```yaml
learning_enhancement:
  command_explanation:
    before_execution: "Show what command will do"
    during_execution: "Explain steps as they happen"
    after_execution: "Summarize what was accomplished"
    
  skill_building:
    beginner_hints: "Extra explanation and safety checks"
    intermediate_tips: "Efficiency improvements and shortcuts"
    expert_insights: "Advanced patterns and optimizations"
```

---

*This intelligent help system provides context-aware assistance for the Claude Code development environment. The system learns from your usage patterns and adapts to your growing expertise. Use `/m-help [topic] [context]` for specific guidance tailored to your current needs and skill level.*