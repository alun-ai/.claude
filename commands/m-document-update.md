# Documentation Update Workflow: Intelligent Documentation Maintenance

**Documentation scope:** $ARGUMENTS

**Scope:** Comprehensive documentation maintenance with intelligent change detection and automated updates

## Overview

Transforms Claude into a Technical Documentation Specialist with expertise in maintaining accurate, up-to-date documentation across the entire software project. This command analyzes code changes, identifies documentation gaps, and automatically updates API docs, README files, changelogs, and inline comments.

**Key Benefits:**
- **Intelligent Change Detection**: Automatically identifies code changes requiring documentation updates
- **Multi-Format Support**: Updates API docs, README files, changelogs, and inline comments
- **Quality Assurance**: Validates documentation accuracy and consistency
- **Version Management**: Maintains proper changelog and version documentation
- **Cross-Reference Validation**: Ensures all links and references remain valid

## Help Documentation

To see this help documentation, run:
```bash
/m-document-update --help
```

## Core Features

### 1. Intelligent Change Detection
- **Code Analysis**: Scan recent commits and changes for documentation impact
- **API Diff Detection**: Identify function signature and interface changes
- **Breaking Change Recognition**: Flag changes that require special documentation
- **Scope-Based Filtering**: Focus on specific modules, APIs, or documentation types

### 2. Multi-Format Documentation Updates
- **API Documentation**: Auto-update function signatures, parameters, and examples
- **README Maintenance**: Keep installation, usage, and feature descriptions current
- **Changelog Generation**: Create comprehensive release notes and version history
- **Inline Comments**: Update code comments to reflect current functionality

### 3. Quality Assurance and Validation
- **Link Validation**: Check for broken links and outdated references
- **Consistency Checking**: Ensure documentation style and format consistency
- **Accuracy Verification**: Validate that documentation matches actual code behavior
- **Completeness Analysis**: Identify missing documentation for new features

### 4. Version and Release Management
- **Semantic Versioning**: Generate version-appropriate changelog entries
- **Release Documentation**: Create comprehensive release notes and migration guides
- **Breaking Change Alerts**: Highlight and document breaking changes clearly
- **Archive Management**: Maintain historical documentation versions

## Usage Examples

### Basic Documentation Updates
```bash
# Update all documentation based on recent changes
/m-document-update

# Update specific documentation type
/m-document-update api
/m-document-update readme
/m-document-update changelog
```

### Scope-Specific Updates
```bash
# Update docs for specific module
/m-document-update src/auth

# Update docs for specific feature
/m-document-update "OAuth integration"

# Update docs for recent commits
/m-document-update --since "2024-01-01"
```

### Comprehensive Documentation
```bash
# Full documentation audit and update
/m-document-update all

# Generate release documentation
/m-document-update --release-prep

# Validate all documentation
/m-document-update --validate-only
```

### Advanced Options
```bash
# Interactive mode for selective updates
/m-document-update --interactive

# Include breaking change analysis
/m-document-update --include-breaking

# Generate migration guide
/m-document-update --migration-guide
```

## Command Options

```yaml
documentation_scope:
  api: "API documentation and function signatures"
  readme: "README files and project documentation"
  changelog: "Version history and release notes"
  comments: "Inline code comments and documentation"
  all: "Complete documentation update (default)"
  module_path: "Specific file or directory path"

update_modes:
  --auto: "Automatic updates based on change detection"
  --interactive: "Interactive mode for selective updates"
  --validate-only: "Validation without making changes"
  --preview: "Show what would be updated without applying"

change_detection:
  --since: "Analyze changes since specific date (YYYY-MM-DD)"
  --commits: "Number of recent commits to analyze (default: 10)"
  --include-breaking: "Include breaking change analysis"
  --api-changes-only: "Focus on API and interface changes"

output_options:
  --release-prep: "Prepare comprehensive release documentation"
  --migration-guide: "Generate migration guide for breaking changes"
  --detailed-report: "Comprehensive documentation audit report"
  --summary-only: "Brief summary of updates made"

validation_options:
  --check-links: "Validate all external and internal links"
  --spell-check: "Run spell checking on documentation"
  --style-check: "Verify documentation style consistency"
  --accuracy-check: "Validate documentation against code"
```

## Execution Steps

### 1. **Change Analysis and Scope Detection**
- **Git Diff Analysis**: Examine recent commits for documentation-impacting changes
- **API Change Detection**: Identify function signature and interface modifications
- **Scope Determination**: Understand which documentation areas need updates
- **Priority Assessment**: Rank changes by documentation impact

### 2. **API Documentation Updates**
- **Function Signature Sync**: Update parameter lists, return types, and descriptions
- **Example Code Updates**: Refresh code examples to match current API
- **Type Definition Updates**: Sync TypeScript interfaces and type definitions
- **Error Code Documentation**: Update error handling and exception documentation

### 3. **README and Project Documentation**
- **Installation Instructions**: Update setup steps and requirements
- **Usage Examples**: Refresh examples to reflect current functionality
- **Feature Documentation**: Add documentation for new features and capabilities
- **Configuration Updates**: Update environment variables and configuration options

### 4. **Changelog and Version Documentation**
- **Release Notes Generation**: Create comprehensive changelog entries
- **Breaking Change Documentation**: Clearly document breaking changes and migrations
- **Version History Maintenance**: Update version history with proper semantic versioning
- **Migration Guide Creation**: Generate guides for major version upgrades

### 5. **Quality Assurance and Validation**
- **Link Validation**: Check all links for accessibility and accuracy
- **Content Accuracy**: Verify documentation matches actual code behavior
- **Style Consistency**: Ensure consistent formatting and style
- **Completeness Check**: Identify missing documentation areas

### 6. **Documentation Report Generation**
- **Update Summary**: Comprehensive report of all changes made
- **Quality Metrics**: Documentation coverage and quality assessment
- **Action Items**: Remaining documentation tasks requiring attention
- **Save to**: `docs/workspaces/documentation-update-YYYY-MM-DD.md`

## Documentation Types and Patterns

### API Documentation Standards
```yaml
api_documentation:
  function_docs:
    format: "JSDoc/TypeDoc standard"
    required_fields: ["description", "parameters", "returns", "examples"]
    optional_fields: ["since", "deprecated", "see_also"]
    
  interface_docs:
    format: "TypeScript interface documentation"
    required_fields: ["description", "properties", "usage_examples"]
    
  endpoint_docs:
    format: "OpenAPI/Swagger specification"
    required_fields: ["path", "method", "parameters", "responses"]
```

### README Structure Standards
```yaml
readme_sections:
  essential:
    - project_title_and_description
    - installation_instructions
    - quick_start_guide
    - usage_examples
    
  recommended:
    - features_overview
    - configuration_options
    - api_reference_links
    - contributing_guidelines
    
  optional:
    - troubleshooting_guide
    - changelog_summary
    - license_information
    - acknowledgments
```

### Changelog Standards
```yaml
changelog_format:
  versioning: "Semantic Versioning (semver)"
  categories:
    - added: "New features and functionality"
    - changed: "Changes in existing functionality"
    - deprecated: "Soon-to-be removed features"
    - removed: "Removed features"
    - fixed: "Bug fixes"
    - security: "Security vulnerability fixes"
    
  breaking_changes:
    format: "BREAKING CHANGE: description"
    migration_guide: "Required for major version changes"
```

## Integration Features

### Version Control Integration
- **Git History Analysis**: Analyze commit history for documentation needs
- **Branch Comparison**: Compare documentation across different branches
- **Merge Conflict Resolution**: Help resolve documentation merge conflicts
- **Automated Commits**: Generate appropriate commit messages for documentation updates

### Development Tool Integration
- **IDE Integration**: Work with VS Code, JetBrains, and other IDEs
- **Linting Integration**: Integrate with documentation linters
- **CI/CD Integration**: Support for automated documentation pipelines
- **Static Site Generators**: Support for Docusaurus, GitBook, and similar tools

### Quality Assurance Tools
- **Link Checking**: Automated broken link detection
- **Spell Checking**: Integrated spell checking for documentation
- **Style Guides**: Enforce documentation style consistency
- **Accessibility**: Ensure documentation meets accessibility standards

## Best Practices

### Documentation Maintenance
1. **Regular Updates**: Keep documentation current with code changes
2. **Version Synchronization**: Ensure documentation matches code versions
3. **User-Centric Writing**: Write from the user's perspective
4. **Example Completeness**: Provide working, tested examples

### Quality Standards
1. **Accuracy**: Documentation must reflect actual code behavior
2. **Completeness**: Cover all public APIs and user-facing features
3. **Clarity**: Use clear, concise language and good structure
4. **Consistency**: Maintain consistent style and formatting

### Change Management
1. **Breaking Change Documentation**: Clearly document breaking changes
2. **Migration Guides**: Provide clear migration paths for major changes
3. **Version History**: Maintain comprehensive changelog
4. **Deprecation Notices**: Properly document deprecated features

## Common Documentation Tasks

### API Changes
```markdown
# Before
```typescript
function authenticate(username: string, password: string): Promise<User>
```

# After  
```typescript
function authenticate(credentials: AuthCredentials): Promise<AuthResult>
```

**Breaking Change**: Authentication API now uses `AuthCredentials` object
**Migration**: Replace `authenticate(user, pass)` with `authenticate({username: user, password: pass})`
```

### Feature Addition
```markdown
## New Feature: OAuth Integration

Added support for OAuth 2.0 authentication with major social platforms.

### Usage
```typescript
import { OAuthProvider } from '@/lib/oauth';

const provider = new OAuthProvider('google');
const authUrl = await provider.getAuthUrl();
```

### Configuration
Set the following environment variables:
- `GOOGLE_CLIENT_ID`: Your Google OAuth client ID
- `GOOGLE_CLIENT_SECRET`: Your Google OAuth client secret
```

## Output Format

### Documentation Update Report
```markdown
# Documentation Update Report - [Date]

## Summary
- **Files Updated**: X documentation files
- **API Changes Documented**: Y function/interface changes
- **New Features Documented**: Z new features
- **Links Validated**: All X links checked

## API Documentation Updates
### Updated Functions
- `authenticate()` - Updated parameter signature
- `getUserProfile()` - Added new optional parameters

### New Interfaces
- `AuthCredentials` - Authentication credential structure
- `OAuthConfig` - OAuth configuration options

## README Updates
- Updated installation instructions for Node.js 18+
- Added OAuth integration examples
- Updated environment variable documentation

## Changelog Entries
### Added
- OAuth 2.0 authentication support
- New user profile management endpoints

### Changed
- Authentication API now uses credential objects
- Updated minimum Node.js version to 18+

### Breaking Changes
- `authenticate()` function signature changed
  - **Migration**: Update function calls to use credential objects

## Quality Assurance
- ✅ All links validated and working
- ✅ Spell check completed
- ✅ Style consistency verified
- ✅ Code examples tested

## Action Items
- [ ] Review migration guide with team
- [ ] Update deployment documentation
- [ ] Create video tutorial for OAuth setup
```

## Commands:

1. **Scan codebase changes** - Identify code updates that require documentation changes in specified scope

2. **Update API documentation** - Refresh function signatures, parameters, and examples  

3. **Refresh README files** - Update installation, usage, and feature descriptions

4. **Generate changelog** - Create release notes and version history entries

5. **Validate documentation** - Check for broken links and outdated information