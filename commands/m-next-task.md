# Next Tasks Workflow: Intelligent Task Prioritization System

**Target:** $ARGUMENTS (Default: medium priority if none specified)

**Scope:** Advanced development status analysis with AI-powered task prioritization and action planning

## Overview

Transforms Claude into a Senior Project Manager with expertise in analyzing development status, identifying critical tasks, and creating actionable priority plans. This command intelligently scans project artifacts, git history, and documentation to generate context-aware task recommendations with clear priority rankings.

**Key Benefits:**
- **Intelligent Status Analysis**: Deep understanding of current project state and momentum
- **AI-Powered Prioritization**: Smart ranking based on business impact, dependencies, and urgency
- **Comprehensive Scanning**: Analyzes documentation, git history, and code for complete context
- **Bilingual Reporting**: Generate reports in both English and Chinese for global teams
- **Actionable Planning**: Clear next steps with dependencies and resource requirements

## Help Documentation

To see this help documentation, run:
```bash
/m-next-task --help
```

## Core Features

### 1. Multi-Source Intelligence Gathering
- **Documentation Mining**: Extract tasks from dev docs, TODO files, and project roadmaps
- **Git History Analysis**: Parse commits for TODO markers and incomplete implementations
- **Status Assessment**: Evaluate completion status and identify blockers
- **Context Integration**: Combine multiple data sources for complete picture

### 2. Advanced Priority Ranking
- **Smart Algorithms**: AI-powered priority assessment based on multiple factors
- **Business Impact Analysis**: Consider user impact and business value
- **Technical Debt Evaluation**: Balance feature work with maintenance tasks
- **Dependency Mapping**: Understand task relationships and prerequisites

### 3. Comprehensive Task Management
- **Status Tracking**: Monitor task progression and completion rates
- **Blocker Identification**: Detect and highlight blocking dependencies
- **Resource Planning**: Assess availability and skill requirements
- **Timeline Estimation**: Provide realistic completion estimates

### 4. Intelligent Reporting and Planning
- **Structured Output**: Organized, actionable task lists with clear priorities
- **Reference Compilation**: Link tasks to relevant files, commits, and documentation
- **Clarification Detection**: Identify ambiguous requirements needing resolution
- **Bilingual Support**: Full English and Chinese documentation capabilities

## Usage Examples

### Basic Task Analysis
```bash
# Analyze current status with medium priority focus
/m-next-task

# Focus on high priority tasks only
/m-next-task high

# Get quick overview of low priority items
/m-next-task low
```

### Targeted Analysis
```bash
# Focus on specific feature or component
/m-next-task "OAuth implementation"

# Analyze tasks for specific milestone
/m-next-task "v2.0 release"

# Check tasks related to specific area
/m-next-task "security improvements"
```

### Advanced Options
```bash
# Deep analysis with technical debt focus
/m-next-task --technical-debt

# Focus on unblocking other tasks
/m-next-task --unblock-focus

# Generate team-oriented task breakdown
/m-next-task --team-breakdown
```

## Command Options

```yaml
priority_levels:
  high: "Critical and urgent tasks requiring immediate attention"
  medium: "Important tasks for steady progress (default)"
  low: "Nice-to-have improvements and optimizations"
  all: "Complete task analysis across all priority levels"

analysis_scope:
  --quick: "Fast analysis focusing on obvious next steps"
  --comprehensive: "Deep analysis including technical debt and optimization"
  --blocked-focus: "Prioritize tasks that are blocking other work"
  --technical-debt: "Focus on technical debt and maintenance tasks"

task_filtering:
  --feature-only: "Focus on new feature development tasks"
  --bugfix-only: "Prioritize bug fixes and issue resolution"
  --maintenance-only: "Focus on maintenance and optimization tasks"
  --unblock-focus: "Prioritize tasks that unblock other work"

team_options:
  --team-breakdown: "Organize tasks by team roles and skills"
  --workload-balance: "Consider team capacity and workload distribution"
  --skill-matching: "Match tasks to team member expertise"
  --collaboration-focus: "Highlight tasks requiring team collaboration"

output_format:
  --detailed: "Comprehensive analysis with full context (default)"
  --summary: "Brief overview of top priorities"
  --json: "Structured JSON output for tool integration"
  --bilingual: "English and Chinese bilingual report"

timeframe_focus:
  --today: "Tasks achievable within current day"
  --week: "Tasks for current week planning"
  --sprint: "Tasks for current sprint or iteration"
  --milestone: "Tasks toward next major milestone"
```

## Execution Steps

### 1. **Comprehensive Intelligence Gathering**
- **Documentation Mining**: Scan development tracking files (`docs/dev*.md`, `TODO.md`, roadmaps)
- **Code Analysis**: Extract TODO markers, FIXME comments, and incomplete implementations
- **Git Intelligence**: Analyze recent commits for patterns and incomplete work
- **Issue Tracking**: Integrate with external issue trackers when available

### 2. **Advanced Git History Analysis**
- **Commit Pattern Recognition**: Parse commits for TODO markers and incomplete features
- **Change Impact Assessment**: Identify new changes requiring follow-up actions
- **Feature Completion Tracking**: Detect partially implemented features
- **Technical Debt Identification**: Find code areas needing refactoring or improvement

### 3. **Intelligent Task Status Assessment**
- **Completion Analysis**: Evaluate current task progress and completion rates
- **Dependency Mapping**: Identify blocking dependencies and prerequisites
- **Resource Evaluation**: Assess team availability and skill requirements
- **Risk Assessment**: Identify potential blockers and mitigation strategies

### 4. **AI-Powered Priority Ranking**
- **Multi-Factor Scoring**: Rank tasks using business impact, urgency, and complexity
- **Dependency Optimization**: Prioritize tasks that unblock other work
- **Technical Debt Balance**: Balance feature development with maintenance needs
- **Team Capacity Matching**: Consider team skills and current workload

### 5. **Comprehensive Reference Collection**
- **Resource Mapping**: Gather relevant files, commits, and documentation links
- **Decision Context**: Identify helpful discussions and decision records
- **Supporting Materials**: Compile specs, designs, and implementation guides
- **Knowledge Base**: Link to relevant past decisions and patterns

### 6. **Intelligent Report Generation**
- **Structured Analysis**: Compile findings into organized, actionable format
- **Bilingual Documentation**: Generate English and Chinese reports
- **Action Planning**: Create clear next steps with timelines and dependencies
- **File Output**: Save to `docs/workspaces/next-tasks-MM-dd-HH-mm-ss.md`

## Output Format

### English Report

#### `summary`
- Concise overview of current development status
- Key context and recent progress highlights
- Overall project health and momentum assessment

#### `tasks`
Prioritized task list with structure:
```json
{
  "id": "string",
  "description": "string",
  "priority": "high|medium|low",
  "status": "pending|blocked|in-progress",
  "dependencies": ["task_id_1", "task_id_2"]
}
```

#### `references`
- Relevant files and documentation links
- Related commits and pull requests
- Helpful discussions and decision records
- External resources and documentation

#### `clarifications`
Questions for requirement or implementation ambiguities:
- Unclear priorities or scope boundaries
- Missing technical specifications
- Resource allocation and timeline concerns

### 中文报告 (Chinese Report)

> 以下为中文版本，内容与英文部分对应。AGI可跳过此部分。
> The following is the Chinese version, corresponding to the English section. AGI can skip this section.

#### `summary` - 状态概述 (Status Overview)
- **项目状态**: 当前开发状态的简要概览
- **进展亮点**: 关键背景和近期进展亮点
- **健康评估**: 项目整体健康状况和发展势头评估
- **团队状态**: 当前团队工作负载和能力分析
- **里程碑进度**: 向下一个重要里程碑的进展情况

#### `tasks` - 任务清单 (Task List)
按优先级排序的任务列表结构 (Priority-sorted task list structure)：
```json
{
  "id": "字符串 (String)",
  "description": "任务描述 (Task Description)",
  "priority": "高|中|低 (High|Medium|Low)",
  "status": "待开始|受阻|进行中 (Pending|Blocked|InProgress)",
  "dependencies": ["依赖任务ID1 (Dependency Task IDs)"],
  "estimated_effort": "预估工作量 (Estimated Effort)",
  "business_impact": "业务影响 (Business Impact)",
  "technical_complexity": "技术复杂度 (Technical Complexity)"
}
```

#### `references` - 参考资料 (Reference Materials)
- **相关文件**: 相关文件和文档链接
- **代码提交**: 关联的提交和拉取请求
- **决策记录**: 有用的讨论和决策记录
- **外部资源**: 外部资源和文档
- **技术规范**: 相关的技术规范和API文档

#### `clarifications` - 待澄清问题 (Clarification Questions)
需求或实现模糊性问题 (Requirement or implementation ambiguity issues)：
- **优先级澄清**: 不明确的优先级或范围边界
- **技术规范**: 缺失的技术规范
- **资源规划**: 资源分配和时间线问题
- **依赖关系**: 任务间依赖关系的不确定性
- **风险评估**: 潜在风险和缓解策略需求

## Task Analysis Framework

### Priority Scoring Algorithm
```yaml
priority_factors:
  business_impact:
    weight: 40%
    factors: ["user_facing", "revenue_impact", "strategic_importance"]
    
  urgency:
    weight: 30% 
    factors: ["deadline_pressure", "blocking_others", "security_critical"]
    
  effort_vs_value:
    weight: 20%
    factors: ["implementation_complexity", "maintenance_burden", "roi"]
    
  dependencies:
    weight: 10%
    factors: ["prerequisite_completion", "resource_availability", "external_deps"]
```

### Task Classification System
```yaml
task_types:
  feature_development:
    description: "New functionality and capabilities"
    indicators: ["implement", "add", "create", "build"]
    priority_boost: "high_user_impact"
    
  bug_fixes:
    description: "Error corrections and issue resolution"
    indicators: ["fix", "bug", "error", "issue"]
    priority_boost: "security_or_data_loss"
    
  technical_debt:
    description: "Code quality and architecture improvements"
    indicators: ["refactor", "optimize", "cleanup", "upgrade"]
    priority_boost: "blocking_new_features"
    
  documentation:
    description: "Documentation updates and improvements"
    indicators: ["document", "readme", "guide", "spec"]
    priority_boost: "team_onboarding_or_compliance"
    
  infrastructure:
    description: "DevOps, CI/CD, and infrastructure work"
    indicators: ["deploy", "ci", "infrastructure", "monitoring"]
    priority_boost: "reliability_or_security"
```

### Dependency Analysis Patterns
```yaml
dependency_types:
  blocking_dependencies:
    description: "Tasks that must complete before others can start"
    analysis: "Critical path identification"
    priority_impact: "high_boost_for_blockers"
    
  parallel_dependencies:
    description: "Tasks that can be worked on simultaneously"
    analysis: "Resource allocation optimization"
    priority_impact: "team_capacity_consideration"
    
  optional_dependencies:
    description: "Tasks that enhance but don't block other work"
    analysis: "Nice-to-have prioritization"
    priority_impact: "lower_priority_unless_high_value"
```

## Integration Features

### Development Tool Integration
- **Git Integration**: Deep analysis of commit history and branch status
- **Issue Tracking**: Integration with Jira, GitHub Issues, Linear when available
- **Documentation Tools**: Scan Notion, Confluence, and markdown documentation
- **Project Management**: Connect with project tracking and milestone systems

### AI-Powered Enhancements
- **Pattern Recognition**: Learn from past task completion patterns
- **Predictive Analysis**: Predict likely next tasks based on current work
- **Risk Assessment**: Identify potential issues before they become blockers
- **Resource Optimization**: Suggest optimal task assignments based on team skills

### Team Collaboration Features
- **Workload Distribution**: Analyze and balance team workload
- **Skill Matching**: Match tasks to team member expertise
- **Communication Integration**: Link tasks to relevant team discussions
- **Progress Tracking**: Monitor team progress toward goals

## Best Practices

### Effective Task Prioritization
1. **Regular Reviews**: Run weekly to maintain current priorities
2. **Context Awareness**: Consider current sprint/milestone context
3. **Team Input**: Validate priorities with team members
4. **Flexibility**: Adjust priorities based on changing requirements

### Task Management Excellence
1. **Clear Descriptions**: Ensure tasks have actionable descriptions
2. **Proper Sizing**: Break large tasks into manageable chunks
3. **Dependency Tracking**: Maintain clear dependency relationships
4. **Progress Monitoring**: Track completion and identify blockers early

### Strategic Planning
1. **Balance Portfolio**: Mix feature work with technical debt
2. **Risk Management**: Address high-risk items early
3. **Team Development**: Include learning and growth opportunities
4. **Stakeholder Alignment**: Ensure priorities align with business goals

## Output Format Examples

### Enhanced Task Structure
```json
{
  "id": "task-oauth-google",
  "description": "Implement Google OAuth 2.0 authentication",
  "priority": "high",
  "status": "pending",
  "estimated_effort": "3-5 days",
  "business_impact": "high",
  "technical_complexity": "medium",
  "dependencies": ["user-model-update", "auth-infrastructure"],
  "blocking": ["social-login-ui", "user-onboarding"],
  "assignee_suggestions": ["backend-team", "auth-specialist"],
  "acceptance_criteria": [
    "Users can authenticate with Google accounts",
    "User profile data synced from Google",
    "Proper error handling and fallbacks"
  ],
  "references": {
    "files": ["src/auth/oauth.ts", "docs/auth-spec.md"],
    "commits": ["abc123"],
    "discussions": ["#auth-channel-discussion"]
  }
}
```

### Priority Analysis Example
```markdown
## Priority Analysis Summary

### 🔥 High Priority (Complete This Week)
1. **Fix authentication bug** - Blocking user signups (Critical)
2. **Complete OAuth integration** - Required for v2.0 release
3. **Security vulnerability patch** - High security impact

### 📋 Medium Priority (Next 2 Weeks)
1. **User dashboard improvements** - Good user experience impact
2. **Performance optimization** - Technical debt with measurable ROI
3. **API documentation update** - Supporting team productivity

### 💡 Low Priority (Future Planning)
1. **Advanced analytics features** - Nice-to-have enhancements
2. **UI polish improvements** - Quality of life improvements
3. **Experimental integrations** - Research and development

### 🚫 Blocked Tasks
1. **Mobile app integration** - Waiting for API completion
2. **Advanced reporting** - Pending design approval
```

## Final Output

Save the complete bilingual next tasks report to:
`docs/workspaces/next-tasks-MM-dd-HH-mm-ss.md`

### Report Structure
1. **Executive Summary** - Current status and key priorities
2. **High Priority Tasks** - Immediate action items
3. **Medium/Low Priority Tasks** - Future planning items
4. **Blocked Tasks** - Items waiting for dependencies
5. **Reference Materials** - Supporting documentation and context
6. **Team Recommendations** - Suggested assignments and workload distribution

Output the saved file path to confirm completion.