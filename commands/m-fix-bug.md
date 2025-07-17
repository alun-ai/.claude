# Bug Fix Workflow: Comprehensive Bug Resolution System

**Target:** $ARGUMENTS (Default: analyze recent error logs and failed tests)

**Scope:** Systematic bug analysis, reproduction, root cause identification, implementation, and verification

## Overview

Transforms Claude into a Senior Software Engineer specializing in bug resolution. This command provides a comprehensive workflow for analyzing, reproducing, identifying, fixing, and verifying bug fixes across the entire software stack. Supports multiple input types and uses AI-powered analysis for efficient debugging, with enhanced MCP Puppeteer integration for frontend issue investigation through browser automation, console log analysis, and automated authentication for debugging protected applications like https://www.alun.ai/auth/login.

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
- **Browser Automation**: MCP Puppeteer integration for frontend debugging
- **Authentication Support**: Automated login for authenticated application debugging
- **Console Log Analysis**: Automated capture and analysis of browser errors
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
- **Browser Console Analysis**: Capture and analyze frontend console errors via MCP Puppeteer
- **Test Failure Analysis**: Understand failed test scenarios
- **Context Discovery**: Search documentation and related code

### 2. Reproduction Engineering
- **Test Case Creation**: Build reliable reproduction steps
- **Environment Setup**: Configure minimal reproduction environment
- **Data Preparation**: Create test data for consistent reproduction
- **Authentication Setup**: Automated login for authenticated application testing
- **Browser Automation**: MCP Puppeteer-based frontend reproduction and testing
- **Console Monitoring**: Real-time browser console error capture
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
- **Browser Testing**: MCP Puppeteer automated frontend validation
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

# Frontend debugging with browser automation
/m-fix-bug "button not responding" --browser-automation --capture-console

# Full browser debugging workflow
/m-fix-bug "form validation errors" --browser-automation --screenshot-states --monitor-network

# Authenticated debugging session
/m-fix-bug "dashboard loading issue" --browser-automation --login-url "https://www.alun.ai/auth/login" --auth-method form

# OAuth-based debugging
/m-fix-bug "user profile not updating" --browser-automation --login-url "https://app.example.com/auth" --oauth-provider google

# Complete authenticated workflow
/m-fix-bug "payment form errors" --browser-automation --login-url "https://www.alun.ai/auth/login" --capture-console --screenshot-states --session-storage
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

  browser_automation:
    scope: "MCP Puppeteer browser testing"
    speed: "Medium execution"
    coverage: "Frontend UI and interactions"
    tools: "mcp__puppeteer__* commands"

  manual_steps:
    scope: "Human interaction simulation"
    speed: "Manual timing"
    coverage: "Real user behavior"
```

#### Environment Setup
- **Data Preparation**: Create test datasets
- **Configuration**: Set up reproduction environment
- **Authentication Setup**: Configure login credentials and session handling
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

  browser_debugging:
    technique: "Live browser state inspection and console analysis"
    tools: "MCP Puppeteer automation, browser dev tools"
    focus: "Console errors, network requests, DOM state"
    commands:
      - "mcp__puppeteer__puppeteer_navigate"
      - "mcp__puppeteer__puppeteer_screenshot"
      - "mcp__puppeteer__puppeteer_evaluate"

  data_flow_analysis:
    technique: "Track data through system components"
    tools: "Data inspection, transformation mapping, browser state capture"
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

  browser_validation:
    tests: "MCP Puppeteer automated UI testing"
    scope: "Frontend functionality and interactions"
    time: "5-15 minutes"
    tools: "mcp__puppeteer__* commands for screenshot comparison"

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
  --browser-automation: "Use MCP Puppeteer for frontend debugging"
  --environment: "Specify reproduction environment"

browser_debugging_options:
  --capture-console: "Capture browser console logs and errors"
  --screenshot-states: "Take screenshots at key states"
  --monitor-network: "Monitor network requests and responses"
  --inspect-dom: "Inspect DOM state and element visibility"
  --test-interactions: "Test user interactions and form submissions"

authentication_options:
  --login-url: "Specify login page URL (e.g., https://app.example.com/login)"
  --auth-method: "Authentication method (form/oauth/sso)"
  --username: "Username/email for login (use environment variable for security)"
  --password: "Password for login (use environment variable for security)"
  --oauth-provider: "OAuth provider (google/github/microsoft)"
  --session-storage: "Save authenticated session for reuse"
  --logout-after: "Logout after debugging session"

fix_options:
  --minimal: "Apply minimal fix approach"
  --comprehensive: "Address related issues as well"
  --performance-focus: "Include performance considerations"
  --security-focus: "Include security considerations"

verification_options:
  --quick-verify: "Fast verification only"
  --full-regression: "Complete regression test suite"
  --browser-test: "Include MCP Puppeteer UI testing"
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
- **Browser Automation**: MCP Puppeteer for frontend debugging and testing
- **Console Log Analysis**: Automated capture and analysis of browser console output
- **Screenshot Comparison**: Visual regression testing through automated screenshots

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
    investigation: "Browser dev tools, CSS inspection, MCP Puppeteer screenshots"
    fixes: "Style corrections, responsive design"

  javascript_errors:
    symptoms: "Console errors, broken functionality"
    investigation: "Stack traces, browser debugging, MCP Puppeteer console capture"
    fixes: "Code corrections, error handling"

  state_management:
    symptoms: "Incorrect data display, state inconsistencies"
    investigation: "State debugging, action tracing, MCP Puppeteer state inspection"
    fixes: "State logic corrections, data flow fixes"

  browser_automation_testing:
    symptoms: "Functional regressions, UI interaction failures"
    investigation: "MCP Puppeteer automated testing, user flow simulation"
    fixes: "UI interaction improvements, accessibility enhancements"

  authentication_flows:
    symptoms: "Login failures, session timeouts, authorization errors"
    investigation: "Auth token inspection, OAuth flow debugging, MCP Puppeteer login automation"
    fixes: "Session management, token refresh, permission fixes"
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
- Use MCP Puppeteer to automate reproduction steps
- Capture browser state and console logs during reproduction attempts

**"Frontend console errors not visible"**
- Use `mcp__puppeteer__puppeteer_navigate` to load the problematic page
- Execute `mcp__puppeteer__puppeteer_evaluate` with console monitoring script
- Capture network errors and failed requests
- Take screenshots at different interaction states

**"Authentication required for bug reproduction"**
- Use `--login-url` to specify the authentication endpoint
- Set `DEBUG_EMAIL` and `DEBUG_PASSWORD` environment variables
- Use `--session-storage` to maintain authenticated state
- Handle OAuth flows with `--oauth-provider` option

**"Fix breaks other functionality"**
- Run broader regression tests
- Check for shared dependencies
- Review change impact analysis
- Consider more targeted fix
- Use MCP Puppeteer for automated UI regression testing

**"Performance degradation after fix"**
- Profile before/after performance
- Identify bottlenecks
- Consider optimization
- Evaluate trade-offs
- Monitor browser performance metrics through Puppeteer

**"Bug returns after deployment"**
- Check deployment process
- Verify environment configuration
- Review rollback procedures
- Update monitoring and alerting
- Set up automated browser monitoring with MCP Puppeteer

### MCP Puppeteer Debugging Workflow

**For Authenticated Frontend Issues:**
1. Navigate to login page: `mcp__puppeteer__puppeteer_navigate "https://www.alun.ai/auth/login"`
2. Perform authentication:
   ```javascript
   // Form-based login
   mcp__puppeteer__puppeteer_fill "input[name='email']" "$DEBUG_EMAIL"
   mcp__puppeteer__puppeteer_fill "input[name='password']" "$DEBUG_PASSWORD"
   mcp__puppeteer__puppeteer_click "button[type='submit']"

   // Wait for authentication and capture session
   mcp__puppeteer__puppeteer_evaluate "
     return new Promise(resolve => {
       const checkAuth = () => {
         if (window.location.pathname !== '/auth/login') {
           console.log('Authentication successful');
           resolve({authenticated: true, url: window.location.href});
         } else {
           setTimeout(checkAuth, 1000);
         }
       };
       checkAuth();
     });
   "
   ```
3. Navigate to problematic page: `mcp__puppeteer__puppeteer_navigate`
4. Capture authenticated state: `mcp__puppeteer__puppeteer_screenshot`
5. Monitor console with auth context: `mcp__puppeteer__puppeteer_evaluate` with error logging
6. Test authenticated interactions: `mcp__puppeteer__puppeteer_click`, `mcp__puppeteer__puppeteer_fill`
7. Capture final state and compare

**For OAuth-based Authentication:**
1. Navigate to OAuth login: `mcp__puppeteer__puppeteer_navigate`
2. Handle OAuth provider redirect and consent
3. Capture OAuth callback and token exchange
4. Proceed with authenticated debugging workflow

### Security Best Practices for Authentication

**Environment Variables for Credentials:**
```bash
# Add to .envrc (never commit these values)
export DEBUG_EMAIL="your-test-account@example.com"
export DEBUG_PASSWORD="your-secure-test-password"
export DEBUG_OAUTH_CLIENT_ID="your-oauth-client-id"

# Usage in debugging
/m-bug-fix "dashboard issue" --login-url "https://www.alun.ai/auth/login" --username "$DEBUG_EMAIL" --password "$DEBUG_PASSWORD"
```

**Session Management:**
- Use `--session-storage` to save authenticated sessions between debug runs
- Automatically logout with `--logout-after` for security
- Support for multiple authentication methods: form, OAuth, SSO
- Handle 2FA/MFA workflows with interactive prompts

**Credential Protection:**
- NEVER hardcode credentials in command examples
- Use environment variables or secure credential stores
- Support for encrypted credential storage
- Automatic credential masking in logs and screenshots

### Real-World Authentication Examples

**Alun.ai Authentication:**
```bash
# Set up environment variables first
export DEBUG_EMAIL="test-user@yourdomain.com"
export DEBUG_PASSWORD="your-secure-test-password"

# Debug authenticated dashboard issues
/m-bug-fix "dashboard widgets not loading" \
  --browser-automation \
  --login-url "https://www.alun.ai/auth/login" \
  --auth-method form \
  --capture-console \
  --screenshot-states

# Debug payment flow issues with session persistence
/m-bug-fix "subscription upgrade fails" \
  --browser-automation \
  --login-url "https://www.alun.ai/auth/login" \
  --session-storage \
  --monitor-network \
  --test-interactions
```

**Google OAuth Integration:**
```bash
# Debug OAuth authentication flow
/m-bug-fix "Google login redirects incorrectly" \
  --browser-automation \
  --login-url "https://www.alun.ai/auth/login" \
  --oauth-provider google \
  --capture-console \
  --screenshot-states

# Test OAuth token refresh issues
/m-bug-fix "user session expires unexpectedly" \
  --browser-automation \
  --login-url "https://www.alun.ai/auth/login" \
  --oauth-provider google \
  --monitor-network \
  --session-storage
```

**Multi-Step Authentication Debugging:**
```bash
# Debug 2FA/MFA workflows
/m-bug-fix "two-factor authentication fails" \
  --browser-automation \
  --login-url "https://www.alun.ai/auth/login" \
  --auth-method form \
  --test-interactions \
  --capture-console \
  --screenshot-states
```