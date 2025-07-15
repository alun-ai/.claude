# Intelligent Commit: AI-Powered Local Git Workflow

**Target:** $ARGUMENTS (Default: auto-generate commit message)

**Scope:** Intelligent local git commit with AI-powered commit message generation (no push to remote)

## Overview

Transforms Claude into your AI-powered Git Commit Specialist, providing enterprise-grade version control intelligence with sophisticated commit message generation and comprehensive submodule management. This command delivers professional local-only commits with conventional commit compliance, intelligent context analysis, and seamless development workflow integration that maintains code history integrity while maximizing developer productivity through AI-assisted automation.

**Key Benefits:**
- **AI-Powered Commit Intelligence**: Machine learning-driven commit message generation with conventional commit compliance and context-aware descriptions
- **Enterprise-Grade Submodule Management**: Comprehensive submodule processing with automatic detection, intelligent commits, and reference synchronization
- **Local-First Development Workflow**: Rapid local commits without network overhead, enabling frequent saves and experimental development
- **Intelligent Context Analysis**: Sophisticated change detection with automatic type classification and scope determination
- **Seamless MCP Integration**: Native Claude Code integration with zero-configuration Gemini access and automatic authentication

## Help Documentation

To see this help documentation, run:
```bash
/m-commit --help
```

## Core Features

### 1. AI-Powered Commit Message Intelligence Engine
- **Advanced Conventional Commit Generation**: Machine learning-driven message creation with automatic type detection and scope analysis
- **Multi-Language Context Understanding**: Sophisticated change analysis across all programming languages with semantic understanding
- **Smart Change Classification**: Automatic categorization of changes into feat, fix, docs, style, refactor, test, chore, perf, ci, build
- **Breaking Change Detection**: Intelligent identification of breaking changes with appropriate BREAKING CHANGE notation

### 2. Enterprise-Grade Submodule Management Platform
- **Automatic Submodule Detection**: Comprehensive scanning and enumeration of all git submodules with status verification
- **Parallel Submodule Processing**: Efficient processing of multiple submodules with independent commit generation
- **Reference Synchronization**: Automatic updating of submodule references in main repository with consistency validation
- **Error Recovery and Resilience**: Robust error handling for detached HEAD states, missing references, and permission issues

### 3. Local-First Development Workflow Optimization
- **Rapid Iteration Support**: Enable frequent local commits without network latency for experimental development
- **Offline Development Capability**: Full functionality without internet connection for uninterrupted productivity
- **Batch Operation Preparation**: Intelligent tracking of unpushed commits for efficient batch pushing
- **Work-in-Progress Management**: Safe storage of intermediate development states without exposing incomplete work

### 4. Intelligent Context Analysis and Enhancement
- **Comprehensive Diff Analysis**: Deep understanding of code changes with file-level and line-level insights
- **Project Structure Awareness**: Intelligent scope detection based on project organization and conventions
- **Dependency Impact Assessment**: Analysis of change impact on related components and dependencies
- **Quality Validation**: Pre-commit validation with linting, formatting, and security checks

## Execution Framework

### 1. **Strategic Environment Assessment and Initialization Phase**
- **Repository State Validation**: Comprehensive verification of git repository health, branch status, and working directory state
- **Submodule Discovery and Enumeration**: Intelligent detection of all git submodules with initialization status verification
- **Change Detection Intelligence**: Advanced analysis of staged, unstaged, and untracked changes across main repository and submodules
- **MCP Integration Verification**: Automatic validation of MCP Gemini availability with fallback strategy preparation
- **Pre-commit Hook Execution**: Optional execution of quality checks, linting, and security scans before commit

### 2. **Advanced Submodule Processing and Management Phase**
- **Priority-Based Processing**: Submodules processed before main repository to ensure reference consistency
- **Parallel Change Analysis**: Efficient analysis of changes across multiple submodules with dependency awareness
- **AI-Powered Message Generation**: Individual commit message generation for each submodule with context preservation
- **Atomic Commit Operations**: Safe commit execution with rollback capability on failure
- **Reference Update Tracking**: Automatic tracking of submodule reference changes for main repository commit

### 3. **Intelligent Change Analysis and Classification Phase**
- **Comprehensive Diff Processing**: Deep analysis of code changes with semantic understanding and impact assessment
- **Automatic Type Detection**: Machine learning-based classification into conventional commit types
- **Smart Scope Determination**: Intelligent scope extraction based on file paths and project structure
- **Breaking Change Detection**: Identification of API changes and compatibility impacts
- **Dependency Analysis**: Understanding of change impact on related components and systems

### 4. **AI-Powered Message Generation and Optimization Phase**
- **MCP Gemini Integration**: Native integration with Claude Code's MCP framework for seamless AI access
- **Conventional Commit Compliance**: Strict adherence to conventional commit standards with validation
- **Context-Aware Generation**: Incorporation of project context, recent commits, and team conventions
- **Message Quality Optimization**: Multiple generation attempts with quality scoring and selection
- **Submodule Reference Integration**: Intelligent inclusion of submodule updates in main commit message

### 5. **Commit Execution and Workflow Integration Phase**
- **Staged Change Validation**: Final verification of all changes before commit execution
- **Atomic Commit Operations**: Safe execution with comprehensive error handling and recovery
- **Local History Management**: Tracking of unpushed commits for batch operations
- **Success Confirmation**: Detailed reporting of all operations with next step suggestions
- **Integration Preparation**: Setup for seamless transition to /m-commit-push when ready

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
# Auto-generate commit message (processes submodules first, local commits only)
/m-commit

# Provide specific message for main repo (submodules still auto-processed)
/m-commit "feat(auth): implement OAuth2 LinkedIn integration"

# Interactive mode with AI suggestions
/m-commit --interactive

# Process only submodules (skip main repo)
/m-commit --submodules-only

# Skip submodule processing (main repo only)
/m-commit --no-submodules
```

### Advanced Usage
```bash
# Generate message with full project context (including submodules)
/m-commit --context-full

# Review changes before commit (shows submodule changes too)
/m-commit --review

# Include breaking change notation
/m-commit --breaking-change

# Custom scope specification
/m-commit --scope auth

# Verbose mode with detailed submodule processing
/m-commit --verbose

# Dry run mode (show what would be committed without actually committing)
/m-commit --dry-run
```

### Submodule-Specific Usage
```bash
# Process specific submodule only
/m-commit --submodule .claude

# Process multiple specific submodules
/m-commit --submodules ".claude,docs,config"

# Sync submodules before processing
/m-commit --sync-submodules

# Create commits with timestamp in message
/m-commit --timestamp
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
  "operation": "local_commit_only",
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
      "local_only": true
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
    "local_only": true
  },
  "ai_assistance": {
    "used_gemini": true,
    "message_generated": true,
    "context_analysis": "comprehensive",
    "submodule_processing": true
  },
  "next_steps": {
    "suggestion": "Run /m-commit-push to push all local commits to remote",
    "unpushed_commits": 2
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
- **Merge Conflicts**: Detection and resolution guidance
- **Repository State**: Verification of clean working directory
- **Submodule Issues**: Handling detached HEAD and missing references

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
            
            echo "✅ Submodule $SUBMODULE committed locally"
            echo "💡 Note: Use /m-commit-push to push changes to remote"
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
- **Detached HEAD**: Automatic branch switching for commits
- **Merge Conflicts**: Detection and resolution guidance
- **Local Commit Management**: Track unpushed commits across submodules

## Integration Features

### Pre-commit Hooks
- **Quality Checks**: Run linting and formatting before commit
- **Test Validation**: Ensure tests pass before commit
- **Security Scanning**: Check for sensitive data exposure
- **Conventional Commit Validation**: Ensure message format compliance

### Post-commit Actions
- **Local Commit Tracking**: Track unpushed commits for later push
- **Status Reporting**: Show summary of local changes and commits
- **Push Reminders**: Suggest when to run /m-commit-push
- **Commit History**: Maintain local commit history and metadata

## Local Commit Workflow Benefits

### Frequent Local Commits
- **Rapid Development**: Commit frequently without network overhead
- **Work in Progress**: Save intermediate states without exposing incomplete work
- **Offline Development**: Continue working without internet connection
- **Experimentation**: Try different approaches with easy rollback

### Batch Operations
- **Reduced Network Traffic**: Push multiple commits at once with /m-commit-push
- **Atomic Remote Updates**: Ensure consistent remote state updates
- **Review Before Push**: Examine all local commits before making them public
- **Selective Pushing**: Choose which commits to push when ready

### Integration with /m-commit-push
- **Complementary Commands**: Use /m-commit for frequent local saves
- **Seamless Transition**: /m-commit-push handles all unpushed commits
- **No Conflicts**: Both commands work together without interference
- **Flexible Workflow**: Switch between local and remote operations as needed

## Best Practices

### When to Use /m-commit
- **Feature Development**: Multiple small commits during feature work
- **Bug Fixes**: Incremental fixes with descriptive commit messages
- **Refactoring**: Step-by-step code improvements
- **Documentation**: Ongoing documentation updates
- **Experimentation**: Testing new approaches or solutions

### When to Use /m-commit-push
- **Feature Completion**: When ready to share completed work
- **Daily Sync**: End-of-day push to sync with team
- **Milestone Reached**: Major progress points
- **Before Breaks**: Before vacation, weekends, or long breaks
- **Code Reviews**: When ready for team review

### Workflow Examples
```bash
# Development session workflow
/m-commit "feat(auth): start OAuth implementation"
/m-commit "feat(auth): add OAuth provider config"
/m-commit "feat(auth): implement token exchange"
/m-commit "feat(auth): add error handling"
/m-commit "test(auth): add OAuth integration tests"
# End of session - push all commits
/m-commit-push

# Bug fix workflow
/m-commit "fix(api): identify rate limiting issue"
/m-commit "fix(api): implement retry logic"
/m-commit "fix(api): add rate limit headers"
/m-commit "test(api): verify rate limit handling"
# Ready for production
/m-commit-push
```