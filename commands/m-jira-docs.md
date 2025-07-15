# Jira Documentation: Comprehensive Documentation Management

**Target:** $ARGUMENTS (Default: current issue or interactive selection)

**Scope:** Create, maintain, and manage comprehensive project documentation integrated with Jira workflows

## Overview

Transforms Claude into your AI-powered Documentation Specialist, providing enterprise-grade documentation management and intelligent content creation capabilities seamlessly integrated with development workflows. This command delivers comprehensive documentation automation, multi-platform publishing, and advanced content optimization that ensures high-quality, accessible, and maintainable documentation throughout the entire development lifecycle.

**Key Benefits:**
- **AI-Powered Content Generation**: Intelligent documentation creation from code, requirements, and specifications with automated quality enhancement
- **Comprehensive Documentation Ecosystem**: Multi-format documentation including user guides, API references, technical specifications, and knowledge bases
- **Advanced Multi-Platform Publishing**: Automated distribution across Confluence, documentation sites, API portals, and help centers
- **Intelligent Content Optimization**: AI-driven content enhancement with accessibility compliance and user experience optimization
- **Living Documentation Intelligence**: Automated synchronization with code changes and continuous content maintenance

## Help Documentation

To see this help documentation, run:
```bash
/m-jira-docs --help
```

## Usage Examples

### Basic Documentation Creation
```bash
# Generate documentation for current Jira issue
/m-jira-docs

# Generate documentation for specific issue
/m-jira-docs ALUN-123

# Interactive documentation with AI guidance
/m-jira-docs --interactive
```

### Focused Documentation Types
```bash
# User guide focus
/m-jira-docs --user-guide

# API documentation focus
/m-jira-docs --api-docs

# Technical guide focus
/m-jira-docs --technical-guide
```

### Advanced Options
```bash
# Comprehensive documentation suite
/m-jira-docs --comprehensive-suite

# Multi-platform publishing
/m-jira-docs --multi-platform

# Living documentation update
/m-jira-docs --living-docs-sync
```

## Command Options

```yaml
documentation_scope:
  current_issue: "Generate documentation for current or specified Jira issue (default)"
  user_documentation: "Comprehensive end-user guides and tutorials"
  technical_documentation: "Developer guides and technical references"
  api_documentation: "Complete API reference and integration guides"
  knowledge_base: "Troubleshooting guides and institutional knowledge"

analysis_depth:
  --quick: "Essential documentation with key information"
  --standard: "Comprehensive documentation with detailed content (default)"
  --comprehensive: "Enterprise-grade documentation with full coverage"
  --suite: "Complete documentation suite across all formats"

documentation_type:
  --user-guide: "End-user guides, tutorials, and help articles"
  --technical-guide: "Developer guides, architecture docs, and technical references"
  --api-docs: "API documentation, reference guides, and integration examples"
  --process-docs: "Workflow guides, procedures, and best practices"
  --troubleshooting: "Problem-solving guides, FAQs, and support documentation"

content_generation:
  --code-to-docs: "Generate documentation from existing codebase analysis"
  --requirements-driven: "Create documentation from requirements and specifications"
  --template-based: "Use standardized templates for consistent documentation"
  --ai-enhanced: "AI-powered content generation with optimization (default)"

publishing_options:
  --confluence-publish: "Publish to Confluence with automated formatting"
  --docs-site-deploy: "Deploy to documentation website with static generation"
  --api-portal-sync: "Synchronize with API documentation portal"
  --multi-platform: "Publish across all configured platforms"

quality_assurance:
  --accessibility-check: "Comprehensive accessibility compliance validation"
  --content-optimization: "AI-powered content enhancement and optimization"
  --review-workflow: "Enable structured review and approval process"
  --analytics-tracking: "Enable usage analytics and performance monitoring"

integration_features:
  --jira-integration: "Deep integration with Jira issues and workflows"
  --code-sync: "Automatic synchronization with code changes"
  --living-docs-sync: "Continuous documentation updates with development"
  --version-control: "Advanced version control and change tracking"
```

## AI Integration Strategy

### Primary: Gemini CLI Integration
**PRIORITY: Uses Gemini CLI when available for superior documentation generation**

```bash
# AI-powered documentation generation
if command -v gemini >/dev/null 2>&1 && [[ -n "$GEMINI_API_KEY" ]]; then
    # Generate comprehensive documentation
    gemini --all-files -p "Generate comprehensive user documentation for this application.
    Include: getting started guide, feature documentation, API reference, troubleshooting.
    Use clear, professional writing with examples." --format markdown
fi
```

**Fallback**: Use Claude Code native functionality if Gemini CLI unavailable.

## Core Features

### 1. AI-Powered Intelligent Documentation Generation Engine
- **Advanced Automatic Content Creation**: Machine learning-driven documentation generation from code analysis, requirements extraction, and specification interpretation
- **Template-Based Professional Documentation**: Sophisticated template system with customizable formats and industry-standard compliance
- **Multi-Format Publishing Intelligence**: Automated content optimization for web, mobile, print, and API documentation formats
- **Content Enhancement and Optimization**: AI-powered content suggestions with readability analysis and accessibility improvements

### 2. Comprehensive Multi-Type Documentation Platform
- **User Experience Documentation**: End-user guides, interactive tutorials, and contextual help systems with user journey optimization
- **Technical Reference Documentation**: Developer guides, comprehensive API references, architecture documentation, and code examples
- **Process and Workflow Documentation**: Detailed workflow guides, standard operating procedures, and best practice documentation
- **Knowledge Management System**: Advanced troubleshooting guides, comprehensive FAQs, and institutional knowledge preservation

### 3. Advanced Development Integration and Synchronization
- **Intelligent Code-Documentation Synchronization**: Real-time documentation updates with code changes and automated content validation
- **Issue-Driven Documentation Automation**: Automatic documentation updates based on Jira issue completion and feature development
- **Comprehensive Version Control Integration**: Advanced change tracking with documentation versioning and collaboration workflows
- **Multi-Platform Automated Publishing**: Seamless distribution across Confluence, documentation sites, API portals, and help centers

### 4. Enterprise-Grade Content Management and Optimization
- **Advanced Content Analytics and Optimization**: User behavior analysis with content performance optimization and engagement tracking
- **Accessibility and Compliance Intelligence**: Automated accessibility compliance checking with international standards adherence
- **Collaborative Review and Approval Workflows**: Sophisticated peer review system with stakeholder validation and approval tracking
- **Continuous Content Improvement**: AI-driven content optimization with user feedback integration and quality enhancement recommendations

## Execution Framework

### 1. **Strategic Documentation Analysis and Planning Phase**
- **Comprehensive Requirement Analysis**: AI-powered analysis of Jira issues, user stories, and technical specifications for documentation needs identification
- **Target Audience Intelligence**: Advanced user persona analysis with content customization for different stakeholder groups
- **Documentation Architecture Planning**: Sophisticated content structure design with information architecture optimization
- **Content Creation Workflow Design**: Comprehensive workflow planning with resource allocation and timeline optimization
- **Quality Standards Definition**: Establishment of content quality criteria, accessibility standards, and compliance requirements

### 2. **AI-Powered Content Creation and Generation Phase**
- **Intelligent Content Generation**: Advanced AI-driven content creation from code analysis, requirement extraction, and specification interpretation
- **Multi-Format Content Development**: Comprehensive creation of user guides, technical references, API documentation, and interactive tutorials
- **Visual Content Integration**: Automated integration of code examples, screenshots, diagrams, and interactive elements
- **Accessibility and Internationalization**: Comprehensive accessibility compliance with multi-language support and cultural adaptation
- **Content Enhancement and Optimization**: AI-powered content improvement with readability analysis and user experience optimization

### 3. **Comprehensive Review and Quality Validation Phase**
- **Technical Accuracy Validation**: Subject matter expert review with automated fact-checking and technical validation
- **User Experience and Usability Testing**: Comprehensive UX review with user testing and feedback collection
- **Content Quality Assessment**: Multi-dimensional quality analysis including clarity, completeness, and effectiveness
- **Compliance and Accessibility Audit**: Comprehensive accessibility testing with international standards compliance validation
- **Stakeholder Approval and Sign-off**: Structured approval workflow with stakeholder validation and change management

### 4. **Multi-Platform Publication and Distribution Phase**
- **Intelligent Platform Optimization**: AI-powered content adaptation for different publishing platforms and formats
- **Automated Publishing Pipeline**: Comprehensive automation for Confluence, documentation sites, API portals, and help centers
- **Quality Assurance and Testing**: Complete testing of published content with link validation and formatting verification
- **Performance Optimization**: Content delivery optimization with loading speed and accessibility performance enhancement
- **Launch Coordination and Communication**: Stakeholder communication with launch announcements and training provision

### 5. **Continuous Maintenance and Improvement Phase**
- **Advanced Usage Analytics**: Comprehensive analysis of documentation usage patterns with user behavior insights
- **Automated Content Maintenance**: Intelligent content updates with code synchronization and automated quality monitoring
- **User Feedback Integration**: Systematic feedback collection with AI-powered content improvement recommendations
- **Performance Monitoring and Optimization**: Continuous monitoring of content effectiveness with optimization recommendations
- **Knowledge Management and Evolution**: Long-term knowledge preservation with content evolution and organizational learning integration

## Advanced Documentation Templates

### User Guide Template
```yaml
user_guide_template:
  title: "User Guide: {feature_name}"
  jira_issue: "{issue_key}"
  
  sections:
    introduction:
      purpose: "What this feature does and why it's useful"
      audience: "Who should use this feature"
      prerequisites: "What users need before starting"
    
    getting_started:
      overview: "Quick start guide"
      basic_setup: "Initial configuration steps"
      first_use: "Walk through first successful use"
    
    detailed_usage:
      features: "Detailed feature descriptions"
      workflows: "Step-by-step procedures"
      examples: "Real-world usage examples"
      tips_and_tricks: "Best practices and shortcuts"
    
    troubleshooting:
      common_issues: "Frequently encountered problems"
      error_messages: "Error message explanations"
      solutions: "Step-by-step problem resolution"
      support: "How to get additional help"
    
    appendices:
      glossary: "Term definitions"
      references: "Related documentation"
      changelog: "Recent changes and updates"
```

### API Reference Template
```yaml
api_reference_template:
  title: "API Reference: {api_name}"
  jira_issue: "{issue_key}"
  
  sections:
    overview:
      introduction: "API purpose and capabilities"
      base_url: "API base URL and versioning"
      authentication: "Authentication methods"
      rate_limiting: "Usage limits and throttling"
    
    endpoints:
      - endpoint: "/api/v1/users"
        method: "GET"
        description: "Retrieve user information"
        parameters:
          - name: "id"
            type: "string"
            required: true
            description: "User identifier"
        request_example: |
          curl -X GET "https://api.example.com/v1/users/123" \
            -H "Authorization: Bearer YOUR_TOKEN"
        response_example: |
          {
            "id": "123",
            "name": "John Doe",
            "email": "john@example.com"
          }
        error_responses:
          404: "User not found"
          401: "Unauthorized"
    
    data_models:
      User:
        description: "User object structure"
        properties:
          id: "string - unique identifier"
          name: "string - user full name"
          email: "string - user email address"
    
    sdk_examples:
      javascript: "Code examples in JavaScript"
      python: "Code examples in Python"
      curl: "cURL command examples"
```

### Technical Guide Template
```yaml
technical_guide_template:
  title: "Technical Guide: {topic}"
  jira_issue: "{issue_key}"
  
  sections:
    overview:
      purpose: "Guide purpose and scope"
      audience: "Target technical audience"
      prerequisites: "Required knowledge and setup"
    
    concepts:
      key_concepts: "Important concepts and terminology"
      architecture: "System architecture overview"
      design_patterns: "Relevant design patterns"
    
    implementation:
      setup: "Environment setup and configuration"
      code_examples: "Practical code examples"
      best_practices: "Recommended approaches"
      common_pitfalls: "Things to avoid"
    
    advanced_topics:
      optimization: "Performance optimization"
      security: "Security considerations"
      monitoring: "Monitoring and debugging"
      scaling: "Scaling considerations"
    
    resources:
      further_reading: "Additional resources"
      tools: "Recommended tools and utilities"
      community: "Community resources and support"
```

## Smart Documentation Features

### Content Generation
```yaml
content_generation:
  from_code:
    - function_docs: "Generate docs from code comments"
    - api_docs: "Generate API docs from OpenAPI specs"
    - type_docs: "Generate docs from TypeScript types"
    - example_code: "Extract code examples from tests"
  
  from_requirements:
    - user_stories: "Convert user stories to user guides"
    - acceptance_criteria: "Convert AC to feature documentation"
    - technical_specs: "Convert specs to technical guides"
    - test_cases: "Convert tests to usage examples"
  
  from_issues:
    - feature_docs: "Generate feature docs from stories"
    - bug_fixes: "Document bug fixes and workarounds"
    - change_logs: "Generate change logs from issues"
    - release_notes: "Create release notes from sprints"
```

### Content Enhancement
```yaml
content_enhancement:
  ai_suggestions:
    - clarity_improvements: "Suggest clearer explanations"
    - completeness_check: "Identify missing information"
    - structure_optimization: "Improve document organization"
    - language_simplification: "Simplify complex language"
  
  interactive_elements:
    - code_playgrounds: "Interactive code examples"
    - video_tutorials: "Embedded video explanations"
    - interactive_diagrams: "Clickable architecture diagrams"
    - live_examples: "Real-time API examples"
  
  accessibility_features:
    - alt_text: "Alt text for images and diagrams"
    - screen_reader: "Screen reader compatibility"
    - keyboard_navigation: "Keyboard-only navigation"
    - color_contrast: "High contrast mode support"
```

## Documentation Workflow

### Creation Workflow
```yaml
creation_workflow:
  planning:
    - analyze_requirements: "Identify documentation needs"
    - define_audience: "Determine target users"
    - plan_structure: "Organize content hierarchy"
    - assign_writers: "Assign content creation tasks"
  
  creation:
    - generate_outline: "Create content outline"
    - write_content: "Create initial content"
    - add_examples: "Include code examples and screenshots"
    - review_internally: "Internal content review"
  
  review:
    - technical_review: "Technical accuracy check"
    - editorial_review: "Grammar and style review"
    - user_testing: "Test with actual users"
    - accessibility_audit: "Accessibility compliance check"
  
  publication:
    - format_content: "Format for target platform"
    - publish_draft: "Publish to staging environment"
    - final_review: "Final approval before publication"
    - publish_live: "Publish to production"
```

### Maintenance Workflow
```yaml
maintenance_workflow:
  monitoring:
    - usage_analytics: "Track documentation usage"
    - user_feedback: "Collect user feedback"
    - accuracy_checks: "Verify information accuracy"
    - broken_links: "Check for broken links"
  
  updates:
    - scheduled_reviews: "Regular content reviews"
    - issue_driven_updates: "Updates from Jira issues"
    - code_change_updates: "Updates from code changes"
    - user_request_updates: "Updates from user requests"
  
  quality_assurance:
    - content_audits: "Comprehensive content audits"
    - consistency_checks: "Ensure consistent style"
    - accuracy_validation: "Verify technical accuracy"
    - performance_optimization: "Optimize page loading"
```

## Multi-Platform Publishing

### Publishing Targets
```yaml
publishing_platforms:
  internal_wiki:
    platform: "Confluence"
    format: "Confluence markup"
    access: "Internal team only"
    automation: "Auto-sync from git"
  
  public_docs:
    platform: "Documentation site"
    format: "Static site (Hugo/Jekyll)"
    access: "Public"
    automation: "Deploy on merge"
  
  api_docs:
    platform: "API documentation portal"
    format: "OpenAPI/Swagger"
    access: "Developer portal"
    automation: "Generated from code"
  
  help_center:
    platform: "Customer support portal"
    format: "Knowledge base articles"
    access: "Customers and support"
    automation: "Manual review process"
```

### Format Optimization
```yaml
format_optimization:
  web_format:
    - responsive_design: "Mobile-friendly layout"
    - fast_loading: "Optimized images and assets"
    - searchable: "Full-text search capability"
    - interactive: "Interactive elements and examples"
  
  print_format:
    - page_breaks: "Proper page break handling"
    - print_css: "Print-optimized styling"
    - table_of_contents: "Comprehensive TOC"
    - appendices: "Reference materials"
  
  mobile_format:
    - touch_friendly: "Touch-optimized interface"
    - offline_access: "Offline reading capability"
    - condensed_layout: "Mobile-optimized layout"
    - swipe_navigation: "Gesture-based navigation"
```

## Configuration Options

### Documentation Standards
```json
{
  "documentation_standards": {
    "style_guide": {
      "tone": "professional_friendly",
      "voice": "active_voice_preferred",
      "terminology": "consistent_terms_glossary",
      "formatting": "markdown_with_extensions"
    },
    "structure": {
      "max_page_length": 2000,
      "heading_hierarchy": "h1_to_h4_only",
      "code_block_language": "always_specified",
      "image_requirements": "alt_text_required"
    },
    "quality": {
      "spell_check": true,
      "grammar_check": true,
      "link_validation": true,
      "accessibility_check": true
    }
  }
}
```

### Publishing Configuration
```json
{
  "publishing": {
    "platforms": {
      "confluence": {
        "enabled": true,
        "space_key": "ALUN",
        "auto_publish": true,
        "review_required": false
      },
      "docs_site": {
        "enabled": true,
        "base_url": "https://docs.alunai.com",
        "auto_deploy": true,
        "review_required": true
      },
      "api_portal": {
        "enabled": true,
        "base_url": "https://api.alunai.com",
        "auto_generate": true,
        "review_required": false
      }
    },
    "automation": {
      "sync_frequency": "on_commit",
      "review_workflow": "enabled",
      "notification_settings": "reviewers_only"
    }
  }
}
```

## Output Format

### Documentation Creation Result
```json
{
  "documentation": {
    "title": "OAuth2 LinkedIn Integration User Guide",
    "jira_issue": "ALUN-123",
    "type": "user_guide",
    "status": "draft",
    "created_by": "technical_writer",
    "created_at": "2024-01-15T14:00:00Z"
  },
  "content_metrics": {
    "word_count": 2500,
    "reading_time": "10 minutes",
    "page_count": 12,
    "code_examples": 8,
    "screenshots": 15
  },
  "quality_scores": {
    "readability": 85,
    "completeness": 90,
    "accuracy": 95,
    "accessibility": 88
  },
  "publishing_status": {
    "confluence": "published",
    "docs_site": "pending_review",
    "api_portal": "not_applicable"
  },
  "review_assignments": [
    {
      "reviewer": "product_manager",
      "type": "content_review",
      "due_date": "2024-01-17"
    },
    {
      "reviewer": "ux_designer",
      "type": "usability_review",
      "due_date": "2024-01-18"
    }
  ]
}
```

### Documentation Analytics
```json
{
  "analytics": {
    "usage_stats": {
      "page_views": 1250,
      "unique_visitors": 380,
      "average_time_on_page": "4m 30s",
      "bounce_rate": "25%"
    },
    "user_feedback": {
      "helpful_votes": 45,
      "not_helpful_votes": 3,
      "comments": 12,
      "average_rating": 4.6
    },
    "content_performance": {
      "most_viewed_sections": [
        "Getting Started",
        "API Reference",
        "Troubleshooting"
      ],
      "search_queries": [
        "oauth setup",
        "linkedin integration",
        "authentication error"
      ]
    }
  },
  "improvement_suggestions": [
    "Add more visual examples to Getting Started",
    "Expand troubleshooting section",
    "Include video tutorials for complex workflows"
  ]
}
```

## Integration Features

### Development Integration
- **Code Documentation**: Generate docs from code comments and annotations
- **API Documentation**: Auto-generate API docs from OpenAPI specifications
- **Change Tracking**: Update documentation when code changes
- **Version Synchronization**: Keep docs in sync with code versions

### Project Management Integration
- **Issue-Driven Updates**: Update documentation based on completed issues
- **Sprint Planning**: Include documentation tasks in sprint planning
- **Release Documentation**: Generate release notes from sprint completion
- **Stakeholder Reviews**: Integrate documentation review into approval workflows

### User Experience Integration
- **Feedback Collection**: Gather user feedback on documentation quality
- **Usage Analytics**: Track how documentation is used
- **Search Optimization**: Optimize content for search and discovery
- **Accessibility Compliance**: Ensure documentation meets accessibility standards

## Error Handling and Validation

### Content Validation
- **Technical Accuracy**: Validate technical content for correctness
- **Link Validation**: Check all links and references
- **Code Examples**: Verify code examples work correctly
- **Accessibility**: Check compliance with accessibility standards

### Process Validation
- **Review Workflow**: Ensure proper review and approval process
- **Publishing Pipeline**: Validate publishing process and automation
- **Version Control**: Track changes and maintain version history
- **Quality Metrics**: Monitor and improve documentation quality

### Continuous Improvement
- **User Feedback**: Incorporate user feedback into improvements
- **Analytics Insights**: Use analytics to improve content and structure
- **Process Optimization**: Continuously improve documentation workflows
- **Training and Support**: Provide training on documentation best practices