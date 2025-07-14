# Code Review Workflow: AI-Enhanced Comprehensive Analysis

**Target:** $ARGUMENTS (Default: latest commits of current branch)

**Scope:** Analyze code changes, architecture patterns, and implementation quality with AI assistance

## AI Integration Strategy

### MCP Gemini Agent Integration
**Uses MCP Gemini agent for enhanced code analysis:**

```bash
# AI-powered comprehensive code review using MCP Gemini agent
echo "Using MCP Gemini agent for enhanced code review..."

# Analyze staged changes or recent commits
if git diff --staged --quiet; then
    # Analyze recent commits if nothing staged
    echo "Analyzing recent commits with MCP Gemini agent..."
    DIFF=$(git diff HEAD~1)
    /gemini-analyze-code "Perform comprehensive code review of these changes:

${DIFF}

Analyze in detail:
1. Architecture patterns and design decisions
2. Security vulnerabilities (auth, input validation, XSS, SQL injection)
3. Performance bottlenecks and optimization opportunities
4. Code quality, maintainability, and best practices
5. Error handling and edge case coverage
6. Test coverage adequacy and quality
7. Multi-tenant security and data isolation
8. API design consistency and usability

Provide specific, actionable recommendations with code examples.
Format as structured markdown with severity levels."
else
    # Analyze staged changes
    echo "Analyzing staged changes with MCP Gemini agent..."
    DIFF=$(git diff --cached)
    /gemini-analyze-code "Review these staged code changes:

${DIFF}

Focus on:
- Code quality and best practices compliance
- Security vulnerabilities and access control
- Performance implications and optimizations
- Test coverage and edge case handling
- Architecture consistency with existing patterns

Provide detailed feedback with specific improvement suggestions."
fi

# Additional security-focused analysis with full context
echo "Conducting security-focused analysis..."
/gemini-analyze-code "Conduct comprehensive security review of the codebase.
    
    Focus on:
    - Authentication and authorization mechanisms
    - Multi-tenant data isolation and access control
    - Input validation and sanitization
    - API security and rate limiting
    - Sensitive data handling and encryption
    - OAuth implementation security
    - Database query security (SQL injection prevention)
    - Cross-site scripting (XSS) protection
    
    Identify specific vulnerabilities with remediation suggestions." --format markdown
else
    echo "Gemini CLI not available, using Claude Code native functionality..."
fi
```

**Fallback**: Use Claude Code native functionality if Gemini CLI unavailable.

### Enhanced AI Capabilities
- **Deep Architecture Analysis**: AI-powered pattern recognition and design assessment
- **Security Vulnerability Detection**: Advanced security analysis beyond traditional tools
- **Performance Optimization**: Intelligent performance bottleneck identification
- **Best Practice Enforcement**: Context-aware best practice recommendations
- **Multi-tenant Security**: Specialized analysis for data isolation and access control
- **Staged vs Committed Analysis**: Smart detection of what changes to review

## Execution Steps

1. **Architecture & Pattern Analysis**
   - Review repository patterns, service layers, and migration strategies
   - Assess system design decisions and structural changes

2. **Security & Multi-tenant Validation**
   - Check authentication, authorization, and tenant isolation
   - Identify potential security vulnerabilities and access control issues

3. **Functional Completeness Verification**
   - Ensure all requirements are implemented with proper edge case handling
   - Validate input validation, error handling, and boundary conditions

4. **Code Quality Assessment**
   - Identify code smells, anti-patterns, and duplicated logic
   - Detect potential runtime issues: race conditions, memory leaks, null pointer exceptions

5. **Test Coverage Evaluation**
   - Assess unit and integration test coverage gaps
   - Review test quality and edge case coverage

6. **Third-party Library Opportunities**
   - Suggest robust external libraries for current implementations
   - Identify opportunities to reduce custom code complexity

7. **Generate Bilingual Report**
   - Compile findings into structured markdown format
   - Save to `docs/workspaces/review-MM-dd-HH-mm-ss.md`

## Output Format

### English Report

Present findings in the following sections:

#### `functionalCompleteness`
- Requirements implementation status
- Edge case handling assessment
- Missing functionality identification

#### `criticalBugs`
- Potential crashes, panics, or system failures
- Security vulnerabilities and data exposure risks
- Performance bottlenecks and resource leaks

#### `badSmells`
- Code anti-patterns and design issues
- Duplicated or overly complex logic
- Maintainability concerns

#### `thirdPartyOpportunities`
- External library suggestions for current implementations
- Benefits and integration considerations
- Risk assessment for library adoption

#### `testCoverage`
- Coverage gaps in unit and integration tests
- Missing test scenarios and edge cases
- Test quality and reliability issues

#### `actionables`
- Prioritized improvement recommendations
- Specific code changes and refactoring suggestions
- Implementation guidance and best practices

### 中文报告

> 以下为中文版本，内容与英文部分对应。AGI可跳过此部分。

#### `functionalCompleteness` - 功能完整性
- 需求实现状态评估
- 边界条件处理分析
- 缺失功能识别

#### `criticalBugs` - 关键问题
- 潜在崩溃、异常或系统故障
- 安全漏洞和数据暴露风险
- 性能瓶颈和资源泄露

#### `badSmells` - 代码异味
- 反模式和设计问题
- 重复或过度复杂的逻辑
- 可维护性问题

#### `thirdPartyOpportunities` - 第三方库优化
- 现有实现的外部库替代建议
- 集成收益和考虑因素
- 库采用风险评估

#### `testCoverage` - 测试覆盖
- 单元测试和集成测试覆盖缺口
- 缺失的测试场景和边界用例
- 测试质量和可靠性问题

#### `actionables` - 行动建议
- 优先级改进建议
- 具体代码修改和重构建议
- 实施指导和最佳实践

## Final Output

Save the complete bilingual report to:
`docs/workspaces/review-MM-dd-HH-mm-ss.md`

Output the saved file path to confirm completion.