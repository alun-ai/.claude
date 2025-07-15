# Git Branch Management and Test/Merge Workflow

**Target:** $ARGUMENTS (Default: analyze and clean all branches)

**Scope:** Comprehensive git branch management with analysis, testing, merging, and cleanup operations

## Overview

This command provides intelligent git branch management capabilities, helping you maintain a clean repository by analyzing branches, testing changes, orchestrating merges, and removing obsolete branches. It combines automated analysis with careful testing to ensure safe branch operations while preserving important work.

**Key Benefits:**
- **Branch Analysis**: Review differences and document improvements per branch
- **Safe Cleanup**: Delete only fully merged branches with safety checks
- **Test Validation**: Build and verify each branch before operations
- **Conflict Resolution**: Handle merge conflicts systematically
- **Comprehensive Testing**: Full test suite validation after merges

## Help Documentation

To see this help documentation, run:
```bash
/m-branch-prune --help
```

## Core Features

### 1. Branch Analysis
- **Individual Review**: Analyze each branch's commits and changes
- **Documentation**: Generate improvement notes per branch
- **Diff Analysis**: Compare branches against main/master
- **Activity Tracking**: Identify stale vs active branches

### 2. Safe Branch Cleanup
- **Merge Verification**: Only delete fully merged branches
- **Protected Branches**: Skip main, master, develop, staging
- **Remote Sync**: Clean both local and remote branches
- **Backup Options**: Archive branches before deletion

### 3. Testing Integration
- **Pre-Merge Testing**: Validate each branch individually
- **Build Verification**: Ensure branches compile successfully
- **Test Suite Execution**: Run relevant tests per branch
- **Performance Checks**: Identify performance regressions

### 4. Merge Orchestration
- **Sequential Processing**: Merge branches in safe order
- **Conflict Detection**: Identify conflicts before merging
- **Resolution Assistance**: AI-powered conflict resolution
- **Rollback Capability**: Undo problematic merges

## Usage Examples

### Basic Branch Cleanup
```bash
# Analyze and clean merged branches
/m-branch-prune

# Dry run - see what would be deleted
/m-branch-prune --dry-run

# Force cleanup including unmerged branches
/m-branch-prune --force
```

### Selective Operations
```bash
# Only analyze branches (no deletion)
/m-branch-prune --analyze-only

# Clean specific branch pattern
/m-branch-prune feature/*

# Exclude certain branches
/m-branch-prune --exclude hotfix/*
```

### Testing Integration
```bash
# Test all branches before cleanup
/m-branch-prune --test-all

# Run specific test suite
/m-branch-prune --test-suite unit

# Skip testing for quick cleanup
/m-branch-prune --skip-tests
```

## Workflow Steps

### 1. **Branch Discovery**
- List all local and remote branches
- Identify merge status for each branch
- Calculate branch age and activity
- Detect protected branch patterns

### 2. **Analysis Phase**
- Review commit history per branch
- Generate change summaries
- Identify potential conflicts
- Document improvements made

### 3. **Testing Phase** (Optional)
- Checkout branch in isolation
- Run build verification
- Execute test suites
- Record test results

### 4. **Merge Operations** (If requested)
- Create merge queue
- Process branches sequentially
- Handle conflicts interactively
- Verify successful integration

### 5. **Cleanup Execution**
- Delete merged local branches
- Remove corresponding remote branches
- Update tracking references
- Generate cleanup report

### 6. **Validation**
- Run comprehensive tests on result
- Verify repository integrity
- Check for orphaned commits
- Confirm successful cleanup

## Command Options

```yaml
operation_modes:
  --analyze-only: "Only analyze branches without deletion"
  --dry-run: "Show what would be deleted without executing"
  --force: "Delete branches even if not fully merged"
  --interactive: "Confirm each deletion interactively"

testing_options:
  --test-all: "Test each branch before operations"
  --test-suite: "Specify test suite to run (unit|integration|e2e)"
  --skip-tests: "Skip all testing phases"
  --fail-fast: "Stop on first test failure"

scope_control:
  --local-only: "Only process local branches"
  --remote-only: "Only process remote branches"
  --include: "Pattern of branches to include"
  --exclude: "Pattern of branches to exclude"

safety_options:
  --backup: "Create backup archive before deletion"
  --protected: "Additional protected branch patterns"
  --max-age: "Only delete branches older than N days"
  --require-pr: "Only delete branches with merged PRs"
```

## Safety Features

### Protected Branches
Never deletes:
- main/master branches
- develop/development branches
- staging/production branches
- release/* branches
- Custom protected patterns

### Verification Steps
- Confirms merge status before deletion
- Checks for uncommitted changes
- Verifies remote synchronization
- Validates no active PRs

### Recovery Options
- Creates deletion log with commit SHAs
- Optional branch archiving
- Reflog preservation
- Undo capability within session

## Integration with Other Commands

Works well with:
- `/m-git-flow` - For branch creation standards
- `/m-test-suite` - For comprehensive testing
- `/m-commit-push` - For finalizing changes
- `/m-pr-create` - For pull request workflow

## Best Practices

1. **Regular Maintenance**: Run weekly to keep repository clean
2. **Test First**: Always test branches before bulk operations
3. **Dry Run**: Use --dry-run to preview changes
4. **Backup Important**: Archive branches with unique work
5. **Team Communication**: Notify team before major cleanups

## Common Patterns

### Weekly Cleanup
```bash
# Standard weekly maintenance
/m-branch-prune --max-age 14 --test-all
```

### Post-Release Cleanup
```bash
# Clean feature branches after release
/m-branch-prune feature/* --require-pr
```

### Safe Exploration
```bash
# Analyze without risk
/m-branch-prune --analyze-only --dry-run
```