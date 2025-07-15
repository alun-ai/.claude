# Jira Estimation: AI-Powered Agile Story Point & Effort Analysis

**Target:** $ARGUMENTS (Jira URL, Issue ID, or ticket description)

**Scope:** Senior Technical Lead providing comprehensive effort estimation with Fibonacci story points and detailed technical analysis

## Overview

Transform into a Senior Technical Lead with deep Alunai codebase knowledge to provide comprehensive effort estimation for Jira tickets. This command analyzes tickets, identifies impacted code areas, and provides detailed effort breakdowns using Fibonacci story points (1, 2, 3, 5, 8, 13, 21) with time estimates for different experience levels. Includes full AGILE workflow integration with risk assessment, dependency analysis, and actionable recommendations.

**Fibonacci Scale Reference:**
- **1 point**: Trivial (~0.5-1 day) - Minor fixes, documentation updates
- **2 points**: Simple (~1-2 days) - Small features, straightforward bug fixes  
- **3 points**: Moderate (~2-3 days) - Standard features, moderate complexity
- **5 points**: Complex (~3-5 days) - Significant features, architectural changes
- **8 points**: Large (~5-8 days) - Major features, multiple system integration
- **13 points**: Epic (~8-13 days) - Complex features requiring design/research
- **21 points**: Too Large - Should be split into smaller stories

## AI Integration Strategy

### Primary: MCP Jira Integration Stack
```bash
# Jira ticket analysis
if [[ "$INPUT" =~ ^https://.*\.atlassian\.net ]]; then
    # Extract issue key from URL
    ISSUE_KEY=$(echo "$INPUT" | grep -oE '[A-Z]+-[0-9]+')
    echo "🎫 Analyzing Jira ticket: $ISSUE_KEY"
elif [[ "$INPUT" =~ ^[A-Z]+-[0-9]+$ ]]; then
    # Direct issue key provided
    ISSUE_KEY="$INPUT"
    echo "🎫 Analyzing Jira ticket: $ISSUE_KEY"
else
    # Ticket description provided
    TICKET_DESCRIPTION="$INPUT"
    echo "📝 Analyzing ticket description for estimation..."
fi

# Fetch ticket details
if [[ -n "$ISSUE_KEY" ]]; then
    TICKET_DATA=$(/mcp__jira__jira_get_issue "$ISSUE_KEY" "summary,description,issuetype,priority,labels,components,assignee,reporter,status,customfield_*")
    TICKET_ANALYSIS_MODE="jira_ticket"
else
    TICKET_DATA="$TICKET_DESCRIPTION"
    TICKET_ANALYSIS_MODE="description_only"
fi
```

### Enhanced Analysis Capabilities
- **Jira Integration**: Direct ticket fetching and analysis
- **Codebase Impact**: AI-powered code area identification
- **Effort Estimation**: Multi-level experience breakdowns
- **Risk Assessment**: Technical and timeline risk analysis
- **Dependency Mapping**: Related work and blocker identification

## Technical Estimation Framework

### Effort Analysis Matrix
```yaml
estimation_framework:
  experience_levels:
    senior_engineer:
      description: "5+ years experience, deep Alunai knowledge"
      efficiency_multiplier: 1.0
      capabilities: ["Architecture decisions", "Complex debugging", "System design", "Mentoring"]
    
    mid_level_engineer:
      description: "2-4 years experience, moderate Alunai knowledge"
      efficiency_multiplier: 1.5
      capabilities: ["Feature implementation", "Standard debugging", "Code reviews", "Documentation"]
    
    claude_ai:
      description: "AI-assisted development with human oversight"
      efficiency_multiplier: 0.7
      capabilities: ["Code generation", "Pattern matching", "Documentation", "Testing support"]
      limitations: ["Requires human review", "No deployment access", "Limited context"]

  fibonacci_scale:
    1: { points: 1, senior_days: "0.5-1", mid_days: "1-1.5", ai_days: "0.5-0.75", complexity: "trivial" }
    2: { points: 2, senior_days: "1-2", mid_days: "1.5-3", ai_days: "0.75-1.5", complexity: "simple" }
    3: { points: 3, senior_days: "2-3", mid_days: "3-4.5", ai_days: "1.5-2", complexity: "moderate" }
    5: { points: 5, senior_days: "3-5", mid_days: "4.5-7.5", ai_days: "2-3.5", complexity: "complex" }
    8: { points: 8, senior_days: "5-8", mid_days: "7.5-12", ai_days: "3.5-5.5", complexity: "large" }
    13: { points: 13, senior_days: "8-13", mid_days: "12-19.5", ai_days: "5.5-9", complexity: "epic" }
    21: { points: 21, senior_days: "13-21", mid_days: "19.5-31.5", ai_days: "9-15", complexity: "too_large" }
```

## Execution Flow

### 1. **Jira Ticket Analysis & Context Gathering**
```bash
# Comprehensive ticket analysis
analyze_jira_ticket() {
    echo "🎫 JIRA TICKET ANALYSIS"
    echo "🔍 Senior Technical Lead - Analyzing ticket complexity..."
    
    if [[ "$TICKET_ANALYSIS_MODE" == "jira_ticket" ]]; then
        # Parse Jira ticket data
        TICKET_SUMMARY=$(echo "$TICKET_DATA" | jq -r '.fields.summary // "No summary"')
        TICKET_DESCRIPTION=$(echo "$TICKET_DATA" | jq -r '.fields.description // "No description"')
        TICKET_TYPE=$(echo "$TICKET_DATA" | jq -r '.fields.issuetype.name // "Unknown"')
        TICKET_PRIORITY=$(echo "$TICKET_DATA" | jq -r '.fields.priority.name // "Unknown"')
        TICKET_LABELS=$(echo "$TICKET_DATA" | jq -r '.fields.labels[]? // empty' | tr '\n' ',' | sed 's/,$//')
        TICKET_COMPONENTS=$(echo "$TICKET_DATA" | jq -r '.fields.components[]?.name // empty' | tr '\n' ',' | sed 's/,$//')
        
        echo "📋 Ticket: $ISSUE_KEY"
        echo "📝 Type: $TICKET_TYPE | Priority: $TICKET_PRIORITY"
        echo "🏷️ Labels: $TICKET_LABELS"
        echo "🧩 Components: $TICKET_COMPONENTS"
    fi
    
    # AI-powered ticket analysis
    DETAILED_ANALYSIS=$(/mcp__gemini__gemini-analyze-text "$TICKET_DATA" "key-points")
    
    # Initial complexity assessment
    COMPLEXITY_ANALYSIS=$(/mcp__gemini__gemini-query "As a Senior Technical Lead with deep Alunai codebase knowledge, analyze this ticket for complexity:

Ticket Data: $TICKET_DATA

Analysis Framework:
1. TECHNICAL COMPLEXITY: Frontend, backend, database, integrations
2. SCOPE ANALYSIS: Feature scope, system boundaries, integration points
3. RISK FACTORS: Technical risks, unknown dependencies, complexity indicators
4. ALUNAI IMPACT: Which parts of the system will be affected?

Alunai System Context:
- Next.js 15.3.4 + React 19 frontend
- Supabase backend (PostgreSQL, Auth, Edge Functions)
- Multi-tenant architecture (Organizations → Teams → Brands)
- Sliding Panel System with provider architecture
- OAuth integrations with 10+ social platforms
- Enterprise security patterns

Provide initial complexity assessment and areas of impact.")
}
```

### 2. **Codebase Impact Analysis**
```bash
# Identify affected code areas
analyze_codebase_impact() {
    echo "🏗️ CODEBASE IMPACT ANALYSIS"
    echo "Identifying affected systems and components..."
    
    # Extract key terms for code analysis
    KEY_TERMS=$(/mcp__gemini__gemini-query "Extract technical keywords from this ticket: $TICKET_DATA
    
    Focus on:
    - Feature names and functionality
    - System components mentioned
    - Technical terms and technologies
    - Database entities and operations
    - UI components and workflows
    
    Return comma-separated list of search terms for codebase analysis.")
    
    # Search for related code patterns
    CODE_AREAS=$(/mcp__filesystem__search_files "." "$KEY_TERMS")
    
    # Analyze code impact areas
    IMPACT_ANALYSIS=$(/mcp__gemini__gemini-analyze-code "Analyze codebase impact for ticket: $TICKET_DATA

Related code files found: $CODE_AREAS

Alunai Architecture Analysis:
1. FRONTEND IMPACT: React components, pages, UI systems
2. BACKEND IMPACT: API routes, Edge Functions, business logic
3. DATABASE IMPACT: Schema changes, migrations, data models
4. INTEGRATION IMPACT: OAuth providers, external APIs, webhooks
5. INFRASTRUCTURE IMPACT: Deployment, configuration, environment

System Component Mapping:
- /app: Next.js app router pages and layouts
- /components: Reusable UI components
- /lib: Core business logic and utilities
- /lib/sliding-panel: UI state management system
- /lib/oauth-security: Authentication and security
- /supabase: Database schema and Edge Functions
- /docs: Architecture and system documentation

Estimate impact scope and complexity for each area.")
}
```

### 3. **Fibonacci Estimation & Effort Breakdown**
```bash
# Generate detailed effort estimates
generate_effort_estimation() {
    echo "📊 EFFORT ESTIMATION ANALYSIS"
    echo "Generating Fibonacci story points and time breakdowns..."
    
    ESTIMATION_ANALYSIS=$(/mcp__gemini__gemini-query "As a Senior Technical Lead, provide comprehensive effort estimation:

Ticket: $TICKET_DATA
Codebase Impact: $IMPACT_ANALYSIS
Complexity Assessment: $COMPLEXITY_ANALYSIS

Estimation Requirements:
1. FIBONACCI STORY POINTS: Choose from 1, 2, 3, 5, 8, 13, 21
2. EFFORT BREAKDOWN: Senior Engineer, Mid-Level Engineer, Claude AI
3. TIME ESTIMATES: Days for each experience level
4. COMPLEXITY FACTORS: What drives the estimation?
5. RISK ASSESSMENT: Technical and timeline risks
6. ASSUMPTIONS: Key assumptions made in estimation

Alunai Development Context:
- Strong TypeScript/React patterns established
- Supabase integration patterns well-defined
- OAuth security patterns reusable
- Sliding panel provider architecture mature
- Database patterns and standards established
- Comprehensive testing patterns in place

Fibonacci Scale Guide:
- 1 point (0.5-1 days): Trivial changes, minor fixes
- 2 points (1-2 days): Simple features, straightforward implementations
- 3 points (2-3 days): Standard features, moderate complexity
- 5 points (3-5 days): Complex features, architectural considerations
- 8 points (5-8 days): Large features, multiple system integration
- 13 points (8-13 days): Epic features, significant design work
- 21 points (13+ days): Too large, should be split

Provide detailed reasoning for the chosen estimation.")
    
    # Generate estimation summary table
    generate_estimation_table
}

# Create formatted estimation table
generate_estimation_table() {
    echo "📋 ESTIMATION SUMMARY TABLE"
    echo ""
    
    # Extract story points and time estimates from analysis
    STORY_POINTS=$(/mcp__gemini__gemini-query "Extract just the Fibonacci story point number from: $ESTIMATION_ANALYSIS")
    
    echo "| Experience Level | Story Points | Time Estimate | Confidence | Notes |"
    echo "|------------------|--------------|---------------|------------|-------|"
    echo "| Senior Engineer  | $STORY_POINTS | [AI will fill] | [AI will fill] | [AI will fill] |"
    echo "| Mid-Level Engineer | $STORY_POINTS | [AI will fill] | [AI will fill] | [AI will fill] |"
    echo "| Claude AI | $STORY_POINTS | [AI will fill] | [AI will fill] | [AI will fill] |"
    echo ""
    
    # Generate detailed breakdown
    DETAILED_BREAKDOWN=$(/mcp__gemini__gemini-query "Create detailed estimation table based on:
    
Story Points: $STORY_POINTS
Analysis: $ESTIMATION_ANALYSIS

Format as markdown table with:
- Experience Level
- Time Estimate (days)
- Confidence Level (High/Medium/Low)
- Key Considerations/Notes

Include reasoning for time differences between experience levels.")
}
```

### 4. **AGILE Workflow Integration**
```bash
# AGILE workflow analysis and recommendations
analyze_agile_workflow() {
    echo "🔄 AGILE WORKFLOW INTEGRATION"
    echo "Analyzing sprint planning and delivery considerations..."
    
    AGILE_ANALYSIS=$(/mcp__gemini__gemini-query "As an Agile Technical Lead, analyze workflow implications:

Ticket: $TICKET_DATA
Estimation: $ESTIMATION_ANALYSIS
Story Points: $STORY_POINTS

AGILE Analysis Required:
1. SPRINT PLANNING: How does this fit in sprint capacity?
2. DEPENDENCIES: What other tickets or work items are required?
3. ACCEPTANCE CRITERIA: Are requirements clear and testable?
4. DEFINITION OF DONE: What needs to be completed?
5. RISK MITIGATION: What could go wrong and how to prepare?
6. BREAKDOWN RECOMMENDATIONS: Should this be split into smaller stories?

Sprint Planning Considerations:
- Standard sprint length: 2 weeks (10 working days)
- Team velocity: Typically 20-40 story points per sprint
- Buffer for code review, testing, deployment: 20% overhead
- Cross-team dependencies can add 1-2 days delay

Provide actionable sprint planning recommendations.")
    
    # Generate dependency analysis
    analyze_dependencies
    
    # Risk assessment
    assess_risks
}

# Dependency analysis
analyze_dependencies() {
    echo "🔗 DEPENDENCY ANALYSIS"
    
    DEPENDENCY_ANALYSIS=$(/mcp__gemini__gemini-query "Identify dependencies for ticket: $TICKET_DATA

Dependency Categories:
1. TECHNICAL DEPENDENCIES: Required infrastructure, APIs, services
2. TEAM DEPENDENCIES: Work requiring other teams (design, product, etc.)
3. EXTERNAL DEPENDENCIES: Third-party services, vendor integrations
4. PREREQUISITE WORK: Other tickets that must be completed first
5. KNOWLEDGE DEPENDENCIES: Domain expertise or research required

Alunai System Dependencies to Consider:
- Supabase database migrations requiring coordinated deployment
- OAuth provider configurations requiring external approval
- Multi-tenant data patterns requiring careful testing
- Real-time features requiring WebSocket infrastructure
- Security changes requiring security review

Provide dependency mapping with timeline impact.")
}

# Risk assessment
assess_risks() {
    echo "⚠️ RISK ASSESSMENT"
    
    RISK_ANALYSIS=$(/mcp__gemini__gemini-query "Assess risks for ticket: $TICKET_DATA

Risk Categories:
1. TECHNICAL RISKS: Implementation complexity, architecture challenges
2. TIMELINE RISKS: Scope creep, dependency delays, unknown complexity
3. QUALITY RISKS: Testing challenges, integration complexity, regression potential
4. BUSINESS RISKS: User impact, performance implications, security considerations
5. TEAM RISKS: Knowledge gaps, availability, skill requirements

Risk Mitigation Strategies:
- Spike stories for research and prototyping
- Technical design sessions for complex features
- Early integration testing for multi-system features
- Stakeholder communication for scope management

Provide risk assessment with mitigation recommendations.")
}
```

## Advanced AGILE Features

### Story Breakdown Recommendations
```bash
# Analyze if story should be split
analyze_story_breakdown() {
    if [[ "$STORY_POINTS" -gt 8 ]]; then
        echo "📊 STORY BREAKDOWN ANALYSIS"
        echo "Large story detected - analyzing breakdown opportunities..."
        
        BREAKDOWN_ANALYSIS=$(/mcp__gemini__gemini-query "Analyze story breakdown for: $TICKET_DATA

Story Points: $STORY_POINTS (Large - consider splitting)

Breakdown Analysis:
1. VERTICAL SLICING: Can this be delivered in smaller valuable increments?
2. TECHNICAL LAYERS: Can frontend/backend work be separated?
3. FEATURE PHASES: Can this be delivered in phases with user value?
4. RISK REDUCTION: Can high-risk elements be tackled separately?
5. DEPENDENCY SEPARATION: Can dependent work be isolated?

AGILE Best Practices:
- Stories should be completable within one sprint
- Each story should deliver independent user value
- Complex stories increase uncertainty and risk
- Smaller stories improve estimation accuracy

Provide specific breakdown recommendations with user value for each piece.")
    fi
}
```

### Acceptance Criteria Analysis
```bash
# Analyze and enhance acceptance criteria
analyze_acceptance_criteria() {
    echo "✅ ACCEPTANCE CRITERIA ANALYSIS"
    
    AC_ANALYSIS=$(/mcp__gemini__gemini-query "Analyze acceptance criteria for: $TICKET_DATA

Current AC Analysis:
1. COMPLETENESS: Are all scenarios covered?
2. TESTABILITY: Can each criterion be tested?
3. CLARITY: Are requirements unambiguous?
4. USER VALUE: Does each criterion deliver value?
5. TECHNICAL CONSIDERATIONS: Are non-functional requirements included?

Enhanced AC Recommendations:
- Given/When/Then format for clarity
- Edge cases and error scenarios
- Performance and security requirements
- Cross-browser/device compatibility
- Accessibility considerations

Provide enhanced acceptance criteria recommendations.")
}
```

### Sprint Capacity Planning
```bash
# Sprint capacity and planning analysis
analyze_sprint_capacity() {
    echo "📅 SPRINT CAPACITY PLANNING"
    
    CAPACITY_ANALYSIS=$(/mcp__gemini__gemini-query "Analyze sprint capacity implications:

Story Points: $STORY_POINTS
Estimation: $ESTIMATION_ANALYSIS

Sprint Planning Factors:
1. CAPACITY FIT: How does this fit in typical sprint capacity?
2. TEAM ALLOCATION: What skills/roles are required?
3. PARALLEL WORK: Can parts be worked on simultaneously?
4. REVIEW CYCLES: Time needed for code review and testing
5. DEPLOYMENT PLANNING: Release and deployment considerations

Typical Sprint Metrics:
- Sprint length: 2 weeks (10 working days)
- Team velocity: 20-40 story points
- Code review overhead: 10-20%
- Testing and QA time: 20-30%
- Buffer for unexpected issues: 10-15%

Provide sprint planning recommendations.")
}
```

## Output Formats

### Comprehensive Estimation Report
```json
{
  "ticket_analysis": {
    "jira_key": "ALU-123",
    "summary": "Implement multi-platform content scheduler",
    "type": "Story",
    "priority": "High",
    "complexity_assessment": "Complex feature requiring multiple system integration"
  },
  "effort_estimation": {
    "story_points": 8,
    "fibonacci_rationale": "Large feature with architectural considerations and multiple integration points",
    "effort_breakdown": {
      "senior_engineer": {
        "time_estimate": "5-8 days",
        "confidence": "High",
        "considerations": "Familiar with OAuth patterns, can leverage existing components"
      },
      "mid_level_engineer": {
        "time_estimate": "7.5-12 days", 
        "confidence": "Medium",
        "considerations": "Will need guidance on OAuth integration patterns"
      },
      "claude_ai": {
        "time_estimate": "3.5-5.5 days",
        "confidence": "Medium",
        "considerations": "Can generate code with human review, limited deployment access"
      }
    }
  },
  "codebase_impact": {
    "affected_areas": [
      "/app/dashboard/content/scheduler",
      "/lib/oauth-security",
      "/lib/sliding-panel/providers",
      "/supabase/migrations"
    ],
    "complexity_factors": [
      "OAuth token management",
      "Multi-platform API integration",
      "Database schema changes",
      "Real-time UI updates"
    ]
  }
}
```

### AGILE Workflow Recommendations
```json
{
  "sprint_planning": {
    "recommended_sprint_capacity": "8 points fits in standard sprint",
    "team_allocation": "1 senior + 1 mid-level engineer",
    "timeline": "5-8 working days",
    "parallel_work_opportunities": ["Frontend UI while backend APIs being built"]
  },
  "dependencies": [
    {
      "type": "Technical",
      "description": "OAuth provider configuration",
      "impact": "1-2 day delay",
      "mitigation": "Begin provider setup early"
    }
  ],
  "risks": [
    {
      "category": "Technical",
      "risk": "Rate limiting complexity",
      "probability": "Medium",
      "impact": "High",
      "mitigation": "Spike story for rate limiting research"
    }
  ],
  "acceptance_criteria_enhancements": [
    "Add performance requirements (< 2s response time)",
    "Include error handling scenarios",
    "Specify mobile responsiveness requirements"
  ]
}
```

## Configuration Options

### Estimation Calibration
```json
{
  "estimation_config": {
    "team_velocity": {
      "typical_sprint_points": 30,
      "sprint_length_days": 10,
      "overhead_percentage": 25
    },
    "experience_multipliers": {
      "senior": 1.0,
      "mid_level": 1.5,
      "junior": 2.0,
      "ai_assisted": 0.7
    },
    "complexity_factors": {
      "new_technology": 1.5,
      "external_dependencies": 1.3,
      "database_migrations": 1.2,
      "multi_system_integration": 1.4
    }
  }
}
```

## Usage Examples

### Jira URL Analysis
```bash
# Analyze Jira ticket by URL
/m-jira-estimate https://alunai.atlassian.net/browse/ALU-123

# Analyze by issue key
/m-jira-estimate ALU-123

# Quick estimation from description
/m-jira-estimate "Add Instagram Story sharing feature with scheduling"
```

### Enhanced Analysis Options
```bash
# Include dependency analysis
/m-jira-estimate ALU-123 --include-dependencies

# Focus on sprint planning
/m-jira-estimate ALU-123 --sprint-planning

# Risk-focused analysis
/m-jira-estimate ALU-123 --risk-assessment

# Story breakdown analysis for large tickets
/m-jira-estimate ALU-123 --analyze-breakdown
```

This command provides comprehensive AGILE-integrated effort estimation with technical depth, helping teams make informed sprint planning decisions while identifying risks and dependencies early in the process.