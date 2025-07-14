# Jira Issue Management: Create and Configure Issues

**Target:** $ARGUMENTS (Default: interactive issue creation or issue key for existing issue)

**Scope:** Comprehensive issue creation, modification, and management with smart templates

## Overview

Streamlines Jira issue creation and management with intelligent templates, automatic field population, and integration with development workflows. Supports all issue types with project-specific customization.

## AI Integration Strategy

### Primary: Gemini CLI Integration
**Uses Gemini CLI when available for superior issue creation:**

```bash
# AI-powered issue creation
if command -v gemini >/dev/null 2>&1 && [[ -n "$GEMINI_API_KEY" ]]; then
    # Analyze current context for issue creation
    git diff --name-only | head -10 | xargs cat | \
    gemini -p "Based on these code changes, suggest a comprehensive Jira issue.
    Include: summary, description, acceptance criteria, story points estimate.
    Format as structured Jira issue data." --format json
    
    # Generate user stories from requirements
    gemini --all-files -p "Generate user stories for the current feature implementation.
    Use format: As a [user type], I want [goal] so that [benefit].
    Include acceptance criteria and technical requirements." --format markdown
fi
```

### Enhanced AI Capabilities
- **Context-Aware Creation**: Analyzes code changes to suggest relevant issues
- **Smart Field Population**: Auto-fills priority, labels, and components based on context
- **Acceptance Criteria Generation**: Creates comprehensive acceptance criteria from requirements
- **Story Point Estimation**: AI-powered complexity analysis and point estimation

## Core Features

### Smart Issue Creation
- **Template Selection**: Choose from predefined templates (Feature, Bug, Task, Epic, Story)
- **Auto-Population**: Extract context from current branch, commit history, and project files
- **Field Validation**: Ensure all required fields are completed before creation
- **Bulk Creation**: Create multiple related issues efficiently

### Issue Configuration
- **Metadata Management**: Set priority, labels, components, and custom fields
- **Assignee Management**: Smart assignee suggestions based on expertise and workload
- **Sprint Assignment**: Automatic sprint detection and assignment
- **Epic Linking**: Link stories to appropriate epics automatically

### Development Integration
- **Branch Linking**: Connect issues to feature branches
- **Commit Association**: Link commits to issues with proper formatting
- **PR Integration**: Associate pull requests with issues
- **Deployment Tracking**: Track issue progress through deployment pipeline

## Execution Steps

1. **Context Analysis**
   - Analyze current git branch and commit history
   - Detect project type and relevant components
   - Identify related existing issues
   - Suggest issue type based on context

2. **Template Selection**
   - Present available issue templates
   - Smart template recommendation based on context
   - Custom template creation for repeated patterns
   - Template validation and field requirements

3. **Issue Creation Workflow**
   - Interactive field completion with smart suggestions
   - Validation of required fields and dependencies
   - Preview issue before creation
   - Automatic issue key generation and assignment

4. **Post-Creation Actions**
   - Create linked development branch (optional)
   - Set up local development environment
   - Update project tracking files
   - Send notifications to relevant team members

## Issue Templates

### Feature Story Template
```yaml
issue_type: Story
priority: Medium
components: []
labels: [feature, new-development]
required_fields:
  - summary
  - description
  - acceptance_criteria
  - business_value
optional_fields:
  - mockups
  - technical_requirements
  - dependencies
```

### Bug Report Template
```yaml
issue_type: Bug
priority: High
components: []
labels: [bug, needs-investigation]
required_fields:
  - summary
  - description
  - steps_to_reproduce
  - expected_behavior
  - actual_behavior
  - environment
optional_fields:
  - screenshots
  - logs
  - workaround
  - severity_impact
```

### Technical Task Template
```yaml
issue_type: Task
priority: Medium
components: []
labels: [technical, maintenance]
required_fields:
  - summary
  - description
  - technical_approach
  - definition_of_done
optional_fields:
  - research_notes
  - implementation_plan
  - testing_strategy
```

### Epic Template
```yaml
issue_type: Epic
priority: High
components: []
labels: [epic, planning]
required_fields:
  - summary
  - description
  - business_objectives
  - success_metrics
  - timeline
optional_fields:
  - user_personas
  - market_analysis
  - technical_architecture
```

## Smart Field Population

### Automatic Context Detection
- **Repository Analysis**: Extract component and module information
- **File Change Analysis**: Suggest affected components from recent changes
- **Team Expertise**: Recommend assignees based on code ownership
- **Historical Patterns**: Learn from previous similar issues

### Intelligent Suggestions
- **Summary Generation**: AI-powered summary suggestions based on description
- **Label Recommendations**: Suggest relevant labels based on issue content
- **Priority Assessment**: Recommend priority based on business impact
- **Sprint Planning**: Suggest optimal sprint based on capacity and dependencies

## Issue Management Operations

### Bulk Operations
```bash
# Create multiple related issues
jira issue create --template story --count 5 --epic ALUN-100

# Update multiple issues with same criteria
jira issue update --query "assignee = currentUser()" --status "In Progress"

# Clone issue with modifications
jira issue clone ALUN-123 --title "New Feature Variation" --assignee john.doe
```

### Advanced Queries
```bash
# Find issues by complex criteria
jira issue list --query "project = ALUN AND status = 'To Do' AND component = 'Frontend'"

# Export issues for analysis
jira issue export --format csv --query "sprint = 'Sprint 23'"

# Link issues with relationships
jira issue link ALUN-123 --relates ALUN-124 --blocks ALUN-125
```

## Configuration Options

### Project Configuration
```json
{
  "project_key": "ALUN",
  "default_templates": {
    "story": "feature_story",
    "bug": "bug_report",
    "task": "technical_task"
  },
  "required_fields": ["summary", "description"],
  "component_mapping": {
    "src/components/": "Frontend",
    "src/lib/auth/": "Authentication",
    "supabase/": "Database"
  },
  "auto_assignment": {
    "enable": true,
    "rules": [
      {"component": "Frontend", "assignee": "frontend-team"},
      {"label": "security", "assignee": "security-team"}
    ]
  }
}
```

### Validation Rules
```json
{
  "validation": {
    "summary": {
      "min_length": 10,
      "max_length": 100,
      "required_patterns": ["ALUN-"]
    },
    "description": {
      "min_length": 50,
      "required_sections": ["Problem", "Solution", "Acceptance Criteria"]
    },
    "story_points": {
      "valid_values": [1, 2, 3, 5, 8, 13, 21]
    }
  }
}
```

## Output Format

### Issue Creation Result
```json
{
  "issue": {
    "key": "ALUN-456",
    "summary": "Implement OAuth2 integration for LinkedIn",
    "status": "To Do",
    "assignee": "developer@company.com",
    "components": ["Authentication", "Social Media"],
    "labels": ["feature", "oauth", "linkedin"],
    "created": "2024-01-15T10:30:00Z"
  },
  "actions_taken": [
    "Created issue ALUN-456",
    "Assigned to current user",
    "Added to current sprint",
    "Created feature branch: feature/ALUN-456-linkedin-oauth"
  ],
  "next_steps": [
    "Switch to feature branch",
    "Begin development",
    "Update issue status to 'In Progress'"
  ]
}
```

### Issue Query Result
```json
{
  "query": "assignee = currentUser() AND status = 'To Do'",
  "total_count": 8,
  "issues": [
    {
      "key": "ALUN-456",
      "summary": "Implement OAuth2 integration",
      "priority": "High",
      "story_points": 8,
      "sprint": "Sprint 24"
    }
  ],
  "suggested_actions": [
    "Start work on highest priority issue ALUN-456",
    "Review sprint backlog for planning",
    "Update issue estimates if needed"
  ]
}
```

## Integration Features

### Git Integration
- Automatic branch creation with issue key
- Commit message templates including issue references
- Pull request templates with issue linking
- Branch protection rules based on issue status

### IDE Integration
- Issue information displayed in development environment
- Quick access to issue details from code
- Automatic time tracking during development
- Context switching between issues

### Team Collaboration
- Automatic notifications for issue updates
- Commenting and discussion threading
- File attachment and screenshot integration
- Cross-reference detection and linking

## Error Handling

### Validation Errors
- Field requirement validation with helpful suggestions
- Duplicate detection and merge recommendations
- Permission verification before creation
- Template compatibility checking

### Network Issues
- Offline mode with local queue management
- Automatic retry with exponential backoff
- Data consistency validation after reconnection
- Conflict resolution for concurrent modifications

### Recovery Options
- Issue draft saving for incomplete submissions
- Bulk operation rollback capabilities
- Version history tracking for modifications
- Audit trail for all issue operations