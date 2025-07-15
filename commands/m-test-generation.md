# Test Generation Workflow: AI-Powered Comprehensive Test Creation

**Test type and target:** $ARGUMENTS

**Scope:** Intelligent test generation using AI analysis to create comprehensive test suites across unit, integration, and E2E testing

## Overview

Transforms Claude into a Senior Test Engineer with expertise in test-driven development, creating intelligent, comprehensive test suites tailored to your codebase. This command analyzes code structure, identifies testing gaps, and generates high-quality tests with proper mocking, edge cases, and integration scenarios.

**Key Benefits:**
- **AI-Powered Analysis**: Deep code understanding for contextual test generation
- **Comprehensive Coverage**: Unit, integration, and E2E test creation
- **Smart Test Design**: Proper mocking, edge cases, and error scenarios
- **Framework Agnostic**: Supports Jest, React Testing Library, Puppeteer, and more
- **Gap Detection**: Identifies untested code paths and missing scenarios

## Help Documentation

To see this help documentation, run:
```bash
/m-test-generation --help
```

## Core Features

### 1. Intelligent Test Analysis
- **Code Structure Analysis**: Understand component dependencies and data flow
- **Coverage Gap Detection**: Identify untested functions and code paths
- **Risk Assessment**: Prioritize critical code areas for testing
- **Pattern Recognition**: Detect testing patterns and anti-patterns

### 2. Multi-Level Test Generation
- **Unit Tests**: Component and function-level testing with mocks
- **Integration Tests**: API endpoints, database operations, service interactions
- **E2E Tests**: Complete user workflows and critical paths
- **Visual Tests**: Component rendering and regression testing

### 3. Smart Test Design
- **Edge Case Detection**: Boundary conditions and error scenarios
- **Mock Generation**: Intelligent dependency mocking and stubbing
- **Data-Driven Tests**: Parameterized tests with multiple input sets
- **Async Testing**: Proper handling of promises and async operations

### 4. Framework Integration
- **Jest Configuration**: Advanced Jest setup with proper matchers
- **React Testing Library**: Component testing with user interactions
- **Puppeteer E2E**: Browser automation and visual testing
- **MSW Integration**: API mocking for realistic testing

## Usage Examples

### Basic Test Generation
```bash
# Generate tests for recently modified files
/m-test-generation

# Generate unit tests for specific component
/m-test-generation unit src/components/AuthButton.tsx

# Generate tests with coverage goal
/m-test-generation unit src/auth 90%
```

### Test Type Specific
```bash
# Unit tests only
/m-test-generation unit src/services/api.ts

# Integration tests
/m-test-generation integration api

# E2E user flows
/m-test-generation e2e user-authentication

# Visual regression tests
/m-test-generation visual src/components
```

### Comprehensive Generation
```bash
# All test types for component
/m-test-generation all src/components/Dashboard

# Full test suite for feature
/m-test-generation all src/features/channels

# Generate missing tests only
/m-test-generation missing --coverage-threshold 80%
```

### Advanced Options
```bash
# Generate with specific framework
/m-test-generation unit src/utils --framework jest

# Include performance tests
/m-test-generation unit src/api --include-performance

# Generate with mocks
/m-test-generation integration src/services --with-mocks
```

## Command Options

```yaml
test_types:
  unit: "Component and function-level unit tests"
  integration: "Service integration and API tests"
  e2e: "End-to-end user workflow tests"
  visual: "Visual regression and component rendering tests"
  performance: "Load and performance testing"
  all: "Generate all test types"
  missing: "Only generate tests for uncovered code"

target_scope:
  file: "Specific file or component path"
  directory: "All files in directory"
  feature: "Feature-based grouping"
  component: "React component with dependencies"
  service: "Service class with integrations"
  api: "API endpoints and routes"

coverage_options:
  --coverage-threshold: "Minimum coverage percentage (default: 80%)"
  --coverage-goal: "Target coverage percentage"
  --uncovered-only: "Generate tests only for uncovered code"
  --critical-paths: "Focus on business-critical code paths"

test_configuration:
  --framework: "Testing framework (jest/vitest/mocha)"
  --testing-library: "Component testing library (rtl/enzyme)"
  --mock-strategy: "Mocking approach (manual/auto/msw)"
  --async-patterns: "Async testing patterns"

output_options:
  --preview: "Show generated tests without creating files"
  --diff: "Show what tests would be added/updated"
  --dry-run: "Analyze and plan without generating"
  --verbose: "Detailed generation process information"

integration_options:
  --with-mocks: "Generate comprehensive mock setup"
  --include-performance: "Add performance testing scenarios"
  --include-accessibility: "Add a11y testing scenarios"
  --include-security: "Add security testing scenarios"
```

If no parameters specified, generate unit tests for recently modified files by default.
Format: [test-type] [target] [coverage-goal]
Examples: "unit src/auth 90%", "integration api", "e2e user-flow", "all components"