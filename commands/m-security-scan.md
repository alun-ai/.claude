# Security Scan Workflow: AI-Enhanced Comprehensive Security Analysis

**Target scope:** $ARGUMENTS (Default: full codebase security audit)

**Scope:** Advanced security vulnerability detection with AI-powered analysis and threat modeling

## Overview

Transforms Claude into an expert Security Engineer with comprehensive knowledge of application security, threat modeling, and compliance frameworks. This command provides advanced security vulnerability detection using AI-powered analysis, OWASP standards, and specialized multi-tenant security assessments.

**Key Benefits:**
- **AI-Powered Analysis**: Advanced security vulnerability detection with Gemini CLI integration
- **Comprehensive Coverage**: Authentication, data protection, infrastructure, and compliance
- **Multi-Tenant Security**: Specialized analysis for SaaS security patterns
- **OWASP Standards**: Classification using OWASP Top 10 and CWE standards
- **Actionable Reports**: Detailed remediation steps with priority levels

## Help Documentation

To see this help documentation, run:
```bash
/m-security-scan --help
```

## Core Features

### 1. Multi-Domain Security Analysis
- **Authentication Security**: OAuth, session management, multi-factor authentication
- **Data Protection**: Input validation, encryption, sensitive data handling
- **Authorization Controls**: RBAC, privilege escalation, access control validation
- **Infrastructure Security**: Configuration, secrets management, API security

### 2. Advanced Threat Detection
- **Vulnerability Classification**: OWASP Top 10 and CWE standard classification
- **Risk Assessment**: Business impact and exploitability analysis
- **Pattern Recognition**: AI-powered detection of security anti-patterns
- **Supply Chain Security**: Dependency and third-party risk assessment

### 3. Compliance Framework Integration
- **GDPR Compliance**: Data protection and privacy regulation compliance
- **SOC 2 Controls**: Security control implementation verification
- **OWASP Standards**: Top 10 and security best practices validation
- **Multi-Tenant Requirements**: SaaS-specific security pattern analysis

### 4. Intelligent Remediation Guidance
- **Severity Prioritization**: Critical, High, Medium, Low severity classification
- **Remediation Roadmap**: Prioritized action plan with timelines
- **Code Examples**: Specific fix implementations with code samples
- **Compliance Alignment**: Remediation steps aligned with compliance requirements

## Usage Examples

### Basic Security Scans
```bash
# Comprehensive security audit
/m-security-scan

# Full codebase analysis
/m-security-scan full

# Quick security assessment
/m-security-scan --quick
```

### Focused Security Analysis
```bash
# Authentication security audit
/m-security-scan auth
/m-security-scan authentication

# Data handling security
/m-security-scan data
/m-security-scan data-handling

# Infrastructure security
/m-security-scan infra
/m-security-scan infrastructure

# Dependency security scan
/m-security-scan deps
/m-security-scan dependencies
```

### Compliance-Focused Scans
```bash
# GDPR compliance check
/m-security-scan --gdpr

# SOC 2 control validation
/m-security-scan --soc2

# OWASP Top 10 assessment
/m-security-scan --owasp

# Multi-tenant security audit
/m-security-scan --multi-tenant
```

### Advanced Options
```bash
# Include penetration testing guidance
/m-security-scan --pentest

# Focus on high-severity issues only
/m-security-scan --severity high

# Generate executive summary
/m-security-scan --executive-summary

# Include remediation code examples
/m-security-scan --with-fixes
```

## Command Options

```yaml
scan_scope:
  full: "Comprehensive security audit (default)"
  auth: "Authentication and authorization security"
  data: "Data protection and privacy analysis"
  deps: "Dependency and supply chain security"
  infra: "Infrastructure and configuration security"
  api: "API security and endpoint analysis"

compliance_focus:
  --gdpr: "GDPR compliance assessment"
  --soc2: "SOC 2 control validation"
  --owasp: "OWASP Top 10 vulnerability assessment"
  --cwe: "CWE weakness analysis"
  --multi-tenant: "Multi-tenant security patterns"

severity_filtering:
  --severity: "Filter by severity level (critical/high/medium/low)"
  --critical-only: "Show only critical vulnerabilities"
  --exclude-low: "Exclude low-severity findings"
  --all-findings: "Include all severity levels"

analysis_depth:
  --quick: "Fast security scan focusing on critical issues"
  --standard: "Standard comprehensive analysis (default)"
  --deep: "Deep analysis with AI-powered threat modeling"
  --pentest: "Include penetration testing guidance"

output_options:
  --executive-summary: "Generate executive summary report"
  --detailed-report: "Comprehensive technical report"
  --json-output: "Output results in JSON format"
  --with-fixes: "Include remediation code examples"
  --compliance-report: "Focus on compliance status"

integration_options:
  --ci-friendly: "CI/CD pipeline compatible output"
  --sarif-output: "SARIF format for security tools"
  --github-security: "GitHub Security Advisory format"
  --jira-tickets: "Generate Jira ticket format for findings"
```

## AI Integration Strategy

### Primary: Gemini CLI Integration
**PRIORITY: Uses Gemini CLI when available for superior security analysis**

```bash
# AI-powered comprehensive security scanning using Gemini CLI
if command -v gemini >/dev/null 2>&1 && [[ -n "$GEMINI_API_KEY" ]]; then
    echo "Using Gemini CLI for enhanced security analysis..."
    
    # Determine scan scope
    SCAN_SCOPE="${1:-full}"
    
    case "$SCAN_SCOPE" in
        "auth"|"authentication")
            echo "Conducting authentication security analysis..."
            gemini --all-files -p "Perform comprehensive authentication security analysis.
            
            Focus on:
            1. Authentication mechanism vulnerabilities
            2. Session management security
            3. OAuth 2.0 implementation security (Twitter, LinkedIn integrations)
            4. JWT token handling and validation
            5. Password storage and verification
            6. Multi-factor authentication gaps
            7. Account enumeration vulnerabilities
            8. Session fixation and hijacking risks
            
            Identify specific vulnerabilities with OWASP classification and remediation steps." --format markdown
            ;;
            
        "data"|"data-handling")
            echo "Analyzing data handling security..."
            gemini --all-files -p "Conduct data security and privacy analysis.
            
            Analyze:
            1. Input validation and sanitization
            2. SQL injection prevention mechanisms
            3. Cross-site scripting (XSS) protection
            4. Data encryption at rest and in transit
            5. Sensitive data exposure risks
            6. Multi-tenant data isolation
            7. API rate limiting and abuse prevention
            8. File upload security and validation
            
            Provide specific findings with severity levels and fix recommendations." --format markdown
            ;;
            
        "dependencies"|"deps")
            echo "Scanning dependencies for vulnerabilities..."
            # Check package files for known vulnerabilities
            if [[ -f "package.json" ]]; then
                npm audit --audit-level=moderate 2>/dev/null || echo "NPM audit completed with warnings"
            fi
            
            gemini --all-files -p "Analyze dependency security and supply chain risks.
            
            Review:
            1. Third-party library vulnerabilities
            2. Outdated dependencies with known CVEs
            3. Supply chain attack vectors
            4. Dependency confusion opportunities
            5. License compliance and security implications
            6. Unnecessary dependencies and attack surface
            7. Package integrity and verification
            
            Provide prioritized remediation roadmap." --format markdown
            ;;
            
        "infrastructure"|"infra")
            echo "Analyzing infrastructure security..."
            gemini --all-files -p "Conduct infrastructure security analysis.
            
            Examine:
            1. Environment variable security and secrets management
            2. Database configuration and access controls
            3. API endpoint security and exposure
            4. CORS policy implementation
            5. HTTPS/TLS configuration
            6. Container and deployment security
            7. Logging and monitoring security
            8. Backup and disaster recovery security
            
            Identify misconfigurations and security gaps." --format markdown
            ;;
            
        "full"|*)
            echo "Conducting comprehensive security audit..."
            gemini --all-files -p "Perform comprehensive security audit of the entire application.
            
            Conduct detailed analysis across all security domains:
            
            🔐 AUTHENTICATION & AUTHORIZATION:
            - Multi-tenant authentication security
            - OAuth 2.0 implementation vulnerabilities
            - Role-based access control (RBAC) enforcement
            - Session management and token security
            - Password policies and storage security
            
            🛡️ DATA PROTECTION:
            - Input validation and sanitization gaps
            - SQL injection and NoSQL injection risks
            - Cross-site scripting (XSS) vulnerabilities
            - Cross-site request forgery (CSRF) protection
            - Sensitive data exposure and encryption
            - Multi-tenant data isolation verification
            
            🌐 API SECURITY:
            - RESTful API security best practices
            - Rate limiting and DDoS protection
            - API versioning and deprecation security
            - GraphQL security (if applicable)
            - Webhook security and validation
            
            🔧 INFRASTRUCTURE SECURITY:
            - Environment configuration security
            - Secrets management and key rotation
            - Database security configuration
            - Cloud security posture (if applicable)
            - Container security (if applicable)
            
            📊 COMPLIANCE & PRIVACY:
            - GDPR compliance for user data
            - SOC 2 security controls
            - Data retention and deletion policies
            - Audit logging and monitoring
            - Privacy by design implementation
            
            For each vulnerability found:
            - Classify using OWASP Top 10 or CWE standards
            - Assign severity level (Critical/High/Medium/Low)
            - Provide specific remediation steps
            - Include code examples for fixes
            - Estimate remediation effort and priority
            
            Format as comprehensive security report with executive summary." --format markdown
            ;;
    esac
else
    echo "Gemini CLI not available, using Claude Code native security analysis..."
    echo "Running basic security checks..."
fi
```

**Fallback**: Use Claude Code native functionality if Gemini CLI unavailable.

### Enhanced AI Security Capabilities
- **Threat Modeling**: AI-powered threat identification and risk assessment
- **Vulnerability Classification**: OWASP Top 10 and CWE standard classification
- **Multi-tenant Security**: Specialized analysis for SaaS security patterns
- **OAuth Security**: Advanced analysis of social media integrations
- **Supply Chain Security**: Dependency and third-party risk assessment
- **Compliance Analysis**: GDPR, SOC 2, and privacy regulation compliance

## Execution Steps

1. **Scope Detection and Analysis Planning**
   - Auto-detect application architecture and technology stack
   - Identify critical security boundaries and attack surfaces
   - Plan comprehensive security analysis based on detected patterns
   - Prioritize high-risk areas for detailed examination

2. **Authentication and Authorization Audit**
   - Multi-tenant authentication security verification
   - OAuth 2.0 implementation security analysis
   - Role-based access control (RBAC) enforcement validation
   - Session management and token security assessment
   - Cross-tenant access prevention verification

3. **Data Protection and Privacy Analysis**
   - Input validation and sanitization gap identification
   - SQL injection and XSS vulnerability detection
   - Sensitive data exposure and encryption analysis
   - Multi-tenant data isolation verification
   - GDPR compliance and privacy protection assessment

4. **API and Infrastructure Security Review**
   - RESTful API security best practices validation
   - Rate limiting and abuse prevention analysis
   - Infrastructure configuration security audit
   - Secrets management and environment security
   - Third-party integration security assessment

5. **Vulnerability Classification and Prioritization**
   - OWASP Top 10 and CWE standard classification
   - Severity assessment (Critical/High/Medium/Low)
   - Business impact and exploitability analysis
   - Remediation effort estimation and prioritization
   - Compliance impact assessment

6. **Comprehensive Security Report Generation**
   - Executive summary with key findings and recommendations
   - Detailed vulnerability catalog with remediation steps
   - Risk matrix and prioritization framework
   - Compliance status and gap analysis
   - Save to `docs/security/security-audit-YYYY-MM-DD.md`

## Security Analysis Framework

### Vulnerability Categories
```yaml
vulnerability_assessment:
  authentication_security:
    - oauth_implementation_flaws
    - session_management_issues
    - password_policy_violations
    - multi_factor_authentication_gaps
    - account_enumeration_risks
  
  data_protection:
    - input_validation_failures
    - sql_injection_vulnerabilities
    - xss_attack_vectors
    - sensitive_data_exposure
    - encryption_implementation_flaws
  
  authorization_controls:
    - rbac_enforcement_gaps
    - privilege_escalation_risks
    - cross_tenant_access_violations
    - api_authorization_bypasses
    - resource_access_controls
  
  infrastructure_security:
    - environment_configuration_issues
    - secrets_management_flaws
    - database_security_gaps
    - api_rate_limiting_failures
    - cors_policy_violations
```

### Severity Classification
```yaml
severity_levels:
  critical:
    description: "Immediate security risk with high impact"
    examples: ["SQL injection", "Authentication bypass", "Data exposure"]
    response_time: "immediate_fix_required"
    business_impact: "high"
  
  high:
    description: "Significant security vulnerability"
    examples: ["XSS vulnerabilities", "Privilege escalation", "Weak encryption"]
    response_time: "fix_within_48_hours"
    business_impact: "medium_to_high"
  
  medium:
    description: "Security weakness requiring attention"
    examples: ["Missing rate limiting", "Weak password policies", "Information disclosure"]
    response_time: "fix_within_week"
    business_impact: "medium"
  
  low:
    description: "Security improvement opportunity"
    examples: ["Security headers missing", "Verbose error messages", "Minor misconfigurations"]
    response_time: "fix_in_next_sprint"
    business_impact: "low"
```

## Compliance and Standards

### Security Standards Compliance
```yaml
compliance_frameworks:
  owasp_top_10:
    - broken_access_control
    - cryptographic_failures
    - injection_vulnerabilities
    - insecure_design
    - security_misconfiguration
    - vulnerable_components
    - identification_authentication_failures
    - software_data_integrity_failures
    - security_logging_monitoring_failures
    - server_side_request_forgery
  
  cwe_categories:
    - input_validation_cwe_20
    - authentication_cwe_287
    - authorization_cwe_862
    - cryptography_cwe_327
    - code_injection_cwe_94
  
  privacy_regulations:
    - gdpr_compliance
    - ccpa_compliance
    - data_retention_policies
    - consent_management
    - data_portability_rights
```

### Multi-tenant Security Requirements
```yaml
multi_tenant_security:
  data_isolation:
    - tenant_boundary_enforcement
    - cross_tenant_data_access_prevention
    - shared_resource_security
    - tenant_specific_encryption
  
  access_controls:
    - organization_level_isolation
    - team_based_access_controls
    - brand_specific_permissions
    - role_inheritance_security
  
  audit_and_monitoring:
    - tenant_specific_audit_logs
    - cross_tenant_activity_monitoring
    - security_event_correlation
    - compliance_reporting_per_tenant
```

## Output Format

### Comprehensive Security Report
```markdown
# Security Audit Report - [Date]

## Executive Summary
- **Scan Scope**: [Full application / Specific components]
- **Critical Vulnerabilities**: [Number found]
- **High Priority Issues**: [Number found]
- **Overall Security Posture**: [Rating: Excellent/Good/Fair/Poor]
- **Compliance Status**: [GDPR/SOC2/Other compliance levels]

## Vulnerability Catalog

### Critical Severity Issues
[Detailed list with OWASP classification, impact, and immediate remediation steps]

### High Severity Issues
[Detailed analysis with business impact and remediation timeline]

### Medium and Low Priority Issues
[Categorized findings with improvement recommendations]

## Multi-tenant Security Assessment
### Data Isolation Verification
[Tenant boundary security analysis]

### Access Control Validation
[RBAC and permission system security review]

## OAuth Integration Security
### Social Media Platform Security
[Twitter, LinkedIn, and other OAuth implementation security]

### Token Management Security
[JWT, refresh token, and session security analysis]

## Infrastructure Security Analysis
### Environment Configuration
[Secrets management, environment variables, configuration security]

### API Security Assessment
[Rate limiting, CORS, authentication, authorization analysis]

## Compliance Analysis
### GDPR Compliance Status
[Data protection, privacy rights, consent management]

### SOC 2 Control Assessment
[Security controls, audit requirements, monitoring]

## Remediation Roadmap
### Immediate Actions (0-7 days)
[Critical vulnerabilities requiring immediate attention]

### Short-term Improvements (1-4 weeks)
[High and medium priority security enhancements]

### Long-term Security Strategy (1-3 months)
[Strategic security improvements and compliance initiatives]

## Security Monitoring Recommendations
### Detection and Response
[Security monitoring, alerting, and incident response recommendations]

### Continuous Security
[Ongoing security practices, regular audits, security training]
```

### Security Metrics Dashboard
```json
{
  "security_metrics": {
    "vulnerability_counts": {
      "critical": 0,
      "high": 2,
      "medium": 8,
      "low": 15
    },
    "compliance_scores": {
      "owasp_top_10": "85%",
      "gdpr_compliance": "92%",
      "soc2_controls": "78%"
    },
    "security_posture": {
      "overall_score": 87,
      "trend": "improving",
      "last_audit": "2024-01-15",
      "next_audit": "2024-04-15"
    }
  },
  "remediation_tracking": {
    "fixed_vulnerabilities": 12,
    "pending_fixes": 5,
    "average_fix_time": "3.2 days",
    "compliance_improvements": [
      "Implemented GDPR data deletion",
      "Enhanced OAuth security",
      "Added rate limiting"
    ]
  }
}
```

## Advanced Security Features

### Automated Threat Detection
- **Pattern Recognition**: AI-powered detection of security anti-patterns
- **Behavioral Analysis**: Unusual code patterns that may indicate vulnerabilities
- **Supply Chain Monitoring**: Continuous dependency vulnerability scanning
- **Configuration Drift**: Detection of security configuration changes

### Security Testing Integration
- **Static Analysis**: Integration with security-focused static analysis tools
- **Dynamic Testing**: API security testing and penetration testing guidance
- **Dependency Scanning**: Automated vulnerability scanning of third-party libraries
- **Security Regression Testing**: Verification that security fixes don't introduce new issues

### Continuous Security Monitoring
- **Real-time Alerting**: Integration with security monitoring and alerting systems
- **Compliance Tracking**: Ongoing compliance status monitoring and reporting
- **Security Metrics**: Key performance indicators for security posture
- **Incident Response**: Security incident detection and response procedures