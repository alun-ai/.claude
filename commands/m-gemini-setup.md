# Gemini CLI Setup: Configure Google Gemini AI Integration

**Target:** $ARGUMENTS (Default: interactive setup)

**Scope:** Set up and configure Gemini CLI for use with Claude Code workflows

## Overview

Provides setup and configuration guidance for Google Gemini CLI integration with Claude Code. Enables AI-powered assistance, code analysis, and content generation directly from the command line.

## Core Features

### Setup and Configuration
- **API Key Management**: Secure storage of Gemini API credentials
- **Model Selection**: Configure preferred Gemini models for different tasks
- **Environment Integration**: Seamless integration with development workflows
- **Usage Guidelines**: Best practices for effective Gemini CLI usage

### Available Gemini Models
- **gemini-2.5-pro**: Latest and most capable model (default)
- **gemini-1.5-pro**: Previous generation pro model
- **gemini-1.5-flash**: Fast and efficient for quick tasks

### Common Use Cases
- **Code Review**: AI-powered code analysis and suggestions
- **Documentation**: Generate and improve technical documentation
- **Debugging**: Get help with troubleshooting and error analysis
- **Architecture**: Discuss system design and architectural decisions

## Setup Steps

1. **Get Gemini API Key**
   - Visit Google AI Studio: https://makersuite.google.com/app/apikey
   - Sign in with your Google account
   - Create a new API key
   - Copy the generated API key

2. **Configure Environment Variables**
   - Add your API key to the project .envrc file
   - Replace `[YOUR_GEMINI_API_KEY]` with your actual key
   - Reload environment with `direnv allow`

3. **Test Installation**
   - Run `gemini -p "Hello, test message"`
   - Verify successful response from Gemini API
   - Test different models and options

4. **Integration with Claude Code**
   - Use Gemini CLI in custom commands
   - Integrate with existing development workflows
   - Set up automation and scripting

## Configuration Options

### API Key Setup
```bash
# Option 1: Environment Variable (Recommended)
export GEMINI_API_KEY="your_api_key_here"

# Option 2: Configuration File
mkdir -p ~/.gemini
echo '{"apiKey": "your_api_key_here"}' > ~/.gemini/settings.json
```

### Model Selection
```bash
# Use default model (gemini-2.5-pro)
gemini -p "Your prompt here"

# Use specific model
gemini -m "gemini-1.5-flash" -p "Quick analysis needed"

# Use pro model for complex tasks
gemini -m "gemini-2.5-pro" -p "Complex architecture question"
```

### Advanced Options
```bash
# Include all project files in context
gemini --all-files -p "Analyze this codebase"

# Run in sandbox mode for code execution
gemini --sandbox -p "Write and test a Python function"

# Debug mode for troubleshooting
gemini --debug -p "Your prompt"

# Auto-accept all actions (use with caution)
gemini --yolo -p "Refactor this code"
```

## Usage Examples

### Code Review and Analysis
```bash
# Analyze current file
gemini -p "Review this code for potential improvements" < src/components/MyComponent.tsx

# Analyze git diff
git diff | gemini -p "Review these changes for potential issues"

# Code quality assessment
gemini --all-files -p "Assess the overall code quality of this project"
```

### Documentation Generation
```bash
# Generate API documentation
gemini -p "Generate API documentation for this Express.js app" --all-files

# Create README content
gemini -p "Create a comprehensive README for this project" --all-files

# Generate function documentation
gemini -p "Add JSDoc comments to all functions in this file" < utils/helpers.js
```

### Debugging and Troubleshooting
```bash
# Analyze error logs
gemini -p "Help me understand this error" < error.log

# Debug failing tests
npm test 2>&1 | gemini -p "Why are these tests failing?"

# Performance analysis
gemini -p "Identify performance bottlenecks in this code" --all-files
```

### Architecture and Design
```bash
# System design review
gemini --all-files -p "Review the system architecture and suggest improvements"

# Database schema analysis
gemini -p "Analyze this database schema for optimization opportunities" < schema.sql

# Security assessment
gemini --all-files -p "Identify potential security vulnerabilities"
```

## Integration with Claude Code Commands

### Custom Gemini Commands
Create specialized commands that leverage Gemini CLI for specific workflows:

```bash
# Code review command
alias gemini-review='git diff | gemini -p "Provide a detailed code review"'

# Documentation helper
alias gemini-docs='gemini -p "Generate documentation for this code"'

# Architecture advisor
alias gemini-arch='gemini --all-files -p "Analyze system architecture"'
```

### Workflow Integration
```yaml
development_workflow:
  code_review:
    - run: "git diff | gemini -p 'Review changes for quality and security'"
    - run: "gemini -p 'Suggest unit tests for new code' < new_file.js"
  
  documentation:
    - run: "gemini --all-files -p 'Update README with recent changes'"
    - run: "gemini -p 'Generate API docs' --all-files"
  
  debugging:
    - run: "npm test 2>&1 | gemini -p 'Explain test failures'"
    - run: "gemini -p 'Debug this error' < error.log"
```

## Best Practices

### Effective Prompting
- **Be Specific**: Provide clear, detailed prompts for better results
- **Context Matters**: Use `--all-files` when you need full project context
- **Iterate**: Refine prompts based on initial responses
- **Combine Tools**: Use with other CLI tools for powerful workflows

### Security Considerations
- **API Key Security**: Never commit API keys to version control
- **Sensitive Data**: Avoid sending sensitive information to external APIs
- **Access Control**: Limit API key access and rotate regularly
- **Audit Usage**: Monitor API usage and costs

### Performance Optimization
- **Model Selection**: Use faster models for simple tasks
- **Context Size**: Limit context when possible to reduce latency
- **Batch Processing**: Group related queries for efficiency
- **Caching**: Cache responses for repeated queries

## Troubleshooting

### Common Issues
```bash
# API key not set
Error: Please set an Auth method in your settings.json OR specify GEMINI_API_KEY

# Solution: Set environment variable or create settings file
export GEMINI_API_KEY="your_key_here"

# Rate limiting
Error: API quota exceeded

# Solution: Check usage limits and consider upgrading plan

# Network issues
Error: Connection timeout

# Solution: Check internet connection and API status
```

### Debug Mode
```bash
# Enable debug output
gemini --debug -p "Your prompt"

# Check API connectivity
curl -H "x-goog-api-key: $GEMINI_API_KEY" \
  "https://generativelanguage.googleapis.com/v1beta/models"
```

## Advanced Features

### Scripting and Automation
```bash
#!/bin/bash
# Automated code review script
git diff --name-only | while read file; do
  echo "Reviewing $file..."
  gemini -p "Review this file for issues" < "$file" > "review_$file.md"
done
```

### Custom Extensions
Gemini CLI supports extensions for specialized workflows:
- List available extensions: `gemini --list-extensions`
- Use specific extensions: `gemini -e extension_name`
- Custom extension development for project-specific needs

### Integration with CI/CD
```yaml
# GitHub Actions example
- name: AI Code Review
  run: |
    git diff origin/main...HEAD | \
    gemini -p "Provide code review feedback" > review.md
    
- name: Update Documentation
  run: |
    gemini --all-files -p "Update README if needed" > readme_update.md
```

## Cost Management

### Usage Monitoring
- Monitor API usage through Google Cloud Console
- Set up billing alerts for cost control
- Track usage patterns and optimize accordingly

### Cost Optimization
- Use appropriate models for each task (flash for simple, pro for complex)
- Minimize context size when possible
- Cache responses for repeated queries
- Consider batch processing for multiple related tasks

## Support and Resources

### Documentation
- Official Gemini CLI: https://github.com/google-gemini/gemini-cli
- Google AI Studio: https://makersuite.google.com/
- API Documentation: https://ai.google.dev/docs

### Community
- Join developer communities for tips and best practices
- Share custom workflows and commands
- Contribute to open-source extensions and tools