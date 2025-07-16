# AI-Powered Codebase Onboarding: Universal Developer Experience

**Target:** $ARGUMENTS (Optional: specific team/project context)

**Scope:** Dynamic, intelligent onboarding that adapts to any codebase, technology stack, and development environment

## Overview

Transforms Claude into your AI-powered Onboarding Specialist that analyzes your specific codebase in real-time and creates a personalized, interactive learning experience. This command works with any technology stack - from Next.js to Django, React to Vue, PostgreSQL to MongoDB - by intelligently discovering your project's patterns, architecture, and conventions to deliver world-class onboarding experiences.

**Key Benefits:**
- **Universal Compatibility**: Works with any language, framework, or architecture
- **Dynamic Analysis**: Real-time codebase discovery and pattern recognition
- **Personalized Learning**: Adapts to individual experience levels and learning styles
- **Interactive Discovery**: Hands-on exploration with guided exercises
- **Team Integration**: Contextual onboarding based on actual team work patterns

## Help Documentation

To see this help documentation, run:
```bash
/m-onboard-me --help
```

## Core Features

### 1. Dynamic Codebase Analysis Engine
- **Technology Stack Detection**: Automatically identifies languages, frameworks, databases, and tools
- **Architecture Pattern Recognition**: Discovers MVC, microservices, monoliths, or custom patterns
- **Code Convention Analysis**: Learns naming conventions, file organization, and coding standards
- **Dependency Mapping**: Understands external libraries, APIs, and service integrations

### 2. Adaptive Learning Framework
- **Experience Level Assessment**: Tailors depth and pace to individual background
- **Learning Style Optimization**: Adapts to visual, hands-on, or conceptual learning preferences
- **Progressive Skill Building**: Builds from foundational concepts to advanced patterns
- **Interactive Knowledge Validation**: Real-time comprehension testing and feedback

### 3. Intelligent Content Generation
- **Custom Exercise Creation**: Generates relevant coding exercises based on actual codebase
- **Contextual Documentation**: Creates explanations specific to your project's patterns
- **Team-Specific Insights**: Analyzes recent commits and issues for relevant context
- **Best Practice Guidance**: Identifies and explains project-specific conventions

### 4. Universal Integration Platform
- **Version Control Analysis**: Git history mining for evolution insights
- **Issue Tracking Integration**: Connects with GitHub Issues, Jira, or similar systems
- **Development Environment Setup**: Automated detection and setup guidance
- **Testing Framework Integration**: Discovers and explains testing patterns

## Usage Examples

```bash
# Basic onboarding - analyzes current directory
/m-onboard-me

# Team-specific onboarding with context
/m-onboard-me --team backend-api

# Focus on specific technology areas
/m-onboard-me --focus architecture
/m-onboard-me --focus database
/m-onboard-me --focus frontend

# Experience level customization
/m-onboard-me --experience junior
/m-onboard-me --experience senior

# Learning style preferences
/m-onboard-me --style hands-on
/m-onboard-me --style conceptual
```

## Command Options

- `--team <name>`: Team-specific onboarding with context
- `--focus <area>`: Focus on specific technology area
- `--experience <level>`: Customize for experience level (junior/mid/senior)
- `--style <type>`: Learning style preference (visual/hands-on/conceptual)
- `--quick`: Fast-track overview for experienced developers
- `--deep`: Comprehensive deep-dive onboarding
- `--interactive`: Enhanced interactive mode with Q&A

## Implementation Framework

### Phase 1: Intelligent Codebase Discovery

The command begins by analyzing the current project to understand its unique characteristics:

```bash
# Codebase analysis initialization
analyze_codebase() {
    echo "🔍 ANALYZING YOUR CODEBASE..."
    echo "============================="
    echo ""
    
    # Detect project type and technology stack
    detect_technology_stack
    
    # Analyze project structure and patterns
    analyze_project_architecture
    
    # Discover development workflows
    discover_development_patterns
    
    # Identify team conventions
    extract_coding_conventions
    
    # Generate onboarding plan
    create_personalized_onboarding_plan
}

detect_technology_stack() {
    echo "🔎 TECHNOLOGY STACK DETECTION"
    echo "-----------------------------"
    
    # Use comprehensive analysis to detect stack
    TECH_ANALYSIS=$(analyze_current_project)
    
    # Frontend framework detection
    if [[ -f "package.json" ]]; then
        FRONTEND_FRAMEWORK=$(detect_frontend_framework)
        echo "Frontend: $FRONTEND_FRAMEWORK"
    fi
    
    # Backend framework detection
    BACKEND_FRAMEWORK=$(detect_backend_framework)
    echo "Backend: $BACKEND_FRAMEWORK"
    
    # Database technology
    DATABASE_TECH=$(detect_database_technology)
    echo "Database: $DATABASE_TECH"
    
    # Additional tools and services
    TOOLS_AND_SERVICES=$(detect_tools_and_services)
    echo "Tools: $TOOLS_AND_SERVICES"
    
    echo ""
    echo "✅ Technology stack analysis complete!"
}

analyze_project_architecture() {
    echo "🏗️ ARCHITECTURE ANALYSIS"
    echo "------------------------"
    
    # Analyze directory structure
    PROJECT_STRUCTURE=$(analyze_directory_structure)
    
    # Identify architectural patterns
    ARCHITECTURE_PATTERNS=$(identify_architectural_patterns)
    
    # Analyze component relationships
    COMPONENT_RELATIONSHIPS=$(analyze_component_relationships)
    
    # Generate architecture summary
    ARCHITECTURE_SUMMARY=$(/mcp__gemini__gemini-query "Analyze project architecture:
    
    Project structure: $PROJECT_STRUCTURE
    Detected patterns: $ARCHITECTURE_PATTERNS
    Component relationships: $COMPONENT_RELATIONSHIPS
    
    Provide:
    1. High-level architecture overview
    2. Key architectural decisions and patterns
    3. Component interaction patterns
    4. Data flow and state management
    5. Important concepts for new developers
    
    Tailor explanation to detected technology stack and make it beginner-friendly.")
    
    echo "$ARCHITECTURE_SUMMARY"
}
```

### Phase 2: Personalized Learning Path Generation

Based on the analysis, the system creates a customized learning experience:

```bash
create_personalized_onboarding_plan() {
    echo "🎯 PERSONALIZED ONBOARDING PLAN"
    echo "==============================="
    
    # Assess developer experience and preferences
    assess_developer_context
    
    # Generate learning objectives
    generate_learning_objectives
    
    # Create progressive learning path
    create_learning_path
    
    # Prepare interactive exercises
    prepare_contextual_exercises
}

assess_developer_context() {
    echo "👤 DEVELOPER CONTEXT ASSESSMENT"
    echo "-------------------------------"
    echo ""
    echo "Let me customize your onboarding experience:"
    echo ""
    
    # Gather developer context
    echo "1. What's your experience level with $FRONTEND_FRAMEWORK?"
    echo "2. How familiar are you with $BACKEND_FRAMEWORK?"
    echo "3. Experience with $DATABASE_TECH?"
    echo "4. Preferred learning style? (visual/hands-on/conceptual)"
    echo "5. What's your primary role? (frontend/backend/fullstack/devops)"
    echo ""
    
    # AI-powered personalization
    PERSONALIZATION_PLAN=$(/mcp__gemini__gemini-query "Create personalized onboarding plan:
    
    Technology stack: $FRONTEND_FRAMEWORK, $BACKEND_FRAMEWORK, $DATABASE_TECH
    Architecture: $ARCHITECTURE_SUMMARY
    Developer context: [responses will be provided]
    
    Generate:
    1. Learning priority order
    2. Appropriate depth level for each topic
    3. Recommended timeline
    4. Key concepts to emphasize
    5. Potential challenge areas
    6. Suggested learning resources
    
    Adapt to developer's experience level and learning style.")
    
    echo "📋 YOUR PERSONALIZED PLAN:"
    echo "$PERSONALIZATION_PLAN"
}

generate_learning_objectives() {
    echo "🎯 LEARNING OBJECTIVES"
    echo "----------------------"
    
    # Generate specific, measurable objectives
    LEARNING_OBJECTIVES=$(/mcp__gemini__gemini-query "Create specific learning objectives:
    
    Based on: $ARCHITECTURE_SUMMARY
    Technology stack: $FRONTEND_FRAMEWORK, $BACKEND_FRAMEWORK, $DATABASE_TECH
    
    Generate 5-7 specific, measurable objectives like:
    - Understand [specific architectural pattern] and how it's implemented
    - Navigate [specific directory structure] and locate key components
    - Implement [specific type of feature] following project conventions
    - Debug [specific type of issue] using project tooling
    - Contribute to [specific workflow] following team processes
    
    Make objectives specific to this codebase and technology stack.")
    
    echo "$LEARNING_OBJECTIVES"
}
```

### Phase 3: Interactive Architecture Exploration

The system provides hands-on exploration of the specific codebase:

```bash
explore_codebase_interactively() {
    echo "🗺️ INTERACTIVE CODEBASE EXPLORATION"
    echo "===================================="
    
    # Start with overview
    provide_codebase_overview
    
    # Explore key directories and files
    explore_key_components
    
    # Trace through important workflows
    trace_important_workflows
    
    # Hands-on exercises
    conduct_hands_on_exercises
}

provide_codebase_overview() {
    echo "📊 CODEBASE OVERVIEW"
    echo "-------------------"
    
    # Generate visual representation
    CODEBASE_OVERVIEW=$(/mcp__gemini__gemini-query "Create codebase overview:
    
    Technology: $FRONTEND_FRAMEWORK, $BACKEND_FRAMEWORK, $DATABASE_TECH
    Architecture: $ARCHITECTURE_SUMMARY
    Structure: $PROJECT_STRUCTURE
    
    Create:
    1. Visual directory structure explanation
    2. Key files and their purposes
    3. Important entry points
    4. Configuration files and their roles
    5. Build and development scripts
    
    Format as an educational guide for new developers.")
    
    echo "$CODEBASE_OVERVIEW"
    
    # Interactive navigation
    echo ""
    echo "🎮 INTERACTIVE NAVIGATION:"
    echo "Let's explore together! I'll show you key files and explain their purpose."
    echo ""
}

explore_key_components() {
    echo "🔍 KEY COMPONENT EXPLORATION"
    echo "----------------------------"
    
    # Identify the most important files to understand
    KEY_FILES=$(identify_key_files)
    
    for file in $KEY_FILES; do
        if [[ -f "$file" ]]; then
            echo "📄 EXPLORING: $file"
            echo "$(printf '%.0s-' {1..50})"
            
            # Show file content with explanation
            FILE_CONTENT=$(head -50 "$file")
            
            FILE_EXPLANATION=$(/mcp__gemini__gemini-query "Explain this file for new developer:
            
            File: $file
            Content: $FILE_CONTENT
            Project context: $ARCHITECTURE_SUMMARY
            
            Explain:
            1. What this file does
            2. How it fits into the architecture
            3. Key concepts demonstrated
            4. Patterns to notice
            5. How it connects to other components
            
            Make it educational and highlight important concepts.")
            
            echo "$FILE_EXPLANATION"
            echo ""
            
            # Interactive questions
            echo "🤔 THINK ABOUT IT:"
            echo "- How does this file contribute to the overall system?"
            echo "- What would happen if you modified key parts?"
            echo "- How does it follow the project's conventions?"
            echo ""
        fi
    done
}

trace_important_workflows() {
    echo "🔄 WORKFLOW TRACING"
    echo "-------------------"
    
    # Identify key workflows in the application
    IMPORTANT_WORKFLOWS=$(identify_important_workflows)
    
    echo "Let's trace through important workflows in your application:"
    echo ""
    
    for workflow in $IMPORTANT_WORKFLOWS; do
        echo "📋 WORKFLOW: $workflow"
        echo "$(printf '%.0s-' {1..30})"
        
        WORKFLOW_TRACE=$(/mcp__gemini__gemini-query "Trace workflow for learning:
        
        Workflow: $workflow
        Architecture: $ARCHITECTURE_SUMMARY
        Technology: $FRONTEND_FRAMEWORK, $BACKEND_FRAMEWORK
        
        Trace the workflow step by step:
        1. Entry point (where it starts)
        2. Key functions/components involved
        3. Data flow and transformations
        4. External dependencies
        5. Output or result
        
        Include file names and line numbers where possible.
        Make it educational with clear explanations.")
        
        echo "$WORKFLOW_TRACE"
        echo ""
    done
}
```

### Phase 4: Technology-Specific Skill Building

The system adapts exercises to the specific technology stack:

```bash
conduct_hands_on_exercises() {
    echo "💻 HANDS-ON EXERCISES"
    echo "====================="
    
    # Generate exercises based on detected technology
    generate_technology_specific_exercises
    
    # Provide templates and guidance
    provide_exercise_templates
    
    # Conduct mini-implementation challenges
    conduct_implementation_challenges
}

generate_technology_specific_exercises() {
    echo "🎯 CUSTOMIZED EXERCISES"
    echo "----------------------"
    
    # Generate exercises based on actual technology stack
    EXERCISES=$(/mcp__gemini__gemini-query "Create hands-on exercises:
    
    Technology stack: $FRONTEND_FRAMEWORK, $BACKEND_FRAMEWORK, $DATABASE_TECH
    Architecture: $ARCHITECTURE_SUMMARY
    Project patterns: $CODING_CONVENTIONS
    
    Create 3-5 progressive exercises:
    1. Basic - Simple modification or addition
    2. Intermediate - Feature implementation
    3. Advanced - Integration or optimization
    
    For each exercise include:
    - Clear objective
    - Step-by-step instructions
    - Expected outcome
    - Files to modify/create
    - Testing instructions
    
    Adapt to detected technology stack and project patterns.")
    
    echo "$EXERCISES"
}

provide_exercise_templates() {
    echo "📝 EXERCISE TEMPLATES"
    echo "--------------------"
    
    # Provide starter templates based on technology
    TEMPLATES=$(/mcp__gemini__gemini-query "Create exercise templates:
    
    Technology: $FRONTEND_FRAMEWORK, $BACKEND_FRAMEWORK, $DATABASE_TECH
    Conventions: $CODING_CONVENTIONS
    
    Provide starter templates for:
    1. Component/module creation
    2. API endpoint implementation
    3. Database integration
    4. Testing setup
    
    Use actual project conventions and patterns.")
    
    echo "$TEMPLATES"
}
```

### Phase 5: Team Integration and Next Steps

The system provides team-specific context and growth path:

```bash
facilitate_team_integration() {
    echo "👥 TEAM INTEGRATION"
    echo "=================="
    
    # Analyze team patterns and recent work
    analyze_team_context
    
    # Provide development workflow guidance
    explain_development_workflow
    
    # Suggest first contributions
    suggest_first_contributions
    
    # Provide ongoing learning resources
    provide_learning_resources
}

analyze_team_context() {
    echo "🔍 TEAM CONTEXT ANALYSIS"
    echo "------------------------"
    
    # Analyze recent commits and issues
    RECENT_ACTIVITY=$(analyze_recent_development_activity)
    
    # Identify team patterns
    TEAM_PATTERNS=$(identify_team_patterns)
    
    TEAM_CONTEXT=$(/mcp__gemini__gemini-query "Analyze team context:
    
    Recent activity: $RECENT_ACTIVITY
    Team patterns: $TEAM_PATTERNS
    Technology stack: $FRONTEND_FRAMEWORK, $BACKEND_FRAMEWORK
    
    Provide insights about:
    1. What the team has been working on
    2. Common types of contributions
    3. Key areas of focus
    4. Collaboration patterns
    5. Good first contribution opportunities
    
    Make it specific to actual team activity.")
    
    echo "$TEAM_CONTEXT"
}

suggest_first_contributions() {
    echo "🌱 FIRST CONTRIBUTION SUGGESTIONS"
    echo "================================="
    
    # Analyze codebase for good first issues
    FIRST_CONTRIBUTIONS=$(/mcp__gemini__gemini-query "Suggest first contributions:
    
    Codebase analysis: $ARCHITECTURE_SUMMARY
    Team context: $TEAM_CONTEXT
    Technology: $FRONTEND_FRAMEWORK, $BACKEND_FRAMEWORK
    
    Suggest 3-5 good first contributions:
    1. Documentation improvements
    2. Small bug fixes
    3. Code quality improvements
    4. Testing additions
    5. Feature enhancements
    
    For each suggestion:
    - Specific task description
    - Expected difficulty level
    - Learning objectives
    - Files to work with
    - Success criteria
    
    Make suggestions specific to this codebase.")
    
    echo "$FIRST_CONTRIBUTIONS"
}
```

## Universal Technology Support

### Automatic Technology Detection

The command automatically detects and adapts to:

**Frontend Frameworks:**
- React, Vue, Angular, Svelte
- Next.js, Nuxt.js, Gatsby
- Plain JavaScript/TypeScript

**Backend Frameworks:**
- Node.js (Express, Fastify, Nest.js)
- Python (Django, Flask, FastAPI)
- Java (Spring, Spring Boot)
- C# (.NET, ASP.NET)
- Go (Gin, Echo)
- Ruby (Rails, Sinatra)
- PHP (Laravel, Symfony)

**Databases:**
- PostgreSQL, MySQL, MongoDB
- Redis, Elasticsearch
- SQLite, CouchDB

**Additional Tools:**
- Docker, Kubernetes
- CI/CD (GitHub Actions, GitLab CI)
- Testing frameworks
- Build tools and bundlers

### Adaptive Learning Paths

The system creates different learning paths based on detected technology:

```yaml
technology_adaptations:
  react_nextjs:
    focus_areas: ["Component patterns", "Server-side rendering", "Routing", "State management"]
    key_concepts: ["JSX", "Hooks", "Context", "Props"]
    exercises: ["Create component", "Implement route", "Add state management"]
    
  django_python:
    focus_areas: ["MVT pattern", "ORM", "Admin interface", "URL routing"]
    key_concepts: ["Models", "Views", "Templates", "Migrations"]
    exercises: ["Create model", "Implement view", "Add template"]
    
  spring_boot_java:
    focus_areas: ["Dependency injection", "REST controllers", "JPA", "Security"]
    key_concepts: ["Annotations", "Beans", "Controllers", "Services"]
    exercises: ["Create REST endpoint", "Add service layer", "Implement security"]
```

## Advanced Features

### Git History Analysis
- Analyzes commit patterns and evolution
- Identifies key contributors and their areas
- Shows architectural evolution over time

### Issue Tracking Integration
- Connects with GitHub Issues, Jira, or similar
- Analyzes issue patterns and common problems
- Suggests areas for contribution

### Development Environment Setup
- Automatically detects required tools
- Provides setup instructions
- Validates environment configuration

### Performance and Security Analysis
- Identifies performance patterns
- Highlights security considerations
- Suggests optimization opportunities

## Configuration Options

```bash
# Experience level customization
/m-onboard-me --experience junior --deep
/m-onboard-me --experience senior --quick

# Technology focus
/m-onboard-me --focus frontend --style visual
/m-onboard-me --focus backend --style hands-on

# Team integration
/m-onboard-me --team backend-api --with-jira
/m-onboard-me --team frontend --with-github-issues
```

This universal onboarding command provides intelligent, adaptive onboarding that works with any technology stack while delivering personalized learning experiences based on actual codebase analysis and team context.