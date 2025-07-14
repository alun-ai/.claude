# Dev Task Plan Workflow: Dual-AI Analysis & Structured Implementation

**Target:** $ARGUMENTS (Default: requirement document(s) discovered in the project)

**Scope:** Comprehensive dual-AI analysis with Gemini research and Claude review for structured implementation planning

## AI Integration Strategy

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

## Execution Steps

1. **Gemini First-Pass Research**
   - Comprehensive requirements analysis and extraction
   - Technical feasibility research and constraint identification
   - Architecture pattern analysis and system design evaluation
   - Risk assessment and complexity analysis

2. **Claude Review and Synthesis**
   - Critical review of Gemini's findings and recommendations
   - Practical implementation perspective and real-world considerations
   - Final task decomposition with dependency mapping
   - Implementation roadmap with priority sequencing

3. **Collaborative Plan Generation**
   - Synthesize both AI perspectives into unified plan
   - Generate actionable task breakdown with clear dependencies
   - Create implementation timeline with milestone mapping
   - Produce comprehensive documentation with visual diagrams

4. **Plan Validation and Documentation**
   - Validate plan completeness and feasibility
   - Generate Mermaid diagrams for task flow visualization
   - Create bilingual documentation (English/Chinese)
   - Save comprehensive plan to timestamped file

## Output Format

### English Report

#### `overview`
- High-level implementation strategy and architectural approach
- Testing methodology and coverage targets
- Key technical decisions and assumptions

#### `tasks`
Array of task objects with structure:
```json
{
  "id": "string",
  "description": "string", 
  "type": "feature|test|refactor|docs",
  "status": "pending|in-progress|completed",
  "dependencies": ["task_id_1", "task_id_2"]
}
```

#### `diagram`
Mermaid diagram code illustrating:
- Task dependencies and flow
- Critical path identification
- Parallel execution opportunities

#### `clarifications`
Array of questions for requirement ambiguities:
- Unclear functional requirements
- Missing technical specifications
- Integration and compatibility concerns

### 中文报告

> 以下为中文版本，内容与英文部分对应。AGI可跳过此部分。

#### `overview` - 总体策略
- 高层实现策略和架构方法
- 测试方法论和覆盖目标
- 关键技术决策和假设

#### `tasks` - 任务清单
任务对象数组结构：
```json
{
  "id": "字符串",
  "description": "任务描述", 
  "type": "功能|测试|重构|文档",
  "status": "待开始|进行中|已完成",
  "dependencies": ["依赖任务ID1", "依赖任务ID2"]
}
```

#### `diagram` - 依赖图表
Mermaid图表代码展示：
- 任务依赖和流程
- 关键路径识别
- 并行执行机会

#### `clarifications` - 待确认问题
需求模糊性问题数组：
- 不明确的功能需求
- 缺失的技术规范
- 集成和兼容性问题

## Final Output

Save the complete bilingual task plan to:
`docs/workspaces/task-plan-MM-dd-HH-mm-ss.md`

Output the saved file path to confirm completion.