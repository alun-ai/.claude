# Jira Issue Update: Comprehensive Issue Modification

**Target:** $ARGUMENTS (Default: current branch issue or interactive selection)

**Scope:** Advanced issue updating with smart workflows, batch operations, and automated transitions

## Overview

Provides comprehensive issue updating capabilities with intelligent workflow management, automated status transitions, and seamless integration with development activities. Supports both individual and bulk issue modifications.

## Core Features

### Smart Status Transitions
- **Workflow-Aware Updates**: Respect Jira workflow rules and transitions
- **Automatic Progression**: Update status based on development milestones
- **Validation Checks**: Ensure all required fields are completed for transitions
- **Custom Workflows**: Support project-specific workflow configurations

### Intelligent Field Updates
- **Context-Based Suggestions**: Recommend updates based on current activity
- **Bulk Field Operations**: Update multiple issues with same changes
- **Template-Based Updates**: Apply predefined update patterns
- **Conditional Logic**: Apply different updates based on issue criteria

### Development Integration
- **Git-Triggered Updates**: Automatic updates based on commit messages and PR status
- **Time Tracking**: Automatic time logging based on development activity
- **Progress Monitoring**: Update issue progress based on code changes
- **Quality Gates**: Update status based on testing and review completion

## Execution Steps

1. **Issue Identification**
   - Auto-detect current issue from branch context
   - Support manual issue key specification
   - Bulk selection with advanced filtering
   - Related issue discovery and selection

2. **Update Planning**
   - Analyze current issue state and available transitions
   - Suggest optimal updates based on development context
   - Validate update permissions and workflow constraints
   - Preview changes before application

3. **Smart Field Updates**
   - Interactive field modification with intelligent suggestions
   - Bulk operation planning with preview
   - Dependency validation and resolution
   - Custom field handling and validation

4. **Workflow Execution**
   - Apply updates with proper transition handling
   - Handle workflow validation and requirements
   - Execute related automation and triggers
   - Verify successful completion and rollback if needed

## Update Operations

### Status Management
```bash
# Automatic status progression
jira update --auto-transition  # Based on development context

# Manual status change with validation
jira update ALUN-123 --status "In Progress" --validate-transition

# Bulk status updates
jira update --query "assignee = currentUser()" --status "Code Review"

# Conditional status updates
jira update --if-status "To Do" --set-status "In Progress" --assignee currentUser
```

### Field Modifications
```bash
# Update specific fields
jira update ALUN-123 --priority High --labels "urgent,hotfix"

# Add/remove values from multi-value fields
jira update ALUN-123 --add-labels "frontend" --remove-labels "backend"

# Update custom fields
jira update ALUN-123 --custom-field "Story Points" 8

# Conditional field updates
jira update --if-component "Frontend" --set-assignee "frontend-lead"
```

### Time and Progress Tracking
```bash
# Log work time
jira update ALUN-123 --log-work "2h" --work-description "Implemented OAuth flow"

# Update progress estimates
jira update ALUN-123 --remaining-estimate "4h" --original-estimate "8h"

# Bulk time logging
jira update --log-work-bulk "today" --default-time "4h"
```

## Smart Update Patterns

### Development Milestone Triggers
```yaml
patterns:
  commit_trigger:
    condition: "commit message contains issue key"
    actions:
      - set_status: "In Progress"
      - add_comment: "Development started: {commit_summary}"
      - log_work: "30m"
  
  pr_created:
    condition: "pull request created with issue key"
    actions:
      - set_status: "Code Review"
      - add_comment: "Pull request created: {pr_url}"
      - assign_reviewer: "team_lead"
  
  pr_merged:
    condition: "pull request merged"
    actions:
      - set_status: "Done"
      - add_comment: "Implementation completed and merged"
      - log_work: "final_time_tracking"
```

### Quality Gate Integration
```yaml
quality_gates:
  code_review_passed:
    condition: "PR approved by 2+ reviewers"
    actions:
      - transition_to: "Ready for Testing"
      - notify: "qa_team"
  
  tests_passing:
    condition: "CI pipeline successful"
    actions:
      - add_label: "tests-passing"
      - update_field: "QA Status" = "Ready"
  
  deployment_complete:
    condition: "deployed to production"
    actions:
      - transition_to: "Done"
      - add_comment: "Deployed to production"
      - close_related_subtasks: true
```

## Bulk Operations

### Query-Based Updates
```yaml
bulk_operations:
  sprint_cleanup:
    query: "sprint = 'Sprint 23' AND status = 'To Do'"
    actions:
      - move_to_sprint: "Sprint 24"
      - add_comment: "Moved to next sprint"
  
  priority_adjustment:
    query: "component = 'Security' AND priority != 'High'"
    actions:
      - set_priority: "High"
      - add_label: "security-review-required"
  
  assignee_rebalancing:
    query: "assignee = 'overloaded.developer'"
    conditions:
      - story_points: "> 5"
    actions:
      - reassign_to: "available_team_member"
      - add_comment: "Reassigned for workload balancing"
```

### Template-Based Updates
```yaml
templates:
  bug_triage:
    fields:
      priority: "High"
      labels: ["triaged", "needs-investigation"]
      assignee: "triage_team"
    comments: "Bug triaged and assigned for investigation"
  
  feature_complete:
    transition: "Done"
    fields:
      resolution: "Fixed"
      labels: ["completed", "ready-for-release"]
    comments: "Feature implementation completed"
  
  testing_required:
    transition: "Ready for Testing"
    fields:
      assignee: "qa_team"
      labels: ["needs-testing"]
    comments: "Ready for QA testing"
```

## Configuration Options

### Workflow Configuration
```json
{
  "workflow_automation": {
    "auto_transition": true,
    "validate_transitions": true,
    "require_comments": ["Won't Fix", "Cannot Reproduce"],
    "restricted_transitions": {
      "To Do -> Done": "require_approval"
    }
  },
  "field_defaults": {
    "resolution": {
      "Done": "Fixed",
      "Won't Fix": "Won't Fix"
    },
    "assignee": {
      "Code Review": "tech_lead",
      "Testing": "qa_team"
    }
  }
}
```

### Automation Rules
```json
{
  "automation": {
    "git_integration": {
      "commit_status_update": true,
      "pr_status_update": true,
      "branch_creation_update": true
    },
    "time_tracking": {
      "auto_log_commits": true,
      "auto_log_pr_reviews": true,
      "daily_time_summary": true
    },
    "notifications": {
      "status_changes": ["assignee", "reporter"],
      "assignment_changes": ["old_assignee", "new_assignee"],
      "priority_changes": ["team_lead"]
    }
  }
}
```

## Output Format

### Update Result
```json
{
  "updated_issues": [
    {
      "key": "ALUN-123",
      "previous_status": "To Do",
      "new_status": "In Progress",
      "updated_fields": {
        "assignee": "current_user",
        "labels": ["frontend", "priority"]
      },
      "comments_added": 1,
      "time_logged": "2h"
    }
  ],
  "bulk_operation": {
    "total_issues": 5,
    "successfully_updated": 4,
    "failed_updates": 1,
    "validation_errors": [
      {
        "issue": "ALUN-125",
        "error": "Cannot transition from 'Done' to 'In Progress'"
      }
    ]
  },
  "automation_triggered": [
    "Notified assignee of status change",
    "Updated sprint burndown metrics",
    "Triggered CI/CD pipeline check"
  ]
}
```

### Progress Summary
```json
{
  "issue_progress": {
    "key": "ALUN-123",
    "completion_percentage": 75,
    "time_tracking": {
      "original_estimate": "8h",
      "time_spent": "6h",
      "remaining_estimate": "2h"
    },
    "quality_metrics": {
      "code_coverage": "85%",
      "tests_passing": true,
      "security_scan": "passed"
    }
  },
  "sprint_impact": {
    "burndown_effect": "+2 story points completed",
    "velocity_trend": "on_track",
    "risk_factors": []
  }
}
```

## Integration Features

### Development Tools
- **IDE Integration**: Update issues directly from development environment
- **Git Hooks**: Automatic updates based on git operations
- **CI/CD Integration**: Status updates based on pipeline results
- **Code Review Tools**: Integration with PR and review platforms

### Team Collaboration
- **Real-time Notifications**: Immediate updates to relevant team members
- **Activity Streaming**: Live feed of issue updates and changes
- **Conflict Resolution**: Handle concurrent modifications gracefully
- **Audit Logging**: Complete history of all updates and changes

### Analytics and Reporting
- **Update Metrics**: Track frequency and patterns of issue updates
- **Workflow Analytics**: Analyze transition patterns and bottlenecks
- **Team Performance**: Monitor individual and team update activities
- **Automation Effectiveness**: Measure impact of automated updates

## Error Handling

### Validation and Permissions
- **Pre-update Validation**: Check all constraints before applying changes
- **Permission Verification**: Ensure user has rights for all operations
- **Workflow Compliance**: Validate against Jira workflow rules
- **Field Validation**: Check field types, formats, and requirements

### Rollback and Recovery
- **Change Rollback**: Ability to undo recent updates if needed
- **Batch Operation Recovery**: Handle partial failures in bulk operations
- **Conflict Resolution**: Merge concurrent changes intelligently
- **Data Consistency**: Ensure all related data remains synchronized