# Ask Gemini: AI-Powered Development Assistant

**Target:** $ARGUMENTS (Default: interactive prompt or question)

**Scope:** Streamlined interface to Google Gemini AI for development assistance, code analysis, and technical consultation

## Overview

Transforms Claude into your AI-powered Development Intelligence Partner, providing enterprise-grade Google Gemini integration with sophisticated context management and intelligent development assistance. This command delivers seamless AI collaboration, advanced code analysis, and strategic technical consultation that amplifies developer productivity while maintaining the highest standards of code quality and architectural excellence.

**Key Benefits:**
- **AI-Powered Development Intelligence**: Direct access to Google Gemini's advanced AI capabilities with context-aware analysis and intelligent recommendations
- **Enterprise-Grade Code Analysis**: Sophisticated code review, security assessment, and performance optimization with actionable insights
- **Seamless MCP Integration**: Native Claude Code integration requiring no external dependencies or API key management
- **Strategic Architecture Guidance**: Expert-level system design consultation with best practice recommendations and pattern recognition
- **Intelligent Context Management**: Smart context selection with project-aware analysis and optimal information inclusion

## Help Documentation

To see this help documentation, run:
```bash
/m-ask-gemini --help
```

## Core Features

### 1. AI-Powered Development Intelligence Engine
- **Advanced Context-Aware Analysis**: Machine learning-driven context management with intelligent project understanding and optimal information selection
- **Multi-Model Orchestration**: Automatic model selection between Gemini Flash and Pro based on query complexity and context requirements
- **Intelligent Query Routing**: Smart routing to specialized MCP tools (gemini-query, gemini-analyze-code, gemini-brainstorm) for optimal results
- **Real-Time Collaboration**: Interactive AI partnership with streaming responses and progressive refinement capabilities

### 2. Enterprise-Grade Code Analysis Platform
- **Comprehensive Code Review**: AI-powered analysis with security vulnerability detection, performance optimization, and best practice validation
- **Advanced Debugging Intelligence**: Sophisticated error analysis with root cause identification, fix suggestions, and preventive recommendations
- **Performance Optimization Engine**: Deep performance analysis with bottleneck detection, optimization strategies, and scalability assessment
- **Security Assessment Framework**: Automated vulnerability scanning with OWASP compliance checking and remediation guidance

### 3. Strategic Architecture and Design Consultation
- **System Design Intelligence**: Expert-level architectural guidance with pattern recognition and best practice recommendations
- **Technology Stack Analysis**: Intelligent technology selection with compatibility assessment and future-proofing considerations
- **Database Design Optimization**: Schema analysis with performance tuning, normalization validation, and scalability planning
- **API Design Excellence**: RESTful and GraphQL API design validation with contract testing and documentation generation

### 4. Intelligent Documentation and Knowledge Management
- **Automated Documentation Generation**: AI-powered documentation creation with code analysis and usage example generation
- **Smart Comment Enhancement**: Intelligent code commenting with context-aware explanations and maintainability improvements
- **Knowledge Base Integration**: Seamless integration with project documentation and organizational knowledge repositories
- **Learning and Explanation Engine**: Interactive learning sessions with concept explanation and skill development support

## Execution Framework

### 1. **Strategic Context Analysis and Optimization Phase**
- **Intelligent Query Understanding**: AI-powered intent recognition with query classification and optimal routing determination
- **Project-Aware Context Building**: Sophisticated project analysis with dependency mapping, structure understanding, and relevance scoring
- **Smart File Selection**: Machine learning-based file relevance scoring with import graph analysis and change correlation
- **Context Size Optimization**: Dynamic context sizing with information density analysis and token efficiency optimization
- **Security and Privacy Filtering**: Automated sensitive data detection with redaction and compliance verification

### 2. **Advanced Query Processing and Routing Phase**
- **Intent Classification Engine**: Deep learning-based query categorization with confidence scoring and fallback strategies
- **Optimal Tool Selection**: Intelligent routing between gemini-query, gemini-analyze-code, and gemini-brainstorm based on query characteristics
- **Prompt Engineering Excellence**: Sophisticated prompt construction with context injection and response optimization techniques
- **Model Selection Intelligence**: Automatic selection between Gemini Flash and Pro based on complexity analysis and performance requirements
- **Query Enhancement**: AI-powered query expansion with clarification detection and ambiguity resolution

### 3. **MCP Integration and Execution Phase**
- **Native MCP Orchestration**: Seamless integration with Claude Code's MCP framework for zero-configuration operation
- **Streaming Response Management**: Real-time response streaming with progressive rendering and cancellation support
- **Error Handling and Recovery**: Comprehensive error detection with graceful degradation and intelligent retry strategies
- **Performance Optimization**: Request batching, caching, and parallel processing for optimal response times
- **Multi-Tool Coordination**: Orchestration of multiple MCP tools for complex queries requiring diverse capabilities

### 4. **Result Processing and Integration Phase**
- **Response Enhancement**: AI-powered response formatting with code highlighting, example generation, and clarity improvements
- **Actionable Insight Generation**: Conversion of AI responses into concrete development actions with priority scoring
- **Workflow Integration**: Seamless integration with git, testing frameworks, and development tools for immediate application
- **Knowledge Persistence**: Intelligent conversation history management with searchable archives and learning extraction
- **Feedback Loop Integration**: Continuous improvement through response quality tracking and user satisfaction metrics

### 5. **Continuous Learning and Optimization Phase**
- **Usage Pattern Analysis**: Machine learning-based analysis of query patterns for personalized optimization
- **Context Strategy Refinement**: Continuous improvement of context selection algorithms based on response effectiveness
- **Model Performance Tracking**: Monitoring of model selection decisions with accuracy validation and optimization
- **Knowledge Base Enhancement**: Automated extraction of valuable insights for team knowledge sharing
- **Developer Productivity Metrics**: Comprehensive tracking of time savings and quality improvements from AI assistance

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