# Ask Gemini: AI-Powered Development Assistant

**Target:** $ARGUMENTS (Default: interactive prompt or question)

**Scope:** Streamlined interface to Google Gemini AI for development assistance, code analysis, and technical consultation

## Overview

Provides a streamlined interface to Google Gemini AI specifically optimized for development workflows. Offers context-aware assistance for code review, debugging, architecture decisions, documentation, and technical problem-solving directly within the Claude Code environment.

## Core Features

### Intelligent Context Management
- **Project-Aware**: Automatically includes relevant project context
- **File-Specific Analysis**: Analyze current file or specific code sections
- **Git Integration**: Analyze diffs, commits, and branch changes
- **Smart Context Selection**: Choose optimal context size for different queries

### Specialized Development Assistance
- **Code Review**: AI-powered code analysis and improvement suggestions
- **Debugging Help**: Analyze errors, stack traces, and failed tests
- **Architecture Guidance**: System design and architectural decision support
- **Documentation**: Generate and improve technical documentation

### Multi-Modal Interactions
- **Interactive Mode**: Conversational interface for complex discussions
- **Batch Processing**: Process multiple files or queries efficiently
- **Pipeline Integration**: Use with other CLI tools and workflows
- **Output Formatting**: Structured output for different use cases

## Execution Steps

1. **Context Analysis**
   - Determine optimal context based on query type
   - Analyze current working directory and project structure
   - Identify relevant files and code sections
   - Prepare context with appropriate scope

2. **Query Processing**
   - Parse user prompt and intent
   - Route to appropriate MCP Gemini tool based on query type
   - Format prompt with development-specific context
   - Apply best practices for technical queries

3. **MCP Integration**
   - Use MCP Gemini agent through Claude Code's native integration
   - Leverage `/gemini-query` for general questions
   - Use `/gemini-analyze-code` for code analysis
   - Use `/gemini-brainstorm` for collaborative problem-solving
   - Handle streaming responses and error conditions

4. **Result Integration**
   - Format response for CLI consumption
   - Provide actionable insights and suggestions
   - Integrate with development workflows
   - No external dependencies required (MCP handles authentication)

## Usage Patterns

### Basic Usage
```bash
# Ask a general development question
/m-ask-gemini "How can I optimize this React component for performance?"

# Get help with specific code
/m-ask-gemini "Explain this function" --file src/utils/auth.js

# Analyze current git changes
/m-ask-gemini "Review my recent changes" --diff

# Interactive session for complex topics
/m-ask-gemini --interactive "Let's discuss system architecture"
```

**New MCP Integration**: Commands now use the MCP Gemini agent:
- General queries → `/gemini-query`
- Code analysis → `/gemini-analyze-code`
- Brainstorming → `/gemini-brainstorm`
- No CLI dependency required

### Code Review and Analysis
```bash
# Review current changes
/m-ask-gemini "Review these changes for potential issues" --diff

# Analyze specific file
/m-ask-gemini "Suggest improvements for this code" --file components/UserProfile.tsx

# Security review
/m-ask-gemini "Check for security vulnerabilities" --all-files --focus security

# Performance analysis
/m-ask-gemini "Identify performance bottlenecks" --file src/api/routes.js
```

### Debugging and Problem Solving
```bash
# Analyze test failures
/m-ask-gemini "Why are these tests failing?" --test-output

# Debug error messages
/m-ask-gemini "Help me understand this error" --error-log error.log

# Analyze stack traces
/m-ask-gemini "Explain this stack trace" --stdin < crash.log

# Performance debugging
/m-ask-gemini "Debug slow API responses" --file api/users.js --context performance
```

### Documentation and Explanation
```bash
# Generate documentation
/m-ask-gemini "Create API documentation" --file api/routes.js --format markdown

# Explain complex code
/m-ask-gemini "Explain this algorithm step by step" --file utils/sorting.js

# Update README
/m-ask-gemini "Update README with recent changes" --all-files --output README.md

# Generate comments
/m-ask-gemini "Add JSDoc comments" --file utils/helpers.js --format jsdoc
```

### Architecture and Design
```bash
# System design review
/m-ask-gemini "Review system architecture" --all-files --focus architecture

# Database design
/m-ask-gemini "Optimize database schema" --file schema.sql --context database

# API design feedback
/m-ask-gemini "Review REST API design" --file api/ --focus api-design

# Technology recommendations
/m-ask-gemini "Suggest appropriate technologies" --context "new microservice"
```

## Command Options

### Context Control
```yaml
context_options:
  --file: "Analyze specific file(s)"
  --all-files: "Include entire project context"
  --diff: "Include git diff in context"
  --staged: "Include staged changes"
  --branch: "Compare with specific branch"
  --since: "Include changes since date/commit"
  
  --context: "Specify context type (security, performance, architecture)"
  --focus: "Focus analysis on specific aspects"
  --scope: "Limit scope (function, class, module, project)"
```

### Model Selection
```yaml
model_options:
  --model: "Choose Gemini model (auto, flash, pro)"
  --fast: "Use gemini-1.5-flash for quick responses"
  --pro: "Use gemini-2.5-pro for complex analysis"
  --auto: "Automatically select best model (default)"
```

### Output Control
```yaml
output_options:
  --format: "Output format (text, markdown, json, code)"
  --output: "Save output to file"
  --append: "Append to existing file"
  --clipboard: "Copy result to clipboard"
  --interactive: "Start interactive session"
  --stream: "Stream response in real-time"
```

### Integration Options
```yaml
integration_options:
  --stdin: "Read input from stdin"
  --pipe: "Optimize for pipeline usage"
  --quiet: "Minimal output for scripting"
  --verbose: "Detailed output and debug info"
  --save-session: "Save conversation for later"
  --load-session: "Continue previous conversation"
```

## Specialized Workflows

### Code Review Workflow
```yaml
code_review_workflow:
  pre_commit_review:
    command: "/m-ask-gemini 'Review staged changes' --staged --focus quality"
    integration: "pre-commit hook"
    
  pull_request_review:
    command: "/m-ask-gemini 'Comprehensive PR review' --diff origin/main --format markdown"
    integration: "GitHub Actions"
    
  security_review:
    command: "/m-ask-gemini 'Security vulnerability check' --all-files --focus security"
    integration: "CI/CD pipeline"
```

### Development Assistance
```yaml
development_workflows:
  debugging_session:
    command: "/m-ask-gemini --interactive 'Debug session' --context debugging"
    use_case: "Interactive debugging with AI guidance"
    
  architecture_discussion:
    command: "/m-ask-gemini --interactive 'Architecture review' --all-files"
    use_case: "System design discussion and planning"
    
  learning_session:
    command: "/m-ask-gemini --interactive 'Explain concepts' --context learning"
    use_case: "Learn new technologies and concepts"
```

### Documentation Generation
```yaml
documentation_workflows:
  api_docs:
    command: "/m-ask-gemini 'Generate API docs' --file api/ --format openapi"
    output: "api-documentation.yaml"
    
  code_comments:
    command: "/m-ask-gemini 'Add comprehensive comments' --file src/ --format jsdoc"
    integration: "automated documentation"
    
  readme_update:
    command: "/m-ask-gemini 'Update project README' --all-files --output README.md"
    frequency: "after major changes"
```

## Smart Context Selection

### Automatic Context Detection
```yaml
context_detection:
  file_type_analysis:
    - javascript: "Include package.json, tsconfig.json"
    - python: "Include requirements.txt, pyproject.toml"
    - rust: "Include Cargo.toml, Cargo.lock"
    - go: "Include go.mod, go.sum"
  
  project_structure:
    - frontend: "Include component structure, styles"
    - backend: "Include API routes, database schema"
    - fullstack: "Include both frontend and backend context"
    - library: "Include public API and documentation"
  
  query_type_context:
    - debugging: "Include error logs, test output"
    - security: "Include auth code, sensitive operations"
    - performance: "Include benchmarks, profiling data"
    - architecture: "Include system design documents"
```

### Context Optimization
```yaml
context_optimization:
  size_management:
    - smart_truncation: "Keep most relevant parts"
    - hierarchical_context: "Include overview then details"
    - selective_inclusion: "Choose relevant files only"
    - compression: "Summarize large contexts"
  
  relevance_scoring:
    - recent_changes: "Prioritize recently modified files"
    - import_relationships: "Include related dependencies"
    - error_correlation: "Include files related to errors"
    - usage_frequency: "Prioritize frequently accessed code"
```

## Configuration Options

### Default Settings
```json
{
  "ask_gemini_settings": {
    "default_model": "auto",
    "context_strategy": "smart",
    "max_context_size": 100000,
    "output_format": "markdown",
    "interactive_mode": false,
    "save_conversations": true,
    "stream_responses": true
  }
}
```

### Model Selection Rules
```json
{
  "model_selection": {
    "auto_rules": {
      "simple_questions": "gemini-1.5-flash",
      "code_review": "gemini-2.5-pro",
      "large_context": "gemini-2.5-pro",
      "quick_lookup": "gemini-1.5-flash",
      "architecture_discussion": "gemini-2.5-pro"
    },
    "context_thresholds": {
      "flash_max_tokens": 50000,
      "pro_recommended_tokens": 100000
    }
  }
}
```

### Integration Settings
```json
{
  "integration": {
    "git_integration": {
      "auto_include_diff": true,
      "max_diff_size": 10000,
      "exclude_binary_files": true
    },
    "file_watching": {
      "auto_refresh_context": true,
      "watch_patterns": ["src/**/*.{js,ts,jsx,tsx}", "api/**/*.js"]
    },
    "output_handling": {
      "syntax_highlighting": true,
      "auto_save_responses": true,
      "response_history_limit": 100
    }
  }
}
```

## Output Format

### Standard Response Format
```json
{
  "response": {
    "query": "Review this React component for performance",
    "model_used": "gemini-2.5-pro",
    "context_size": 2500,
    "response_time": "3.2s",
    "confidence": "high"
  },
  "analysis": {
    "summary": "Component has several optimization opportunities",
    "issues_found": 3,
    "suggestions": 5,
    "priority": "medium"
  },
  "recommendations": [
    {
      "type": "performance",
      "description": "Use React.memo to prevent unnecessary re-renders",
      "code_example": "export default React.memo(UserProfile);",
      "impact": "high",
      "effort": "low"
    }
  ],
  "follow_up_questions": [
    "Would you like me to explain React.memo in detail?",
    "Should I review the entire component tree for optimization?"
  ]
}
```

### Code Analysis Response
```json
{
  "code_analysis": {
    "file": "src/components/UserProfile.tsx",
    "language": "typescript",
    "complexity_score": 7,
    "maintainability": "good",
    "security_score": 9
  },
  "findings": [
    {
      "line": 45,
      "type": "performance",
      "severity": "medium",
      "message": "Consider memoizing expensive calculation",
      "suggestion": "const expensiveValue = useMemo(() => calculate(data), [data]);"
    }
  ],
  "metrics": {
    "lines_of_code": 150,
    "cyclomatic_complexity": 8,
    "test_coverage": 85,
    "dependencies": 5
  }
}
```

## Integration Features

### CLI Tool Integration
- **Git Integration**: Seamless analysis of diffs, commits, and branches
- **Test Framework Integration**: Analyze test results and failures
- **Build Tool Integration**: Include build logs and configuration
- **Package Manager Integration**: Understand project dependencies

### IDE Integration
- **File Context**: Automatically detect current file in supported IDEs
- **Selection Analysis**: Analyze selected code blocks
- **Error Integration**: Parse and analyze IDE error messages
- **Debugging Integration**: Analyze debugger output and breakpoints

### Workflow Integration
- **Pre-commit Hooks**: Automated code review before commits
- **CI/CD Integration**: Include in automated testing and deployment
- **Code Review Tools**: Integration with PR and review platforms
- **Documentation Tools**: Generate and update documentation automatically

## Error Handling and Recovery

### API Error Handling
```yaml
error_handling:
  rate_limiting:
    detection: "Monitor API response headers"
    backoff: "Exponential backoff with jitter"
    queue: "Queue requests during rate limits"
    
  authentication:
    validation: "Check API key before requests"
    rotation: "Support for API key rotation"
    fallback: "Graceful degradation when API unavailable"
    
  network_issues:
    timeout: "Configurable request timeouts"
    retry: "Automatic retry with circuit breaker"
    offline: "Cached responses for common queries"
```

### Context Management Errors
```yaml
context_errors:
  file_not_found:
    handling: "Graceful error messages"
    suggestions: "Suggest similar files"
    
  context_too_large:
    handling: "Smart truncation strategies"
    user_options: "Let user choose context scope"
    
  permission_denied:
    handling: "Skip inaccessible files"
    user_notification: "Inform about skipped files"
```

## Performance Optimization

### Response Caching
```yaml
caching_strategy:
  query_caching:
    - hash_based: "Cache based on query and context hash"
    - time_based: "Cache with configurable TTL"
    - invalidation: "Smart cache invalidation on file changes"
    
  context_caching:
    - file_analysis: "Cache file analysis results"
    - project_structure: "Cache project structure analysis"
    - dependency_graph: "Cache dependency relationships"
```

### Streaming and Efficiency
```yaml
performance_optimization:
  streaming_responses:
    - real_time: "Stream responses as they're generated"
    - progressive: "Show partial results during generation"
    - cancellation: "Allow user to cancel long requests"
    
  context_optimization:
    - smart_selection: "Include only relevant context"
    - compression: "Compress repetitive context"
    - chunking: "Break large contexts into chunks"
```

## Security and Privacy

### Data Protection
- **Local Processing**: Minimize data sent to external APIs
- **Sensitive Data Detection**: Automatically redact sensitive information
- **Audit Logging**: Track all API requests and responses
- **Access Control**: Respect file permissions and access rights

### API Security
- **Key Management**: Secure storage and rotation of API keys
- **Request Validation**: Validate all requests before sending
- **Response Filtering**: Filter responses for sensitive information
- **Usage Monitoring**: Monitor and alert on unusual usage patterns