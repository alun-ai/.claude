# Code Review Workflow: AI-Enhanced Comprehensive Analysis

**Target:** $ARGUMENTS (Default: latest commits of current branch)

**Scope:** Analyze code changes, architecture patterns, and implementation quality with AI assistance

## Overview

Transform Claude into a Senior Code Reviewer with deep expertise in software architecture, security, and best practices. This command provides comprehensive code analysis using AI-powered review techniques, focusing on staged changes or recent commits with multi-dimensional assessment covering architecture, security, performance, and code quality.

**Key Benefits:**
- **AI-Powered Analysis**: Deep code understanding beyond syntax checking
- **Multi-Dimensional Review**: Architecture, security, performance, quality
- **Context-Aware**: Understands project patterns and standards
- **Actionable Feedback**: Specific recommendations with code examples
- **Security Focus**: Specialized multi-tenant and authentication analysis

## Help Documentation

To see this help documentation, run:
```bash
/m-review-code --help
```

## Core Features

### 1. Intelligent Change Detection
- **Staged Analysis**: Review changes ready for commit
- **Commit Analysis**: Review recent commits and PRs
- **Diff Intelligence**: Understand context around changes
- **Pattern Recognition**: Identify architectural patterns and violations

### 2. Multi-Dimensional Assessment
- **Architecture Review**: Design patterns, structure, dependencies
- **Security Analysis**: Vulnerabilities, access control, data protection
- **Performance Review**: Bottlenecks, optimizations, scaling concerns
- **Quality Assessment**: Code smells, maintainability, best practices

### 3. Specialized Analysis Areas
- **Multi-Tenant Security**: Data isolation and tenant access control
- **Authentication/Authorization**: OAuth, session management, permissions
- **API Security**: Rate limiting, input validation, response handling
- **Database Security**: Query safety, injection prevention, access patterns

### 4. Comprehensive Reporting
- **Severity Levels**: Critical, high, medium, low priority issues
- **Actionable Recommendations**: Specific improvement steps
- **Code Examples**: Before/after implementation suggestions
- **Best Practice References**: Links to documentation and standards

## Usage Examples

### Basic Review Operations
```bash
# Review staged changes
/m-review-code

# Review specific commit
/m-review-code abc123

# Review PR or branch
/m-review-code origin/feature-branch

# Review last N commits
/m-review-code --commits 3
```

### Focused Review Types
```bash
# Security-focused review
/m-review-code --focus security

# Performance optimization review
/m-review-code --focus performance

# Architecture pattern review
/m-review-code --focus architecture

# Code quality review
/m-review-code --focus quality
```

### Scope-Specific Reviews
```bash
# Review specific files
/m-review-code --files "src/auth/*.ts"

# Review by component
/m-review-code --component authentication

# Review API changes only
/m-review-code --api-only

# Full codebase review
/m-review-code --full-codebase
```

## Command Options

```yaml
scope_control:
  --files: "Specific files or patterns to review"
  --component: "Focus on specific component/module"
  --api-only: "Review API changes only"
  --frontend-only: "Focus on frontend changes"
  --backend-only: "Focus on backend changes"
  --full-codebase: "Review entire codebase"

review_focus:
  --focus: "Primary review focus (security/performance/architecture/quality)"
  --security-critical: "Enhanced security analysis"
  --performance-critical: "Deep performance analysis"
  --breaking-changes: "Focus on breaking change analysis"

analysis_depth:
  --quick: "Fast review focusing on critical issues"
  --thorough: "Comprehensive analysis (default)"
  --deep: "Deep analysis including dependencies"
  --surface: "Surface-level quick scan"

commit_selection:
  --commits: "Number of recent commits to review"
  --since: "Review changes since specific date/commit"
  --branch: "Compare against specific branch"
  --staged: "Review only staged changes"

output_control:
  --format: "Output format (markdown/json/console)"
  --severity: "Minimum severity level to report"
  --verbose: "Detailed analysis output"
  --summary-only: "Brief summary of findings"
```

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

## Review Methodology

### Analysis Dimensions
```yaml
architecture_review:
  design_patterns:
    - Pattern consistency and appropriateness
    - SOLID principles adherence
    - Dependency injection and inversion
    - Separation of concerns
    
  system_design:
    - Component interactions
    - API design consistency
    - Data flow architecture
    - Scalability considerations
    
  code_organization:
    - Module structure
    - File organization
    - Import/export patterns
    - Namespace management

security_analysis:
  authentication:
    - OAuth implementation security
    - Session management
    - Token handling and validation
    - Multi-factor authentication
    
  authorization:
    - Role-based access control
    - Permission validation
    - Resource-level security
    - Multi-tenant isolation
    
  data_protection:
    - Input validation and sanitization
    - SQL injection prevention
    - XSS protection
    - Data encryption
    
  api_security:
    - Rate limiting implementation
    - CORS configuration
    - Request validation
    - Response security headers

performance_review:
  query_optimization:
    - Database query efficiency
    - N+1 query detection
    - Index usage analysis
    - Caching strategies
    
  resource_management:
    - Memory usage patterns
    - CPU utilization
    - Network optimization
    - Asset loading
    
  scalability:
    - Load handling capacity
    - Bottleneck identification
    - Horizontal scaling readiness
    - Performance monitoring

code_quality:
  maintainability:
    - Code readability
    - Documentation quality
    - Test coverage
    - Error handling
    
  best_practices:
    - Language idioms
    - Framework conventions
    - Coding standards
    - Design patterns
    
  technical_debt:
    - Code duplication
    - Complex functions
    - Outdated dependencies
    - TODO/FIXME items
```

### Review Process
```yaml
review_stages:
  1_change_analysis:
    - Identify modified files and functions
    - Analyze change scope and impact
    - Detect breaking changes
    - Assess change complexity
    
  2_context_gathering:
    - Review related code and dependencies
    - Understand business requirements
    - Check existing tests and documentation
    - Analyze integration points
    
  3_multi_dimensional_analysis:
    - Run architecture assessment
    - Perform security analysis
    - Execute performance review
    - Conduct quality evaluation
    
  4_synthesis_and_prioritization:
    - Consolidate findings
    - Assign severity levels
    - Prioritize recommendations
    - Generate actionable feedback
    
  5_report_generation:
    - Create structured report
    - Include code examples
    - Provide improvement suggestions
    - Link to best practices
```

## Review Focus Areas

### Security-Critical Review
```yaml
security_checklist:
  authentication_security:
    oauth_implementation:
      - Token validation and refresh
      - Scope verification
      - State parameter usage
      - Redirect URI validation
      
    session_management:
      - Session timeout handling
      - Secure session storage
      - Session fixation prevention
      - Concurrent session management
      
  authorization_controls:
    access_control:
      - Role-based permissions
      - Resource-level authorization
      - Context-aware permissions
      - Privilege escalation prevention
      
    multi_tenant_isolation:
      - Tenant data separation
      - Cross-tenant access prevention
      - Tenant-specific configurations
      - Shared resource security
      
  data_protection:
    input_validation:
      - SQL injection prevention
      - XSS protection
      - Command injection prevention
      - File upload security
      
    data_handling:
      - Encryption at rest and transit
      - PII data protection
      - Data retention policies
      - Secure data deletion
```

### Performance-Critical Review
```yaml
performance_checklist:
  database_optimization:
    query_efficiency:
      - Query plan analysis
      - Index utilization
      - Join optimization
      - Subquery performance
      
    scaling_patterns:
      - Connection pooling
      - Read replica usage
      - Caching strategies
      - Batch operations
      
  application_performance:
    resource_usage:
      - Memory allocation patterns
      - CPU-intensive operations
      - I/O optimization
      - Garbage collection impact
      
    frontend_optimization:
      - Bundle size analysis
      - Lazy loading implementation
      - Image optimization
      - Caching strategies
      
  scalability_assessment:
    load_handling:
      - Concurrent request handling
      - Rate limiting effectiveness
      - Resource contention
      - Bottleneck identification
```

### Architecture Review
```yaml
architecture_checklist:
  design_patterns:
    pattern_usage:
      - Appropriate pattern selection
      - Pattern implementation quality
      - Consistency across codebase
      - Anti-pattern avoidance
      
    solid_principles:
      - Single responsibility
      - Open/closed principle
      - Liskov substitution
      - Interface segregation
      - Dependency inversion
      
  system_design:
    component_architecture:
      - Loose coupling
      - High cohesion
      - Clear interfaces
      - Proper abstraction
      
    api_design:
      - RESTful principles
      - Consistent naming
      - Error handling
      - Versioning strategy
```

## Severity Classification

```yaml
severity_levels:
  critical:
    security:
      - Authentication bypass
      - Data exposure vulnerabilities
      - Privilege escalation
      - Injection vulnerabilities
      
    functionality:
      - System crashes
      - Data corruption
      - Complete feature failure
      - Breaking changes
      
  high:
    security:
      - Access control weaknesses
      - Session management issues
      - Input validation gaps
      - Cryptographic weaknesses
      
    performance:
      - Significant performance degradation
      - Resource leaks
      - Scalability bottlenecks
      - Database performance issues
      
  medium:
    quality:
      - Code duplication
      - Complex functions
      - Poor error handling
      - Missing documentation
      
    maintainability:
      - Code organization issues
      - Inconsistent patterns
      - Technical debt accumulation
      - Test coverage gaps
      
  low:
    style:
      - Formatting inconsistencies
      - Naming conventions
      - Comment quality
      - Code style violations
      
    optimization:
      - Minor performance improvements
      - Code simplification opportunities
      - Dependency updates
      - Documentation enhancements
```

## Output Format

### Review Report Structure
```markdown
# Code Review Report

## Executive Summary
- Total issues found: X
- Critical: X, High: X, Medium: X, Low: X
- Primary concerns: [List top 3 issues]
- Overall assessment: [Pass/Conditional/Fail]

## Detailed Findings

### Critical Issues
**[Issue Title]** - Security/Performance/Architecture
- **File**: path/to/file.js:line
- **Description**: Detailed explanation
- **Impact**: Security risk/Performance impact
- **Recommendation**: Specific fix with code example
- **References**: Links to best practices

### Architecture Assessment
- **Pattern Consistency**: Good/Needs Improvement
- **Design Principles**: SOLID compliance assessment
- **System Design**: Component interaction analysis
- **Recommendations**: Architectural improvements

### Security Analysis
- **Authentication**: Security posture assessment
- **Authorization**: Access control effectiveness
- **Data Protection**: Input validation and encryption
- **Vulnerabilities**: Specific security issues

### Performance Review
- **Query Performance**: Database optimization opportunities
- **Resource Usage**: Memory and CPU efficiency
- **Scalability**: Load handling assessment
- **Optimization**: Performance improvement suggestions

## Action Items
1. **Immediate (Critical/High)**
   - [List critical issues requiring immediate attention]
   
2. **Next Sprint (Medium)**
   - [List issues for next development cycle]
   
3. **Future (Low)**
   - [List improvements for future consideration]
```

## Integration Examples

### Pre-Commit Review
```bash
# .git/hooks/pre-commit
#!/bin/bash
/m-review-code --staged --security-critical
if [ $? -ne 0 ]; then
    echo "Code review failed. Please address issues before committing."
    exit 1
fi
```

### Pull Request Review
```bash
# Review PR changes
/m-review-code origin/main..feature-branch --format markdown > review-report.md
```

### CI/CD Integration
```yaml
# .github/workflows/code-review.yml
name: Automated Code Review
on: [pull_request]
jobs:
  review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run Code Review
        run: /m-review-code --thorough --format json > review.json
```

## Best Practices

### Effective Code Review
1. **Review Small Changes**: Keep changes focused and reviewable
2. **Understand Context**: Review with business requirements in mind
3. **Prioritize Issues**: Focus on critical and high-severity issues first
4. **Provide Examples**: Include code examples with recommendations
5. **Check Tests**: Ensure adequate test coverage for changes

### Security Review
1. **Trust Nothing**: Validate all inputs and assumptions
2. **Defense in Depth**: Multiple layers of security validation
3. **Least Privilege**: Ensure minimal necessary permissions
4. **Data Protection**: Encrypt sensitive data and communications

### Performance Review
1. **Measure First**: Profile before optimizing
2. **Identify Bottlenecks**: Focus on actual performance issues
3. **Consider Scale**: Think about performance at scale
4. **Monitor Impact**: Track performance metrics over time

## Troubleshooting

### Common Issues

**"No changes detected"**
- Check git status: `git status`
- Verify staged changes: `git diff --cached`
- Try specific commit: `/m-review-code HEAD~1`

**"Review taking too long"**
- Use quick mode: `--quick`
- Focus on specific area: `--focus security`
- Limit scope: `--files "src/auth/*"`

**"Too many false positives"**
- Adjust severity threshold: `--severity high`
- Focus review: `--security-critical`
- Use summary mode: `--summary-only`

**"Missing context"**
- Use thorough mode: `--thorough`
- Include full codebase: `--full-codebase`
- Review larger scope: `--commits 5`
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