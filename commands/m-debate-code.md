# Collaborative Code Debate: Dual-AI Tactical Review

**Review target:** $ARGUMENTS (Default: recent changes or staged files)

**Scope:** Comprehensive code-level analysis using collaborative Gemini-Claude debate process with detailed findings

## Overview

Conducts tactical code review through collaborative debate between Gemini CLI and Claude Code. This dual-AI approach provides comprehensive evaluation of code quality, implementation patterns, security vulnerabilities, and performance considerations through comparative analysis.

## Dual-AI Collaboration Strategy

### Phase 1: Gemini CLI Tactical Analysis
**Primary Code Analysis Engine**: Gemini CLI performs detailed code-level assessment

```bash
# Gemini CLI comprehensive code analysis
if command -v gemini >/dev/null 2>&1 && [[ -n "$GEMINI_API_KEY" ]]; then
    echo "=== GEMINI CODE ANALYSIS ===" > /tmp/gemini_code_analysis.md
    
    # Detailed code implementation analysis
    if git diff --staged --quiet; then
        # Analyze recent changes if nothing staged
        git diff HEAD~1 | gemini -p "Conduct comprehensive tactical code review.
        
        Analyze:
        1. Code quality and implementation patterns
        2. Performance bottlenecks and optimization opportunities
        3. Security vulnerabilities and best practices compliance
        4. Error handling and edge case coverage
        5. Testing adequacy and test quality
        6. Documentation clarity and completeness
        7. Coding standards and style consistency
        8. Maintainability and readability issues
        
        Provide specific line-by-line feedback with code examples.
        Format as structured markdown with severity levels." --format markdown >> /tmp/gemini_code_analysis.md
    else
        # Analyze staged changes
        git diff --cached | gemini -p "Review staged code changes for quality, security, and best practices.
        Focus on implementation details, potential bugs, and improvement opportunities.
        Provide actionable feedback with specific recommendations." --format markdown >> /tmp/gemini_code_analysis.md
    fi
    
    # Security-focused analysis
    echo -e "\n## Security Analysis" >> /tmp/gemini_code_analysis.md
    gemini --all-files -p "Conduct security-focused code review.
    Look for:
    - Authentication and authorization issues
    - Input validation vulnerabilities
    - SQL injection and XSS potential
    - Sensitive data exposure
    - Cryptographic implementations
    - Access control violations
    
    Provide specific security recommendations." --format markdown >> /tmp/gemini_code_analysis.md
fi
```

### Phase 2: Claude Code Review and Counter-Analysis
**Review and Debate Engine**: Claude analyzes Gemini's findings and provides alternative perspectives

```bash
# Claude reviews Gemini's analysis and provides counter-perspective
if [[ -f /tmp/gemini_code_analysis.md ]]; then
    echo "Claude Code will now review Gemini's code analysis..."
    echo "Generating comprehensive code debate document..."
fi
```

### Phase 3: Collaborative Synthesis
**Final Output**: Generate comprehensive debate document in `/docs/code-debate-YYYYMMDD.md`

## Execution Steps

1. **Environment Setup**
   - Verify both Gemini CLI and Claude Code availability
   - Determine review target (staged changes, recent commits, specific files)
   - Create timestamped output file in `/docs/`

2. **Gemini Tactical Analysis**
   - Line-by-line code quality assessment
   - Security vulnerability identification
   - Performance optimization analysis
   - Best practices compliance review

3. **Claude Review and Debate**
   - Critical review of Gemini's findings
   - Alternative implementation suggestions
   - Additional security considerations
   - Practical implementation feedback

4. **Synthesis and Documentation**
   - Create comprehensive debate document
   - Prioritize findings by severity and impact
   - Generate actionable improvement roadmap
   - Include code examples and fixes

## Debate Framework

### Code Analysis Areas
```yaml
analysis_domains:
  implementation_quality:
    - code_clarity_and_readability
    - algorithm_efficiency
    - design_pattern_usage
    - error_handling_robustness
  
  security_assessment:
    - vulnerability_identification
    - input_validation_review
    - authentication_implementation
    - data_sanitization_practices
  
  performance_evaluation:
    - bottleneck_identification
    - resource_optimization
    - caching_strategies
    - database_query_efficiency
  
  maintainability_review:
    - code_organization
    - documentation_quality
    - testing_coverage
    - refactoring_opportunities
```

### Review Severity Levels
```yaml
severity_classification:
  critical:
    description: "Security vulnerabilities, data corruption risks"
    action: "immediate_fix_required"
    examples: ["SQL injection", "authentication bypass", "data loss"]
  
  high:
    description: "Performance issues, major bugs, compliance violations"
    action: "fix_before_release"
    examples: ["memory leaks", "infinite loops", "broken functionality"]
  
  medium:
    description: "Code quality issues, minor bugs, style violations"
    action: "fix_in_current_sprint"
    examples: ["code duplication", "poor naming", "missing validation"]
  
  low:
    description: "Optimization opportunities, documentation improvements"
    action: "backlog_consideration"
    examples: ["minor optimizations", "comment improvements", "refactoring"]
```

## Output Format

### Comprehensive Code Debate Document
```markdown
# Code Debate Report - [Date]

## Executive Summary
- **Review Scope**: [Files/changes analyzed]
- **AI Participants**: Gemini CLI + Claude Code
- **Critical Issues**: [Number by severity]
- **Priority Actions**: [Top 3 immediate fixes needed]

## Gemini CLI Analysis
### Implementation Quality Assessment
[Detailed code quality findings]

### Security Vulnerability Report
[Security issues with severity levels]

### Performance Analysis
[Performance bottlenecks and optimizations]

## Claude Code Review
### Areas of Agreement
[Confirmed issues and recommendations]

### Alternative Solutions
[Different approaches and implementations]

### Additional Concerns
[Issues missed by Gemini analysis]

## Collaborative Synthesis
### Priority Fix List
[Ranked list of issues to address]

### Implementation Recommendations
[Specific code improvements with examples]

### Best Practices Guide
[Coding standards and patterns to follow]

## Code Examples
### Before/After Comparisons
[Specific code improvements]

### Security Fixes
[Security vulnerability remediation]

### Performance Optimizations
[Performance improvement examples]
```

## Configuration Options

### Review Scope
```json
{
  "code_debate": {
    "scope": {
      "target_files": ["staged", "recent_changes", "specific_paths"],
      "include_tests": true,
      "include_documentation": true,
      "analysis_depth": "comprehensive"
    },
    "output": {
      "location": "/docs/",
      "filename_pattern": "code-debate-{date}.md",
      "include_code_snippets": true,
      "severity_filtering": "all"
    }
  }
}
```

### Analysis Focus
```json
{
  "analysis_focus": {
    "security": {
      "enabled": true,
      "frameworks": ["owasp", "sans"],
      "custom_rules": []
    },
    "performance": {
      "enabled": true,
      "metrics": ["time_complexity", "space_complexity", "resource_usage"],
      "benchmarking": true
    },
    "quality": {
      "enabled": true,
      "standards": ["project_specific", "industry_standard"],
      "documentation_requirements": true
    }
  }
}
```

## Advanced Features

### Multi-Language Support
- **Language-Specific Analysis**: Tailored review criteria for different programming languages
- **Framework Awareness**: Framework-specific best practices and patterns
- **Ecosystem Integration**: Language-specific tooling and conventions

### Continuous Code Quality
- **Baseline Tracking**: Track code quality improvements over time
- **Regression Detection**: Identify quality regressions in new changes
- **Team Learning**: Extract patterns for team coding standards

### Integration Capabilities
- **IDE Integration**: Display findings directly in development environment
- **CI/CD Pipeline**: Automated code debate as part of build process
- **Code Review Tools**: Integration with GitHub/GitLab review systems