# Claude Commands - Generalized for Open Source

This directory contains a comprehensive suite of Claude commands that have been generalized for use across different projects and technology stacks. Originally developed for a specific project, these commands have been abstracted to work with any modern web application.

## Overview

These commands transform Claude into specialized AI agents for various development tasks:
- **Development Workflows**: Code review, bug fixing, test generation
- **Project Management**: JIRA integration, sprint planning, estimation
- **Architecture**: Technical specifications, architecture debates
- **DevOps**: Build fixing, security scanning, deployment
- **Team Collaboration**: Onboarding, documentation, knowledge sharing

## Getting Started

### 1. Configuration

To customize these commands for your project:

1. Copy the configuration template:
   ```bash
   cp .claude/claude-commands-config.template.json .claude/claude-commands-config.json
   ```

2. Edit the configuration file with your project-specific values:
   ```json
   {
     "project": {
       "name": "my-app",
       "displayName": "My Application",
       "domain": "myapp.com",
       "type": "SaaS Platform"
     },
     "technology": {
       "frontend": {
         "framework": "React",
         "version": "18.0"
       }
     }
   }
   ```

### 2. Available Commands

#### Development Commands
- `/m-fix-bug` - AI-powered bug fixing with root cause analysis
- `/m-fix-build` - Comprehensive build error detection and fixing
- `/m-review-code` - Intelligent code review with best practices
- `/m-test-generation` - Automated test generation with coverage analysis
- `/m-tdd-planner` - Test-driven development planning

#### Architecture & Planning
- `/m-task-planner` - Strategic task planning and decomposition
- `/m-debate-architecture` - Multi-perspective architecture analysis
- `/m-debate-code` - Code implementation debate and optimization
- `/m-product-tech-spec` - Technical specification generation
- `/m-product-canvas` - Product canvas and strategy development

#### Project Management
- `/m-jira-*` - Complete JIRA integration suite:
  - `/m-jira-estimate` - AI-powered story point estimation
  - `/m-jira-planning` - Epic and sprint planning
  - `/m-jira-sprint` - Sprint management and optimization
  - `/m-jira-workflow` - Workflow automation
  - `/m-jira-report` - Advanced reporting and analytics

#### Team & Knowledge
- `/m-onboard-me` - Interactive onboarding for new engineers
- `/m-document-update` - Intelligent documentation management
- `/m-ask-gemini` - Dual-AI collaboration with Gemini
- `/m-help` - Command discovery and usage guide

#### DevOps & Security
- `/m-security-scan` - Comprehensive security analysis
- `/m-project-init` - Project initialization and setup
- `/m-project-cleanup` - Code cleanup and optimization
- `/m-nix-setup` - Nix environment configuration

### 3. Command Patterns

All commands follow consistent patterns:

```bash
# Basic usage
/command-name

# With arguments
/command-name argument1 argument2

# With options
/command-name --option value

# Help documentation
/command-name --help
```

## Customization Guide

### Technology Stack Adaptation

The commands automatically adapt to your technology stack based on:
1. Configuration file settings
2. Project file detection (package.json, requirements.txt, etc.)
3. Code analysis and pattern recognition

### Adding Custom Commands

1. Create a new command file: `.claude/commands/m-your-command.md`
2. Follow the existing command structure
3. Use configuration variables for project-specific values
4. Test thoroughly with your project

### Extending Existing Commands

Commands can be extended by:
1. Adding custom patterns to the configuration
2. Creating project-specific command variants
3. Overriding default behaviors with local settings

## Best Practices

1. **Start with Configuration**: Always set up your project configuration first
2. **Use Help Commands**: Each command has `--help` for detailed documentation
3. **Leverage AI Integration**: Commands work best with MCP agents configured
4. **Customize Gradually**: Start with defaults and customize as needed
5. **Share Improvements**: Contribute enhancements back to the community

## Architecture

These commands use:
- **Modular Design**: Each command is self-contained
- **Configuration-Driven**: Project settings drive behavior
- **AI-Powered**: Leverages Claude's capabilities with optional Gemini integration
- **Tool Integration**: Works with standard development tools
- **Extensible Framework**: Easy to add new capabilities

## Contributing

To contribute improvements:
1. Keep commands generic and configurable
2. Avoid hardcoding project-specific values
3. Use configuration variables for customization
4. Document new features and options
5. Test across different project types

## Migration from Project-Specific Commands

If you're migrating from project-specific commands:
1. Replace hardcoded values with configuration variables
2. Update project references to use generic terminology
3. Abstract framework-specific code to be tool-agnostic
4. Test commands with your new configuration

## Support

For issues or questions:
1. Check command help: `/command-name --help`
2. Review configuration documentation
3. Examine example commands for patterns
4. Contribute improvements via pull requests

---

These generalized commands provide a powerful foundation for AI-assisted development across any modern software project. Customize them to fit your specific needs while maintaining their flexibility for future projects.