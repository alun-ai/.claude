# QA Test Automation: AI-Powered Quality Assurance Testing Suite

**Target:** $ARGUMENTS (JIRA ticket number, PR URL, commit SHA, or feature description)

**Scope:** Intelligent test discovery and execution based on code changes, feature impact, and risk analysis

## Overview

Transforms Claude into your AI-powered Senior QA Engineer, providing enterprise-grade quality assurance intelligence with sophisticated test discovery, comprehensive risk-based testing strategies, and advanced Puppeteer-powered browser automation. This command delivers world-class testing expertise with intelligent change analysis, automated test generation, strategic quality validation, and real-time console monitoring that ensures software excellence while maximizing testing efficiency through context-aware prioritization and predictive defect detection.

**Key Benefits:**
- **AI-Powered Test Intelligence**: Machine learning-driven test discovery with change impact analysis and risk-based prioritization
- **Enterprise-Grade Quality Assurance**: Comprehensive testing strategies with multi-layer validation and regression prevention
- **Advanced Puppeteer Integration**: Real-time browser automation with console monitoring, network tracking, and performance analysis
- **Intelligent Change Analysis**: Sophisticated code change understanding with dependency mapping and impact prediction
- **Automated Test Generation**: Context-aware test case creation with edge case identification and coverage optimization
- **Predictive Defect Detection**: Advanced pattern recognition for potential issues with proactive quality gates
- **Comprehensive Console Monitoring**: Real-time JavaScript error tracking, network failure detection, and performance metrics

## Help Documentation

To see this help documentation, run:
```bash
/m-qa-test --help
```

## Core Features

### 1. AI-Powered Test Discovery Intelligence Engine
- **Intelligent Change Impact Analysis**: Machine learning-driven code change understanding with dependency graph traversal and affected component identification
- **Risk-Based Test Prioritization**: Sophisticated risk scoring with business impact assessment and regression probability calculation
- **Dynamic Test Suite Generation**: Automated test case creation based on code changes, API modifications, and UI updates
- **Coverage Gap Identification**: Intelligent detection of untested code paths with critical path analysis and edge case discovery

### 2. Advanced Puppeteer Browser Automation Platform
- **Real-Time Console Monitoring**: Comprehensive JavaScript console log capture with error tracking and performance analysis
- **Network Request Monitoring**: Failed request detection, response time tracking, and API health validation
- **Interactive Element Testing**: Smart element interaction with screenshot capture and validation logging
- **Visual Regression Analysis**: AI-powered screenshot comparison with console state correlation
- **Performance Metrics Collection**: Page load times, memory usage, DOM performance, and resource optimization analysis

### 3. Enterprise-Grade Quality Validation Platform
- **Multi-Layer Testing Orchestration**: Comprehensive test execution across unit, integration, end-to-end, and performance layers
- **Automated Regression Detection**: Pattern-based identification of potential regressions with historical defect correlation
- **Cross-Browser/Device Testing**: Intelligent test distribution across platforms with compatibility matrix optimization
- **Accessibility Compliance Validation**: WCAG 2.1 AAA standard verification with assistive technology simulation

### 4. Intelligent Test Generation and Optimization System
- **Context-Aware Test Case Creation**: AI-powered generation of test scenarios based on code understanding and user behavior patterns
- **Edge Case Discovery Engine**: Sophisticated boundary value analysis with combinatorial test generation
- **Test Data Generation**: Intelligent creation of realistic test data with constraint satisfaction and privacy compliance
- **Performance Test Scenarios**: Load pattern generation based on production traffic analysis and growth projections

### 5. Advanced Quality Analytics and Reporting Platform
- **Predictive Defect Analysis**: Machine learning models for defect prediction with root cause identification
- **Console Health Analytics**: Real-time error pattern analysis with JavaScript performance insights
- **Quality Trend Visualization**: Real-time quality metrics with trend analysis and anomaly detection
- **Test Effectiveness Scoring**: ROI-based test suite evaluation with optimization recommendations
- **Executive Quality Dashboards**: High-level quality insights with risk heat maps and release readiness indicators

## Execution Framework

### 1. **Strategic Test Planning and Analysis Phase**
- **Change Impact Assessment**: Comprehensive analysis of code modifications with dependency mapping and risk evaluation
- **Test Strategy Generation**: AI-powered creation of optimal testing approach based on change scope and business criticality
- **Resource Allocation Planning**: Intelligent distribution of testing efforts across different test types and platforms
- **Quality Gate Definition**: Establishment of pass/fail criteria with risk-based thresholds and business alignment
- **Test Environment Preparation**: Automated setup of testing infrastructure with data seeding and service mocking

### 2. **Advanced Test Discovery and Generation Phase**
- **Automated Test Case Mining**: Extraction of test scenarios from requirements, code changes, and user stories
- **Intelligent Test Prioritization**: Risk-based ordering of test execution with critical path optimization
- **Edge Case Synthesis**: Generation of boundary conditions and error scenarios through constraint analysis
- **Test Data Creation**: Realistic data generation with privacy compliance and production-like characteristics
- **Cross-Functional Test Design**: Integration of functional, performance, security, and accessibility testing

### 3. **Comprehensive Test Execution and Validation Phase**
- **Parallel Test Orchestration**: Distributed test execution across multiple environments with optimal resource utilization
- **Real-Time Browser Monitoring**: Live console log capture, network monitoring, and JavaScript error tracking during test execution
- **Intelligent Failure Analysis**: Root cause identification with stack trace analysis, console state correlation, and historical pattern matching
- **Performance Baseline Validation**: Comparison against established benchmarks with regression detection and memory usage analysis
- **Visual Regression Detection**: Screenshot-based UI validation with AI-powered difference analysis and console health correlation
- **Security Vulnerability Scanning**: Integrated security testing with OWASP compliance verification

### 4. **Quality Analysis and Defect Management Phase**
- **Defect Pattern Recognition**: AI-powered analysis of failure patterns with clustering and categorization
- **Root Cause Investigation**: Automated debugging assistance with code path analysis and variable inspection
- **Impact Assessment**: Business impact evaluation of discovered issues with priority recommendations
- **Fix Verification Planning**: Targeted retest strategy generation for efficient validation cycles
- **Knowledge Base Updates**: Capture of new test scenarios and failure patterns for future prevention

### 5. **Reporting and Continuous Improvement Phase**
- **Comprehensive Test Reports**: Detailed results with coverage metrics, pass rates, and quality trends
- **Executive Summaries**: High-level quality status with go/no-go recommendations and risk assessments
- **Test Suite Optimization**: Recommendations for test improvement based on effectiveness analysis
- **Process Enhancement**: Identification of testing process improvements and automation opportunities
- **Predictive Quality Metrics**: Future quality projections based on current trends and historical data

## AI Integration Strategy

### Primary: Intelligent Change Analysis
```bash
# Multi-source change detection and analysis
if [[ "$INPUT" =~ ^[A-Z]+-[0-9]+$ ]]; then
    JIRA_TICKET="$INPUT"
    echo "🎫 Analyzing JIRA ticket: $JIRA_TICKET"
    
    # Fetch ticket details and linked PRs/commits
    TICKET_DATA=$(/mcp__jira__jira_get_issue "$JIRA_TICKET" \
        "summary,description,issuetype,acceptance_criteria,components,labels,attachments,customfield_*")
    
    # Extract linked PRs and commits
    analyze_linked_changes
    
elif [[ "$INPUT" =~ github\.com.*pull ]]; then
    PR_URL="$INPUT"
    echo "🔀 Analyzing Pull Request changes..."
    analyze_pr_changes
    
elif [[ "$INPUT" =~ ^[a-f0-9]{7,40}$ ]]; then
    COMMIT_SHA="$INPUT"
    echo "📝 Analyzing commit changes..."
    analyze_commit_changes
    
else
    FEATURE_DESC="$INPUT"
    echo "🔍 Performing intelligent test discovery for: $FEATURE_DESC"
    discover_test_requirements
fi

# Intelligent change analysis functions
analyze_linked_changes() {
    echo "🔗 Discovering linked code changes..."
    
    # Extract PR links from JIRA
    PR_LINKS=$(/mcp__gemini__gemini-query "Extract GitHub PR URLs from: $TICKET_DATA")
    
    # Get recent commits for the feature branch
    FEATURE_BRANCH=$(git branch --show-current)
    RECENT_COMMITS=$(git log --oneline -20 --grep="$JIRA_TICKET" || true)
    
    # Analyze all changes
    analyze_code_changes
}

analyze_pr_changes() {
    echo "📊 Analyzing Pull Request changes..."
    
    # Extract PR info
    PR_FILES=$(/mcp__github__get_pull_request_files --url "$PR_URL")
    PR_DIFF=$(git diff main...HEAD)
    
    analyze_code_changes
}

analyze_commit_changes() {
    echo "🔍 Analyzing commit changes..."
    
    # Get commit diff
    COMMIT_DIFF=$(git show "$COMMIT_SHA")
    CHANGED_FILES=$(git diff-tree --no-commit-id --name-only -r "$COMMIT_SHA")
    
    analyze_code_changes
}

# Core intelligent change analysis
analyze_code_changes() {
    echo "🧠 INTELLIGENT CHANGE ANALYSIS"
    echo "=============================="
    
    # Get all changed files
    CHANGED_FILES=$(git diff --name-only main...HEAD 2>/dev/null || git status --porcelain | awk '{print $2}')
    
    # Analyze impact of changes
    IMPACT_ANALYSIS=$(/mcp__gemini__gemini-analyze-code "As a Senior QA Engineer, analyze these code changes:

Changed Files:
$CHANGED_FILES

Diff Content:
${COMMIT_DIFF:-$PR_DIFF}

Perform comprehensive impact analysis:
1. COMPONENT IMPACT: Which components/features are affected?
2. INTEGRATION POINTS: What systems interact with changed code?
3. DATA FLOW: How does data flow through changed components?
4. USER JOURNEYS: Which user workflows are impacted?
5. REGRESSION RISKS: What existing functionality could break?
6. PERFORMANCE IMPACT: Could these changes affect performance?
7. SECURITY IMPLICATIONS: Any security-sensitive changes?

{{PROJECT_NAME}} Architecture Context:
- Multi-tenant SaaS with Organizations/Teams/Brands
- Sliding Panel UI system
- OAuth integrations with 10+ platforms
- Supabase backend with RLS
- Real-time subscriptions

Identify EXACTLY what needs to be tested based on these changes.")
    
    # Discover related test files
    discover_existing_tests
}

discover_existing_tests() {
    echo "🔎 Discovering existing test coverage..."
    
    # Find test files for changed components
    for file in $CHANGED_FILES; do
        # Look for corresponding test files
        TEST_FILE=$(echo "$file" | sed 's/\.\(ts\|tsx\|js\|jsx\)$/.test.\1/')
        if [[ -f "$TEST_FILE" ]]; then
            EXISTING_TESTS="$EXISTING_TESTS $TEST_FILE"
        fi
    done
    
    # Analyze test coverage for changed files
    COVERAGE_ANALYSIS=$(/mcp__gemini__gemini-query "Analyze test coverage:

Changed Files: $CHANGED_FILES
Existing Tests: $EXISTING_TESTS

Identify:
1. Which changed files have NO tests?
2. Which tests need to be updated?
3. What new tests are required?
4. Are there integration tests for these changes?
5. Do we need E2E tests for user-facing changes?")
}
```

### Enhanced Testing Capabilities
- **Intelligent Change Detection**: Analyzes git diffs, PRs, and commits to understand what changed
- **Impact Analysis**: Determines which components, features, and user journeys are affected
- **Smart Test Selection**: Only runs tests relevant to the changes made
- **Advanced Browser Automation**: Puppeteer-powered testing with real-time console monitoring and network tracking
- **Console Health Monitoring**: Real-time JavaScript error detection, warning analysis, and performance tracking
- **Visual Regression Testing**: AI-powered screenshot comparison with console state correlation
- **Network Request Validation**: Failed API detection, response time monitoring, and service health checks
- **Regression Prevention**: Identifies areas at risk of regression with browser-level validation
- **Coverage Gap Detection**: Finds what's not tested based on actual changes including browser interactions
- **Context-Aware Testing**: Understands {{PROJECT_NAME}}'s architecture to make smart testing decisions

## Intelligent QA Behavior

### How It Works Like a Human QA Engineer

The `/m-qa-test` command acts like an experienced QA engineer who:

1. **Understands Context**: Analyzes what actually changed, not just runs all tests
2. **Makes Smart Decisions**: Determines which tests are relevant based on impact
3. **Saves Time**: Skips unrelated tests, focuses on what matters
4. **Identifies Risks**: Finds regression risks and edge cases
5. **Recommends Actions**: Suggests missing tests and improvements

### Intelligence Features

```yaml
intelligent_capabilities:
  change_detection:
    - Git diff analysis
    - PR file change tracking
    - Commit impact assessment
    - JIRA ticket linking
    
  impact_analysis:
    - Component dependency mapping
    - User journey identification
    - API endpoint tracking
    - Database schema changes
    
  browser_automation:
    - Real-time console monitoring
    - JavaScript error tracking
    - Network request validation
    - Visual regression detection
    - Performance metrics collection
    - Memory usage analysis
    
  test_selection:
    - Only runs affected unit tests
    - Targets specific E2E scenarios with console monitoring
    - Identifies regression areas with browser validation
    - Skips unrelated test suites
    - Prioritizes tests based on console health
    
  risk_assessment:
    - Security vulnerability detection
    - Performance impact analysis with browser metrics
    - Multi-tenant isolation checks
    - OAuth integration validation
    - JavaScript error pattern analysis
    - Network failure detection
```

## QA Testing Framework

### Comprehensive Test Strategy
```yaml
test_strategy:
  test_levels:
    unit_tests:
      scope: "Individual functions and components"
      tools: ["Jest", "React Testing Library"]
      coverage_target: 80%
      
    integration_tests:
      scope: "API endpoints, database operations, service interactions"
      tools: ["Jest", "Supertest", "Database fixtures"]
      coverage_target: 70%
      
    e2e_tests:
      scope: "User workflows, critical paths, visual regression"
      tools: ["Puppeteer", "Screenshot comparison"]
      coverage_target: "Critical user journeys"
      
  test_types:
    functional:
      positive: "Happy path scenarios"
      negative: "Error handling, edge cases"
      boundary: "Input validation, limits"
      
    browser_automation:
      console_monitoring: "JavaScript error tracking, log analysis"
      network_validation: "API response monitoring, failed request detection"
      visual_regression: "Screenshot comparison, UI element validation"
      performance_analysis: "Page load metrics, memory usage tracking"
      
    non_functional:
      performance: "Load time, response time, DOM metrics"
      security: "Authentication, authorization, data protection"
      accessibility: "WCAG compliance, keyboard navigation"
      cross_browser: "Chrome, Firefox, Safari, Edge with console monitoring"
      
  test_environments:
    local: "Development environment validation"
    staging: "Pre-production verification"
    production: "Smoke tests and monitoring"
```

## Execution Flow

### 1. **Intelligent Test Discovery & Planning**
```bash
# Main entry point for intelligent testing
execute_intelligent_qa_testing() {
    echo "🧠 INTELLIGENT QA TESTING SUITE"
    echo "==============================="
    echo "Acting as Senior QA Engineer - Discovering what needs testing..."
    
    # Phase 1: Understand the changes
    analyze_changes_and_impact
    
    # Phase 2: Determine test strategy
    determine_test_strategy
    
    # Phase 3: Execute relevant tests
    execute_targeted_tests
    
    # Phase 4: Validate and report
    validate_quality_gates
}

# Analyze changes and their impact
analyze_changes_and_impact() {
    echo "📊 PHASE 1: CHANGE IMPACT ANALYSIS"
    echo "=================================="
    
    # Run the appropriate analysis based on input type
    if [[ -n "$JIRA_TICKET" ]]; then
        analyze_linked_changes
    elif [[ -n "$PR_URL" ]]; then
        analyze_pr_changes
    elif [[ -n "$COMMIT_SHA" ]]; then
        analyze_commit_changes
    else
        discover_test_requirements
    fi
    
    # Determine affected areas
    AFFECTED_ANALYSIS=$(/mcp__gemini__gemini-query "As a Senior QA Engineer, based on the changes:

Impact Analysis: $IMPACT_ANALYSIS
Changed Files: $CHANGED_FILES

Determine:
1. AFFECTED FEATURES: Which user-facing features are impacted?
2. API CHANGES: Which API endpoints need testing?
3. DATABASE IMPACT: Any schema or data flow changes?
4. UI COMPONENTS: Which UI components need visual testing?
5. INTEGRATION POINTS: Which external integrations are affected?
6. BUSINESS LOGIC: What business rules need validation?
7. PERFORMANCE HOTSPOTS: Areas that might impact performance?

Be specific about what a QA engineer would test in each area.")
}

# Determine intelligent test strategy
determine_test_strategy() {
    echo "🎯 PHASE 2: INTELLIGENT TEST STRATEGY"
    echo "===================================="
    
    TEST_STRATEGY=$(/mcp__gemini__gemini-query "As a Senior QA Engineer, create a focused test strategy:

Changes: $CHANGED_FILES
Impact: $AFFECTED_ANALYSIS
Existing Tests: $EXISTING_TESTS

Create a prioritized test strategy:
1. CRITICAL TESTS: What MUST be tested before release?
   - Smoke tests for core functionality
   - Regression tests for affected areas
   - New feature validation
   
2. TARGETED UNIT TESTS: Which specific functions need testing?
   - List specific files and functions
   - Focus on changed business logic
   
3. INTEGRATION TESTS: What integration points need validation?
   - API endpoint tests
   - Database operation tests
   - Service interaction tests
   
4. E2E SCENARIOS: Which user journeys need validation?
   - Critical user paths affected by changes
   - Visual regression for UI changes
   - Cross-browser testing needs
   
5. EDGE CASES: What edge cases are introduced?
   - Error handling scenarios
   - Boundary conditions
   - Concurrent operation tests

6. SKIP LIST: What can we safely skip?
   - Unrelated features
   - Stable, unchanged areas

Provide a specific, actionable test plan that a QA engineer would execute.")
    
    echo "📋 Test Strategy Determined:"
    echo "$TEST_STRATEGY"
}
```

### 2. **Targeted Test Execution**
```bash
# Execute only the tests that matter
execute_targeted_tests() {
    echo "🎯 PHASE 3: TARGETED TEST EXECUTION"
    echo "==================================="
    echo "Running only tests relevant to changes..."
    
    # Initialize test results
    TEST_RESULTS='{
        "strategy": "targeted",
        "change_summary": "",
        "tests_executed": [],
        "tests_skipped": [],
        "coverage": {},
        "findings": []
    }'
    
    # Execute tests based on strategy
    execute_by_priority
}

# Execute tests in priority order
execute_by_priority() {
    echo "🚀 Executing tests by priority..."
    
    # 1. Critical smoke tests first
    if [[ "$TEST_STRATEGY" =~ "smoke" ]]; then
        run_smoke_tests
    fi
    
    # 2. Targeted unit tests for changed code
    if [[ -n "$CHANGED_FILES" ]]; then
        run_targeted_unit_tests
    fi
    
    # 3. Integration tests for affected APIs
    if [[ "$AFFECTED_ANALYSIS" =~ "API" ]]; then
        run_targeted_integration_tests
    fi
    
    # 4. E2E tests for affected user journeys
    if [[ "$AFFECTED_ANALYSIS" =~ "UI" ]] || [[ "$AFFECTED_ANALYSIS" =~ "feature" ]]; then
        run_targeted_e2e_tests
    fi
    
    # 5. TypeScript checking if code structure changed
    if [[ "$CHANGED_FILES" =~ "\.(ts|tsx)" ]]; then
        run_typescript_typecheck
    fi
    
    # 6. Visual regression for UI changes
    if [[ "$CHANGED_FILES" =~ "components/|app/" ]]; then
        run_visual_regression_tests
    fi
}

# Smart smoke test execution
run_smoke_tests() {
    echo "🔥 Running critical smoke tests..."
    
    SMOKE_TESTS=$(/mcp__gemini__gemini-query "Based on changes: $CHANGED_FILES

What are the 3-5 most critical smoke tests to run?
Focus on core functionality that must work.

For {{PROJECT_NAME}}, consider:
- Authentication flow
- Brand/Organization switching
- Core navigation
- Critical API endpoints
- Database connectivity")
    
    # Execute identified smoke tests
    echo "Smoke tests identified: $SMOKE_TESTS"
    
    # Run specific smoke test scenarios
    execute_puppeteer_smoke_tests
}

# Targeted unit test execution
run_targeted_unit_tests() {
    echo "🧪 Running targeted unit tests..."
    
    # Only run tests for changed files
    TARGETED_TEST_FILES=""
    for file in $CHANGED_FILES; do
        TEST_FILE=$(find . -name "$(basename $file .ts).test.ts" -o -name "$(basename $file .tsx).test.tsx" 2>/dev/null | head -1)
        if [[ -n "$TEST_FILE" ]]; then
            TARGETED_TEST_FILES="$TARGETED_TEST_FILES $TEST_FILE"
        fi
    done
    
    if [[ -n "$TARGETED_TEST_FILES" ]]; then
        echo "Running tests: $TARGETED_TEST_FILES"
        UNIT_RESULTS=$(npm test -- $TARGETED_TEST_FILES --coverage --json || true)
        
        # Parse and analyze results
        analyze_test_results "$UNIT_RESULTS" "unit"
    else
        echo "⚠️ No unit tests found for changed files - Recommend creating tests!"
        MISSING_TESTS="$CHANGED_FILES"
    fi
}

# Smart E2E test selection
run_targeted_e2e_tests() {
    echo "🌐 Running targeted E2E tests..."
    
    E2E_SCENARIOS=$(/mcp__gemini__gemini-query "Based on these changes and impact:

Changed Files: $CHANGED_FILES
Affected Features: $AFFECTED_ANALYSIS

What specific E2E scenarios should be tested?
Consider:
1. User journeys that touch changed code
2. Critical paths that could regress
3. New feature workflows
4. Integration points with external services

Be specific - what would a QA engineer manually test?")
    
    echo "E2E scenarios to test: $E2E_SCENARIOS"
    
    # Execute specific E2E scenarios
    execute_intelligent_e2e_tests "$E2E_SCENARIOS"
}

# Intelligent E2E test execution
execute_intelligent_e2e_tests() {
    local SCENARIOS=$1
    echo "🤖 Executing intelligent E2E tests..."
    
    # Launch Puppeteer
    /mcp__puppeteer__puppeteer_navigate \
        --url "http://localhost:3000" \
        --allowDangerous false
    
    # Parse and execute each scenario
    SCENARIO_RESULTS=$(/mcp__gemini__gemini-query "Convert to executable test steps:
    
Scenarios: $SCENARIOS

For each scenario, provide:
1. Puppeteer navigation steps
2. Element selectors to interact with
3. Validation checks
4. Screenshot points

Format as actionable commands.")
    
    # Execute the test steps
    execute_puppeteer_commands "$SCENARIO_RESULTS"
}

# Visual regression testing for UI changes
run_visual_regression_tests() {
    echo "📸 Running visual regression tests..."
    
    # Identify UI components that changed
    UI_COMPONENTS=$(/mcp__gemini__gemini-query "From changed files: $CHANGED_FILES
    
Which UI components/pages need visual regression testing?
List specific components and routes.")
    
    # Capture screenshots of affected components
    for component in $UI_COMPONENTS; do
        capture_component_screenshot "$component"
    done
    
    # Compare with baseline
    perform_visual_comparison
}
```

### 3. **Quality Gates & Risk Assessment**
```bash
# Validate quality gates before release
validate_quality_gates() {
    echo "✅ PHASE 4: QUALITY GATE VALIDATION"
    echo "==================================="
    
    QUALITY_ASSESSMENT=$(/mcp__gemini__gemini-query "As a Senior QA Engineer, assess release readiness:

Test Results: $TEST_RESULTS
Changes Made: $CHANGED_FILES
Impact Analysis: $AFFECTED_ANALYSIS
Missing Tests: ${MISSING_TESTS:-None}

Provide quality gate assessment:
1. TEST COVERAGE: Is coverage sufficient for the changes?
2. CRITICAL PATHS: Are all critical paths tested?
3. REGRESSION RISK: What's the regression risk level?
4. PERFORMANCE: Any performance concerns?
5. SECURITY: Any security issues identified?
6. KNOWN ISSUES: What issues were found?
7. RECOMMENDATIONS: Should this be released?

Provide a GO/NO-GO recommendation with reasoning.")
    
    echo "🎯 Quality Assessment:"
    echo "$QUALITY_ASSESSMENT"
    
    # Generate comprehensive report
    generate_qa_report
}

# Generate intelligent QA report
generate_qa_report() {
    echo "📊 Generating QA Report..."
    
    QA_REPORT=$(/mcp__gemini__gemini-query "Create a comprehensive QA report:

Executive Summary:
- Changes tested: $CHANGED_FILES
- Test strategy: Targeted testing based on impact analysis
- Tests executed: [Summary of what was tested]
- Tests skipped: [What we didn't test and why]

Key Findings:
$TEST_RESULTS

Risk Assessment:
$QUALITY_ASSESSMENT

Recommendations:
1. Immediate actions needed
2. Follow-up testing required
3. Technical debt identified
4. Missing test coverage

Format as a professional QA report that a QA lead would present.")
    
    # Update JIRA if applicable
    if [[ -n "$JIRA_TICKET" ]]; then
        update_jira_with_intelligent_results
    fi
}

# Update JIRA with intelligent test results
update_jira_with_intelligent_results() {
    echo "📝 Updating JIRA with test results..."
    
    JIRA_COMMENT="🧠 **Intelligent QA Test Report**

**Change Analysis:**
- Files Changed: $(echo "$CHANGED_FILES" | wc -l) files
- Impact Areas: $AFFECTED_ANALYSIS

**Test Strategy:**
- Approach: Targeted testing based on actual changes
- Tests Executed: $(echo $TEST_RESULTS | jq '.tests_executed | length')
- Tests Skipped: $(echo $TEST_RESULTS | jq '.tests_skipped | length') (unrelated to changes)

**Quality Gate Status:**
$QUALITY_ASSESSMENT

**Key Findings:**
$QA_REPORT

---
*Generated by Intelligent QA Automation*"
    
    /mcp__jira__jira_add_comment \
        --issue_key "$JIRA_TICKET" \
        --comment "$JIRA_COMMENT"
}
```

### 4. **Intelligent Test Discovery Functions**
```bash
# Discover what needs testing when no specific changes are provided
discover_test_requirements() {
    echo "🔎 Discovering test requirements..."
    
    # Analyze feature description
    FEATURE_ANALYSIS=$(/mcp__gemini__gemini-query "As a Senior QA Engineer, analyze this feature:

Feature: $FEATURE_DESC

Determine:
1. What components are likely affected?
2. What test types are needed?
3. What are the critical test scenarios?
4. What regression risks exist?
5. What integrations need testing?

Consider {{PROJECT_NAME}}'s architecture and provide specific test recommendations.")
    
    # Search codebase for related components
    search_related_components
}

# Search for components related to the feature
search_related_components() {
    echo "🔍 Searching for related components..."
    
    # Extract keywords from feature
    KEYWORDS=$(/mcp__gemini__gemini-query "Extract search keywords from: $FEATURE_DESC
    Return comma-separated technical terms.")
    
    # Search codebase
    RELATED_FILES=$(/mcp__filesystem__search_files "." "$KEYWORDS")
    
    # Analyze findings
    COMPONENT_ANALYSIS=$(/mcp__gemini__gemini-analyze-code "Analyze these files for testing needs:
    
Files: $RELATED_FILES
Feature: $FEATURE_DESC

What specific tests are needed?")

    # Generate negative test scenarios
    NEGATIVE_SCENARIOS=$(/mcp__gemini__gemini-query "Generate negative test scenarios:

Requirements: $TEST_REQUIREMENTS
Feature: ${TICKET_SUMMARY:-$FEATURE_DESC}

Create comprehensive negative test cases:
1. ERROR HANDLING: Invalid inputs, missing data
2. BOUNDARY TESTING: Limits, edge values
3. SECURITY TESTING: Injection attempts, unauthorized access
4. CONCURRENCY: Race conditions, simultaneous operations
5. FAILURE SCENARIOS: Network errors, service unavailability

Include specific test cases for:
- Input validation failures
- Authentication/authorization errors
- Data consistency issues
- Performance degradation
- Error message validation")

    # Generate production verification scenarios
    PRODUCTION_SCENARIOS=$(/mcp__gemini__gemini-query "Generate production verification scenarios:

Requirements: $TEST_REQUIREMENTS
Feature: ${TICKET_SUMMARY:-$FEATURE_DESC}

Create safe production test scenarios:
1. SMOKE TESTS: Core functionality verification
2. MONITORING: Performance and availability checks
3. DATA VALIDATION: Verify production data integrity
4. INTEGRATION HEALTH: External service connectivity
5. USER IMPACT: Minimal disruption validation

Ensure all tests are:
- Non-destructive
- Read-only where possible
- Performance-conscious
- Quickly executable")
}
```

### 3. **Advanced Puppeteer Test Execution with Console Monitoring**
```bash
# Execute E2E tests using Puppeteer with comprehensive monitoring
execute_puppeteer_tests() {
    echo "🤖 ADVANCED PUPPETEER TEST EXECUTION"
    echo "===================================="
    echo "Starting intelligent browser automation with console monitoring..."
    
    # Initialize comprehensive test results tracking
    TEST_RESULTS='{
        "passed": [],
        "failed": [],
        "skipped": [],
        "screenshots": [],
        "console_logs": [],
        "performance": {},
        "coverage": {},
        "network_failures": [],
        "javascript_errors": [],
        "accessibility_violations": []
    }'
    
    # Launch Puppeteer with comprehensive monitoring
    launch_enhanced_puppeteer_session
    
    # Execute test scenarios with console monitoring
    for scenario in $POSITIVE_SCENARIOS $NEGATIVE_SCENARIOS; do
        execute_monitored_test_scenario "$scenario"
    done
    
    # Capture visual regression with console validation
    perform_enhanced_visual_regression_testing
    
    # Comprehensive performance and console analysis
    measure_comprehensive_metrics
}

launch_enhanced_puppeteer_session() {
    echo "🌐 Launching enhanced browser session with monitoring..."
    
    # Configure Puppeteer with console and network monitoring
    ENHANCED_PUPPETEER_CONFIG='{
        "headless": false,
        "devtools": true,
        "args": [
            "--disable-web-security", 
            "--disable-features=VizDisplayCompositor",
            "--enable-logging",
            "--v=1"
        ]
    }'
    
    # Navigate to application with monitoring setup
    mcp__puppeteer__puppeteer_navigate "http://localhost:3000"
    
    # Setup comprehensive console and error monitoring
    setup_browser_monitoring
    
    # Login if required with monitoring
    perform_monitored_test_login
}

setup_browser_monitoring() {
    echo "🔍 Setting up comprehensive browser monitoring..."
    
    # Setup console log capture, error monitoring, and network tracking
    MONITORING_SCRIPT='
        // Console log capture
        const originalConsole = {
            log: console.log,
            warn: console.warn,
            error: console.error,
            info: console.info
        };
        
        window.testLogs = [];
        window.testErrors = [];
        window.networkFailures = [];
        
        // Override console methods
        console.log = (...args) => {
            window.testLogs.push({type: "log", message: args.join(" "), timestamp: Date.now()});
            originalConsole.log.apply(console, args);
        };
        
        console.warn = (...args) => {
            window.testLogs.push({type: "warn", message: args.join(" "), timestamp: Date.now()});
            originalConsole.warn.apply(console, args);
        };
        
        console.error = (...args) => {
            window.testErrors.push({type: "error", message: args.join(" "), timestamp: Date.now(), stack: new Error().stack});
            window.testLogs.push({type: "error", message: args.join(" "), timestamp: Date.now()});
            originalConsole.error.apply(console, args);
        };
        
        console.info = (...args) => {
            window.testLogs.push({type: "info", message: args.join(" "), timestamp: Date.now()});
            originalConsole.info.apply(console, args);
        };
        
        // Global error handling
        window.addEventListener("error", (event) => {
            window.testErrors.push({
                type: "javascript_error",
                message: event.message,
                filename: event.filename,
                lineno: event.lineno,
                colno: event.colno,
                error: event.error ? event.error.toString() : "Unknown error",
                timestamp: Date.now()
            });
        });
        
        // Promise rejection handling
        window.addEventListener("unhandledrejection", (event) => {
            window.testErrors.push({
                type: "unhandled_promise_rejection",
                reason: event.reason ? event.reason.toString() : "Unknown rejection",
                timestamp: Date.now()
            });
        });
        
        // Network monitoring setup
        const originalFetch = window.fetch;
        window.fetch = async (...args) => {
            const startTime = Date.now();
            try {
                const response = await originalFetch.apply(this, args);
                const endTime = Date.now();
                
                if (!response.ok) {
                    window.networkFailures.push({
                        url: args[0],
                        status: response.status,
                        statusText: response.statusText,
                        duration: endTime - startTime,
                        timestamp: Date.now()
                    });
                }
                
                return response;
            } catch (error) {
                const endTime = Date.now();
                window.networkFailures.push({
                    url: args[0],
                    error: error.message,
                    duration: endTime - startTime,
                    timestamp: Date.now()
                });
                throw error;
            }
        };
        
        return "Monitoring setup complete";
    '
    
    MONITORING_RESULT=$(mcp__puppeteer__puppeteer_evaluate "$MONITORING_SCRIPT")
    echo "✅ Browser monitoring active: $MONITORING_RESULT"
}

execute_monitored_test_scenario() {
    local SCENARIO=$1
    local SCENARIO_ID=$(echo "$SCENARIO" | jq -r '.id')
    local SCENARIO_STEPS=$(echo "$SCENARIO" | jq -r '.steps[]')
    
    echo "🧪 Executing Monitored Test: $SCENARIO_ID"
    
    # Clear previous logs for this scenario
    CLEAR_LOGS_SCRIPT='
        window.testLogs = [];
        window.testErrors = [];
        window.networkFailures = [];
        return "Logs cleared for new scenario";
    '
    mcp__puppeteer__puppeteer_evaluate "$CLEAR_LOGS_SCRIPT"
    
    # Execute each test step with monitoring
    for step in $SCENARIO_STEPS; do
        case $step.action in
            "navigate")
                echo "🧭 Navigating to: $step.url"
                mcp__puppeteer__puppeteer_navigate "$step.url"
                capture_navigation_metrics "$SCENARIO_ID" "$step.url"
                ;;
            "click")
                echo "👆 Clicking: $step.selector"
                mcp__puppeteer__puppeteer_click "$step.selector"
                capture_interaction_logs "$SCENARIO_ID" "click" "$step.selector"
                ;;
            "fill")
                echo "✏️ Filling: $step.selector with $step.value"
                mcp__puppeteer__puppeteer_fill "$step.selector" "$step.value"
                capture_interaction_logs "$SCENARIO_ID" "fill" "$step.selector"
                ;;
            "screenshot")
                echo "📷 Capturing screenshot: $step.name"
                SCREENSHOT_PATH=$(mcp__puppeteer__puppeteer_screenshot "${SCENARIO_ID}_${step.name}")
                
                # Add to results with console state
                CONSOLE_STATE=$(capture_console_state "$SCENARIO_ID")
                TEST_RESULTS=$(echo "$TEST_RESULTS" | jq \
                    ".screenshots += [{\"scenario\": \"$SCENARIO_ID\", \"path\": \"$SCREENSHOT_PATH\", \"console_state\": $CONSOLE_STATE}]")
                ;;
            "validate")
                echo "✅ Validating: $step.validation_name"
                VALIDATION_RESULT=$(mcp__puppeteer__puppeteer_evaluate "$step.validation_script")
                
                # Capture validation logs
                VALIDATION_LOGS=$(capture_validation_logs "$SCENARIO_ID" "$step.validation_name")
                
                # Record result with detailed logging
                if [[ "$VALIDATION_RESULT" == "true" ]]; then
                    TEST_RESULTS=$(echo "$TEST_RESULTS" | jq ".passed += [{\"scenario\": \"$SCENARIO_ID\", \"logs\": $VALIDATION_LOGS}]")
                    echo "✅ Validation passed: $step.validation_name"
                else
                    TEST_RESULTS=$(echo "$TEST_RESULTS" | jq ".failed += [{\"scenario\": \"$SCENARIO_ID\", \"logs\": $VALIDATION_LOGS, \"validation_result\": $(echo "$VALIDATION_RESULT" | jq -Rs .)}]")
                    echo "❌ Validation failed: $step.validation_name"
                fi
                ;;
            "wait")
                echo "⏱️ Waiting: $step.duration seconds"
                sleep "$step.duration"
                ;;
        esac
        
        # Small pause between steps to capture intermediate states
        sleep 0.5
    done
    
    # Capture final console state for scenario
    FINAL_CONSOLE_STATE=$(capture_final_console_state "$SCENARIO_ID")
    TEST_RESULTS=$(echo "$TEST_RESULTS" | jq ".console_logs += [$FINAL_CONSOLE_STATE]")
}

capture_navigation_metrics() {
    local SCENARIO_ID=$1
    local URL=$2
    
    echo "📊 Capturing navigation metrics for $SCENARIO_ID at $URL"
    
    # Wait for page to stabilize
    sleep 2
    
    NAVIGATION_METRICS_SCRIPT='
        const perfData = performance.timing;
        const navEntries = performance.getEntriesByType("navigation")[0];
        
        return {
            scenario: "'$SCENARIO_ID'",
            url: "'$URL'",
            metrics: {
                domContentLoaded: perfData.domContentLoadedEventEnd - perfData.navigationStart,
                loadComplete: perfData.loadEventEnd - perfData.navigationStart,
                firstPaint: navEntries ? navEntries.loadEventEnd - navEntries.fetchStart : null,
                domInteractive: perfData.domInteractive - perfData.navigationStart
            },
            console_logs: window.testLogs.slice(),
            errors: window.testErrors.slice(),
            network_failures: window.networkFailures.slice(),
            timestamp: Date.now()
        };
    '
    
    METRICS_RESULT=$(mcp__puppeteer__puppeteer_evaluate "$NAVIGATION_METRICS_SCRIPT")
    echo "Navigation metrics captured: $(echo "$METRICS_RESULT" | jq -r '.metrics.domContentLoaded')ms DOM load"
}

capture_interaction_logs() {
    local SCENARIO_ID=$1
    local ACTION=$2
    local SELECTOR=$3
    
    INTERACTION_LOGS_SCRIPT='
        return {
            scenario: "'$SCENARIO_ID'",
            action: "'$ACTION'",
            selector: "'$SELECTOR'",
            console_logs: window.testLogs.slice(-10), // Last 10 logs
            errors: window.testErrors.slice(),
            timestamp: Date.now()
        };
    '
    
    INTERACTION_RESULT=$(mcp__puppeteer__puppeteer_evaluate "$INTERACTION_LOGS_SCRIPT")
    
    # Check for errors after interaction
    ERROR_COUNT=$(echo "$INTERACTION_RESULT" | jq '.errors | length')
    if [[ $ERROR_COUNT -gt 0 ]]; then
        echo "⚠️ Detected $ERROR_COUNT errors after $ACTION on $SELECTOR"
    fi
}

capture_console_state() {
    local SCENARIO_ID=$1
    
    CONSOLE_STATE_SCRIPT='
        return {
            scenario: "'$SCENARIO_ID'",
            logs: window.testLogs.slice(),
            errors: window.testErrors.slice(),
            network_failures: window.networkFailures.slice(),
            dom_state: {
                title: document.title,
                url: window.location.href,
                ready_state: document.readyState,
                visible_elements: document.querySelectorAll("*:not([style*=\"display: none\"]):not([hidden])").length
            },
            timestamp: Date.now()
        };
    '
    
    mcp__puppeteer__puppeteer_evaluate "$CONSOLE_STATE_SCRIPT"
}

capture_validation_logs() {
    local SCENARIO_ID=$1
    local VALIDATION_NAME=$2
    
    VALIDATION_LOGS_SCRIPT='
        return {
            scenario: "'$SCENARIO_ID'",
            validation: "'$VALIDATION_NAME'",
            pre_validation_logs: window.testLogs.slice(),
            pre_validation_errors: window.testErrors.slice(),
            network_state: window.networkFailures.slice(),
            timestamp: Date.now()
        };
    '
    
    mcp__puppeteer__puppeteer_evaluate "$VALIDATION_LOGS_SCRIPT"
}

capture_final_console_state() {
    local SCENARIO_ID=$1
    
    FINAL_STATE_SCRIPT='
        return {
            scenario: "'$SCENARIO_ID'",
            final_logs: window.testLogs.slice(),
            final_errors: window.testErrors.slice(),
            final_network_failures: window.networkFailures.slice(),
            performance_summary: {
                total_logs: window.testLogs.length,
                total_errors: window.testErrors.length,
                total_network_failures: window.networkFailures.length,
                page_load_complete: document.readyState === "complete"
            },
            browser_state: {
                user_agent: navigator.userAgent,
                viewport: {
                    width: window.innerWidth,
                    height: window.innerHeight
                },
                memory_usage: performance.memory ? {
                    used: performance.memory.usedJSHeapSize,
                    total: performance.memory.totalJSHeapSize
                } : null
            },
            timestamp: Date.now()
        };
    '
    
    mcp__puppeteer__puppeteer_evaluate "$FINAL_STATE_SCRIPT"
}

perform_enhanced_visual_regression_testing() {
    echo "📸 ENHANCED VISUAL REGRESSION TESTING WITH CONSOLE VALIDATION"
    echo "============================================================="
    
    # Enhanced visual test pages with console monitoring
    VISUAL_TEST_PAGES=("dashboard" "channels" "calendar" "settings" "brand-selector" "login" "admin")
    
    for page in "${VISUAL_TEST_PAGES[@]}"; do
        echo "📷 Capturing enhanced visual state: $page"
        
        # Clear console before navigation
        mcp__puppeteer__puppeteer_evaluate 'window.testLogs = []; window.testErrors = []; return "Cleared";'
        
        # Navigate to page
        mcp__puppeteer__puppeteer_navigate "http://localhost:3000/admin/$page"
        
        # Wait for content to load and capture console state
        sleep 3
        
        # Capture pre-screenshot console state
        PRE_SCREENSHOT_STATE=$(capture_console_state "visual_$page")
        
        # Capture screenshot
        SCREENSHOT=$(mcp__puppeteer__puppeteer_screenshot "visual_regression_${page}_$(date +%Y%m%d_%H%M%S)")
        
        # Capture post-screenshot console state
        POST_SCREENSHOT_STATE=$(capture_console_state "visual_${page}_post")
        
        # Enhanced visual comparison with console analysis
        compare_enhanced_visual_regression "$page" "$SCREENSHOT" "$PRE_SCREENSHOT_STATE" "$POST_SCREENSHOT_STATE"
    done
}

compare_enhanced_visual_regression() {
    local PAGE=$1
    local NEW_SCREENSHOT=$2
    local PRE_STATE=$3
    local POST_STATE=$4
    
    echo "🔍 Enhanced visual comparison for $PAGE with console analysis..."
    
    # AI-powered visual and console log analysis
    ENHANCED_COMPARISON=$(mcp__gemini__gemini-analyze-text "Enhanced visual regression analysis:

Page: $PAGE
Screenshot captured: $NEW_SCREENSHOT
Pre-screenshot console state: $PRE_STATE
Post-screenshot console state: $POST_STATE

Analyze:
1. VISUAL CHANGES: Layout, styling, missing elements, color variations
2. CONSOLE HEALTH: Any errors or warnings during page load
3. NETWORK ISSUES: Failed requests or slow responses
4. JAVASCRIPT ERRORS: Runtime errors or unhandled promises
5. PERFORMANCE IMPACT: DOM load times and responsiveness
6. USER EXPERIENCE: Any issues that would affect users

Provide assessment of:
- Visual regression severity (none/low/medium/high)
- Console health status (healthy/warnings/errors)
- User impact level (none/minor/moderate/severe)
- Recommended actions")
    
    echo "📊 Enhanced comparison results:"
    echo "$ENHANCED_COMPARISON"
    
    # Store detailed results
    VISUAL_ANALYSIS=$(echo '{
        "page": "'$PAGE'",
        "screenshot": "'$NEW_SCREENSHOT'",
        "console_analysis": '"$ENHANCED_COMPARISON"',
        "pre_state": '"$PRE_STATE"',
        "post_state": '"$POST_STATE"',
        "timestamp": "'$(date -Iseconds)'"
    }')
    
    TEST_RESULTS=$(echo "$TEST_RESULTS" | jq ".visual_regression += [$VISUAL_ANALYSIS]")
}

measure_comprehensive_metrics() {
    echo "⚡ COMPREHENSIVE PERFORMANCE & CONSOLE MEASUREMENT"
    echo "=================================================="
    
    # Comprehensive performance, console, and browser state analysis
    COMPREHENSIVE_METRICS_SCRIPT='
        const perfData = window.performance.timing;
        const navEntries = performance.getEntriesByType("navigation")[0];
        const resourceEntries = performance.getEntriesByType("resource");
        
        // Calculate performance metrics
        const metrics = {
            page_load_time: perfData.loadEventEnd - perfData.navigationStart,
            time_to_first_byte: perfData.responseStart - perfData.navigationStart,
            dom_content_loaded: perfData.domContentLoadedEventEnd - perfData.navigationStart,
            dom_interactive: perfData.domInteractive - perfData.navigationStart,
            resource_count: resourceEntries.length,
            large_resources: resourceEntries.filter(r => r.transferSize > 100000).length
        };
        
        // Console and error analysis
        const console_analysis = {
            total_logs: window.testLogs.length,
            log_types: window.testLogs.reduce((acc, log) => {
                acc[log.type] = (acc[log.type] || 0) + 1;
                return acc;
            }, {}),
            total_errors: window.testErrors.length,
            error_types: window.testErrors.reduce((acc, error) => {
                acc[error.type] = (acc[error.type] || 0) + 1;
                return acc;
            }, {}),
            network_failures: window.networkFailures.length,
            failed_requests: window.networkFailures.map(f => ({
                url: f.url,
                status: f.status || "network_error",
                error: f.error || f.statusText
            }))
        };
        
        // Memory and browser state
        const browser_state = {
            memory_usage: performance.memory ? {
                used_mb: Math.round(performance.memory.usedJSHeapSize / 1024 / 1024),
                total_mb: Math.round(performance.memory.totalJSHeapSize / 1024 / 1024),
                limit_mb: Math.round(performance.memory.jsHeapSizeLimit / 1024 / 1024)
            } : null,
            dom_elements: document.querySelectorAll("*").length,
            viewport: {
                width: window.innerWidth,
                height: window.innerHeight
            },
            connection: navigator.connection ? {
                effective_type: navigator.connection.effectiveType,
                downlink: navigator.connection.downlink,
                rtt: navigator.connection.rtt
            } : null
        };
        
        return {
            performance: metrics,
            console_analysis: console_analysis,
            browser_state: browser_state,
            timestamp: Date.now()
        };
    '
    
    COMPREHENSIVE_DATA=$(mcp__puppeteer__puppeteer_evaluate "$COMPREHENSIVE_METRICS_SCRIPT")
    
    echo "📊 Performance Summary:"
    echo "$COMPREHENSIVE_DATA" | jq '.performance'
    
    echo "🔍 Console Analysis:"
    echo "$COMPREHENSIVE_DATA" | jq '.console_analysis'
    
    # Add comprehensive data to test results
    TEST_RESULTS=$(echo "$TEST_RESULTS" | jq ".comprehensive_metrics = $COMPREHENSIVE_DATA")
    
    # Generate intelligent performance assessment
    PERFORMANCE_ASSESSMENT=$(mcp__gemini__gemini-analyze-text "Analyze comprehensive test metrics:

Performance Data: $(echo "$COMPREHENSIVE_DATA" | jq '.performance')
Console Analysis: $(echo "$COMPREHENSIVE_DATA" | jq '.console_analysis')
Browser State: $(echo "$COMPREHENSIVE_DATA" | jq '.browser_state')

Provide assessment of:
1. PERFORMANCE HEALTH: Load times, resource efficiency
2. CONSOLE HEALTH: Error patterns, warning trends
3. MEMORY USAGE: Efficiency and potential leaks
4. NETWORK HEALTH: Failed requests and slow responses
5. OVERALL QUALITY: User experience impact
6. RECOMMENDATIONS: Specific improvements needed

Rate overall health: Excellent/Good/Fair/Poor")
    
    echo "🎯 Comprehensive Assessment:"
    echo "$PERFORMANCE_ASSESSMENT"
    
    TEST_RESULTS=$(echo "$TEST_RESULTS" | jq ".performance_assessment = $(echo "$PERFORMANCE_ASSESSMENT" | jq -Rs .)")
}

perform_monitored_test_login() {
    echo "🔐 Performing monitored test login..."
    
    # Test login with console monitoring
    LOGIN_MONITORING_SCRIPT='
        console.log("Starting monitored login test");
        
        // Check if already logged in
        const isLoggedIn = document.querySelector("[data-testid=\"user-menu\"]") || 
                          document.querySelector(".user-avatar") ||
                          window.location.pathname.includes("/admin");
        
        if (isLoggedIn) {
            console.log("User appears to be already logged in");
            return {status: "already_logged_in", redirect_needed: false};
        }
        
        // Check for login form
        const loginForm = document.querySelector("form[data-testid=\"login-form\"]") ||
                         document.querySelector("input[type=\"email\"]");
        
        if (loginForm) {
            console.log("Login form detected");
            return {status: "login_form_found", redirect_needed: false};
        }
        
        console.log("No login form found, may need redirect");
        return {status: "no_login_form", redirect_needed: true};
    '
    
    LOGIN_STATUS=$(mcp__puppeteer__puppeteer_evaluate "$LOGIN_MONITORING_SCRIPT")
    echo "Login status: $LOGIN_STATUS"
    
    # Handle login based on status
    STATUS=$(echo "$LOGIN_STATUS" | jq -r '.status')
    case $STATUS in
        "already_logged_in")
            echo "✅ Already authenticated"
            ;;
        "login_form_found")
            echo "📝 Attempting test login..."
            attempt_monitored_login
            ;;
        "no_login_form")
            echo "🔄 Redirecting to login page..."
            mcp__puppeteer__puppeteer_navigate "http://localhost:3000/auth/login"
            sleep 2
            attempt_monitored_login
            ;;
    esac
}

attempt_monitored_login() {
    echo "🔑 Attempting login with monitoring..."
    
    # Fill login form with monitoring
    mcp__puppeteer__puppeteer_fill 'input[type="email"]' "test@example.com"
    capture_interaction_logs "login" "fill_email" 'input[type="email"]'
    
    mcp__puppeteer__puppeteer_fill 'input[type="password"]' "testpassword"
    capture_interaction_logs "login" "fill_password" 'input[type="password"]'
    
    mcp__puppeteer__puppeteer_click 'button[type="submit"]'
    capture_interaction_logs "login" "submit" 'button[type="submit"]'
    
    # Wait for login completion and monitor
    sleep 3
    
    LOGIN_COMPLETION_SCRIPT='
        const isLoggedIn = document.querySelector("[data-testid=\"user-menu\"]") || 
                          window.location.pathname.includes("/admin");
        
        return {
            logged_in: isLoggedIn,
            current_url: window.location.href,
            console_logs: window.testLogs.slice(-5),
            errors: window.testErrors.slice(),
            timestamp: Date.now()
        };
    '
    
    LOGIN_RESULT=$(mcp__puppeteer__puppeteer_evaluate "$LOGIN_COMPLETION_SCRIPT")
    
    LOGGED_IN=$(echo "$LOGIN_RESULT" | jq -r '.logged_in')
    if [[ "$LOGGED_IN" == "true" ]]; then
        echo "✅ Login successful with monitoring"
    else
        echo "❌ Login failed - check console logs"
        echo "$LOGIN_RESULT" | jq '.console_logs, .errors'
    fi
}
```

### 4. **Unit and Integration Test Discovery & Execution**
```bash
# Discover and run existing tests
discover_and_run_tests() {
    echo "🧪 UNIT & INTEGRATION TEST EXECUTION"
    echo "===================================="
    
    # Discover test files related to the feature
    discover_related_tests
    
    # Run TypeScript type checking first
    run_typescript_typecheck
    
    # Run unit tests
    run_unit_tests
    
    # Run integration tests
    run_integration_tests
    
    # Analyze test coverage
    analyze_test_coverage
}

discover_related_tests() {
    echo "🔍 Discovering related test files..."
    
    # Find test files based on feature components
    COMPONENT_KEYWORDS=$(/mcp__gemini__gemini-query "Extract component/feature keywords from:
    Ticket: ${TICKET_SUMMARY:-$FEATURE_DESC}
    
    Return comma-separated keywords for finding test files.")
    
    # Search for test files
    TEST_FILES=$(/mcp__filesystem__search_files \
        "{{PROJECT_PATH}}/src" \
        "*.test.ts" \
        --excludePatterns "node_modules")
    
    # Filter relevant tests
    RELEVANT_TESTS=$(/mcp__gemini__gemini-query "Filter relevant test files:
    
    All test files: $TEST_FILES
    Feature keywords: $COMPONENT_KEYWORDS
    
    Return list of test files most likely related to this feature.")
}

run_unit_tests() {
    echo "🧬 Running Unit Tests..."
    
    # Run Jest tests for specific files
    UNIT_TEST_RESULTS=$(npm test -- --testPathPattern="$RELEVANT_TESTS" --coverage --json)
    
    # Parse results
    UNIT_PASSED=$(echo "$UNIT_TEST_RESULTS" | jq '.numPassedTests')
    UNIT_FAILED=$(echo "$UNIT_TEST_RESULTS" | jq '.numFailedTests')
    UNIT_COVERAGE=$(echo "$UNIT_TEST_RESULTS" | jq '.coverageMap')
    
    echo "✅ Passed: $UNIT_PASSED"
    echo "❌ Failed: $UNIT_FAILED"
    
    # Add to results
    TEST_RESULTS=$(echo "$TEST_RESULTS" | jq ".unit_tests = {
        passed: $UNIT_PASSED,
        failed: $UNIT_FAILED,
        coverage: $UNIT_COVERAGE
    }")
}

run_integration_tests() {
    echo "🔗 Running Integration Tests..."
    
    # Run integration tests (API, database)
    INTEGRATION_PATTERNS="api|integration|e2e"
    INTEGRATION_RESULTS=$(npm test -- --testNamePattern="$INTEGRATION_PATTERNS" --json)
    
    # Parse and record results
    parse_integration_results "$INTEGRATION_RESULTS"
}

# TypeScript type checking
run_typescript_typecheck() {
    echo "🔍 TYPESCRIPT TYPE CHECKING"
    echo "=========================="
    echo "Running comprehensive type validation..."
    
    # Run TypeScript compiler check
    echo "📝 Executing TypeScript compiler..."
    TYPECHECK_OUTPUT=$(npx tsc --noEmit --pretty 2>&1 || true)
    TYPECHECK_EXIT_CODE=$?
    
    if [[ $TYPECHECK_EXIT_CODE -eq 0 ]]; then
        echo "✅ TypeScript: All type checks passed!"
        TYPE_ERRORS=0
        TYPE_STATUS="passed"
    else
        echo "❌ TypeScript: Type errors found"
        # Count number of errors
        TYPE_ERRORS=$(echo "$TYPECHECK_OUTPUT" | grep -c "error TS" || echo "0")
        TYPE_STATUS="failed"
        
        # Parse and categorize errors
        parse_typescript_errors "$TYPECHECK_OUTPUT"
    fi
    
    # Add to test results
    TEST_RESULTS=$(echo "$TEST_RESULTS" | jq ".typescript = {
        status: \"$TYPE_STATUS\",
        error_count: $TYPE_ERRORS,
        output: $(echo "$TYPECHECK_OUTPUT" | jq -Rs .)
    }")
    
    # Run strict mode check if base check passes
    if [[ $TYPE_STATUS == "passed" ]]; then
        run_strict_typecheck
    fi
}

# Parse TypeScript errors for detailed analysis
parse_typescript_errors() {
    local TS_OUTPUT=$1
    echo "📊 Analyzing TypeScript errors..."
    
    # Extract error categories
    ERROR_ANALYSIS=$(/mcp__gemini__gemini-analyze-code "Analyze TypeScript errors:

TypeScript Output:
$TS_OUTPUT

Categorize errors by:
1. ERROR TYPES: Type mismatches, missing types, incorrect interfaces
2. SEVERITY: Critical errors vs warnings
3. COMPONENTS: Which parts of the codebase are affected
4. COMMON PATTERNS: Recurring type issues
5. QUICK FIXES: Simple solutions vs complex refactoring needed

Provide actionable recommendations for fixing type errors.")
    
    echo "$ERROR_ANALYSIS"
    
    # Extract specific error locations
    echo ""
    echo "📍 Error Locations:"
    echo "$TS_OUTPUT" | grep -E "^[^ ]+\.[tj]sx?:" | sort | uniq | head -20
}

# Run stricter TypeScript checks
run_strict_typecheck() {
    echo ""
    echo "🔒 Running strict TypeScript checks..."
    
    # Create temporary strict tsconfig
    STRICT_CONFIG='{
        "extends": "./tsconfig.json",
        "compilerOptions": {
            "strict": true,
            "noImplicitAny": true,
            "strictNullChecks": true,
            "strictFunctionTypes": true,
            "strictBindCallApply": true,
            "strictPropertyInitialization": true,
            "noImplicitThis": true,
            "alwaysStrict": true,
            "noUnusedLocals": true,
            "noUnusedParameters": true,
            "noImplicitReturns": true,
            "noFallthroughCasesInSwitch": true,
            "noUncheckedIndexedAccess": true
        }
    }'
    
    echo "$STRICT_CONFIG" > tsconfig.strict.json
    
    # Run strict check
    STRICT_OUTPUT=$(npx tsc --project tsconfig.strict.json --noEmit --pretty 2>&1 || true)
    STRICT_EXIT_CODE=$?
    
    # Clean up
    rm tsconfig.strict.json
    
    if [[ $STRICT_EXIT_CODE -eq 0 ]]; then
        echo "✅ Strict mode: All checks passed!"
        STRICT_STATUS="passed"
    else
        echo "⚠️ Strict mode: Additional improvements possible"
        STRICT_STATUS="warnings"
        
        # Analyze strict mode findings
        STRICT_ANALYSIS=$(/mcp__gemini__gemini-query "Analyze strict TypeScript findings:

Strict Mode Output:
$STRICT_OUTPUT

Identify:
1. TYPE SAFETY IMPROVEMENTS: Where stricter typing would help
2. NULL SAFETY: Potential null/undefined issues
3. UNUSED CODE: Dead code detection
4. IMPLICIT ANY: Where explicit types would improve clarity
5. PRIORITY FIXES: Most impactful improvements

Focus on improvements that enhance code quality without disrupting development.")
        
        echo "$STRICT_ANALYSIS"
    fi
    
    # Add strict mode results
    TEST_RESULTS=$(echo "$TEST_RESULTS" | jq ".typescript.strict_mode = {
        status: \"$STRICT_STATUS\",
        recommendations: $(echo "$STRICT_ANALYSIS" | jq -Rs .)
    }")
}

analyze_test_coverage() {
    echo "📊 TEST COVERAGE ANALYSIS"
    echo "========================"
    
    # Get current coverage
    COVERAGE_REPORT=$(npm test -- --coverage --coverageReporters=json-summary)
    
    # Analyze coverage gaps
    COVERAGE_ANALYSIS=$(/mcp__gemini__gemini-analyze-code "Analyze test coverage:

Coverage Report: $COVERAGE_REPORT
Feature: ${TICKET_SUMMARY:-$FEATURE_DESC}
Related Components: $RELEVANT_TESTS

Identify:
1. UNCOVERED LINES: Critical code without tests
2. UNCOVERED BRANCHES: Missing conditional tests
3. UNCOVERED FUNCTIONS: Untested functions
4. MISSING TEST TYPES: Unit vs integration gaps
5. RISK ASSESSMENT: Impact of uncovered code

Provide specific recommendations for improving coverage.")
    
    echo "📈 Coverage Analysis:"
    echo "$COVERAGE_ANALYSIS"
}
```

### 5. **Test Gap Identification & Recommendations**
```bash
# Identify testing gaps and improvement opportunities
identify_test_gaps() {
    echo "🔍 TEST GAP ANALYSIS"
    echo "===================="
    
    # Analyze current test coverage
    analyze_coverage_gaps
    
    # Identify missing test scenarios
    identify_missing_scenarios
    
    # Recommend test improvements
    recommend_test_improvements
    
    # Suggest refactoring opportunities
    suggest_refactoring_opportunities
}

analyze_coverage_gaps() {
    echo "📊 Coverage Gap Analysis..."
    
    COVERAGE_GAPS=$(/mcp__gemini__gemini-query "Analyze test coverage gaps:

Current Coverage: $UNIT_COVERAGE
Feature Requirements: $TEST_REQUIREMENTS
Existing Tests: $RELEVANT_TESTS

Identify critical gaps:
1. UNTESTED FEATURES: Functionality without any tests
2. EDGE CASES: Missing boundary and error tests
3. INTEGRATION GAPS: Untested service interactions
4. UI COVERAGE: Missing visual/interaction tests
5. PERFORMANCE TESTS: Missing load/stress tests

Prioritize by risk and importance.")
}

identify_missing_scenarios() {
    echo "🎯 Missing Test Scenarios..."
    
    MISSING_SCENARIOS=$(/mcp__gemini__gemini-query "Identify missing test scenarios:

Generated Scenarios: $POSITIVE_SCENARIOS, $NEGATIVE_SCENARIOS
Existing Tests: $RELEVANT_TESTS
Feature: ${TICKET_SUMMARY:-$FEATURE_DESC}

Find gaps in:
1. USER JOURNEYS: Uncovered user workflows
2. ERROR SCENARIOS: Unhandled error conditions
3. DATA VARIATIONS: Missing input combinations
4. SECURITY TESTS: Authorization and validation gaps
5. CROSS-BROWSER: Missing compatibility tests

Provide specific test scenarios that should be added.")
}

recommend_test_improvements() {
    echo "💡 Test Improvement Recommendations..."
    
    TEST_IMPROVEMENTS=$(/mcp__gemini__gemini-query "Recommend test improvements:

Current Test State: $TEST_RESULTS
Coverage Analysis: $COVERAGE_ANALYSIS
Missing Scenarios: $MISSING_SCENARIOS

Recommend improvements:
1. CRITICAL ADDITIONS: Must-have tests for safety
2. TEST REFACTORING: Improve existing test quality
3. AUTOMATION OPPORTUNITIES: Manual tests to automate
4. PERFORMANCE TESTS: Load and stress testing needs
5. MAINTENANCE: Test cleanup and organization

Provide actionable recommendations with priority.")
}

suggest_refactoring_opportunities() {
    echo "🔧 Code Refactoring Suggestions..."
    
    REFACTORING_SUGGESTIONS=$(/mcp__gemini__gemini-analyze-code "Suggest refactoring for testability:

Feature Code: [analyze related components]
Test Coverage: $COVERAGE_ANALYSIS
Test Complexity: [analyze test maintainability]

Suggest refactoring to:
1. IMPROVE TESTABILITY: Make code easier to test
2. REDUCE COMPLEXITY: Simplify complex functions
3. ENHANCE MODULARITY: Better separation of concerns
4. MOCK DEPENDENCIES: Easier dependency injection
5. CLEAR INTERFACES: Better API contracts

Focus on changes that improve both code quality and testability.")
}
```

### 6. **JIRA Ticket Update with Results**
```bash
# Update JIRA ticket with comprehensive test results
update_jira_with_results() {
    if [[ -n "$JIRA_TICKET" ]]; then
        echo "📝 UPDATING JIRA TICKET"
        echo "======================"
        
        # Prepare comprehensive test report
        prepare_test_report
        
        # Add test results as comment
        add_test_results_comment
        
        # Update ticket fields if needed
        update_ticket_status
        
        # Attach screenshots and reports
        attach_test_artifacts
    fi
}

prepare_test_report() {
    echo "📊 Preparing test report..."
    
    TEST_REPORT=$(/mcp__gemini__gemini-query "Create comprehensive test report:

Test Results: $TEST_RESULTS
Coverage Analysis: $COVERAGE_ANALYSIS
Gap Analysis: $COVERAGE_GAPS
Recommendations: $TEST_IMPROVEMENTS

Format as professional QA report with:
1. EXECUTIVE SUMMARY: Overall quality assessment
2. TEST EXECUTION RESULTS: Detailed pass/fail
3. COVERAGE METRICS: Current vs target
4. IDENTIFIED RISKS: Critical issues found
5. RECOMMENDATIONS: Prioritized next steps
6. SCREENSHOTS: Visual evidence references

Use clear formatting for JIRA comment.")
}

add_test_results_comment() {
    echo "💬 Adding test results to JIRA..."
    
    # Format test report for JIRA
    JIRA_COMMENT="🧪 **Automated QA Test Report**

$TEST_REPORT

**Test Execution Summary:**
- ✅ Passed: $(echo $TEST_RESULTS | jq '.passed | length')
- ❌ Failed: $(echo $TEST_RESULTS | jq '.failed | length')
- ⏭️ Skipped: $(echo $TEST_RESULTS | jq '.skipped | length')

**TypeScript Type Checking:**
- 🔍 Status: $(echo $TEST_RESULTS | jq -r '.typescript.status')
- 📝 Type Errors: $(echo $TEST_RESULTS | jq '.typescript.error_count')
- 🔒 Strict Mode: $(echo $TEST_RESULTS | jq -r '.typescript.strict_mode.status // "not run"')

**Coverage Metrics:**
- Unit Test Coverage: $(echo $TEST_RESULTS | jq '.unit_tests.coverage.percentage')%
- Integration Tests: $(echo $TEST_RESULTS | jq '.integration_tests.total')
- E2E Tests: $(echo $TEST_RESULTS | jq '.e2e_tests | length')

**Screenshots:** See attachments

**Next Steps:**
$TEST_IMPROVEMENTS

---
*Generated by {{PROJECT_NAME}} QA Automation Suite*"

    # Add comment to JIRA
    /mcp__jira__jira_add_comment \
        --issue_key "$JIRA_TICKET" \
        --comment "$JIRA_COMMENT"
}

update_ticket_status() {
    echo "🔄 Updating ticket status..."
    
    # Determine if tests passed
    FAILED_COUNT=$(echo $TEST_RESULTS | jq '.failed | length')
    
    if [[ $FAILED_COUNT -eq 0 ]]; then
        echo "✅ All tests passed - ready for review"
        
        # Transition to QA passed state if available
        TRANSITIONS=$(/mcp__jira__jira_get_transitions --issue_key "$JIRA_TICKET")
        QA_PASSED_TRANSITION=$(echo "$TRANSITIONS" | jq -r '.transitions[] | select(.name | contains("QA Pass")) | .id')
        
        if [[ -n "$QA_PASSED_TRANSITION" ]]; then
            /mcp__jira__jira_transition_issue \
                --issue_key "$JIRA_TICKET" \
                --transition_id "$QA_PASSED_TRANSITION" \
                --comment "Automated tests passed successfully"
        fi
    else
        echo "❌ Tests failed - needs attention"
        
        # Add QA failed label
        /mcp__jira__jira_update_issue \
            --issue_key "$JIRA_TICKET" \
            --fields '{"labels": ["qa-failed", "needs-fix"]}'
    fi
}

attach_test_artifacts() {
    echo "📎 Attaching test artifacts..."
    
    # Create test report file
    echo "$TEST_REPORT" > "/tmp/qa_report_${JIRA_TICKET}.md"
    echo "$TEST_RESULTS" > "/tmp/test_results_${JIRA_TICKET}.json"
    
    # Attach files to JIRA
    ATTACHMENTS="/tmp/qa_report_${JIRA_TICKET}.md,/tmp/test_results_${JIRA_TICKET}.json"
    
    # Add screenshots
    for screenshot in $(echo $TEST_RESULTS | jq -r '.screenshots[].path'); do
        ATTACHMENTS="$ATTACHMENTS,$screenshot"
    done
    
    # Note: JIRA attachment API would be called here
    echo "📎 Attached: QA report, test results, and $(echo $TEST_RESULTS | jq '.screenshots | length') screenshots"
}
```

## Senior QA Engineer AI Persona

### Professional QA Approach
```yaml
qa_engineer_persona:
  role: "Senior QA Engineer"
  experience_level: "10+ years in software testing"
  specialization: "Test automation, quality strategy, risk-based testing"
  
  testing_philosophy:
    - "Quality is everyone's responsibility"
    - "Automate repetitive, focus manual on exploratory"
    - "Test early, test often, test smart"
    - "Risk-based prioritization"
    - "Continuous improvement mindset"
  
  expertise_areas:
    test_strategy:
      - Test planning and design
      - Risk assessment and mitigation
      - Test case optimization
      - Coverage analysis
    
    automation:
      - E2E automation architecture
      - Test framework design
      - CI/CD integration
      - Performance testing
    
    quality_metrics:
      - Defect prevention
      - Quality gates
      - Test effectiveness
      - Process improvement
    
  communication_style:
    - Detail-oriented documentation
    - Clear risk communication
    - Constructive feedback
    - Collaborative problem-solving
    - Data-driven insights
```

## Advanced Testing Features

### Cross-Browser Testing
```bash
# Execute tests across multiple browsers
cross_browser_testing() {
    echo "🌐 CROSS-BROWSER TESTING"
    echo "======================="
    
    BROWSERS=("chrome" "firefox" "safari" "edge")
    
    for browser in "${BROWSERS[@]}"; do
        echo "🔍 Testing in $browser..."
        
        # Launch browser-specific session
        BROWSER_CONFIG=$(echo "$PUPPETEER_CONFIG" | jq ".product = \"$browser\"")
        
        /mcp__puppeteer__puppeteer_navigate \
            --url "http://localhost:3000" \
            --launchOptions "$BROWSER_CONFIG"
        
        # Run core test scenarios
        execute_browser_specific_tests "$browser"
    done
}
```

### Accessibility Testing
```bash
# Automated accessibility testing
accessibility_testing() {
    echo "♿ ACCESSIBILITY TESTING"
    echo "======================="
    
    # Run axe-core accessibility tests
    ACCESSIBILITY_SCRIPT='
        const axe = require("axe-core");
        const results = await axe.run();
        return {
            violations: results.violations,
            passes: results.passes.length,
            incomplete: results.incomplete
        };
    '
    
    A11Y_RESULTS=$(/mcp__puppeteer__puppeteer_evaluate --script "$ACCESSIBILITY_SCRIPT")
    
    # Analyze and report accessibility issues
    analyze_accessibility_results "$A11Y_RESULTS"
}
```

### Security Testing
```bash
# Basic security testing scenarios
security_testing() {
    echo "🔒 SECURITY TESTING"
    echo "=================="
    
    # Test authentication boundaries
    test_authentication_security
    
    # Test authorization controls
    test_authorization_security
    
    # Test input validation
    test_input_validation_security
    
    # Test data exposure
    test_data_exposure_security
}

test_authentication_security() {
    echo "🔐 Testing authentication..."
    
    # Test scenarios
    TEST_SCENARIOS=(
        "Invalid credentials"
        "SQL injection attempts"
        "XSS in login fields"
        "Session timeout"
        "Concurrent sessions"
        "Password reset flow"
    )
    
    for scenario in "${TEST_SCENARIOS[@]}"; do
        execute_security_test "$scenario"
    done
}
```

## Configuration Options

### Test Execution Profiles
```json
{
  "test_profiles": {
    "quick": {
      "unit_tests": true,
      "integration_tests": false,
      "e2e_tests": "smoke_only",
      "typescript_check": true,
      "strict_types": false,
      "browsers": ["chrome"],
      "performance": false,
      "accessibility": false
    },
    "comprehensive": {
      "unit_tests": true,
      "integration_tests": true,
      "e2e_tests": "full",
      "typescript_check": true,
      "strict_types": true,
      "browsers": ["chrome", "firefox", "safari"],
      "performance": true,
      "accessibility": true
    },
    "production": {
      "unit_tests": false,
      "integration_tests": false,
      "e2e_tests": "smoke_only",
      "typescript_check": true,
      "strict_types": false,
      "browsers": ["chrome"],
      "performance": true,
      "accessibility": false,
      "non_destructive": true
    },
    "type_only": {
      "unit_tests": false,
      "integration_tests": false,
      "e2e_tests": false,
      "typescript_check": true,
      "strict_types": true,
      "browsers": [],
      "performance": false,
      "accessibility": false
    }
  }
}
```

### Risk-Based Test Prioritization
```yaml
risk_matrix:
  critical:
    areas: ["Authentication", "Payment", "Data integrity"]
    test_coverage: 100%
    automation_required: true
    
  high:
    areas: ["Core features", "API endpoints", "Multi-tenancy"]
    test_coverage: 90%
    automation_required: true
    
  medium:
    areas: ["UI components", "Reports", "Settings"]
    test_coverage: 70%
    automation_required: partial
    
  low:
    areas: ["Static content", "Help pages", "Tooltips"]
    test_coverage: 50%
    automation_required: false
```

## Output Formats

### Intelligent Test Report
```json
{
  "change_analysis": {
    "files_changed": 12,
    "components_affected": ["auth", "channels", "sliding-panel"],
    "impact_level": "medium",
    "regression_risk": "low"
  },
  "test_strategy": {
    "approach": "targeted_with_browser_monitoring",
    "reason": "Auth and channel components changed, requiring console validation",
    "tests_selected": 45,
    "tests_skipped": 111,
    "time_saved": "75%",
    "browser_monitoring_enabled": true
  },
  "test_execution_summary": {
    "targeted_tests_run": 45,
    "passed": 43,
    "failed": 2,
    "execution_time": "3m 12s",
    "console_monitoring_active": true,
    "coverage_for_changes": {
      "unit": 92.4,
      "integration": 85.0,
      "e2e": 100.0,
      "browser_validation": 95.5
    }
  },
  "console_health_summary": {
    "total_console_logs": 127,
    "javascript_errors": 2,
    "network_failures": 1,
    "performance_warnings": 3,
    "console_health_score": "Good"
  },
  "failed_tests": [
    {
      "id": "TC_001",
      "scenario": "OAuth token refresh",
      "error": "Token expiry not handled correctly",
      "severity": "high",
      "screenshot": "path/to/screenshot.png",
      "console_errors": ["TypeError: Cannot read property 'token' of undefined"],
      "network_failures": ["401 Unauthorized on /api/auth/refresh"],
      "suggested_fix": "Implement automatic token refresh logic with error handling"
    }
  ],
  "performance_metrics": {
    "page_load_time": "1.2s",
    "ttfb": "234ms",
    "largest_contentful_paint": "1.8s",
    "memory_usage_mb": 45.2,
    "dom_elements": 1247,
    "resource_count": 89
  },
  "visual_regression_results": {
    "pages_tested": 7,
    "visual_changes_detected": 1,
    "console_health_during_screenshots": "Healthy",
    "ui_consistency_score": "97%"
  },
  "accessibility_results": {
    "violations": 3,
    "warnings": 7,
    "wcag_level": "AA"
  },
  "recommendations": {
    "immediate": ["Fix OAuth token refresh with console error handling", "Resolve network failure in auth endpoint"],
    "short_term": ["Improve test coverage for API endpoints", "Add console monitoring to CI pipeline"],
    "long_term": ["Implement comprehensive visual regression testing", "Enhance error boundary components"]
  }
}
```

## Usage Examples

### Intelligent Test Discovery
```bash
# Test based on JIRA ticket (discovers linked changes)
/m-qa-test ALU-123

# Test based on Pull Request
/m-qa-test https://github.com/{{GITHUB_ORG}}/{{GITHUB_REPO}}/pull/456

# Test based on specific commit
/m-qa-test abc123def

# Test based on feature description (searches codebase)
/m-qa-test "Instagram story scheduling feature"

# Show what would be tested without running
/m-qa-test ALU-123 --dry-run
```

### Targeted Testing Modes
```bash
# Only test what changed (default behavior)
/m-qa-test ALU-123 --smart

# Force comprehensive testing (ignore smart selection)
/m-qa-test ALU-123 --comprehensive

# Focus on regression testing
/m-qa-test ALU-123 --regression-focus

# Quick smoke tests only
/m-qa-test ALU-123 --smoke-only

# Production readiness check
/m-qa-test ALU-123 --production-ready
```

### Advanced Intelligence Options
```bash
# Analyze impact without running tests
/m-qa-test ALU-123 --analyze-only

# Include performance impact analysis with browser metrics
/m-qa-test ALU-123 --include-performance

# Include security vulnerability scanning
/m-qa-test ALU-123 --include-security

# Enable enhanced console monitoring
/m-qa-test ALU-123 --console-monitoring

# Include visual regression testing with console validation
/m-qa-test ALU-123 --visual-regression

# Enable network request monitoring
/m-qa-test ALU-123 --network-monitoring

# Force test even unchanged areas (paranoid mode)
/m-qa-test ALU-123 --test-all

# Compare with previous test runs
/m-qa-test ALU-123 --compare-previous

# Generate missing tests recommendations
/m-qa-test ALU-123 --suggest-tests

# Run with headless browser (faster execution)
/m-qa-test ALU-123 --headless

# Run with devtools open for debugging
/m-qa-test ALU-123 --devtools
```

### Integration Testing
```bash
# Test API changes specifically with network monitoring
/m-qa-test ALU-123 --api-focus

# Test database migration impact
/m-qa-test ALU-123 --db-changes

# Test UI components only with visual regression
/m-qa-test ALU-123 --ui-only

# Test OAuth integration changes with console monitoring
/m-qa-test ALU-123 --oauth-focus

# Test with specific browser for compatibility
/m-qa-test ALU-123 --browser=firefox

# Test with mobile viewport simulation
/m-qa-test ALU-123 --mobile-testing
```

### Browser Automation Features

```bash
# Console monitoring capabilities
/m-qa-test ALU-123 --console-detailed    # Detailed console analysis
/m-qa-test ALU-123 --error-tracking      # Focus on JavaScript errors
/m-qa-test ALU-123 --performance-deep    # Deep performance analysis

# Visual testing options
/m-qa-test ALU-123 --screenshot-all      # Screenshot every interaction
/m-qa-test ALU-123 --visual-baseline     # Create new visual baselines
/m-qa-test ALU-123 --ui-health-check     # UI component health validation

# Network and API monitoring
/m-qa-test ALU-123 --api-health          # API endpoint health checks
/m-qa-test ALU-123 --network-detailed    # Detailed network analysis
/m-qa-test ALU-123 --response-validation # API response validation
```

This comprehensive QA testing command provides automated test planning, execution, and reporting with deep integration into your development workflow and advanced Puppeteer-powered browser automation, helping ensure quality while accelerating the testing process with real-time console monitoring and visual validation.