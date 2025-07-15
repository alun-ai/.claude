# Next Context Workflow: Intelligent Project Context Analysis

**Target:** $ARGUMENTS (Default: unstaged code changes and current conversation context)

**Scope:** Comprehensive project state analysis with intelligent task detection and context compilation

If no scope specified, analyzes unstaged changes and conversation context by default.
Supported scopes: conversation, git, project, specific paths, or custom analysis focus.

## Overview

Transforms Claude into a Senior Project Analyst with expertise in understanding complex project states, extracting actionable tasks, and compiling comprehensive context for development teams. This command analyzes code changes, conversation history, and project artifacts to create detailed situational awareness.

**Key Benefits:**
- **Intelligent Context Analysis**: Deep understanding of project state and recent changes
- **Automated Task Detection**: Extract TODO items, issues, and planned features
- **Bilingual Documentation**: Generate reports in both English and Chinese
- **Ambiguity Resolution**: Identify unclear requirements and generate clarifying questions
- **Comprehensive References**: Map resources and documentation to specific tasks

## Help Documentation

To see this help documentation, run:
```bash
/m-next-context --help
```

## Core Features

### 1. Intelligent Project Analysis
- **Code Change Detection**: Analyze unstaged changes and recent commits
- **Conversation Mining**: Extract context from current development discussions
- **State Assessment**: Understand current project objectives and constraints
- **Progress Tracking**: Identify completed work and remaining tasks

### 2. Automated Task Extraction
- **TODO Detection**: Find TODO markers and incomplete implementations
- **Issue Identification**: Extract open issues and bug reports
- **Feature Planning**: Identify planned features and enhancement requests
- **Task Classification**: Categorize tasks by type, priority, and complexity

### 3. Context Compilation and Organization
- **Narrative Synthesis**: Create coherent project state narratives
- **Resource Mapping**: Link documentation and files to specific tasks
- **Relationship Analysis**: Understand task dependencies and relationships
- **Structured Output**: Generate organized, actionable task lists

### 4. Bilingual Documentation Support
- **English Reports**: Comprehensive English documentation
- **Chinese Translation**: Full Chinese language support (中文支持)
- **Cultural Adaptation**: Culturally appropriate documentation styles
- **AGI Compatibility**: Optimized for AI agent consumption

## Usage Examples

### Basic Context Analysis
```bash
# Analyze current project state
/m-next-context

# Focus on specific changes
/m-next-context "recent OAuth implementation"

# Analyze specific file or module
/m-next-context src/auth
```

### Targeted Analysis
```bash
# Focus on conversation context
/m-next-context --conversation-focus

# Analyze recent commits
/m-next-context --git-focus

# Extract planning tasks only
/m-next-context --planning-only
```

### Advanced Options
```bash
# Include detailed technical analysis
/m-next-context --technical-deep-dive

# Generate Chinese-first report
/m-next-context --chinese-primary

# Focus on ambiguity detection
/m-next-context --ambiguity-focus
```

## Command Options

```yaml
analysis_scope:
  default: "Unstaged changes and conversation context"
  conversation: "Focus on current conversation history"
  git: "Focus on recent git changes and commits"
  project: "Full project state analysis"
  specific_path: "Analyze specific file or directory"

analysis_depth:
  --quick: "Fast analysis focusing on immediate tasks"
  --standard: "Comprehensive analysis (default)"
  --deep: "Deep technical analysis with detailed context"
  --planning-only: "Focus on task extraction and planning"

task_filtering:
  --todos-only: "Extract TODO items and incomplete work"
  --issues-only: "Focus on identified issues and bugs"
  --features-only: "Extract feature requests and enhancements"
  --all-tasks: "Comprehensive task extraction (default)"

language_options:
  --english-only: "Generate English report only"
  --chinese-only: "Generate Chinese report only (仅中文)"
  --bilingual: "Generate bilingual report (default)"
  --chinese-primary: "Chinese-first bilingual report"

output_format:
  --json: "Structured JSON output"
  --markdown: "Markdown report format (default)"
  --summary: "Brief summary format"
  --detailed: "Comprehensive detailed report"

focus_areas:
  --conversation-focus: "Prioritize conversation context"
  --git-focus: "Prioritize code changes and commits"
  --ambiguity-focus: "Focus on identifying unclear requirements"
  --technical-deep-dive: "Include detailed technical analysis"
```

## Analysis Methodology

### Project State Detection
```yaml
state_analysis:
  code_changes:
    unstaged_files: "Files with uncommitted changes"
    recent_commits: "Recent commit history analysis"
    branch_status: "Current branch and merge status"
    
  conversation_context:
    discussion_topics: "Key topics from current conversation"
    decisions_made: "Documented decisions and agreements"
    questions_raised: "Outstanding questions and concerns"
    
  project_artifacts:
    documentation: "README, docs, and specification files"
    configuration: "Config files and environment setup"
    dependencies: "Package files and dependency analysis"
```

### Task Detection Patterns
```yaml
task_patterns:
  todo_markers:
    patterns: ["TODO:", "FIXME:", "HACK:", "XXX:"]
    contexts: ["comments", "commit_messages", "documentation"]
    
  issue_indicators:
    patterns: ["bug", "error", "issue", "problem", "broken"]
    sources: ["conversation", "comments", "commit_messages"]
    
  feature_requests:
    patterns: ["feature", "enhancement", "improvement", "add"]
    sources: ["conversation", "documentation", "planning_docs"]
    
  planning_items:
    patterns: ["plan", "design", "architecture", "spec"]
    sources: ["conversation", "documentation", "meeting_notes"]
```

## Execution Steps

### 1. **Project Background Analysis**
- **Change Detection**: Inspect unstaged code changes and modifications
- **Conversation Mining**: Extract context from current conversation history
- **Constraint Assessment**: Assess project objectives and technical constraints
- **Progress Evaluation**: Understand recent progress and current state

### 2. **Intelligent Task Extraction & Classification**
- **Pattern Recognition**: Detect TODO markers and incomplete implementations
- **Issue Identification**: Identify open issues and planned features
- **Smart Classification**: Classify tasks by type (feature, bugfix, refactor, documentation)
- **Priority Assessment**: Determine task urgency and importance

### 3. **Supporting Material Collection**
- **Resource Mapping**: Gather relevant file paths and documentation
- **Reference Compilation**: Identify external links and reference materials
- **Task-Resource Linking**: Map resources to specific tasks and requirements
- **Dependency Analysis**: Understand task dependencies and relationships

### 4. **Ambiguity Detection and Resolution**
- **Requirement Clarity**: Identify unclear requirements and specifications
- **Information Gaps**: Flag missing information and decision points
- **Question Generation**: Generate clarifying questions for resolution
- **Decision Point Marking**: Highlight areas requiring team decisions

### 5. **Context Compilation and Synthesis**
- **Narrative Creation**: Synthesize project state narrative
- **Task Organization**: Organize tasks with clear relationships
- **Reference Structuring**: Structure references for easy access
- **Bilingual Preparation**: Prepare content for both English and Chinese output

### 6. **Comprehensive Report Generation**
- **Structured Compilation**: Compile findings into structured markdown format
- **Bilingual Documentation**: Generate both English and Chinese sections
- **Quality Validation**: Ensure completeness and accuracy of analysis
- **File Output**: Save to `docs/workspaces/next-context-MM-dd-HH-mm-ss.md`

## Output Format

### English Report

#### `context`
- Concise background narrative describing current project state
- Key objectives and development goals
- Technical constraints and architectural decisions
- Recent progress and conversation highlights

#### `tasks`
Array of task objects with structure:
```json
{
  "id": "string",
  "description": "string",
  "type": "feature|bugfix|refactor|docs|test",
  "status": "pending|in-progress|blocked|ready"
}
```

#### `references`
- File paths relevant to each task
- Documentation and specification links
- External resources and dependencies
- Related discussions and decision records

#### `clarifications`
Array of questions for ambiguities requiring resolution:
- Unclear requirements or scope boundaries
- Missing technical specifications
- Implementation approach uncertainties
- Resource and timeline considerations

### 中文报告 (Chinese Report)

> 以下为中文版本，内容与英文部分对应。AGI可跳过此部分。
> The following is the Chinese version, corresponding to the English section. AGI can skip this section.

#### `context` - 项目背景 (Project Background)
- **当前状态描述**: 描述当前项目状态的简要说明
- **核心目标**: 关键目标和开发方向
- **技术架构**: 技术约束和架构决策
- **近期进展**: 近期进展和对话要点
- **团队状态**: 当前团队工作重点和分工

#### `tasks` - 任务清单 (Task List)
任务对象数组结构 (Task Object Array Structure)：
```json
{
  "id": "字符串 (String)",
  "description": "任务描述 (Task Description)",
  "type": "功能|缺陷修复|重构|文档|测试 (Feature|BugFix|Refactor|Docs|Test)",
  "status": "待开始|进行中|受阻|就绪 (Pending|InProgress|Blocked|Ready)",
  "priority": "高|中|低 (High|Medium|Low)",
  "estimated_effort": "预估工作量 (Estimated Effort)"
}
```

#### `references` - 参考资料 (Reference Materials)
- **相关文件**: 与各任务相关的文件路径
- **文档链接**: 文档和规范链接
- **外部资源**: 外部资源和依赖项
- **决策记录**: 相关讨论和决策记录
- **技术文档**: API文档和技术规范

#### `clarifications` - 待澄清问题 (Clarification Questions)
需要解决的模糊性问题数组 (Array of ambiguity issues requiring resolution)：
- **需求澄清**: 不清楚的需求或范围边界
- **技术规范**: 缺失的技术规范
- **实现方法**: 实现方法的不确定性
- **资源评估**: 资源和时间线考虑
- **风险评估**: 潜在风险和缓解策略

## Context Analysis Framework

### Analysis Depth Levels
```yaml
analysis_levels:
  surface_level:
    scope: "Immediate changes and obvious tasks"
    time: "< 5 minutes"
    output: "Basic task list and immediate context"
    
  standard_analysis:
    scope: "Comprehensive project state analysis"
    time: "10-15 minutes"
    output: "Full context report with task classification"
    
  deep_analysis:
    scope: "Technical deep-dive with architecture review"
    time: "20-30 minutes"
    output: "Detailed technical analysis with recommendations"
```

### Task Classification System
```yaml
task_types:
  feature:
    description: "New functionality or capabilities"
    indicators: ["add", "implement", "create", "new"]
    priority_factors: ["user_impact", "business_value"]
    
  bugfix:
    description: "Error corrections and issue resolution"
    indicators: ["fix", "bug", "error", "issue"]
    priority_factors: ["severity", "user_impact", "frequency"]
    
  refactor:
    description: "Code improvement without functional changes"
    indicators: ["refactor", "cleanup", "optimize", "improve"]
    priority_factors: ["code_quality", "maintainability"]
    
  documentation:
    description: "Documentation updates and improvements"
    indicators: ["docs", "readme", "comment", "document"]
    priority_factors: ["completeness", "accuracy"]
    
  testing:
    description: "Test creation and improvement"
    indicators: ["test", "spec", "coverage", "qa"]
    priority_factors: ["coverage_impact", "risk_reduction"]
```

### Ambiguity Detection Patterns
```yaml
ambiguity_indicators:
  requirement_ambiguity:
    patterns: ["maybe", "possibly", "might", "unclear"]
    contexts: ["specifications", "user_stories", "discussions"]
    
  technical_uncertainty:
    patterns: ["how to", "best way", "approach", "strategy"]
    contexts: ["implementation_notes", "technical_discussions"]
    
  scope_boundary_issues:
    patterns: ["scope", "boundary", "includes", "excludes"]
    contexts: ["planning_documents", "requirements"]
    
  decision_pending:
    patterns: ["decide", "choose", "option", "alternative"]
    contexts: ["architecture_discussions", "design_decisions"]
```

## Integration Features

### Development Tool Integration
- **Git Integration**: Analyze git history and branch status
- **IDE Support**: Extract context from IDE project files
- **Issue Tracking**: Integration with Jira, GitHub Issues, Linear
- **Documentation Tools**: Support for Notion, Confluence, GitBook

### AI and Automation
- **Pattern Learning**: Learn from previous project patterns
- **Context Prediction**: Predict likely next tasks based on current state
- **Priority Scoring**: AI-powered task priority recommendations
- **Similarity Detection**: Find similar past projects and solutions

### Team Collaboration
- **Multi-Language Support**: Native Chinese and English support
- **Cultural Adaptation**: Culturally appropriate communication styles
- **Team Role Awareness**: Understand different team member perspectives
- **Communication Optimization**: Format reports for different audiences

## Best Practices

### Context Analysis
1. **Comprehensive Coverage**: Analyze all available project artifacts
2. **Recent Focus**: Prioritize recent changes and conversations
3. **User Perspective**: Consider end-user impact in task prioritization
4. **Technical Debt**: Identify and document technical debt items

### Task Management
1. **Clear Descriptions**: Write actionable, specific task descriptions
2. **Proper Classification**: Use consistent task type classification
3. **Priority Logic**: Apply logical priority assessment criteria
4. **Dependency Mapping**: Understand and document task dependencies

### Communication
1. **Audience Awareness**: Tailor reports for intended audience
2. **Cultural Sensitivity**: Respect cultural communication preferences
3. **Clarity First**: Prioritize clarity over brevity in important areas
4. **Actionable Output**: Ensure all outputs lead to actionable next steps

## Output Format Examples

### Task Object Structure
```json
{
  "id": "task-001",
  "description": "Implement OAuth 2.0 authentication for Google login",
  "type": "feature",
  "status": "ready",
  "priority": "high",
  "estimated_effort": "3-5 days",
  "dependencies": ["user-model-update"],
  "files_involved": [
    "src/auth/oauth.ts",
    "src/components/LoginButton.tsx"
  ],
  "acceptance_criteria": [
    "Users can log in with Google account",
    "User profile synced with Google data",
    "Proper error handling for auth failures"
  ]
}
```

### Context Narrative Example
```markdown
## Project Context

The team is currently implementing a comprehensive authentication system 
for the {{PROJECT_NAME}} social media management platform. Recent work has focused 
on OAuth integration with major social platforms, with Google OAuth 
currently in development.

### Current State
- OAuth foundation implemented
- Google OAuth integration 70% complete
- User model updated to support external auth
- Frontend components partially implemented

### Key Decisions Made
- Using NextAuth.js for authentication management
- Storing user sessions in Supabase
- Implementing refresh token rotation for security

### Outstanding Questions
- How to handle existing users during OAuth migration?
- Should we implement account linking for multiple providers?
- What's the fallback strategy if OAuth provider is down?
```

## Final Output

Save the complete bilingual context report to:
`docs/workspaces/next-context-MM-dd-HH-mm-ss.md`

### Report Structure
1. **Executive Summary** (English and Chinese)
2. **Project Context Analysis**
3. **Task Extraction and Classification**
4. **Reference Materials and Resources**
5. **Clarification Questions and Action Items**
6. **Recommendations and Next Steps**

Output the saved file path to confirm completion.