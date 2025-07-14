# Jira Development Workflow: Comprehensive Issue Management

**Target:** $ARGUMENTS (Default: current branch or active development context)

**Scope:** Comprehensive Jira integration for streamlined development workflow management

## Overview

Provides a complete Jira integration workflow for developers to manage issues, track progress, and maintain project alignment without leaving the development environment. Integrates with git workflows and development tools.

## Core Workflow Commands

### Issue Management
- **Create Issues**: `/m-jira-issue` - Create new tickets with proper categorization
- **Update Issues**: `/m-jira-update` - Update issue status, metadata, and progress
- **Link Issues**: Link issues to branches, PRs, and commits automatically

### Development Integration
- **Start Development**: `/m-jira-dev-start` - Begin work on issue with branch creation
- **Complete Development**: `/m-jira-dev-complete` - Finalize issue with PR and transition

### Testing & QA
- **Test Planning**: `/m-jira-test-plan` - Generate comprehensive test plans
- **QA Findings**: `/m-jira-qa-findings` - Document and track QA results

### Documentation & Specs
- **Tech Specs**: `/m-jira-tech-spec` - Create and maintain technical specifications
- **Documentation**: `/m-jira-docs` - Update project documentation in Jira

## Execution Flow

1. **Environment Setup**
   - Verify jira-cli configuration and authentication
   - Check project context and current branch status
   - Initialize Jira workspace connection

2. **Issue Discovery & Planning**
   - List current assigned issues
   - Identify sprint goals and priorities
   - Suggest optimal issue selection for current context

3. **Development Workflow Integration**
   - Create feature branches linked to Jira issues
   - Automatic commit message formatting with issue keys
   - Progress tracking and time logging

4. **Quality Assurance Integration**
   - Test case generation based on issue requirements
   - QA checkpoint automation
   - Bug tracking and resolution workflows

5. **Completion & Documentation**
   - Automatic issue transitions based on development milestones
   - Documentation updates and knowledge base maintenance
   - Sprint retrospective data collection

## Jira Integration Features

### Authentication & Configuration
- Secure credential management using system keychain
- Project-specific configuration with .jira-config
- Team workspace detection and automatic setup

### Smart Issue Management
- Automatic issue type detection (Story, Bug, Task, Epic)
- Template-based issue creation with project standards
- Bulk operations for sprint planning and management

### Development Tracking
- Git integration with automatic issue linking
- Branch naming convention enforcement
- Commit message standardization with issue keys

### Progress Monitoring
- Real-time progress updates to Jira
- Time tracking integration with development activities
- Burndown chart data collection

## Configuration Options

### Project Setup
```json
{
  "project_key": "ALUN",
  "base_url": "https://your-org.atlassian.net",
  "default_assignee": "current_user",
  "branch_prefix": "feature/ALUN-",
  "commit_template": "ALUN-{issue_key}: {summary}"
}
```

### Workflow Customization
- **issue_types**: Supported Jira issue types for the project
- **status_transitions**: Custom workflow state mappings
- **required_fields**: Mandatory fields for issue creation
- **automation_rules**: Trigger conditions for automatic updates

### Integration Settings
- **git_integration**: Enable automatic branch and commit linking
- **time_tracking**: Enable automatic time logging
- **notification_levels**: Control Jira notification frequency
- **sync_frequency**: How often to sync with Jira server

## Output Format

### Workflow Status Report
```json
{
  "current_issue": {
    "key": "ALUN-123",
    "summary": "Implement OAuth integration",
    "status": "In Progress",
    "assignee": "developer@company.com",
    "branch": "feature/ALUN-123-oauth-integration"
  },
  "sprint_progress": {
    "total_issues": 12,
    "completed": 5,
    "in_progress": 3,
    "todo": 4,
    "burndown_trend": "on_track"
  },
  "next_actions": [
    "Continue development on ALUN-123",
    "Review PR for ALUN-119",
    "Plan testing for ALUN-121"
  ]
}
```

## Available Sub-Commands

- `/m-jira-issue` - Create and manage individual issues
- `/m-jira-update` - Update issue metadata and progress
- `/m-jira-dev-start` - Initialize development workflow for issue
- `/m-jira-dev-complete` - Complete development and transition issue
- `/m-jira-test-plan` - Generate comprehensive testing strategies
- `/m-jira-qa-findings` - Document QA results and bug reports
- `/m-jira-tech-spec` - Maintain technical specifications
- `/m-jira-docs` - Update project documentation
- `/m-jira-sprint` - Sprint planning and management
- `/m-jira-planning` - Epic and feature planning
- `/m-jira-report` - Generate progress and analytics reports
- `/m-jira-metrics` - Development metrics and team insights

## Security & Compliance

### Credential Management
- Secure storage of Jira API tokens
- Multi-factor authentication support
- Automatic token refresh and validation

### Data Privacy
- Local caching with encryption
- Minimal data retention policies
- GDPR compliance for user data

### Audit Trail
- Complete workflow action logging
- Integration with company audit systems
- Change tracking and attribution

## Error Handling

### Connection Issues
- Automatic retry with exponential backoff
- Offline mode with local queue management
- Graceful degradation when Jira is unavailable

### Validation Errors
- Pre-flight validation of issue data
- Smart error recovery suggestions
- Integration with Claude for error resolution

### Workflow Conflicts
- Merge conflict detection and resolution
- Multi-user coordination on shared issues
- Automatic conflict notification and escalation