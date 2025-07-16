# Generate Project CLAUDE.md

**Purpose**: Analyze the current project's codebase and generate/update the project's CLAUDE.md file with comprehensive information needed for world-class AI assistance.

**Context Extension:** For the purpose of analysis and exploration always use "ultrathink" mode to allocate the most computational budget possible.

## Overview

This command performs a deep analysis of the current project's codebase, technology stack, architecture, and patterns to create a comprehensive CLAUDE.md file that enables Claude Code to provide optimal assistance for the specific project.

## What This Command Does

### 1. Codebase Analysis
- Determine language and package utilities
- Analyzes package.json/mix.exs/etc for dependencies and scripts
- Examines project directory structure and organization
- Identifies technology stack and frameworks
- Reviews database schemas and naming conventions
- Analyzes API routes and patterns
- Examines component architecture and patterns
- Reviews testing setup and configuration
- Identifies unique architectural patterns

### 2. Technology Stack Detection
- Framework identification (Next.js, React, Vue, Elixir, PHP, Rails, etc.)
- Language detection and version (TypeScript, JavaScript, etc.)
- Database technology and patterns
- Authentication and security implementations
- State management patterns
- Build tools and deployment configuration
- Testing frameworks and patterns

### 3. Architecture Pattern Recognition
- Single/Multi-tenant architecture detection
- Authentication/authorization patterns
- Database design patterns
- API architecture and conventions
- Component organization patterns
- Security implementation patterns
- Performance optimization patterns

### 4. Documentation Generation
- Creates comprehensive project overview
- Documents tech stack with versions
- Explains key architectural decisions
- Provides code examples and patterns
- Includes database standards and conventions
- Documents security implementations
- Explains development workflows
- Provides configuration details

## Usage

```bash
# Generate new CLAUDE.md
/m-generate-claude-md

# Generate with specific focus area
/m-generate-claude-md --focus database

# Generate with custom output file
/m-generate-claude-md --output custom-claude.md

# Analyze and update existing CLAUDE.md
/m-generate-claude-md --update

# Generate minimal version
/m-generate-claude-md --minimal
```

## Command Options

- `--focus <area>`: Focus on specific area (database, api, auth, frontend, etc.)
- `--output <file>`: Specify output file (default: CLAUDE.md)
- `--update`: Update existing CLAUDE.md instead of replacing
- `--minimal`: Generate minimal version with essential info only
- `--include-examples`: Include more code examples and patterns
- `--analyze-git`: Include git history analysis in documentation

## Implementation

The command will:

1. **Initialize Analysis Context**
   - Detect project root and key files
   - Identify primary technology stack
   - Establish project type and domain

2. **Perform Deep Codebase Analysis**
   - Review Git history of the respository for releases
   - Read package files and analyze dependencies
   - Examine file structure and organization
   - Analyze database schemas and migrations
   - Review API routes and middleware
   - Examine component patterns and architecture
   - Analyze configuration files
   - Review testing setup and patterns

3. **Extract Architectural Patterns**
   - Identify unique patterns and conventions
   - Analyze security implementations
   - Review state management approaches
   - Examine build and deployment configurations
   - Identify performance optimization patterns

4. **Generate Comprehensive Documentation**
   - Create project overview with context
   - Document complete technology stack
   - Explain key architectural decisions
   - Provide coding standards and conventions
   - Include database patterns and standards
   - Document security implementations
   - Explain development workflows
   - Provide configuration and setup details

5. **Create CLAUDE.md File**
   - Generate structured documentation
   - Include code examples and patterns
   - Provide clear conventions and standards
   - Include memory tracking for key decisions
   - Add references to detailed documentation
   - Include MCP configuration if applicable

## Generated Structure

The generated CLAUDE.md will include:

### Core Sections
- **Project Overview**: Description, purpose, and domain
- **Technology Stack**: Complete tech stack with versions
- **Key Features**: Major functionality and capabilities
- **Architecture**: Core architectural patterns and decisions
- **Database Standards**: Naming conventions and design patterns
- **Security Implementation**: Authentication and authorization patterns
- **Development Patterns**: Coding standards and conventions
- **API Architecture**: Route organization and patterns
- **Testing Strategy**: Testing patterns and configuration
- **Deployment**: Build and deployment configuration

### Optional Sections (based on project)
- **Tenant Architecture**: If applicable
- **Auth Implementation**: If social auth is used
- **State Management**: Complex state patterns
- **Performance Optimizations**: Caching and optimization patterns
- **Third-Party Integrations**: External service patterns
- **Monitoring and Logging**: Observability patterns
- **CI/CD Pipeline**: Deployment and testing automation

## Analysis Tools Used

This command leverages various analysis tools:

- **File System Analysis**: Directory structure and organization
- **Package Analysis**: Dependencies and scripts
- **Code Pattern Recognition**: Architectural patterns
- **Database Schema Analysis**: Table structures and relationships
- **Configuration Analysis**: Build and deployment settings
- **Git History Analysis**: Recent changes and patterns
- **Security Pattern Detection**: Auth and security implementations
- **Performance Pattern Analysis**: Optimization strategies

## Best Practices

### For Effective Analysis
1. **Start Fresh**: Run from clean working directory
2. **Include Dependencies**: Ensure all dependencies are installed
3. **Review Output**: Always review generated documentation
4. **Update Regularly**: Re-run when architecture changes
5. **Customize for Project**: Adapt patterns to project specifics

### For Maintenance
1. **Version Control**: Track changes to CLAUDE.md
2. **Regular Updates**: Update after major changes
3. **Team Review**: Have team review generated documentation
4. **Continuous Improvement**: Refine patterns over time

## Framework Agnostic Design

This command is designed to work with any technology stack:

- **Language Agnostic**: Works with Elixir, Rails, PHP, TypeScript, JavaScript, Python, etc.
- **Framework Agnostic**: Supports Next.js, React, Vue, Angular, etc.
- **Database Agnostic**: Works with PostgreSQL, MySQL, MongoDB, etc.
- **Architecture Agnostic**: Supports various architectural patterns
- **Deployment Agnostic**: Works with different deployment strategies

## Output Quality

The generated CLAUDE.md will be:

- **Comprehensive**: Covers all important aspects
- **Actionable**: Provides concrete examples and patterns
- **Maintainable**: Easy to update and extend
- **Consistent**: Follows established documentation patterns
- **Specific**: Tailored to the actual project implementation

## Error Handling

The command includes robust error handling:

- **File Access Errors**: Graceful handling of permission issues
- **Parse Errors**: Robust parsing of configuration files
- **Missing Dependencies**: Clear error messages for missing tools
- **Invalid Configurations**: Helpful guidance for fixes

## Examples

### Basic Usage
```bash
# Generate complete CLAUDE.md for current project
/m-generate-claude-md
```

### Focused Analysis
```bash
# Focus on database patterns
/m-generate-claude-md --focus database

# Focus on API architecture
/m-generate-claude-md --focus api

# Focus on authentication patterns
/m-generate-claude-md --focus auth
```

### Custom Output
```bash
# Generate to custom file
/m-generate-claude-md --output PROJECT-DOCS.md

# Update existing file
/m-generate-claude-md --update

# Generate minimal version
/m-generate-claude-md --minimal
```

## Integration with Development Workflow

This command integrates with standard development workflows:

1. **Project Setup**: Run after initial project setup
2. **Architecture Changes**: Re-run after major architectural changes
3. **Onboarding**: Use to generate onboarding documentation
4. **Documentation Reviews**: Regular updates during sprint reviews
5. **Legacy Analysis**: Analyze existing projects for AI assistance

## Advanced Features

### Multi-Project Analysis
- **Monorepo Support**: Analyze multiple projects in monorepo
- **Service Analysis**: Analyze microservices individually
- **Cross-Project Patterns**: Identify shared patterns

### Integration Analysis
- **Third-Party Services**: Document external integrations
- **API Dependencies**: Analyze external API usage
- **Security Integrations**: Document OAuth and auth providers

### Performance Analysis
- **Bundle Analysis**: Analyze build output and optimizations
- **Database Performance**: Identify query patterns and indexes
- **Caching Strategies**: Document caching implementations

## Maintenance

### Regular Updates
- **Dependency Changes**: Update after major dependency updates
- **Architecture Evolution**: Re-run after architectural changes
- **Team Changes**: Update when team conventions change

### Quality Assurance
- **Documentation Review**: Regular team reviews of generated docs
- **Accuracy Validation**: Validate against actual implementation
- **Completeness Check**: Ensure all important aspects are covered

This command provides a comprehensive solution for generating world-class AI assistance documentation that is specifically tailored to your project's unique architecture, patterns, and conventions.