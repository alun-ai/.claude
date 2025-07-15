# Build Error Fix Workflow: Local, Production, and CircleCI Build Issues

**Target:** $ARGUMENTS (Default: detect build type automatically)

**Scope:** Comprehensive build error detection and fixing across local development, production builds, and CircleCI environments

## Overview

Transforms Claude into an expert Build Engineer with comprehensive knowledge of Next.js, TypeScript, Node.js, and CI/CD systems. This command provides intelligent build error detection, analysis, and fixing across local development, production builds, and CircleCI environments using advanced MCP integrations.

**Key Benefits:**
- **Multi-Environment Support**: Local dev, production, and CI/CD build fixing
- **AI-Powered Analysis**: Intelligent error analysis with Gemini AI integration
- **CircleCI Integration**: Advanced CI/CD build failure analysis via MCP agent
- **Progressive Fixing**: Systematic approach from quick fixes to deep analysis
- **Comprehensive Verification**: Multi-level testing to ensure fixes work

## Help Documentation

To see this help documentation, run:
```bash
/m-fix-build --help
```

## Core Features

### 1. Intelligent Build Detection
- **Environment Recognition**: Auto-detect local, production, or CI build context
- **Tool Identification**: Recognize Next.js, npm, yarn, TypeScript build systems
- **Error Classification**: Categorize build errors by type and severity
- **Context Analysis**: Understand project structure and build requirements

### 2. Multi-Platform Error Analysis
- **Local Development**: Next.js dev server, hot reload, and dependency issues
- **Production Builds**: Optimization, bundling, and deployment preparation
- **CircleCI Integration**: CI/CD pipeline failures and environment issues
- **Cross-Platform**: Consistent error patterns across different environments

### 3. Advanced MCP Integration
- **CircleCI MCP Agent**: Real-time CI build failure logs and analysis
- **Gemini AI Analysis**: Intelligent error interpretation and fix suggestions
- **Filesystem Operations**: Automated file system cleanup and optimization
- **Configuration Validation**: YAML and JSON configuration file analysis

### 4. Progressive Fix Strategy
- **Quick Fixes**: Immediate cache clearing and dependency refresh
- **Configuration Fixes**: Package.json, tsconfig.json, and build config updates
- **Dependency Management**: Version conflicts and compatibility resolution
- **Deep Analysis**: AI-powered comprehensive error analysis and solutions

## Usage Examples

### Basic Build Fixing
```bash
# Auto-detect and fix build issues
/m-fix-build

# Fix specific build type
/m-fix-build local
/m-fix-build production
/m-fix-build circleci

# Force full clean and rebuild
/m-fix-build --full-clean
```

### Environment-Specific Fixes
```bash
# Local development issues
/m-fix-build --dev-server

# Production build optimization
/m-fix-build --production --optimize

# CircleCI pipeline fixes
/m-fix-build --ci --config-fix
```

### Advanced Options
```bash
# Skip certain fix types
/m-fix-build --skip-cache-clear
/m-fix-build --skip-dependencies

# Focus on specific error types
/m-fix-build --typescript-only
/m-fix-build --eslint-only
/m-fix-build --memory-issues
```

## Command Options

```yaml
build_scope:
  local: "Fix local development server issues"
  production: "Fix production build problems"
  circleci: "Fix CircleCI pipeline failures"
  all: "Comprehensive fix across all environments (default)"

fix_intensity:
  --quick: "Quick fixes only (cache, restart)"
  --standard: "Standard fix process (default)"
  --deep: "Deep analysis with AI and comprehensive fixes"
  --full-clean: "Complete environment reset and rebuild"

error_focus:
  --typescript-only: "Focus on TypeScript compilation errors"
  --eslint-only: "Focus on linting and code quality issues"
  --dependency-only: "Focus on package and dependency conflicts"
  --memory-issues: "Focus on memory and performance problems"
  --config-only: "Focus on configuration file issues"

skip_options:
  --skip-cache-clear: "Skip cache clearing operations"
  --skip-dependencies: "Skip dependency reinstallation"
  --skip-verification: "Skip post-fix verification tests"
  --skip-ai-analysis: "Skip AI-powered error analysis"

ci_options:
  --config-fix: "Fix CircleCI configuration issues"
  --env-vars: "Check and fix environment variable issues"
  --flaky-tests: "Analyze and fix flaky test patterns"
  --pipeline-optimize: "Optimize CI pipeline performance"

output_control:
  --verbose: "Detailed progress and error information"
  --quiet: "Minimal output, focus on results"
  --report-only: "Generate analysis report without fixes"
  --json-output: "Output results in JSON format"
```

## Build Error Detection Strategy

### Automatic Build Context Detection
1. **Local Development** - Next.js development server and build issues
2. **Production Build** - `npm run build` failures and deployment issues  
3. **CircleCI Build** - CI/CD pipeline failures using MCP CircleCI agent

### MCP Integration Strategy

#### CircleCI MCP Agent Integration
**Uses MCP CircleCI agent for CI build error analysis and fixing:**

```bash
# Check for CircleCI MCP agent availability
if command -v mcp__circleci-mcp-server__get_build_failure_logs &> /dev/null; then
    echo "CircleCI MCP agent available - analyzing CI build failures..."
    
    # Get build failure logs
    mcp__circleci-mcp-server__get_build_failure_logs
    
    # Analyze flaky tests if needed
    mcp__circleci-mcp-server__find_flaky_tests
    
    # Get latest pipeline status
    mcp__circleci-mcp-server__get_latest_pipeline_status
else
    echo "CircleCI MCP agent not available - focusing on local/production builds..."
fi
```

#### Gemini AI Integration for Error Analysis
**Uses MCP Gemini agent for intelligent error analysis:**

```bash
# AI-powered build error analysis
if command -v mcp__gemini__gemini-analyze-code &> /dev/null; then
    echo "Using Gemini AI for build error analysis..."
    
    # Analyze build errors with AI
    mcp__gemini__gemini-analyze-code "Analyze these build errors and provide specific fixes:
    
    ${BUILD_ERRORS}
    
    Focus on:
    1. TypeScript compilation errors
    2. ESLint and linting issues
    3. Import/export resolution problems
    4. Dependency conflicts
    5. Configuration issues
    6. Performance optimization opportunities
    
    Provide specific code fixes and configuration changes."
else
    echo "Gemini AI not available - using native analysis..."
fi
```

## Execution Steps

### 1. Build Context Detection
- **Auto-detect build environment** (local dev, production, CI)
- **Identify build tool** (Next.js, npm, yarn, etc.)
- **Check for existing build processes** running

### 2. Local Build Error Fixing

#### Next.js Development Server Issues
```bash
# Check for dev server errors
if pgrep -f "next dev" > /dev/null; then
    echo "Next.js dev server running - checking for errors..."
    # Analyze dev server logs
    pm2 logs next-dev --lines 50 2>/dev/null || echo "No PM2 logs found"
fi

# Common Next.js dev fixes
echo "Fixing common Next.js development issues..."

# Clear Next.js cache
rm -rf .next/
echo "✓ Cleared Next.js cache"

# Clear node_modules and reinstall
if [ "$ARGUMENTS" = "--full-clean" ]; then
    rm -rf node_modules package-lock.json
    npm install
    echo "✓ Full dependency reinstall completed"
fi

# Check for port conflicts
if lsof -ti:3000 > /dev/null; then
    echo "Port 3000 in use - killing processes..."
    kill -9 $(lsof -ti:3000)
    echo "✓ Port 3000 freed"
fi
```

#### TypeScript Compilation Errors
```bash
# Run TypeScript type checking
echo "Running TypeScript type checking..."
npx tsc --noEmit --skipLibCheck

# Fix common TypeScript issues
echo "Analyzing TypeScript errors..."
TSC_OUTPUT=$(npx tsc --noEmit --skipLibCheck 2>&1)

if [[ $TSC_OUTPUT == *"error"* ]]; then
    echo "TypeScript errors found - analyzing with AI..."
    
    # Use Gemini AI to analyze TypeScript errors
    mcp__gemini__gemini-analyze-code "Fix these TypeScript compilation errors:
    
    ${TSC_OUTPUT}
    
    Provide specific fixes for:
    - Type definition issues
    - Import/export problems
    - Missing type annotations
    - Generic type constraints
    - Interface compatibility issues"
fi
```

### 3. Production Build Error Fixing

#### Next.js Production Build Issues
```bash
# Run production build with detailed output
echo "Running production build analysis..."
BUILD_OUTPUT=$(npm run build 2>&1)

if [[ $BUILD_OUTPUT == *"Error"* ]] || [[ $BUILD_OUTPUT == *"error"* ]]; then
    echo "Production build failed - analyzing errors..."
    
    # Common production build fixes
    echo "Applying common production build fixes..."
    
    # Check for memory issues
    if [[ $BUILD_OUTPUT == *"heap out of memory"* ]]; then
        echo "Memory issue detected - increasing Node.js memory limit..."
        export NODE_OPTIONS="--max-old-space-size=4096"
        npm run build
    fi
    
    # Check for import/export issues
    if [[ $BUILD_OUTPUT == *"Module not found"* ]]; then
        echo "Module resolution issues detected..."
        # Use AI to analyze module issues
        mcp__gemini__gemini-analyze-code "Fix these module resolution errors:
        
        ${BUILD_OUTPUT}
        
        Focus on:
        - Missing dependencies
        - Incorrect import paths
        - Case sensitivity issues
        - ES module compatibility"
    fi
    
    # Check for static analysis issues
    if [[ $BUILD_OUTPUT == *"ESLint"* ]]; then
        echo "ESLint errors in production build..."
        npm run lint --fix
    fi
fi
```

#### Bundle Size and Performance Issues
```bash
# Analyze bundle size issues
echo "Analyzing bundle size and performance..."

# Check for large dependencies
npx next-bundle-analyzer || echo "Bundle analyzer not available"

# Check for duplicate dependencies
npx npm-check-updates --doctor || echo "Dependency check not available"

# Optimize build performance
echo "Optimizing build configuration..."
```

### 4. CircleCI Build Error Fixing

#### CircleCI Error Analysis
```bash
# Use CircleCI MCP agent for comprehensive CI analysis
if command -v mcp__circleci-mcp-server__get_build_failure_logs &> /dev/null; then
    echo "Analyzing CircleCI build failures..."
    
    # Get build failure logs with truncation handling
    CIRCLECI_LOGS=$(mcp__circleci-mcp-server__get_build_failure_logs)
    
    # Check for truncation warning
    if [[ $CIRCLECI_LOGS == *"MCPTruncationWarning"* ]]; then
        echo "WARNING: CircleCI logs have been truncated. Only showing recent entries."
        echo "Earlier build failures may not be visible."
    fi
    
    # Analyze CI-specific issues
    if [[ $CIRCLECI_LOGS == *"npm ERR!"* ]]; then
        echo "NPM errors detected in CircleCI..."
        # Fix package-lock.json issues
        rm -f package-lock.json
        npm install --package-lock-only
        git add package-lock.json
        git commit -m "fix: update package-lock.json for CircleCI compatibility"
    fi
    
    # Check for environment variable issues
    if [[ $CIRCLECI_LOGS == *"Environment variable"* ]]; then
        echo "Environment variable issues detected..."
        echo "Check CircleCI environment variables configuration"
    fi
    
    # Analyze flaky tests
    FLAKY_TESTS=$(mcp__circleci-mcp-server__find_flaky_tests)
    if [[ $FLAKY_TESTS == *"flaky"* ]]; then
        echo "Flaky tests detected - analyzing patterns..."
        
        # Use AI to analyze flaky test patterns
        mcp__gemini__gemini-analyze-code "Analyze these flaky test patterns and provide fixes:
        
        ${FLAKY_TESTS}
        
        Focus on:
        - Timing issues and race conditions
        - Test isolation problems
        - Mock and stub reliability
        - Async/await handling
        - Resource cleanup issues"
    fi
fi
```

#### CircleCI Configuration Fixes
```bash
# Check and fix CircleCI configuration
if [ -f ".circleci/config.yml" ]; then
    echo "Analyzing CircleCI configuration..."
    
    # Use CircleCI config helper if available
    if command -v mcp__circleci-mcp-server__config_helper &> /dev/null; then
        CONFIG_CONTENT=$(cat .circleci/config.yml)
        mcp__circleci-mcp-server__config_helper --configFile "$CONFIG_CONTENT"
    fi
    
    # Common CircleCI fixes
    echo "Applying common CircleCI configuration fixes..."
    
    # Check Node.js version compatibility
    if grep -q "node:12" .circleci/config.yml; then
        echo "Updating Node.js version in CircleCI config..."
        sed -i 's/node:12/node:18/g' .circleci/config.yml
    fi
    
    # Check for cache configuration
    if ! grep -q "restore_cache" .circleci/config.yml; then
        echo "Adding dependency caching to CircleCI config..."
        # Add cache configuration
    fi
fi
```

### 5. Comprehensive Error Recovery

#### Multi-Level Error Handling
```bash
# Progressive error fixing strategy
echo "Implementing progressive error fixing..."

# Level 1: Quick fixes
echo "Level 1: Quick fixes and cache clearing..."
rm -rf .next/ node_modules/.cache/

# Level 2: Dependency management
echo "Level 2: Dependency analysis and updates..."
npm audit fix --force

# Level 3: Configuration validation
echo "Level 3: Configuration validation..."
npx next lint --fix

# Level 4: AI-powered analysis
echo "Level 4: AI-powered comprehensive analysis..."
if command -v mcp__gemini__gemini-analyze-code &> /dev/null; then
    mcp__gemini__gemini-analyze-code "Perform comprehensive build error analysis:
    
    Current project state:
    - Next.js 15.3.4 with React 19
    - TypeScript 5 with strict configuration
    - Tailwind CSS 4
    - Supabase integration
    - Stripe payments
    - Multi-tenant architecture
    
    Analyze for:
    1. Version compatibility issues
    2. Configuration conflicts
    3. Performance bottlenecks
    4. Security vulnerabilities
    5. Build optimization opportunities
    
    Provide specific, actionable fixes with code examples."
fi
```

### 6. Build Verification and Testing

#### Post-Fix Verification
```bash
# Verify fixes across all build types
echo "Verifying build fixes..."

# Test local development
echo "Testing local development build..."
timeout 30s npm run dev &
DEV_PID=$!
sleep 10
if ps -p $DEV_PID > /dev/null; then
    echo "✓ Local development server started successfully"
    kill $DEV_PID
else
    echo "✗ Local development server failed to start"
fi

# Test production build
echo "Testing production build..."
npm run build
if [ $? -eq 0 ]; then
    echo "✓ Production build successful"
else
    echo "✗ Production build failed"
fi

# Test linting
echo "Testing linting..."
npm run lint
if [ $? -eq 0 ]; then
    echo "✓ Linting passed"
else
    echo "✗ Linting failed"
fi

# Test TypeScript compilation
echo "Testing TypeScript compilation..."
npx tsc --noEmit --skipLibCheck
if [ $? -eq 0 ]; then
    echo "✓ TypeScript compilation successful"
else
    echo "✗ TypeScript compilation failed"
fi
```

## Output Format

### Build Fix Report
Generate a comprehensive report including:

#### `buildContext`
- Detected build environment (local/production/CI)
- Build tool identification
- Error source analysis

#### `errorsFound`
- Categorized error types
- Severity assessment
- Root cause analysis

#### `fixesApplied`
- Specific fixes implemented
- Configuration changes made
- Dependency updates performed

#### `verificationResults`
- Build success status
- Performance improvements
- Remaining issues

#### `recommendedActions`
- Preventive measures
- Configuration improvements
- CI/CD optimizations

### CircleCI Integration Report
If CircleCI MCP agent is available:

#### `ciAnalysis`
- Pipeline failure analysis
- Flaky test identification
- Environment issues detected

#### `ciFixesApplied`
- Configuration updates
- Environment variable fixes
- Test stability improvements

#### `ciRecommendations`
- Pipeline optimization suggestions
- Performance improvements
- Monitoring recommendations

## Final Output

Save the complete build fix report to:
`docs/workspaces/build-fix-$(date +%m-%d-%H-%M-%S).md`

Display summary of:
- ✅ Successful fixes applied
- ⚠️ Remaining issues requiring attention
- 🔄 Recommended follow-up actions
- 📊 Build performance improvements

## Environment Requirements

### Local Development
- Node.js 18+
- npm or yarn
- Next.js 15.3.4+

### MCP Agent Requirements
- **CircleCI MCP Agent**: For CI/CD build error analysis
- **Gemini AI MCP Agent**: For intelligent error analysis
- **Filesystem MCP Agent**: For file operations

### Optional Integrations
- **GitHub MCP Agent**: For repository-based fixes
- **Supabase MCP Agent**: For database-related build issues
- **Notion MCP Agent**: For documentation updates