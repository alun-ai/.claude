# Automated Project Hygiene Workflow: Intelligent Codebase Maintenance

**Cleanup Scope:** $ARGUMENTS

**Scope:** Comprehensive project maintenance with intelligent analysis and automated cleanup across all project dimensions

If no scope is specified, a comprehensive cleanup of the entire project is performed by default.
Supported scopes: `code`, `dependencies`, `structure`, `artifacts`, `config`, `all`.
Example: "dependencies code"

## Overview

Transforms Claude into a Senior DevOps Engineer with expertise in project maintenance, code quality, and technical debt management. This command provides intelligent, comprehensive cleanup across all aspects of a software project, from dead code elimination to dependency optimization and structural improvements.

**Key Benefits:**
- **Intelligent Code Analysis**: AI-powered detection of unused code, imports, and dependencies
- **Comprehensive Maintenance**: Full-spectrum cleanup from code to infrastructure
- **Safe Automation**: Conservative approach with backup and rollback capabilities
- **Performance Optimization**: Reduce project size and improve build/runtime performance
- **Technical Debt Reduction**: Systematic approach to maintaining code quality

## Help Documentation

To see this help documentation, run:
```bash
/m-project-cleanup --help
```

## Core Features

### 1. Intelligent Dead Code Elimination
- **Static Analysis**: Advanced analysis to identify truly unused code
- **Safe Removal**: Conservative approach with thorough testing
- **Import Optimization**: Clean up unused imports and dependencies
- **Function-Level Analysis**: Detect unused functions, classes, and variables

### 2. Smart Dependency Management
- **Unused Dependency Detection**: Identify packages not actually used in code
- **Version Optimization**: Suggest updates for outdated dependencies
- **Security Vulnerability Scanning**: Check for known security issues
- **Dependency Tree Analysis**: Optimize dependency relationships

### 3. Automated Code Quality Improvements
- **Consistent Formatting**: Apply project-wide formatting standards
- **Linting Automation**: Fix automatically correctable linting issues
- **Style Enforcement**: Ensure consistent coding style across the project
- **Documentation Updates**: Update comments and documentation

### 4. Structural Organization and Optimization
- **File Structure Analysis**: Reorganize files following best practices
- **Directory Optimization**: Improve project layout for maintainability
- **Module Organization**: Restructure imports and module relationships
- **Architecture Compliance**: Align structure with architectural patterns

## Usage Examples

### Basic Cleanup Operations
```bash
# Comprehensive project cleanup
/m-project-cleanup

# Focus on specific areas
/m-project-cleanup code
/m-project-cleanup dependencies
/m-project-cleanup structure
```

### Targeted Cleanup
```bash
# Code and dependency cleanup only
/m-project-cleanup "code dependencies"

# Artifacts and cache clearing
/m-project-cleanup artifacts

# Configuration files cleanup
/m-project-cleanup config
```

### Advanced Options
```bash
# Aggressive cleanup with advanced optimizations
/m-project-cleanup --aggressive

# Safe mode with extra validation
/m-project-cleanup --safe-mode

# Preview changes without applying
/m-project-cleanup --dry-run
```

## Command Options

```yaml
cleanup_scope:
  code: "Dead code elimination and import optimization"
  dependencies: "Dependency pruning, updates, and security scanning"
  structure: "File and directory reorganization"
  artifacts: "Build artifacts, logs, and cache clearing"
  config: "Configuration file cleanup and optimization"
  all: "Comprehensive cleanup across all areas (default)"

cleanup_intensity:
  --conservative: "Safe cleanup with minimal changes"
  --standard: "Balanced approach with good coverage (default)"
  --aggressive: "Thorough cleanup with advanced optimizations"
  --safe-mode: "Extra validation and backup creation"

analysis_options:
  --dry-run: "Preview changes without applying them"
  --interactive: "Interactive mode for selective cleanup"
  --auto-approve: "Automatically approve safe changes"
  --detailed-report: "Generate comprehensive cleanup report"

dependency_options:
  --update-minor: "Update to latest minor versions"
  --update-patch: "Update to latest patch versions only"
  --security-only: "Only update dependencies with security issues"
  --audit-report: "Generate detailed dependency audit report"

code_quality_options:
  --format-all: "Apply formatting to all files"
  --fix-linting: "Automatically fix linting issues"
  --optimize-imports: "Optimize and sort import statements"
  --update-docs: "Update inline documentation and comments"

structural_options:
  --reorganize-files: "Reorganize files following best practices"
  --optimize-modules: "Optimize module structure and relationships"
  --architecture-align: "Align structure with architectural patterns"
  --naming-conventions: "Enforce consistent naming conventions"

artifact_cleanup:
  --clear-build: "Clear all build artifacts and temporary files"
  --clear-logs: "Remove old log files and debug output"
  --clear-cache: "Clear all cache directories and files"
  --clear-temp: "Remove temporary and intermediate files"

backup_options:
  --create-backup: "Create full backup before cleanup"
  --git-stash: "Stash changes before cleanup"
  --branch-backup: "Create backup branch before cleanup"
  --no-backup: "Skip backup creation (not recommended)"
```

## Execution Framework

### 1. **Pre-Cleanup Analysis and Planning**
- **Project Assessment**: Analyze project type, size, and complexity
- **Risk Evaluation**: Identify high-risk areas requiring careful handling
- **Scope Determination**: Plan cleanup strategy based on specified scope
- **Backup Strategy**: Determine appropriate backup approach

### 2. **Intelligent Dead Code Detection**
- **Static Analysis**: Comprehensive code analysis to identify unused elements
- **Cross-Reference Checking**: Verify references across entire codebase
- **Test Coverage Analysis**: Ensure cleanup doesn't break existing tests
- **Safe Removal Planning**: Plan removal strategy with minimal impact

### 3. **Smart Dependency Management**
- **Usage Analysis**: Analyze actual dependency usage in codebase
- **Version Audit**: Check for outdated or vulnerable dependencies
- **Compatibility Assessment**: Ensure updates maintain compatibility
- **Security Scanning**: Identify and prioritize security vulnerabilities

### 4. **Code Quality Enhancement**
- **Formatting Application**: Apply consistent formatting across project
- **Linting Fixes**: Automatically resolve linting issues where safe
- **Style Consistency**: Enforce coding standards and conventions
- **Documentation Updates**: Refresh comments and documentation

### 5. **Structural Optimization**
- **File Organization**: Reorganize files following best practices
- **Module Restructuring**: Optimize import relationships and dependencies
- **Architecture Alignment**: Ensure structure follows architectural principles
- **Performance Optimization**: Remove bottlenecks and improve efficiency

### 6. **Artifact and Cache Management**
- **Build Cleanup**: Remove stale build artifacts and intermediate files
- **Log Management**: Archive or remove old log files
- **Cache Optimization**: Clear outdated cache entries
- **Temporary File Removal**: Clean up temporary and debug files

## Cleanup Categories and Strategies

### Code Cleanup Patterns
```yaml
code_cleanup:
  dead_code_elimination:
    targets: ["unused_functions", "unused_classes", "unused_variables"]
    analysis: ["static_analysis", "cross_reference_check", "test_coverage"]
    safety: ["backup_creation", "incremental_removal", "test_validation"]
    
  import_optimization:
    targets: ["unused_imports", "redundant_imports", "import_sorting"]
    analysis: ["dependency_tracking", "usage_analysis"]
    optimization: ["consolidation", "tree_shaking", "lazy_loading"]
    
  code_style_enforcement:
    targets: ["formatting", "naming_conventions", "code_structure"]
    tools: ["prettier", "eslint", "typescript_compiler"]
    automation: ["auto_fix", "style_guide_enforcement"]
```

### Dependency Management Strategies
```yaml
dependency_management:
  unused_dependency_removal:
    detection: ["static_analysis", "build_analysis", "runtime_analysis"]
    verification: ["test_execution", "build_validation"]
    removal: ["gradual_removal", "compatibility_check"]
    
  version_optimization:
    analysis: ["vulnerability_scan", "compatibility_check", "changelog_review"]
    strategy: ["security_first", "compatibility_preservation", "feature_enhancement"]
    testing: ["integration_tests", "regression_testing"]
    
  security_hardening:
    scanning: ["npm_audit", "snyk", "github_security"]
    prioritization: ["severity_assessment", "exploitability_analysis"]
    remediation: ["immediate_updates", "workaround_implementation"]
```

### Structural Optimization Patterns
```yaml
structural_optimization:
  file_organization:
    analysis: ["current_structure", "best_practices", "team_conventions"]
    reorganization: ["logical_grouping", "feature_based_structure"]
    validation: ["import_path_updates", "reference_integrity"]
    
  module_optimization:
    analysis: ["dependency_graph", "circular_dependencies", "coupling_analysis"]
    optimization: ["decoupling", "interface_definition", "dependency_injection"]
    validation: ["build_verification", "test_execution"]
    
  architecture_alignment:
    assessment: ["current_architecture", "target_architecture", "gap_analysis"]
    migration: ["incremental_refactoring", "interface_preservation"]
    validation: ["architectural_tests", "design_compliance"]
```

## Integration Features

### Development Tool Integration
- **IDE Support**: Work with VS Code, JetBrains, and other popular IDEs
- **Build System Integration**: Support for npm, yarn, webpack, and other build tools
- **Testing Framework Integration**: Ensure cleanup doesn't break existing tests
- **CI/CD Pipeline Integration**: Optimize for continuous integration workflows

### Version Control Integration
- **Git Integration**: Create backup branches and commits
- **Change Tracking**: Track all cleanup changes for review
- **Rollback Capability**: Easy rollback if issues are discovered
- **Commit Message Generation**: Descriptive commit messages for cleanup changes

### Quality Assurance Tools
- **Automated Testing**: Run test suites to validate cleanup safety
- **Static Analysis**: Use advanced static analysis tools
- **Performance Monitoring**: Track performance impact of cleanup
- **Security Scanning**: Continuous security analysis during cleanup

## Best Practices

### Safe Cleanup Practices
1. **Always Backup**: Create backups before significant cleanup
2. **Incremental Approach**: Make changes gradually and test frequently
3. **Test Thoroughly**: Run full test suite after each cleanup phase
4. **Review Changes**: Carefully review all automated changes

### Performance Optimization
1. **Profile Before/After**: Measure performance impact of cleanup
2. **Focus on Bottlenecks**: Prioritize high-impact cleanup areas
3. **Monitor Resource Usage**: Track memory and CPU usage improvements
4. **Validate Benefits**: Ensure cleanup provides measurable benefits

### Team Collaboration
1. **Communicate Changes**: Keep team informed of cleanup activities
2. **Document Decisions**: Record reasoning for significant changes
3. **Share Knowledge**: Educate team on cleanup best practices
4. **Establish Standards**: Create guidelines for ongoing maintenance

## Commands:

1. **Dead Code Elimination** - Analyze the codebase to identify and safely remove unused functions, classes, variables, and imports.

2. **Dependency Pruning & Update** - Scan dependency files (e.g., `package.json`, `go.mod`) to find and remove unused packages and suggest updates for outdated ones.

3. **Codebase Formatting & Linting** - Apply standard formatters and linters across the project to enforce consistent coding style.

4. **Structural Reorganization** - Analyze and reorganize files and directories based on best practices to improve project clarity and maintainability.

5. **Artifact & Cache Clearing** - Delete temporary build artifacts, logs, and cache files to reduce project size and avoid conflicts.