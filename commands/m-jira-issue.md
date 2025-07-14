# Jira Issue Management: Unified Create, Update, and Manage

**Target:** $ARGUMENTS (Default: interactive mode - create new or update existing based on context)

**Scope:** Comprehensive issue creation and updating with intelligent detection of existing issues and smart templates

## Overview

Unified command for all Jira issue operations that intelligently determines whether to create a new issue or update an existing one. Supports smart templates, AI-powered field population, automated workflows, and seamless development integration.

## AI Integration Strategy

### Primary: MCP Jira Agent Integration
**Uses MCP Jira agent for intelligent issue operations:**

```bash
# Smart issue detection and operation
ISSUE_KEY=$(git branch --show-current | grep -oE '[A-Z]+-[0-9]+' || echo "")

if [[ -n "$ISSUE_KEY" ]]; then
    # Update existing issue
    /jira_get_issue "$ISSUE_KEY"
    /jira_update_issue "$ISSUE_KEY" --fields "$UPDATE_FIELDS"
else
    # Create new issue with AI assistance
    /gemini-query "Based on current code changes, suggest a Jira issue:
    Include: summary, description, acceptance criteria, story points.
    Format as JSON for Jira API." | /jira_create_issue
fi
```

### Enhanced AI Capabilities
- **Duplicate Detection**: AI-powered search for similar existing issues before creation
- **Smart Updates**: Analyze context to suggest appropriate field updates
- **Workflow Intelligence**: Recommend optimal status transitions based on development state
- **Auto-Categorization**: Intelligent component, label, and priority assignment

## Core Features

### Intelligent Operation Detection
- **Branch Analysis**: Extract issue key from current branch name
- **Context Detection**: Determine if creating or updating based on git state
- **Duplicate Prevention**: Search for similar issues before creating new ones
- **Smart Defaults**: Apply appropriate defaults based on operation type

### Unified Issue Operations
- **Create or Update**: Single command handles both operations intelligently
- **Template System**: Shared templates for both creation and updates
- **Field Management**: Consistent field handling across operations
- **Workflow Automation**: Automatic status progression and field updates

### Development Integration
- **Git-Aware Operations**: Automatic issue linking with branches and commits
- **PR Integration**: Update issues based on pull request events
- **Time Tracking**: Automatic work logging based on development activity
- **Quality Gates**: Update status based on CI/CD pipeline results

## Execution Flow

### 1. **Context Analysis**
```bash
# Detect current context
analyze_context() {
    # Check for issue key in branch name
    BRANCH_ISSUE=$(git branch --show-current | grep -oE '[A-Z]+-[0-9]+')
    
    # Check for issue key in recent commits
    COMMIT_ISSUE=$(git log -1 --pretty=format:"%s" | grep -oE '[A-Z]+-[0-9]+')
    
    # Check for WIP issues assigned to user
    WIP_ISSUES=$(/jira_search "assignee = currentUser() AND status = 'In Progress'")
    
    # Determine operation mode
    if [[ -n "$BRANCH_ISSUE" ]] || [[ -n "$COMMIT_ISSUE" ]]; then
        OPERATION="update"
        ISSUE_KEY="${BRANCH_ISSUE:-$COMMIT_ISSUE}"
    else
        OPERATION="create"
    fi
}
```

### 2. **Smart Operation Selection**
```bash
# Intelligent operation routing
execute_operation() {
    case "$OPERATION" in
        "create")
            # Check for duplicates first
            check_duplicates
            # Use creation workflow
            create_new_issue
            ;;
        "update")
            # Fetch current issue state
            get_issue_details "$ISSUE_KEY"
            # Use update workflow
            update_existing_issue "$ISSUE_KEY"
            ;;
        "interactive")
            # Let user choose
            prompt_operation_choice
            ;;
    esac
}
```

### 3. **Unified Field Management**
```bash
# Common field handling for both create and update
manage_fields() {
    # Core fields applicable to both operations
    FIELDS=$(cat <<EOF
{
    "summary": "$SUMMARY",
    "description": "$DESCRIPTION",
    "priority": {"name": "$PRIORITY"},
    "labels": $LABELS,
    "components": $COMPONENTS
}
EOF
)
    
    # Add operation-specific fields
    if [[ "$OPERATION" == "create" ]]; then
        FIELDS=$(echo "$FIELDS" | jq '. + {
            "project": {"key": "'"$PROJECT_KEY"'"},
            "issuetype": {"name": "'"$ISSUE_TYPE"'"}
        }')
    else
        # For updates, include transition data if needed
        if [[ -n "$NEW_STATUS" ]]; then
            TRANSITION_ID=$(get_transition_id "$ISSUE_KEY" "$NEW_STATUS")
            perform_transition "$ISSUE_KEY" "$TRANSITION_ID"
        fi
    fi
}
```

## Usage Examples

### Automatic Mode (Context-Aware)
```bash
# Automatically detect and perform appropriate operation
/m-jira-issue

# With specific details
/m-jira-issue "Fix OAuth integration timeout issue"

# Force creation even if issue exists
/m-jira-issue --create "New feature: Add dark mode support"

# Force update with issue key
/m-jira-issue --update ALUN-123 "Update status and add comment"
```

### Create Operations
```bash
# Create with template
/m-jira-issue --create --template bug

# Create with full details
/m-jira-issue --create \
    --type "Story" \
    --summary "Implement LinkedIn OAuth" \
    --priority "High" \
    --sprint "current"

# Create subtask
/m-jira-issue --create \
    --parent ALUN-100 \
    --type "Sub-task" \
    --summary "Design OAuth flow diagram"
```

### Update Operations
```bash
# Update current branch issue
/m-jira-issue --update

# Update specific issue
/m-jira-issue --update ALUN-123 \
    --status "In Progress" \
    --assignee "me"

# Bulk update
/m-jira-issue --update-bulk \
    --query "sprint = 'Sprint 24' AND status = 'To Do'" \
    --assignee "team-lead"

# Smart transition
/m-jira-issue --update ALUN-123 --transition "next"
```

## Templates System

### Unified Template Structure
```yaml
templates:
  bug:
    create:
      issuetype: "Bug"
      priority: "High"
      labels: ["bug", "needs-triage"]
      template_fields:
        - steps_to_reproduce
        - expected_behavior
        - actual_behavior
    update:
      add_labels: ["in-progress"]
      workflow: "bug-fix-workflow"
  
  feature:
    create:
      issuetype: "Story"
      priority: "Medium"
      labels: ["feature", "needs-design"]
      template_fields:
        - user_story
        - acceptance_criteria
        - technical_notes
    update:
      add_labels: ["development"]
      workflow: "feature-workflow"
  
  hotfix:
    create:
      issuetype: "Bug"
      priority: "Critical"
      labels: ["hotfix", "production"]
    update:
      fast_track: true
      skip_review: false
```

## Smart Features

### Duplicate Detection
```yaml
duplicate_detection:
  enabled: true
  similarity_threshold: 0.85
  check_fields:
    - summary
    - description
    - components
  actions:
    on_duplicate_found:
      - show_similar_issues
      - prompt_user_choice
      - suggest_update_instead
```

### Workflow Automation
```yaml
workflow_automation:
  branch_created:
    - set_status: "In Progress"
    - assign_to: "current_user"
    - log_work: "30m"
  
  commit_detected:
    - add_comment: "Commit: {commit_message}"
    - update_progress: true
  
  pr_created:
    - set_status: "Code Review"
    - notify: ["reviewer", "tech_lead"]
  
  pr_merged:
    - set_status: "Ready for Testing"
    - assign_to: "qa_team"
```

### Field Intelligence
```yaml
field_intelligence:
  auto_populate:
    components:
      - analyze_changed_files
      - map_to_components
    priority:
      - check_labels_for_urgency
      - analyze_description_keywords
    assignee:
      - check_code_ownership
      - check_expertise_matrix
  
  validation:
    summary:
      min_length: 10
      max_length: 100
      must_not_duplicate: true
    story_points:
      fibonacci_only: true
      max_value: 21
```

## Integration Points

### Git Integration
```bash
# Automatic branch creation on issue create
git checkout -b "feature/ALUN-456-oauth-integration"

# Commit message templates
git commit -m "ALUN-456: Implement OAuth token refresh logic"

# PR description with issue link
gh pr create --title "ALUN-456: OAuth Integration" \
    --body "Fixes ALUN-456\n\nImplements LinkedIn OAuth..."
```

### CI/CD Integration
```yaml
pipeline_integration:
  on_build_success:
    - add_label: "build-passing"
    - update_field: "CI Status" = "Green"
  
  on_test_failure:
    - add_label: "tests-failing"
    - add_comment: "Tests failed: {test_report_url}"
    - assign_to: "issue_creator"
  
  on_deployment:
    - transition_to: "Done"
    - add_comment: "Deployed to {environment}"
```

## Output Format

### Operation Result
```json
{
  "operation": "create|update",
  "success": true,
  "issue": {
    "key": "ALUN-456",
    "summary": "Implement OAuth2 integration for LinkedIn",
    "status": "In Progress",
    "assignee": "developer@company.com",
    "url": "https://company.atlassian.net/browse/ALUN-456"
  },
  "changes_made": {
    "fields_updated": ["status", "assignee", "labels"],
    "comments_added": 1,
    "attachments_added": 0,
    "workflow_transitions": ["To Do -> In Progress"]
  },
  "automation_triggered": [
    "Created feature branch",
    "Updated sprint board",
    "Notified team members"
  ],
  "next_actions": [
    "Begin development",
    "Update time estimate if needed",
    "Add technical details to description"
  ]
}
```

### Duplicate Detection Result
```json
{
  "duplicates_found": true,
  "similar_issues": [
    {
      "key": "ALUN-234",
      "summary": "OAuth integration for social platforms",
      "similarity_score": 0.92,
      "status": "In Progress",
      "assignee": "other.dev@company.com"
    }
  ],
  "recommendation": "Update existing issue ALUN-234 instead of creating new",
  "user_choice": "update_existing"
}
```

## Error Handling

### Smart Recovery
- **Network Failures**: Queue operations for retry when connection restored
- **Permission Issues**: Suggest alternative actions within user permissions
- **Validation Errors**: Provide specific guidance for fixing invalid fields
- **Workflow Violations**: Explain valid transitions and requirements

### Rollback Capabilities
- **Undo Recent Changes**: Revert last operation if needed
- **Batch Rollback**: Undo bulk operations with single command
- **State Recovery**: Restore issue to previous state
- **Audit Trail**: Complete history of all operations for debugging

## Configuration

### Global Settings
```json
{
  "jira_config": {
    "default_project": "ALUN",
    "auto_detect_mode": true,
    "duplicate_check": true,
    "workflow_automation": true,
    "time_tracking": {
      "auto_log": true,
      "minimum_duration": "15m"
    },
    "templates": {
      "enabled": true,
      "custom_path": "~/.jira/templates/"
    },
    "integration": {
      "git": true,
      "ci_cd": true,
      "ide": true
    }
  }
}
```

### Project-Specific Overrides
```json
{
  "projects": {
    "ALUN": {
      "default_issue_type": "Story",
      "required_fields": ["acceptance_criteria", "story_points"],
      "workflow_map": {
        "feature": "feature-workflow",
        "bug": "bug-workflow",
        "hotfix": "expedited-workflow"
      },
      "auto_assignment_rules": {
        "frontend": "frontend-team",
        "backend": "backend-team",
        "security": "security-team"
      }
    }
  }
}
```