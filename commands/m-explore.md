# Dev Task Plan Workflow: Intelligent Dual-AI Analysis & Strategic Implementation

**Target:** $ARGUMENTS (Default: requirement document(s) discovered in the project)

**Scope:** Enterprise-grade dual-AI analysis with Gemini research and Claude review for strategic implementation planning and execution roadmaps

**Context Extension:** For the purpose of analysis and exploration always use "ultrathink" mode to allocate the most computational budget possible.

## Overview

Transforms Claude into a Senior Project Planning Architect collaborating with Gemini AI to conduct comprehensive task planning through sophisticated dual-AI analysis. This approach provides strategic implementation planning, technical feasibility assessment, and structured task decomposition through collaborative AI intelligence.

**Key Benefits:**
- **Dual-AI Strategic Intelligence**: Leverage Gemini research capabilities with Claude's implementation expertise
- **Comprehensive Requirements Analysis**: Deep extraction and analysis of project requirements
- **Technical Feasibility Assessment**: Thorough evaluation of implementation constraints and opportunities
- **Strategic Task Decomposition**: Intelligent task breakdown with dependency mapping and priority sequencing
- **Implementation Roadmap**: Detailed execution plan with timeline, milestones, and resource allocation

## Help Documentation

To see this help documentation, run:
```bash
/m-task-planner --help
```

## Core Features

### 1. Advanced Dual-AI Analysis Framework
- **Gemini Research Engine**: Comprehensive requirements analysis and technical feasibility research
- **Claude Implementation Review**: Practical implementation perspective and real-world validation
- **Collaborative Synthesis**: Integrated findings from both AI perspectives
- **Strategic Planning**: High-level architectural and implementation strategy development

### 2. Comprehensive Requirements Engineering
- **Documentation Mining**: Extract requirements from project documentation and specifications
- **Code Analysis**: Analyze existing codebase for implementation constraints and opportunities
- **Stakeholder Alignment**: Identify business objectives and technical requirements
- **Gap Analysis**: Identify missing requirements and specification ambiguities

### 3. Technical Feasibility and Architecture Planning
- **Technology Stack Assessment**: Evaluate compatibility and limitations of current stack
- **Performance Requirements**: Analyze scalability and performance constraints
- **Security Compliance**: Assess security requirements and compliance needs
- **Integration Analysis**: Evaluate third-party dependencies and API requirements

### 4. Strategic Task Management and Planning
- **Task Decomposition**: Break complex features into manageable, actionable tasks
- **Dependency Mapping**: Identify task relationships and execution order
- **Priority Sequencing**: Rank tasks by business value, complexity, and dependencies
- **Resource Allocation**: Plan team capacity and skill requirements

## Usage Examples

### Basic Task Planning
```bash
# Analyze project and generate comprehensive task plan
/m-task-planner

# Plan for specific requirement document
/m-task-planner "docs/requirements/user-auth.md"

# Plan for specific feature or component
/m-task-planner "OAuth implementation"
```

### Focused Planning
```bash
# Focus on architecture and design tasks
/m-task-planner --architecture-focus

# Emphasize testing and quality assurance
/m-task-planner --testing-focus

# Plan for performance optimization
/m-task-planner --performance-focus
```

### Advanced Options
```bash
# Include detailed technical research
/m-task-planner --deep-research

# Generate executive summary for stakeholders
/m-task-planner --executive-summary

# Create detailed implementation timeline
/m-task-planner --detailed-timeline
```

## Command Options

```yaml
planning_scope:
  full_project: "Comprehensive project analysis and planning (default)"
  specific_requirements: "Focus on particular requirement documents or features"
  architecture_focus: "Emphasize architectural design and system planning"
  feature_planning: "Feature-specific implementation planning"
  integration_planning: "Third-party integration and API planning"

analysis_depth:
  --quick: "Fast planning with essential task breakdown"
  --standard: "Comprehensive analysis and planning (default)"
  --deep-research: "Detailed technical research and feasibility analysis"
  --enterprise: "Enterprise-grade planning with compliance and governance"

ai_collaboration_mode:
  --gemini-lead: "Gemini performs primary research with Claude review"
  --claude-lead: "Claude leads analysis with Gemini research support"
  --balanced: "Equal collaboration between both AIs (default)"
  --research-focus: "Emphasize Gemini's research capabilities"

planning_focus:
  --architecture-focus: "Prioritize architectural design and system planning"
  --testing-focus: "Emphasize testing strategy and quality assurance"
  --performance-focus: "Focus on performance optimization and scalability"
  --security-focus: "Prioritize security requirements and compliance"
  --integration-focus: "Emphasize third-party integrations and APIs"

deliverable_format:
  --comprehensive: "Full task plan with detailed analysis (default)"
  --executive-summary: "High-level summary for stakeholder communication"
  --technical-details: "Detailed technical specifications and requirements"
  --implementation-guide: "Practical implementation roadmap and steps"

timeline_planning:
  --agile-sprints: "Organize tasks into agile sprint structure"
  --milestone-based: "Structure around major project milestones"
  --dependency-optimized: "Optimize timeline based on task dependencies"
  --resource-balanced: "Balance timeline with team capacity and skills"

output_options:
  --bilingual: "Generate English and Chinese documentation"
  --visual-diagrams: "Include Mermaid diagrams for task flow visualization"
  --detailed-timeline: "Include comprehensive timeline and milestone planning"
  --risk-assessment: "Include risk analysis and mitigation strategies"
```

## Advanced Dual-AI Integration Strategy

### Primary: MCP Gemini Agent Analysis
**PRIORITY: Uses MCP Gemini agent for comprehensive initial analysis and research**

```bash
# MCP Gemini agent performs first-pass analysis and research
echo "=== MCP GEMINI ANALYSIS ===" > /tmp/gemini_task_analysis.md

# Comprehensive requirements analysis
/gemini-brainstorm "Conduct comprehensive task planning analysis for this project.

Current Context:
- Branch: $(git branch --show-current)
- Recent files: $(git ls-files --cached | head -20)
- Project structure: $(find . -type f -name "*.md" | head -10)

Analyze and research:
1. Requirements extraction from documentation and code
2. Technical constraints and dependencies identification
3. Architecture patterns and system design considerations
4. Implementation complexity assessment and risk analysis
5. Testing strategy and coverage requirements
6. Task decomposition and prioritization framework
7. Resource allocation and timeline estimation
8. Integration points and external dependencies

Provide detailed findings with specific recommendations for implementation approach.
Format as structured markdown with clear sections and actionable insights." >> /tmp/gemini_task_analysis.md

# Deep technical research
echo -e "\n## Technical Research and Feasibility" >> /tmp/gemini_task_analysis.md
/gemini-analyze-code "Conduct deep technical research on implementation feasibility.

Research areas:
- Technology stack compatibility and limitations
- Performance requirements and scalability considerations
- Security requirements and compliance needs
- Third-party integrations and API dependencies
- Database design and data flow requirements
- Frontend/backend architecture coordination

Provide comprehensive technical research with specific recommendations." >> /tmp/gemini_task_analysis.md
```

### Secondary: Claude Code Review and Synthesis
**Review and refine Gemini's analysis with practical implementation perspective**

```bash
# Claude reviews Gemini's analysis and provides final recommendations
if [[ -f /tmp/gemini_task_analysis.md ]]; then
    echo "Claude Code will now review Gemini's analysis and provide final recommendations..."
    echo "Generating comprehensive task plan with Claude's review and conclusions..."
fi
```

**Fallback**: Use Claude Code native functionality if Gemini CLI unavailable.

## Execution Framework

### 1. **Strategic Analysis and Research Phase**
- **Project Context Assessment**: Analyze current project state, technology stack, and constraints
- **Requirements Discovery**: Extract and analyze requirements from documentation and codebase
- **Stakeholder Alignment**: Identify business objectives and technical requirements
- **Technology Stack Evaluation**: Assess current tools, frameworks, and infrastructure
- **Constraint Identification**: Identify technical, resource, and timeline constraints

### 2. **Gemini AI Comprehensive Research Phase**
- **Deep Requirements Analysis**: Comprehensive extraction and analysis of project requirements
- **Technical Feasibility Research**: Thorough evaluation of implementation approaches and constraints
- **Architecture Pattern Analysis**: System design evaluation and architectural pattern assessment
- **Risk and Complexity Assessment**: Implementation risk analysis and complexity evaluation
- **Integration Research**: Third-party API and service integration analysis

### 3. **Claude AI Review and Implementation Planning Phase**
- **Critical Analysis Review**: Evaluate Gemini's findings with practical implementation perspective
- **Real-World Validation**: Assess feasibility based on real-world development constraints
- **Task Decomposition**: Break complex requirements into manageable, actionable tasks
- **Dependency Mapping**: Identify task relationships and execution order optimization
- **Implementation Strategy**: Develop practical approach with timeline and resource considerations

### 4. **Collaborative Synthesis and Integration Phase**
- **Perspective Integration**: Synthesize both AI perspectives into unified strategic plan
- **Consensus Building**: Resolve conflicts and build consensus on optimal approach
- **Priority Optimization**: Rank tasks by business value, complexity, and dependencies
- **Resource Planning**: Allocate team capacity and identify skill requirements
- **Timeline Development**: Create realistic implementation timeline with milestone mapping

### 5. **Plan Validation and Quality Assurance Phase**
- **Completeness Validation**: Ensure all requirements are addressed in task breakdown
- **Feasibility Assessment**: Validate plan against resource and timeline constraints
- **Risk Analysis**: Identify potential issues and develop mitigation strategies
- **Stakeholder Alignment**: Ensure plan meets business objectives and technical requirements
- **Quality Gate Definition**: Establish success criteria and validation checkpoints

### 6. **Comprehensive Documentation and Delivery Phase**
- **Visual Documentation**: Generate Mermaid diagrams for task flow and dependency visualization
- **Bilingual Documentation**: Create comprehensive English and Chinese documentation
- **Implementation Guide**: Develop practical implementation roadmap with detailed steps
- **Executive Summary**: Create high-level overview for stakeholder communication
- **Continuous Monitoring Framework**: Establish tracking and progress monitoring system

## Task Planning Methodology

### Strategic Planning Framework
```yaml
planning_methodology:
  requirements_analysis:
    scope: "Comprehensive extraction and analysis of project requirements"
    approach: ["documentation_mining", "code_analysis", "stakeholder_alignment"]
    deliverables: ["requirement_matrix", "gap_analysis", "clarification_questions"]

  technical_feasibility:
    scope: "Technical constraint and opportunity assessment"
    approach: ["technology_evaluation", "performance_analysis", "integration_assessment"]
    deliverables: ["feasibility_report", "risk_analysis", "recommendation_matrix"]

  task_decomposition:
    scope: "Strategic breakdown of complex requirements into actionable tasks"
    approach: ["feature_decomposition", "dependency_mapping", "priority_sequencing"]
    deliverables: ["task_hierarchy", "dependency_graph", "execution_timeline"]
```

### Task Classification System
```yaml
task_types:
  feature_development:
    description: "New functionality and user-facing capabilities"
    indicators: ["implement", "add", "create", "build"]
    priority_factors: ["user_impact", "business_value", "technical_complexity"]

  architecture_design:
    description: "System design and architectural planning"
    indicators: ["design", "architecture", "system", "structure"]
    priority_factors: ["foundation_importance", "scalability_impact", "team_dependencies"]

  testing_quality:
    description: "Testing strategy and quality assurance"
    indicators: ["test", "validate", "quality", "coverage"]
    priority_factors: ["risk_mitigation", "regression_prevention", "compliance_requirements"]

  integration_apis:
    description: "Third-party integrations and API development"
    indicators: ["integrate", "api", "service", "connect"]
    priority_factors: ["external_dependencies", "security_requirements", "performance_impact"]

  documentation_specs:
    description: "Documentation and specification development"
    indicators: ["document", "spec", "guide", "readme"]
    priority_factors: ["team_enablement", "compliance_requirements", "knowledge_transfer"]
```

### Priority Assessment Framework
```yaml
priority_calculation:
  business_value:
    weight: 40%
    factors: ["user_impact", "revenue_potential", "strategic_alignment"]

  technical_complexity:
    weight: 25%
    factors: ["implementation_difficulty", "risk_level", "resource_requirements"]

  dependencies:
    weight: 20%
    factors: ["blocking_other_tasks", "external_dependencies", "team_coordination"]

  urgency:
    weight: 15%
    factors: ["deadline_pressure", "stakeholder_expectations", "market_timing"]
```

## Best Practices

### Task Planning Excellence
1. **Comprehensive Analysis**: Ensure all requirements are thoroughly analyzed and understood
2. **Clear Decomposition**: Break complex features into clear, actionable tasks
3. **Realistic Estimation**: Provide realistic timelines based on team capacity and complexity
4. **Dependency Management**: Identify and plan for task dependencies and blockers

### Dual-AI Collaboration
1. **Complementary Strengths**: Leverage Gemini's research depth with Claude's practical implementation experience
2. **Critical Validation**: Use AI disagreement to identify complex or ambiguous requirements
3. **Consensus Building**: Focus on synthesizing the best insights from both AI perspectives
4. **Continuous Refinement**: Apply collaborative insights to improve planning accuracy

### Strategic Implementation
1. **Phased Approach**: Plan implementation in manageable phases with clear milestones
2. **Risk Mitigation**: Identify potential risks early and develop mitigation strategies
3. **Stakeholder Communication**: Maintain clear communication with all project stakeholders
4. **Adaptive Planning**: Build flexibility into plans to accommodate changing requirements

## Enhanced Output Format

### Comprehensive Project Plan

#### `overview`
- **Strategic Approach**: High-level implementation strategy and architectural decisions
- **Testing Methodology**: Comprehensive testing strategy and coverage targets
- **Technical Decisions**: Key technology choices and architectural assumptions
- **Resource Requirements**: Team capacity, skills, and external resource needs
- **Timeline Summary**: Major milestones and delivery expectations

#### `tasks`
Enhanced task objects with comprehensive metadata:
```json
{
  "id": "string",
  "description": "string - Detailed task description with acceptance criteria",
  "type": "feature|architecture|test|integration|docs",
  "status": "pending|in-progress|completed|blocked",
  "priority": "critical|high|medium|low",
  "complexity": "low|medium|high|very-high",
  "estimatedEffort": "string - Time estimate (e.g., '3-5 days')",
  "dependencies": ["task_id_1", "task_id_2"],
  "blockers": ["external_dependency", "resource_constraint"],
  "assigneeSkills": ["typescript", "react", "api-design"],
  "acceptanceCriteria": ["criterion_1", "criterion_2"],
  "businessValue": "string - Business impact description",
  "riskLevel": "low|medium|high",
  "milestone": "string - Associated milestone or release"
}
```

#### `diagram`
Advanced Mermaid visualization including:
- **Task Dependencies**: Complete dependency flow and critical path analysis
- **Timeline Visualization**: Task scheduling and milestone mapping
- **Resource Allocation**: Team assignment and capacity planning
- **Risk Indicators**: Visual risk assessment and mitigation points

#### `clarifications`
Structured clarification framework:
```json
{
  "question": "string - Specific clarification needed",
  "context": "string - Relevant requirement or specification area",
  "impact": "string - Impact of unresolved ambiguity",
  "urgency": "high|medium|low",
  "stakeholder": "string - Who should provide clarification"
}
```

#### `riskAssessment`
Comprehensive risk analysis:
```json
{
  "riskId": "string",
  "description": "string - Risk description",
  "probability": "low|medium|high",
  "impact": "low|medium|high",
  "mitigation": "string - Mitigation strategy",
  "owner": "string - Risk owner",
  "timeline": "string - When risk becomes critical"
}
```

## Integration Features

### Project Management Integration
- **Agile Workflow Integration**: Seamless integration with Scrum and Kanban methodologies
- **Project Management Tools**: Integration with Jira, Linear, Azure DevOps, and GitHub Projects
- **Timeline Management**: Automated milestone and deadline tracking
- **Resource Planning**: Team capacity planning and skill allocation

### Development Environment Integration
- **Version Control Integration**: Git-based task tracking and branch management
- **CI/CD Pipeline Integration**: Automated task validation and deployment coordination
- **IDE Integration**: Task-aware development environment with progress tracking
- **Documentation Systems**: Integration with Confluence, Notion, and GitBook

### Team Collaboration Features
- **Multi-Language Support**: Native English and Chinese documentation generation
- **Stakeholder Communication**: Tailored reports for different audience types
- **Knowledge Transfer**: Comprehensive onboarding and handoff documentation
- **Progress Monitoring**: Real-time progress tracking and reporting

## Troubleshooting Guide

### Common Planning Challenges

**Complex Requirements**:
- Break down into smaller, manageable components
- Use acceptance criteria to clarify expectations
- Engage stakeholders for requirement validation

**Resource Constraints**:
- Prioritize tasks by business value and urgency
- Identify skill gaps and training needs
- Plan for external resource acquisition

**Technical Uncertainty**:
- Include research and prototyping tasks
- Plan for technical validation phases
- Build buffer time for unknown complexities

**Changing Requirements**:
- Build flexibility into task structure
- Plan for iterative refinement
- Maintain clear change management processes

## Final Output

Save the comprehensive bilingual task plan to:
`docs/workspaces/task-plan-MM-dd-HH-mm-ss.md`

### Report Structure
1. **Executive Summary** - High-level overview and strategic approach
2. **Detailed Task Breakdown** - Comprehensive task list with metadata
3. **Implementation Timeline** - Milestone-based delivery schedule
4. **Resource Planning** - Team allocation and skill requirements
5. **Risk Assessment** - Risk analysis and mitigation strategies
6. **Visual Documentation** - Mermaid diagrams and workflow visualization

Output the saved file path to confirm completion.

## Output Documentation

### Findings Storage
All task planning analyses are automatically saved to:
```
.claude/findings/task-plans/
├── task-plan-YYYY-MM-DD-HH-mm-ss.md         # Complete task planning analysis
├── executive-YYYY-MM-DD-HH-mm-ss.md         # Executive summary for stakeholders
├── timeline-YYYY-MM-DD-HH-mm-ss.md          # Detailed implementation timeline
├── dependencies-YYYY-MM-DD-HH-mm-ss.md      # Task dependency analysis
└── gemini-insights-YYYY-MM-DD-HH-mm-ss.md   # AI collaborative insights
```

### Output Structure
Each task plan finding includes:
- **Metadata**: Timestamp, project context, analysis depth
- **Complete Task Breakdown**: All tasks with priorities and dependencies
- **Dual-AI Analysis**: Gemini research with Claude synthesis
- **Implementation Roadmap**: Phased approach with milestones
- **Resource Requirements**: Skills, time, and tool requirements

### Reusing Findings
```bash
# Reference previous task plans
ls .claude/findings/task-plans/

# Build upon previous analysis
/m-explore --extend .claude/findings/task-plans/task-plan-2024-01-15-10-30-00.md

# Compare multiple planning approaches
/m-explore --compare .claude/findings/task-plans/task-plan-*.md

# Generate progress report from initial plan
/m-explore --progress-check .claude/findings/task-plans/task-plan-2024-01-15-10-30-00.md
```

### Integration with Other Commands
```bash
# Use task plan to drive development
/m-execute --from-plan .claude/findings/task-plans/task-plan-latest.md

# Generate tech spec from task plan
/m-product-tech-spec --from-tasks .claude/findings/task-plans/task-plan-latest.md
```

## Enhanced Final Output

The command will:
1. Generate comprehensive task planning documentation
2. Save all findings to `.claude/findings/task-plans/` with timestamps
3. Create multiple views (executive, detailed, timeline) for different audiences
4. Document AI collaboration insights and reasoning
5. Enable iterative refinement and progress tracking
6. Provide integration points with other development commands
7. Output all saved file paths for future reference