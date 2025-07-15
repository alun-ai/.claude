# Bug Fix Workflow: Comprehensive Bug Resolution System

**Target:** $ARGUMENTS (Default: analyze recent error logs and failed tests)

**Scope:** Systematic bug analysis, reproduction, root cause identification, implementation, and verification

## Overview

Transforms Claude into a Senior Software Engineer specializing in bug resolution. This command provides a comprehensive workflow for analyzing, reproducing, identifying, fixing, and verifying bug fixes across the entire software stack. Supports multiple input types and uses AI-powered analysis for efficient debugging.

**Input Support:**
- Issue numbers (#123)
- Error text and stack traces
- Screenshots and images
- Log file paths
- Bug descriptions
- Failed test outputs

**Key Benefits:**
- **Systematic Approach**: Structured 5-step bug resolution process
- **Multi-Source Analysis**: Handle various bug report formats
- **Root Cause Focus**: Deep analysis to fix underlying issues
- **Regression Prevention**: Comprehensive testing to avoid new bugs
- **Documentation**: Detailed bug resolution tracking

## Help Documentation

To see this help documentation, run:
```bash
/m-fix-bug --help
```

## Core Features

### 1. Multi-Source Bug Analysis
- **Issue Parsing**: Extract key information from bug reports
- **Log Analysis**: Parse error logs and stack traces
- **Image Processing**: Analyze screenshots for visual bugs
- **Test Failure Analysis**: Understand failed test scenarios
- **Context Discovery**: Search documentation and related code

### 2. Reproduction Engineering
- **Test Case Creation**: Build reliable reproduction steps
- **Environment Setup**: Configure minimal reproduction environment
- **Data Preparation**: Create test data for consistent reproduction
- **Automation**: Script reproduction for regression testing

### 3. Root Cause Investigation
- **Code Tracing**: Follow execution paths to find issues
- **Dependency Analysis**: Check third-party library issues
- **Configuration Review**: Verify environment and settings
- **Data Flow Analysis**: Track data through system components

### 4. Surgical Fix Implementation
- **Minimal Impact**: Target specific issue without broad changes
- **Pattern Consistency**: Maintain codebase patterns and standards
- **Side Effect Prevention**: Analyze potential unintended consequences
- **Performance Consideration**: Ensure fix doesn't degrade performance

### 5. Comprehensive Verification
- **Fix Validation**: Confirm bug is resolved
- **Regression Testing**: Ensure no new bugs introduced
- **Performance Testing**: Verify performance isn't impacted
- **User Acceptance**: Test from user perspective

## Usage Examples

### Basic Bug Fixing
```bash
# Analyze specific issue
/m-fix-bug "#123"

# Fix based on error message
/m-fix-bug "TypeError: Cannot read property 'id' of undefined"

# Auto-analyze recent failures
/m-fix-bug
```

### Input Type Examples
```bash
# Issue number
/m-fix-bug "#456"

# Log file
/m-fix-bug "logs/error.log"

# Error description
/m-fix-bug "Login fails for Google OAuth users"

# Test failure
/m-fix-bug "user authentication test suite failing"
```

### Advanced Options
```bash
# Skip reproduction phase
/m-fix-bug "#789" --skip-reproduction

# Focus on specific component
/m-fix-bug "API timeout" --component auth-service

# Include performance analysis
/m-fix-bug "slow queries" --performance-focus
```

## Workflow Steps

### 1. **Bug Source Analysis**

#### Multi-Format Input Processing
```yaml
input_types:
  issue_number:
    pattern: "#\d+"
    processing: "Extract from issue tracker"
    context: "Full issue description, comments, labels"
    
  error_text:
    pattern: "Error|Exception|TypeError"
    processing: "Parse stack trace and error message"
    context: "Related code files and functions"
    
  log_file:
    pattern: ".log$|/logs/"
    processing: "Parse log entries and timestamps"
    context: "System state and user actions"
    
  description:
    pattern: "free text"
    processing: "Extract key terms and scenarios"
    context: "Relevant documentation and code"
```

#### Analysis Techniques
- **Stack Trace Parsing**: Identify exact failure points
- **Pattern Recognition**: Find similar past issues
- **Context Gathering**: Collect related code and documentation
- **Severity Assessment**: Determine impact and urgency

### 2. **Issue Reproduction**

#### Reproduction Strategy
```yaml
reproduction_methods:
  unit_tests:
    scope: "Isolated function/method testing"
    speed: "Fast execution"
    coverage: "Specific functionality"
    
  integration_tests:
    scope: "Component interaction testing"
    speed: "Medium execution"
    coverage: "System integration points"
    
  e2e_tests:
    scope: "Full user workflow testing"
    speed: "Slower execution"
    coverage: "Complete user scenarios"
    
  manual_steps:
    scope: "Human interaction simulation"
    speed: "Manual timing"
    coverage: "Real user behavior"
```

#### Environment Setup
- **Data Preparation**: Create test datasets
- **Configuration**: Set up reproduction environment
- **Dependencies**: Ensure all requirements available
- **Isolation**: Remove external dependencies where possible

### 3. **Root Cause Identification**

#### Investigation Techniques
```yaml
investigation_methods:
  code_tracing:
    technique: "Follow execution path through code"
    tools: "Debugger, logging, print statements"
    focus: "Function call chain and variable states"
    
  data_flow_analysis:
    technique: "Track data through system components"
    tools: "Data inspection, transformation mapping"
    focus: "Input/output at each stage"
    
  dependency_review:
    technique: "Check third-party library issues"
    tools: "Package managers, vulnerability databases"
    focus: "Version compatibility and known issues"
    
  configuration_audit:
    technique: "Verify settings and environment"
    tools: "Config files, environment variables"
    focus: "Misconfigurations and defaults"
```

#### Common Root Causes
- **Logic Errors**: Incorrect business logic implementation
- **Data Issues**: Invalid or unexpected data formats
- **Timing Problems**: Race conditions and async issues
- **Environment**: Configuration or dependency problems

### 4. **Fix Implementation**

#### Fix Categories
```yaml
fix_types:
  defensive_programming:
    approach: "Add input validation and error handling"
    example: "null checks, try-catch blocks"
    impact: "Prevents crashes, improves robustness"
    
  logic_correction:
    approach: "Fix incorrect business logic"
    example: "Correct calculations, condition fixes"
    impact: "Resolves functional issues"
    
  data_transformation:
    approach: "Fix data processing and formatting"
    example: "Parsing fixes, type conversions"
    impact: "Handles data correctly"
    
  configuration_updates:
    approach: "Fix settings and environment"
    example: "Config files, environment variables"
    impact: "Resolves deployment issues"
```

#### Implementation Principles
- **Minimal Scope**: Change only what's necessary
- **Pattern Consistency**: Follow existing codebase patterns
- **Backward Compatibility**: Avoid breaking existing functionality
- **Performance Awareness**: Don't introduce performance regressions

### 5. **Fix Verification**

#### Testing Strategy
```yaml
verification_levels:
  immediate_validation:
    tests: "Original reproduction test"
    scope: "Specific bug scenario"
    time: "< 5 minutes"
    
  regression_testing:
    tests: "Related functionality tests"
    scope: "Components affected by fix"
    time: "10-30 minutes"
    
  integration_validation:
    tests: "End-to-end scenarios"
    scope: "Full user workflows"
    time: "30-60 minutes"
    
  performance_testing:
    tests: "Performance benchmarks"
    scope: "Performance-critical paths"
    time: "15-45 minutes"
```

## Command Options

```yaml
analysis_options:
  --component: "Focus on specific component/service"
  --severity: "Specify bug severity (critical/high/medium/low)"
  --context: "Additional context for analysis"
  --similar: "Find similar past issues"

reproduction_options:
  --skip-reproduction: "Skip reproduction phase"
  --manual-only: "Only manual reproduction steps"
  --automated-only: "Only automated test reproduction"
  --environment: "Specify reproduction environment"

fix_options:
  --minimal: "Apply minimal fix approach"
  --comprehensive: "Address related issues as well"
  --performance-focus: "Include performance considerations"
  --security-focus: "Include security considerations"

verification_options:
  --quick-verify: "Fast verification only"
  --full-regression: "Complete regression test suite"
  --performance-test: "Include performance testing"
  --user-acceptance: "Include user acceptance testing"

output_options:
  --detailed-report: "Generate comprehensive fix report"
  --summary-only: "Brief summary of changes"
  --documentation: "Update related documentation"
  --commit-message: "Generate commit message"
```

## Integration Features

### Issue Tracker Integration
- **Jira Integration**: Fetch issue details and update status
- **GitHub Issues**: Link to pull requests and discussions
- **Linear**: Sync with Linear issue tracking
- **Status Updates**: Automatically update issue status

### Development Tools
- **IDE Integration**: Use IDE debugging features
- **Test Runners**: Execute appropriate test suites
- **Code Analysis**: Static analysis for potential issues
- **Performance Profiling**: Identify performance bottlenecks

### Documentation
- **Fix Documentation**: Document resolution steps
- **Knowledge Base**: Add to searchable knowledge base
- **Runbooks**: Update troubleshooting guides
- **Post-Mortem**: Generate incident reports for critical bugs

## Bug Categories and Approaches

### Frontend Bugs
```yaml
frontend_issues:
  ui_rendering:
    symptoms: "Visual layout problems, missing elements"
    investigation: "Browser dev tools, CSS inspection"
    fixes: "Style corrections, responsive design"
    
  javascript_errors:
    symptoms: "Console errors, broken functionality"
    investigation: "Stack traces, browser debugging"
    fixes: "Code corrections, error handling"
    
  state_management:
    symptoms: "Incorrect data display, state inconsistencies"
    investigation: "State debugging, action tracing"
    fixes: "State logic corrections, data flow fixes"
```

### Backend Bugs
```yaml
backend_issues:
  api_errors:
    symptoms: "HTTP errors, incorrect responses"
    investigation: "Server logs, request/response analysis"
    fixes: "Endpoint corrections, validation fixes"
    
  database_issues:
    symptoms: "Data inconsistencies, query failures"
    investigation: "Query analysis, database logs"
    fixes: "Query optimization, schema corrections"
    
  integration_problems:
    symptoms: "Third-party service failures"
    investigation: "API logs, network analysis"
    fixes: "Integration logic, error handling"
```

### Performance Bugs
```yaml
performance_issues:
  slow_queries:
    symptoms: "Database timeouts, slow responses"
    investigation: "Query profiling, execution plans"
    fixes: "Query optimization, indexing"
    
  memory_leaks:
    symptoms: "Increasing memory usage, crashes"
    investigation: "Memory profiling, garbage collection"
    fixes: "Resource cleanup, memory management"
    
  scalability_problems:
    symptoms: "Performance degradation under load"
    investigation: "Load testing, bottleneck analysis"
    fixes: "Optimization, architectural changes"
```

## Best Practices

### Bug Analysis
1. **Complete Information Gathering**: Collect all available context
2. **Reproduce First**: Always reproduce before attempting fixes
3. **Root Cause Focus**: Fix underlying issues, not just symptoms
4. **Document Everything**: Track investigation and resolution steps

### Fix Implementation
1. **Test-Driven**: Write tests before implementing fixes
2. **Incremental Changes**: Make small, verifiable changes
3. **Code Review**: Have fixes reviewed by peers
4. **Rollback Plan**: Ensure fixes can be rolled back if needed

### Verification
1. **Multi-Level Testing**: Unit, integration, and e2e tests
2. **Performance Validation**: Ensure no performance regressions
3. **User Testing**: Validate from user perspective
4. **Monitoring**: Set up monitoring to catch similar issues

## Common Bug Patterns

### Null Pointer Exceptions
```javascript
// Problem
user.profile.email // user.profile might be null

// Fix
user?.profile?.email || 'N/A'
```

### Race Conditions
```javascript
// Problem
async function updateUser() {
  const user = await getUser();
  user.lastActive = Date.now();
  await saveUser(user); // Another process might have updated user
}

// Fix
async function updateUser() {
  await updateUserField('lastActive', Date.now());
}
```

### Memory Leaks
```javascript
// Problem
component.addEventListener('scroll', handler); // No cleanup

// Fix
component.addEventListener('scroll', handler);
// In cleanup:
component.removeEventListener('scroll', handler);
```

## Troubleshooting Guide

### Common Issues

**"Cannot reproduce bug"**
- Check environment differences
- Verify data setup
- Try different browsers/devices
- Check timing/sequence of actions

**"Fix breaks other functionality"**
- Run broader regression tests
- Check for shared dependencies
- Review change impact analysis
- Consider more targeted fix

**"Performance degradation after fix"**
- Profile before/after performance
- Identify bottlenecks
- Consider optimization
- Evaluate trade-offs

**"Bug returns after deployment"**
- Check deployment process
- Verify environment configuration
- Review rollback procedures
- Update monitoring and alerting