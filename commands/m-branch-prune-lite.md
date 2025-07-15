# Git Branch Management Lite: Streamlined Branch Cleanup

**Target:** $ARGUMENTS (Default: clean all merged branches, or specific branch if provided)

**Scope:** Lightweight git branch management focused on quick cleanup without testing overhead

## Overview

This is the lightweight version of branch management, designed for quick branch cleanup operations without the testing overhead of the full `/m-branch-prune` command. Perfect for routine maintenance when you're confident in your branch states and want fast cleanup.

**Key Benefits:**
- **Fast Execution**: No test suite overhead
- **Worktree Support**: Handles git worktree cleanup
- **Simple Operations**: Focus on merged branch removal
- **Targeted Pruning**: Clean specific branches on demand
- **Minimal Disruption**: Quick operations for busy workflows

## Help Documentation

To see this help documentation, run:
```bash
/m-branch-prune-lite --help
```

## Core Features

### 1. Streamlined Branch Analysis
- **Quick Diff Review**: Fast commit difference checking
- **Merge Status**: Verify branches are fully merged
- **No Build Steps**: Skip compilation and testing
- **Rapid Assessment**: Focus on git state only

### 2. Efficient Cleanup
- **Merged Branches**: Remove only safely merged branches
- **Worktree Handling**: Clean associated worktrees
- **Batch Operations**: Process multiple branches quickly
- **Minimal Validation**: Trust git's merge status

### 3. Targeted Operations
- **Single Branch**: Prune specific branch and worktree
- **Pattern Matching**: Clean branches by pattern
- **Safe Defaults**: Protect important branches
- **Quick Turnaround**: Seconds not minutes

## Usage Examples

### Basic Usage
```bash
# Clean all merged branches quickly
/m-branch-prune-lite

# Remove specific branch and its worktree
/m-branch-prune-lite feature/old-feature

# Dry run to preview
/m-branch-prune-lite --dry-run
```

### Worktree Management
```bash
# Clean branch with worktree
/m-branch-prune-lite feature/completed --remove-worktree

# List worktrees before cleanup
/m-branch-prune-lite --list-worktrees

# Clean orphaned worktrees
/m-branch-prune-lite --clean-worktrees
```

### Pattern-Based Cleanup
```bash
# Clean all feature branches
/m-branch-prune-lite 'feature/*'

# Clean hotfix branches
/m-branch-prune-lite 'hotfix/*'

# Exclude pattern
/m-branch-prune-lite --exclude 'feature/keep-*'
```

## Workflow Steps

### 1. **Branch Discovery**
- List local branches
- Check merge status against main/master
- Identify associated worktrees
- Apply exclusion filters

### 2. **Quick Analysis**
- Count commits ahead/behind
- Verify full merge status
- Check for active worktrees
- No deep code analysis

### 3. **Cleanup Execution**
- Remove merged local branches
- Clean associated worktrees
- Update git references
- Skip remote operations by default

### 4. **Summary Report**
- List cleaned branches
- Show space recovered
- Note any skipped branches
- Provide undo instructions

## Command Options

```yaml
operation_modes:
  --dry-run: "Preview changes without executing"
  --force: "Skip safety checks for faster execution"
  --quiet: "Minimal output for automation"
  --verbose: "Detailed operation logging"

worktree_options:
  --remove-worktree: "Also remove associated worktrees"
  --list-worktrees: "Show worktree status before cleanup"
  --clean-worktrees: "Remove orphaned worktrees"
  --keep-worktrees: "Preserve worktrees during cleanup"

scope_control:
  --pattern: "Branch pattern to match (glob supported)"
  --exclude: "Pattern of branches to exclude"
  --remote: "Also clean remote tracking branches"
  --all: "Clean all eligible branches"

safety_options:
  --protect: "Additional protected branch patterns"
  --age-limit: "Only clean branches older than N days"
  --confirm: "Confirm each deletion"
  --backup-refs: "Save branch refs before deletion"
```

## Differences from Full Version

### What's Removed
- ❌ No test suite execution
- ❌ No build verification
- ❌ No performance testing
- ❌ No deep code analysis
- ❌ No merge conflict prediction

### What's Retained
- ✅ Git merge status checking
- ✅ Protected branch patterns
- ✅ Worktree management
- ✅ Basic safety checks
- ✅ Cleanup reporting

### Performance Comparison
- **Lite Version**: 5-30 seconds typical
- **Full Version**: 2-10 minutes with tests
- **Speed Gain**: 10-20x faster execution

## Safety Features

### Always Protected
- main/master branches
- develop/development
- staging/production
- Current branch
- Branches with uncommitted changes

### Quick Checks
- Merge status verification
- Worktree association
- Local changes detection
- Protected pattern matching

### Recovery Options
- Branch refs logged before deletion
- Git reflog available for 30 days
- Undo instructions provided
- Dry run always available

## When to Use

### Use Lite Version When:
- ✅ Regular maintenance cleanup
- ✅ Post-release branch removal
- ✅ Quick worktree management
- ✅ Time-sensitive operations
- ✅ High confidence in branch states

### Use Full Version When:
- ⚠️ Uncertain about branch status
- ⚠️ Complex merge scenarios
- ⚠️ Need test validation
- ⚠️ Critical branches involved
- ⚠️ First-time cleanup

## Common Workflows

### Daily Cleanup
```bash
# Quick morning cleanup
/m-branch-prune-lite --age-limit 7
```

### Post-Merge Cleanup
```bash
# After PR merges
/m-branch-prune-lite feature/merged-feature
```

### Worktree Management
```bash
# Clean finished worktrees
/m-branch-prune-lite --clean-worktrees
```

### Automated Cleanup
```bash
# In CI/CD or scripts
/m-branch-prune-lite --quiet --force
```

## Integration Examples

### With Git Workflow
```bash
# After successful PR merge
git checkout main
git pull
/m-branch-prune-lite feature/completed
```

### In Scripts
```bash
#!/bin/bash
# Weekly cleanup script
/m-branch-prune-lite --age-limit 14 --quiet
```

### With Other Commands
```bash
# Full workflow
/m-commit-push
/m-pr-merge
/m-branch-prune-lite feature/done
```

## Performance Tips

1. **Use Patterns**: Clean multiple branches at once
2. **Skip Confirmations**: Use --force for automation
3. **Quiet Mode**: Reduce output overhead
4. **Local Only**: Skip remote operations
5. **Regular Runs**: Prevent branch accumulation

## Troubleshooting

### Common Issues

**"Branch not fully merged"**
- Check with: `git branch --merged`
- Force with: `--force` flag
- Or use full version for analysis

**"Worktree still exists"**
- Use: `--remove-worktree` flag
- Check: `git worktree list`
- Clean: `git worktree prune`

**"Protected branch"**
- Check: Protection patterns
- Override: Not recommended
- Use: Different branch name