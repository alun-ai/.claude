# Intelligent Commit and Push: AI-Powered Git Workflow

**Target:** $ARGUMENTS (Default: auto-generate commit message)

**Scope:** Intelligent git commit and push with AI-powered commit message generation

## Overview

Provides intelligent git commit and push functionality with AI-powered commit message generation. Uses Gemini CLI when available for superior context understanding and conventional commit formatting.

## AI Integration Strategy

### MCP Gemini Agent Integration
```bash
# Use MCP Gemini agent for commit message generation
DIFF=$(git diff --cached)
/gemini-query "Generate a conventional commit message for these changes:

${DIFF}

Format: type(scope): description
Types: feat, fix, docs, style, refactor, test, chore, perf, ci, build
Keep description under 72 characters. Be specific and clear."
```

**Benefits of MCP Integration:**
- No external CLI dependency required
- Native Claude Code integration
- Automatic authentication handling
- Consistent error handling and recovery

## Execution Steps

1. **Environment Check**
   - Verify git repository status
   - Check for staged/unstaged changes
   - MCP Gemini agent is automatically available

2. **Change Analysis**
   - Analyze git diff for context
   - Identify change types (feature, fix, refactor, etc.)
   - Determine appropriate conventional commit format

3. **AI-Powered Message Generation**
   - Use MCP Gemini agent via `/gemini-query`
   - Apply conventional commit standards
   - Ensure message clarity and specificity

4. **Commit and Push**
   - Stage all changes with git add
   - Commit with generated or provided message
   - Push to remote repository
   - Provide success confirmation

## Gemini CLI Integration

### Commit Message Generation
```bash
# Generate commit message with full context
git diff --cached --name-only | head -10 | xargs cat | \
gemini -p "Analyze these code changes and generate a conventional commit message.
Rules:
- Use format: type(scope): description
- Types: feat, fix, docs, style, refactor, test, chore, perf, ci, build
- Keep under 72 characters
- Be specific about what changed
- Focus on the impact, not implementation details"

# For large changesets
git diff --cached --stat | \
gemini -p "Generate a commit message for these file changes. Use conventional commit format."
```

### Smart Context Analysis
```bash
# Include project context for better messages
gemini --all-files -p "Generate a commit message for the staged changes. 
Consider the project structure and conventions." --scope project
```

### Quality Validation
```bash
# Validate generated commit message
echo "$commit_message" | \
gemini -p "Review this commit message for conventional commit compliance and clarity. 
Suggest improvements if needed." --format feedback
```

## Configuration Options

### Commit Message Templates
```yaml
commit_templates:
  feature: "feat(${scope}): ${description}"
  bugfix: "fix(${scope}): ${description}"
  documentation: "docs(${scope}): ${description}"
  refactoring: "refactor(${scope}): ${description}"
  testing: "test(${scope}): ${description}"
  maintenance: "chore(${scope}): ${description}"
```

### AI Prompt Configuration
```yaml
gemini_prompts:
  commit_generation: |
    Analyze the provided git diff and generate a conventional commit message.
    
    Requirements:
    - Format: type(scope): description
    - Types: feat, fix, docs, style, refactor, test, chore, perf, ci, build
    - Maximum 72 characters for description
    - Be specific and clear about what changed
    - Focus on user-facing impact when applicable
    
    Rules:
    - feat: new features for users
    - fix: bug fixes for users
    - docs: documentation changes
    - style: formatting, missing semicolons, etc.
    - refactor: code restructuring without behavior change
    - test: adding or updating tests
    - chore: maintenance tasks, dependency updates
    - perf: performance improvements
    - ci: CI/CD related changes
    - build: build system or external dependencies
```

## Usage Examples

### Basic Usage
```bash
# Auto-generate commit message
/m-commit-push

# Provide specific message
/m-commit-push "feat(auth): implement OAuth2 LinkedIn integration"

# Interactive mode with AI suggestions
/m-commit-push --interactive
```

### Advanced Usage
```bash
# Generate message with full project context
/m-commit-push --context-full

# Review changes before commit
/m-commit-push --review

# Include breaking change notation
/m-commit-push --breaking-change

# Custom scope specification
/m-commit-push --scope auth
```

## Conventional Commit Integration

### Automatic Type Detection
```yaml
type_detection:
  feat: 
    - new files in src/
    - new functions/classes
    - new features
  fix:
    - bug fix keywords in changes
    - error handling improvements
    - crash fixes
  docs:
    - README.md changes
    - documentation updates
    - comment additions
  test:
    - test file changes
    - test additions/updates
  refactor:
    - code restructuring
    - variable renames
    - function extractions
```

### Scope Detection
```yaml
scope_detection:
  component_based:
    - src/components/ -> "components"
    - src/auth/ -> "auth"
    - src/api/ -> "api"
  framework_based:
    - package.json changes -> "deps"
    - tsconfig.json changes -> "config"
    - .github/ changes -> "ci"
```

## Output Format

### Success Response
```json
{
  "status": "success",
  "commit": {
    "hash": "abc123def",
    "message": "feat(auth): implement OAuth2 LinkedIn integration",
    "files_changed": 5,
    "insertions": 120,
    "deletions": 15
  },
  "push": {
    "status": "success",
    "remote": "origin",
    "branch": "main"
  },
  "ai_assistance": {
    "used_gemini": true,
    "message_generated": true,
    "context_analysis": "comprehensive"
  }
}
```

### AI Generation Details
```json
{
  "ai_generation": {
    "tool_used": "gemini-cli",
    "model": "gemini-2.5-pro",
    "prompt_type": "commit_generation",
    "context_size": 2500,
    "alternatives_considered": 3,
    "confidence": "high"
  }
}
```

## Error Handling

### Gemini CLI Fallback
```bash
# Graceful fallback to Claude Code
if ! command -v gemini >/dev/null 2>&1; then
    echo "Gemini CLI not available, using Claude Code native generation"
    # Use Claude Code's native commit message generation
fi

# API key validation
if [[ -z "$GEMINI_API_KEY" ]]; then
    echo "GEMINI_API_KEY not set, using Claude Code native generation"
    # Fallback to Claude Code
fi
```

### Git Operation Errors
- **Uncommitted Changes**: Intelligent staging with conflict resolution
- **Push Failures**: Retry logic with pull/rebase suggestions
- **Merge Conflicts**: Detection and resolution guidance
- **Network Issues**: Offline commit with deferred push

## Integration Features

### Pre-commit Hooks
- **Quality Checks**: Run linting and formatting before commit
- **Test Validation**: Ensure tests pass before commit
- **Security Scanning**: Check for sensitive data exposure
- **Conventional Commit Validation**: Ensure message format compliance

### Post-commit Actions
- **Automatic Tagging**: Tag releases based on commit type
- **CI/CD Triggers**: Trigger appropriate pipelines
- **Documentation Updates**: Update changelogs and documentation
- **Notification Systems**: Alert relevant team members