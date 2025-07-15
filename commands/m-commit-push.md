# Intelligent Commit and Push: AI-Powered Git Workflow

**Target:** $ARGUMENTS (Default: auto-generate commit message)

**Scope:** Intelligent git commit and push with AI-powered commit message generation

## Overview

Provides intelligent git commit and push functionality with AI-powered commit message generation. Uses Gemini CLI when available for superior context understanding and conventional commit formatting.

**Key Benefits:**
- **AI-Powered Messages**: Generate conventional commit messages automatically
- **Submodule Support**: Handle git submodules intelligently
- **Context Awareness**: Analyze changes for accurate descriptions
- **Standards Compliance**: Follow conventional commit format
- **Batch Operations**: Process multiple repositories efficiently

## Help Documentation

To see this help documentation, run:
```bash
/m-commit-push --help
```

## Core Features

### 1. Intelligent Commit Messages
- **Conventional Format**: Automatic type(scope): description formatting
- **Change Analysis**: AI understands what changed and why
- **Context Integration**: Consider project structure and patterns
- **Length Optimization**: Keep messages concise but descriptive

### 2. Submodule Management
- **Automatic Detection**: Find and process all submodules
- **Ordered Processing**: Commit submodules before main repo
- **Reference Updates**: Update submodule pointers correctly
- **Independent Messages**: Generate appropriate messages per module

### 3. Change Classification
- **Type Detection**: feat, fix, docs, style, refactor, test, chore
- **Scope Identification**: Determine affected components
- **Breaking Changes**: Detect and document API changes
- **Multi-file Analysis**: Understand related changes across files

### 4. Push Strategies
- **Branch Detection**: Push to correct remote branch
- **Force Push Safety**: Prevent accidental force pushes
- **Remote Verification**: Ensure remote is reachable
- **Conflict Prevention**: Check for remote changes first

## Usage Examples

### Basic Usage
```bash
# Auto-generate commit message and push
/m-commit-push

# Provide custom commit message
/m-commit-push "feat: add user authentication"

# Commit without pushing
/m-commit-push --no-push
```

### Submodule Workflows
```bash
# Process submodules and main repo
/m-commit-push --with-submodules

# Skip submodule processing
/m-commit-push --skip-submodules

# Submodules only
/m-commit-push --submodules-only
```

### Advanced Options
```bash
# Amend previous commit
/m-commit-push --amend

# Interactive staging
/m-commit-push --interactive

# Specific files only
/m-commit-push --files "src/*.js" "docs/*.md"
```

## Command Options

```yaml
commit_options:
  --message, -m: "Custom commit message"
  --amend: "Amend previous commit"
  --no-verify: "Skip pre-commit hooks"
  --sign, -S: "GPG sign the commit"

staging_options:
  --all, -a: "Stage all changes"
  --interactive, -i: "Interactive staging"
  --files: "Specific files to stage"
  --patch, -p: "Stage hunks interactively"

push_options:
  --no-push: "Commit only, don't push"
  --force: "Force push (use with caution)"
  --upstream, -u: "Set upstream branch"
  --tags: "Push tags as well"

submodule_options:
  --with-submodules: "Process submodules (default)"
  --skip-submodules: "Ignore submodule changes"
  --submodules-only: "Only process submodules"
  --recursive: "Process nested submodules"

ai_options:
  --no-ai: "Don't use AI for message generation"
  --ai-model: "Specify AI model (pro/flash)"
  --context: "Additional context for AI"
  --conventional: "Enforce conventional format"
```

## Workflow Details

### Pre-Commit Checks
1. Verify git repository status
2. Check for uncommitted changes
3. Ensure branch is up-to-date
4. Validate remote connectivity

### Submodule Processing
1. Detect all submodules via .gitmodules
2. Check each submodule for changes
3. Generate appropriate commit messages
4. Commit and push submodules first
5. Update parent repository references

### Message Generation Process
1. Analyze staged changes
2. Identify change patterns
3. Determine commit type and scope
4. Generate descriptive message
5. Validate message format

### Commit Execution
1. Stage specified or all changes
2. Apply commit with message
3. Run post-commit hooks
4. Push to remote if requested
5. Report success/failure

## Best Practices

### Commit Message Guidelines
- **Be Specific**: "fix: resolve null pointer in user service" not "fix bug"
- **Use Present Tense**: "add feature" not "added feature"
- **Limit Scope**: One logical change per commit
- **Reference Issues**: Include issue numbers when relevant

### Submodule Best Practices
- **Commit Order**: Always commit submodules first
- **Test Together**: Ensure main + submodules work together
- **Document Dependencies**: Note submodule version requirements
- **Atomic Updates**: Keep related changes together

### Push Safety
- **Pull First**: Avoid conflicts by pulling before pushing
- **Review Changes**: Check diff before committing
- **Branch Protection**: Never force push to main/master
- **CI/CD Awareness**: Ensure builds will pass

## AI Message Examples

### Feature Addition
```
feat(auth): implement OAuth2 login flow

- Add Google OAuth2 provider
- Implement token refresh mechanism
- Add user session management
```

### Bug Fix
```
fix(api): handle null response in user endpoint

- Add null check before parsing response
- Return appropriate error status
- Add unit test for edge case
```

### Refactoring
```
refactor(database): optimize query performance

- Replace N+1 queries with single join
- Add database indexes
- Reduce query execution time by 60%
```

## Integration Examples

### With Pre-commit Hooks
```bash
# .git/hooks/pre-commit
/m-commit-push --no-push --validate-only
```

### In CI/CD Pipeline
```bash
# Auto-commit build artifacts
/m-commit-push "build: update distribution files" \
  --files "dist/*" --no-verify
```

### With Other Commands
```bash
# Complete workflow
/m-test-all
/m-commit-push
/m-pr-create
```

## Troubleshooting

### Common Issues

**"Nothing to commit"**
- Check: `git status`
- Stage files: `git add .`
- Use: `--all` flag

**"Failed to push"**
- Pull latest: `git pull`
- Check remote: `git remote -v`
- Verify credentials: `git config --list`

**"Submodule errors"**
- Update submodules: `git submodule update --init`
- Check status: `git submodule status`
- Fix references: `git submodule sync`

**"AI generation failed"**
- Check API key: `echo $GEMINI_API_KEY`
- Use fallback: `--no-ai` flag
- Provide manual message

## AI Integration Strategy

### MCP Gemini Agent Integration
```bash
# Submodule Processing Function
process_submodules() {
    echo "🔍 Detecting git submodules..."
    
    # Check if .gitmodules exists
    if [ ! -f ".gitmodules" ]; then
        echo "No submodules detected in repository"
        return 0
    fi
    
    # Get list of submodules
    SUBMODULES=$(git submodule status | awk '{print $2}')
    
    if [ -z "$SUBMODULES" ]; then
        echo "No active submodules found"
        return 0
    fi
    
    echo "📦 Found submodules: $(echo $SUBMODULES | tr '\n' ' ')"
    
    # Process each submodule
    for SUBMODULE in $SUBMODULES; do
        echo "🔄 Processing submodule: $SUBMODULE"
        
        # Navigate to submodule directory
        cd "$SUBMODULE" || continue
        
        # Check if submodule has changes
        if ! git diff --quiet || ! git diff --cached --quiet || [ -n "$(git status --porcelain)" ]; then
            echo "📝 Changes detected in submodule: $SUBMODULE"
            
            # Get submodule changes
            SUBMODULE_DIFF=$(git diff --cached --name-only; git diff --name-only; git status --porcelain)
            SUBMODULE_CHANGES=$(git diff --cached; git diff; git status --porcelain)
            
            # Generate AI commit message for submodule
            SUBMODULE_MESSAGE=$(mcp__gemini__gemini-query "Generate a conventional commit message for these submodule changes in $SUBMODULE:

${SUBMODULE_CHANGES}

Format: type(scope): description
Types: feat, fix, docs, style, refactor, test, chore, perf, ci, build
Keep description under 72 characters. Be specific and clear.
Context: This is a submodule within a larger project.")
            
            # Stage all changes in submodule
            git add .
            
            # Commit submodule changes
            git commit -m "$SUBMODULE_MESSAGE"
            
            # Push submodule changes
            git push origin HEAD
            
            echo "✅ Submodule $SUBMODULE committed and pushed"
        else
            echo "⚪ No changes in submodule: $SUBMODULE"
        fi
        
        # Return to main repository
        cd - > /dev/null
    done
    
    # Update submodule references in main repo
    echo "🔄 Updating submodule references in main repository..."
    git add .gitmodules
    git submodule sync
    git add $(git submodule status | awk '{print $2}')
}

# Main commit process with submodule integration
main_commit_process() {
    # First process all submodules
    process_submodules
    
    # Then process main repository
    DIFF=$(git diff --cached)
    MAIN_DIFF=$(git diff --name-only; git status --porcelain)
    
    # Generate commit message for main repo (including submodule updates)
    MAIN_MESSAGE=$(mcp__gemini__gemini-query "Generate a conventional commit message for these main repository changes:

${DIFF}
${MAIN_DIFF}

Format: type(scope): description
Types: feat, fix, docs, style, refactor, test, chore, perf, ci, build
Keep description under 72 characters. Be specific and clear.
Note: This may include submodule reference updates.")
    
    # Stage all changes in main repo
    git add .
    
    # Commit main repository
    git commit -m "$MAIN_MESSAGE"
    
    # Push main repository
    git push origin HEAD
    
    echo "✅ Main repository committed and pushed"
}

# Execute main process
main_commit_process
```

**Benefits of MCP Integration:**
- No external CLI dependency required
- Native Claude Code integration
- Automatic authentication handling
- Consistent error handling and recovery

## Execution Steps

1. **Environment Check**
   - Verify git repository status
   - Detect and enumerate all git submodules
   - Check for staged/unstaged changes in main repo and submodules
   - MCP Gemini agent is automatically available

2. **Submodule Processing (Priority)**
   - Process all submodules before main repository
   - For each submodule with changes:
     - Navigate to submodule directory
     - Analyze submodule changes with AI
     - Generate conventional commit message
     - Stage, commit, and push submodule changes
     - Return to main repository

3. **Change Analysis**
   - Analyze git diff for context (including submodule updates)
   - Identify change types (feature, fix, refactor, etc.)
   - Determine appropriate conventional commit format
   - Include submodule reference updates in analysis

4. **AI-Powered Message Generation**
   - Use MCP Gemini agent via `/gemini-query`
   - Apply conventional commit standards
   - Ensure message clarity and specificity
   - Account for submodule updates in commit message

5. **Main Repository Commit and Push**
   - Stage all changes including submodule updates
   - Commit with generated or provided message
   - Push to remote repository
   - Provide success confirmation for all operations

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
# Auto-generate commit message (processes submodules first)
/m-commit-push

# Provide specific message for main repo (submodules still auto-processed)
/m-commit-push "feat(auth): implement OAuth2 LinkedIn integration"

# Interactive mode with AI suggestions
/m-commit-push --interactive

# Process only submodules (skip main repo)
/m-commit-push --submodules-only

# Skip submodule processing (main repo only)
/m-commit-push --no-submodules
```

### Advanced Usage
```bash
# Generate message with full project context (including submodules)
/m-commit-push --context-full

# Review changes before commit (shows submodule changes too)
/m-commit-push --review

# Include breaking change notation
/m-commit-push --breaking-change

# Custom scope specification
/m-commit-push --scope auth

# Verbose mode with detailed submodule processing
/m-commit-push --verbose

# Dry run mode (show what would be committed without actually committing)
/m-commit-push --dry-run
```

### Submodule-Specific Usage
```bash
# Process specific submodule only
/m-commit-push --submodule .claude

# Process multiple specific submodules
/m-commit-push --submodules ".claude,docs,config"

# Force push submodules (use with caution)
/m-commit-push --force-submodules

# Sync submodules before processing
/m-commit-push --sync-submodules
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
  "submodules": [
    {
      "name": ".claude",
      "status": "success",
      "commit": {
        "hash": "xyz789abc",
        "message": "feat(commands): add new build fix functionality",
        "files_changed": 2,
        "insertions": 45,
        "deletions": 0
      },
      "push": {
        "status": "success",
        "remote": "origin",
        "branch": "main"
      }
    }
  ],
  "main_repo": {
    "commit": {
      "hash": "abc123def",
      "message": "chore: update submodule references and project config",
      "files_changed": 3,
      "insertions": 120,
      "deletions": 15
    },
    "push": {
      "status": "success",
      "remote": "origin",
      "branch": "main"
    }
  },
  "ai_assistance": {
    "used_gemini": true,
    "message_generated": true,
    "context_analysis": "comprehensive",
    "submodule_processing": true
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

### Submodule Error Handling
```bash
# Enhanced submodule error handling
process_submodules_with_error_handling() {
    echo "🔍 Detecting git submodules..."
    
    # Verify we're in a git repository
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "❌ Error: Not in a git repository"
        return 1
    fi
    
    # Check if .gitmodules exists
    if [ ! -f ".gitmodules" ]; then
        echo "No submodules detected in repository"
        return 0
    fi
    
    # Initialize submodules if needed
    git submodule init > /dev/null 2>&1
    git submodule update > /dev/null 2>&1
    
    # Get list of submodules with error handling
    SUBMODULES=$(git submodule status 2>/dev/null | awk '{print $2}')
    
    if [ -z "$SUBMODULES" ]; then
        echo "No active submodules found"
        return 0
    fi
    
    echo "📦 Found submodules: $(echo $SUBMODULES | tr '\n' ' ')"
    
    # Process each submodule with error handling
    for SUBMODULE in $SUBMODULES; do
        echo "🔄 Processing submodule: $SUBMODULE"
        
        # Verify submodule directory exists
        if [ ! -d "$SUBMODULE" ]; then
            echo "⚠️  Warning: Submodule directory $SUBMODULE does not exist, skipping..."
            continue
        fi
        
        # Navigate to submodule directory
        if ! cd "$SUBMODULE"; then
            echo "❌ Error: Cannot access submodule directory $SUBMODULE"
            continue
        fi
        
        # Verify submodule is a git repository
        if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
            echo "❌ Error: $SUBMODULE is not a valid git repository"
            cd - > /dev/null
            continue
        fi
        
        # Check if submodule has changes
        if ! git diff --quiet || ! git diff --cached --quiet || [ -n "$(git status --porcelain)" ]; then
            echo "📝 Changes detected in submodule: $SUBMODULE"
            
            # Get submodule changes with error handling
            SUBMODULE_CHANGES=$(git diff --cached 2>/dev/null; git diff 2>/dev/null; git status --porcelain 2>/dev/null)
            
            if [ -z "$SUBMODULE_CHANGES" ]; then
                echo "⚠️  Warning: No changes detected in $SUBMODULE, skipping..."
                cd - > /dev/null
                continue
            fi
            
            # Generate AI commit message for submodule
            SUBMODULE_MESSAGE=$(mcp__gemini__gemini-query "Generate a conventional commit message for these submodule changes in $SUBMODULE:

${SUBMODULE_CHANGES}

Format: type(scope): description
Types: feat, fix, docs, style, refactor, test, chore, perf, ci, build
Keep description under 72 characters. Be specific and clear.
Context: This is a submodule within a larger project." 2>/dev/null)
            
            # Fallback commit message if AI generation fails
            if [ -z "$SUBMODULE_MESSAGE" ]; then
                SUBMODULE_MESSAGE="chore($SUBMODULE): update submodule changes"
                echo "⚠️  Warning: AI commit message generation failed, using fallback"
            fi
            
            # Stage all changes in submodule
            if ! git add . 2>/dev/null; then
                echo "❌ Error: Failed to stage changes in $SUBMODULE"
                cd - > /dev/null
                continue
            fi
            
            # Commit submodule changes
            if ! git commit -m "$SUBMODULE_MESSAGE" 2>/dev/null; then
                echo "❌ Error: Failed to commit changes in $SUBMODULE"
                cd - > /dev/null
                continue
            fi
            
            # Push submodule changes with retry logic
            PUSH_ATTEMPTS=0
            MAX_PUSH_ATTEMPTS=3
            
            while [ $PUSH_ATTEMPTS -lt $MAX_PUSH_ATTEMPTS ]; do
                if git push origin HEAD 2>/dev/null; then
                    echo "✅ Submodule $SUBMODULE committed and pushed"
                    break
                else
                    PUSH_ATTEMPTS=$((PUSH_ATTEMPTS + 1))
                    echo "⚠️  Push attempt $PUSH_ATTEMPTS failed for $SUBMODULE, retrying..."
                    
                    if [ $PUSH_ATTEMPTS -eq $MAX_PUSH_ATTEMPTS ]; then
                        echo "❌ Error: Failed to push $SUBMODULE after $MAX_PUSH_ATTEMPTS attempts"
                        echo "💡 Suggestion: Check network connection and repository permissions"
                    else
                        sleep 2
                    fi
                fi
            done
        else
            echo "⚪ No changes in submodule: $SUBMODULE"
        fi
        
        # Return to main repository
        cd - > /dev/null
    done
    
    # Update submodule references in main repo with error handling
    echo "🔄 Updating submodule references in main repository..."
    git add .gitmodules 2>/dev/null || true
    git submodule sync 2>/dev/null || echo "⚠️  Warning: Failed to sync submodules"
    
    # Add submodule reference updates
    for SUBMODULE in $SUBMODULES; do
        git add "$SUBMODULE" 2>/dev/null || true
    done
}
```

### Common Submodule Issues
- **Submodule Not Initialized**: Automatic initialization and update
- **Permission Errors**: Clear error messages with suggested fixes
- **Network Failures**: Retry logic with exponential backoff
- **Detached HEAD**: Automatic branch switching for commits
- **Merge Conflicts**: Detection and resolution guidance

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