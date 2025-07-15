# New Engineer Onboarding: AI-Powered Codebase Discovery

**Target:** $ARGUMENTS (Optional: JIRA project key for team-specific context)

**Scope:** Comprehensive interactive onboarding for new software engineers to quickly understand Alunai's codebase, architecture, history, and development workflow

## Overview

Transforms Claude into your AI-powered Onboarding Specialist, providing enterprise-grade codebase discovery and comprehensive knowledge transfer that accelerates new engineer productivity through intelligent guidance and personalized learning paths. This command delivers world-class onboarding experiences with interactive exploration, contextual learning, and hands-on exercises that enable rapid understanding of complex systems while building practical skills through AI-assisted mentorship and progressive knowledge acquisition.

**Key Benefits:**
- **AI-Powered Learning Intelligence**: Machine learning-driven personalization with adaptive learning paths and skill-based progression tracking
- **Enterprise-Grade Knowledge Transfer**: Comprehensive codebase understanding with architectural insights and historical context analysis
- **Interactive Discovery Platform**: Hands-on exploration with guided exercises, real-time Q&A, and contextual code navigation
- **Personalized Skill Development**: Role-specific learning paths with targeted exercises and competency-based progression
- **Accelerated Productivity Engine**: Rapid ramp-up through intelligent prioritization and focused learning objectives

## Help Documentation

To see this help documentation, run:
```bash
/m-onboard-me --help
```

## Core Features

### 1. AI-Powered Personalized Learning Engine
- **Adaptive Learning Path Generation**: Machine learning-based curriculum creation tailored to individual experience levels and role requirements
- **Skill Gap Analysis**: Intelligent assessment of current knowledge with targeted learning recommendations and progression tracking
- **Interactive Knowledge Verification**: Real-time comprehension testing with adaptive difficulty and personalized feedback
- **Learning Style Optimization**: Dynamic content delivery adapted to individual learning preferences and pace

### 2. Enterprise-Grade Codebase Discovery Platform
- **Intelligent Architecture Exploration**: Guided tours through system architecture with contextual explanations and dependency mapping
- **Historical Context Analysis**: Git history mining with evolution insights, decision rationale, and architectural pattern emergence
- **Component Relationship Mapping**: Visual and interactive exploration of component dependencies and data flow
- **Best Practice Pattern Recognition**: Identification and explanation of coding patterns, conventions, and architectural decisions

### 3. Interactive Hands-On Learning System
- **Guided Exercise Framework**: Progressive coding challenges with real-time guidance and solution validation
- **Sandbox Environment Provision**: Safe exploration spaces for experimentation without production impact
- **Pair Programming Simulation**: AI-assisted coding sessions with contextual hints and best practice suggestions
- **Real-World Task Integration**: Actual development tasks scaled for learning with mentorship support

### 4. Comprehensive Knowledge Integration Platform
- **Multi-Modal Learning Resources**: Documentation, code examples, video explanations, and interactive tutorials
- **Team Integration Facilitation**: Introduction to team members, processes, and communication channels
- **Development Workflow Mastery**: Hands-on practice with git workflows, CI/CD pipelines, and deployment processes
- **Continuous Learning Tracking**: Progress monitoring with milestone achievements and competency certifications

## Interactive Onboarding Framework

### Learning Pathways by Role/Team
```yaml
onboarding_pathways:
  frontend_focused:
    priority_areas: ["React components", "Sliding Panel System", "UI patterns", "State management"]
    key_files: ["AdminLayout", "SlidingPanel", "BrandContext", "component libraries"]
    estimated_time: "3-5 days deep dive"
    
  backend_focused:
    priority_areas: ["API routes", "Supabase integration", "OAuth security", "Database schema"]
    key_files: ["api routes", "Edge Functions", "oauth-security", "database migrations"]
    estimated_time: "3-5 days deep dive"
    
  fullstack_general:
    priority_areas: ["Overall architecture", "Multi-tenancy", "Integration patterns", "Development workflow"]
    key_files: ["CLAUDE.md", "architecture docs", "core lib files", "key components"]
    estimated_time: "5-7 days comprehensive"
    
  devops_infrastructure:
    priority_areas: ["Deployment", "Database management", "Performance", "Security"]
    key_files: ["deployment scripts", "Supabase config", "performance docs", "security implementations"]
    estimated_time: "2-4 days focused"
```

## Execution Framework

### 1. **Strategic Onboarding Initialization and Assessment Phase**
- **Personalized Welcome Experience**: AI-driven introduction with role detection, team assignment verification, and learning objective establishment
- **Comprehensive Skill Assessment**: Intelligent evaluation of technical background, experience level, and learning preferences
- **Learning Path Generation**: Custom curriculum creation based on role, experience, and team-specific requirements
- **Environment Setup Validation**: Development environment verification with automated tool installation and configuration
- **Success Metrics Definition**: Clear learning objectives with measurable milestones and expected outcomes

### 2. **Advanced Codebase Architecture Discovery Phase**
- **System Overview Presentation**: High-level architecture explanation with visual diagrams and component relationships
- **Technology Stack Deep Dive**: Comprehensive exploration of frameworks, libraries, and tools with practical examples
- **Design Pattern Recognition**: Identification and explanation of architectural patterns with implementation rationale
- **Historical Evolution Analysis**: Git history exploration showing system growth and architectural decisions
- **Best Practice Demonstration**: Code quality standards, conventions, and team-specific practices

### 3. **Interactive Component Exploration and Understanding Phase**
- **Core Component Analysis**: Deep dive into essential components with functionality explanations and usage examples
- **Data Flow Visualization**: Interactive tracing of data through the system with state management insights
- **API Endpoint Mapping**: Comprehensive API exploration with request/response patterns and authentication flows
- **Database Schema Understanding**: Table relationships, multi-tenancy patterns, and query optimization strategies
- **Integration Point Discovery**: External service connections, OAuth flows, and third-party API interactions

### 4. **Hands-On Practice and Skill Development Phase**
- **Guided Exercise Progression**: Carefully crafted coding challenges with increasing complexity and real-world relevance
- **Feature Implementation Practice**: Small feature additions with code review simulation and feedback
- **Bug Fix Scenarios**: Debugging exercises with common issues and resolution strategies
- **Testing Practice**: Unit test creation, integration testing, and test-driven development exercises
- **Code Review Participation**: Simulated code review scenarios with best practice reinforcement

### 5. **Team Integration and Productivity Acceleration Phase**
- **Development Workflow Mastery**: Git workflow practice, PR creation, and CI/CD pipeline interaction
- **Team Process Integration**: Introduction to sprint ceremonies, ticket management, and communication channels
- **First Task Assignment**: Carefully selected starter task with mentor support and success pathway
- **Knowledge Resource Access**: Documentation locations, team wikis, and help channel introductions
- **Continuous Learning Planning**: Ongoing skill development roadmap with advanced topic progression

## Execution Flow

### 1. **Welcome & Initial Assessment**
```bash
# Interactive onboarding startup
start_onboarding() {
    echo "🚀 WELCOME TO ALUNAI!"
    echo "========================================"
    echo "Interactive Codebase Onboarding System"
    echo "========================================"
    echo ""
    echo "Hi! I'm your AI onboarding guide. Let's get you up to speed with our codebase!"
    echo ""
    echo "First, let me learn about you:"
    
    # Gather context about the new engineer
    gather_engineer_context
    
    # Determine learning pathway
    select_learning_pathway
    
    # Set up interactive session
    initialize_onboarding_session
}

gather_engineer_context() {
    echo "📋 GETTING TO KNOW YOU"
    echo ""
    echo "Help me customize your onboarding experience:"
    echo ""
    echo "1. What's your primary role? (frontend/backend/fullstack/devops)"
    echo "2. Years of experience with React/Next.js? (0-2/3-5/5+)"
    echo "3. Experience with TypeScript? (beginner/intermediate/advanced)"
    echo "4. Familiar with Supabase/PostgreSQL? (yes/no/some)"
    echo "5. Previous experience with multi-tenant SaaS? (yes/no)"
    echo ""
    echo "💡 I'll use this to prioritize what we cover first!"
    
    # AI analysis of responses to customize experience
    LEARNING_CUSTOMIZATION=$(/mcp__gemini__gemini-query "Customize onboarding path based on:
    Role: $ROLE_RESPONSE
    React Experience: $REACT_EXPERIENCE  
    TypeScript: $TYPESCRIPT_LEVEL
    Supabase: $SUPABASE_EXPERIENCE
    Multi-tenant: $MULTITENANT_EXPERIENCE
    
    Recommend:
    1. Learning priority order
    2. Depth level for each area
    3. Estimated timeline
    4. Key concepts to emphasize
    5. Areas that might be challenging")
}
```

### 2. **Repository History & Evolution**
```bash
# Git history analysis and storytelling
explore_repository_history() {
    echo "📚 ALUNAI'S STORY: Repository History & Evolution"
    echo "================================================"
    echo ""
    echo "Let's understand how this codebase evolved..."
    
    # Recent commit analysis
    RECENT_COMMITS=$(git log --oneline -20 --pretty=format:"%h %s" | head -10)
    echo "🔍 Recent Development Activity:"
    echo "$RECENT_COMMITS"
    echo ""
    
    # Major milestone analysis
    analyze_major_milestones
    
    # Architecture evolution story
    tell_architecture_story
    
    # Interactive Q&A about history
    history_comprehension_check
}

analyze_major_milestones() {
    echo "🏗️ MAJOR ARCHITECTURAL MILESTONES"
    echo ""
    
    MILESTONE_ANALYSIS=$(/mcp__gemini__gemini-query "Analyze git history to identify major milestones:

Recent commits: $RECENT_COMMITS

Identify and explain:
1. OAUTH SECURITY IMPLEMENTATION: Recent PKCE and security improvements
2. SLIDING PANEL SYSTEM: Unified state management architecture  
3. MULTI-TENANT REFACTOR: Agency to Organization migration
4. CONTENT CURATION: Review workflow and collaboration features
5. ASSET LIBRARY: Phase 1-3 asset management system

For each milestone, explain:
- What problem it solved
- How it impacts the current architecture
- Why it's important for new engineers to understand

Format as story-driven explanations perfect for onboarding.")

    echo "📖 ALUNAI'S TECHNICAL EVOLUTION:"
    echo "$MILESTONE_ANALYSIS"
    echo ""
    
    # Interactive timeline exploration
    echo "🤔 COMPREHENSION CHECK:"
    echo "1. Why was the OAuth security system redesigned recently?"
    echo "2. What problem does the Sliding Panel System solve?"
    echo "3. How does multi-tenancy work in our architecture?"
    echo ""
    echo "💡 Think about these - we'll explore the code that implements these concepts!"
}

tell_architecture_story() {
    echo "🏛️ ARCHITECTURE EVOLUTION STORY"
    echo ""
    
    ARCHITECTURE_STORY=$(/mcp__gemini__gemini-query "Create an engaging architecture evolution story for Alunai:

Context: Social media management platform built with Next.js 15, Supabase, multi-tenant SaaS

Tell the story of:
1. FOUNDATION: Next.js + Supabase foundation for SaaS
2. SCALING CHALLENGE: Managing multiple brands/organizations  
3. UI COMPLEXITY: Need for sliding panel state management
4. SECURITY EVOLUTION: OAuth integrations with 10+ platforms
5. COLLABORATION: Team workflows and content review systems

Make it engaging and help new engineers understand WHY architectural decisions were made, not just WHAT was built.

Include specific examples of how the architecture enables features like:
- Brand switching in the UI
- Secure social media integrations  
- Real-time collaboration
- Multi-tenant data isolation")

    echo "$ARCHITECTURE_STORY"
}
```

### 3. **Interactive Architecture Discovery**
```bash
# Guided architecture exploration
explore_architecture_interactively() {
    echo "🏗️ INTERACTIVE ARCHITECTURE EXPLORATION"
    echo "======================================="
    echo ""
    echo "Now let's explore the actual code! We'll go from high-level to specific."
    
    # Start with the big picture
    show_architecture_overview
    
    # Explore each major system
    explore_major_systems_interactively
    
    # Deep dive into key components
    hands_on_component_exploration
}

show_architecture_overview() {
    echo "🌐 BIG PICTURE: Alunai System Architecture"
    echo ""
    echo "┌─────────────────────────────────────────────────────────────┐"
    echo "│                    ALUNAI ARCHITECTURE                      │"
    echo "├─────────────────────────────────────────────────────────────┤"
    echo "│ Frontend: Next.js 15 + React 19 + TypeScript               │"
    echo "│ ├── Admin Dashboard (/app/admin/)                           │"
    echo "│ ├── Marketing Site (/app/)                                  │"
    echo "│ ├── Components (/components/)                               │"
    echo "│ └── Sliding Panel System (/lib/sliding-panel/)             │"
    echo "├─────────────────────────────────────────────────────────────┤"
    echo "│ Backend: Supabase + Edge Functions                         │"
    echo "│ ├── API Routes (/app/api/)                                 │"
    echo "│ ├── Database (PostgreSQL + RLS)                           │"
    echo "│ ├── Authentication (Supabase Auth)                        │"
    echo "│ └── Real-time (Supabase Realtime)                         │"
    echo "├─────────────────────────────────────────────────────────────┤"
    echo "│ Core Systems:                                              │"
    echo "│ ├── Multi-tenant Architecture (Orgs → Teams → Brands)     │"
    echo "│ ├── OAuth Security (10+ social platforms)                 │"
    echo "│ ├── Asset Management (Upload, CDN, Collaboration)         │"
    echo "│ └── Content Workflows (Curation, Review, Publishing)      │"
    echo "└─────────────────────────────────────────────────────────────┘"
    echo ""
    
    # Interactive architecture questions
    echo "🎯 ARCHITECTURE UNDERSTANDING CHECK:"
    echo ""
    echo "Before we dive deeper, let's test your understanding:"
    echo "1. Where would you look to find API endpoints?"
    echo "2. What handles user interface state management?"
    echo "3. How is data security handled in a multi-tenant system?"
    echo "4. Where are social media integrations implemented?"
    echo ""
    echo "💡 Keep these questions in mind as we explore the actual code!"
}

explore_major_systems_interactively() {
    echo "🔍 GUIDED SYSTEM EXPLORATION"
    echo ""
    echo "Let's explore each major system hands-on. I'll show you key files and ask questions."
    
    # Multi-tenant system exploration
    explore_multitenant_system
    
    # Sliding panel system deep dive
    explore_sliding_panel_system
    
    # OAuth security system
    explore_oauth_security_system
    
    # Database and API patterns
    explore_database_api_patterns
}

explore_multitenant_system() {
    echo "🏢 MULTI-TENANT ARCHITECTURE DEEP DIVE"
    echo "======================================"
    echo ""
    echo "Alunai uses a 3-tier hierarchy: Organizations → Teams → Brands"
    echo ""
    
    # Show key files
    echo "📁 KEY FILES TO UNDERSTAND:"
    echo "   /src/types/organization.ts - Type definitions"
    echo "   /src/lib/auth/organization-auth.ts - Auth logic"
    echo "   /supabase/migrations/ - Database schema"
    echo ""
    
    # Read and explain key files
    ORGANIZATION_TYPES=$(/mcp__filesystem__read_file "/Users/chadupton/Documents/Github/alunai/src/types/organization.ts")
    
    echo "🔎 Let's look at the organization types:"
    echo "----------------------------------------"
    echo "$ORGANIZATION_TYPES" | head -30
    echo ""
    
    # Interactive learning
    echo "🧠 THINK ABOUT IT:"
    echo "1. How do you think data isolation works between organizations?"
    echo "2. What permissions might a 'team_lead' have vs 'team_member'?"
    echo "3. Why do you think we have both Teams AND Brands?"
    echo ""
    
    # Show database schema
    echo "🗄️ Database Schema (check this out):"
    echo "   Look at: /supabase/migrations/ for RLS policies"
    echo "   Key concept: Every table has organization_id for isolation"
    echo ""
    
    MULTITENANT_EXPLANATION=$(/mcp__gemini__gemini-query "Explain multi-tenancy for new engineer:

Organization Types: $ORGANIZATION_TYPES

Explain in simple terms:
1. How data isolation works (RLS with organization_id)
2. The permission hierarchy (org → team → brand roles)
3. Why this architecture scales for SaaS
4. Common patterns they'll see in the codebase
5. How to write new features that respect multi-tenancy

Include practical examples and what to watch out for.")

    echo "📚 UNDERSTANDING MULTI-TENANCY:"
    echo "$MULTITENANT_EXPLANATION"
}

explore_sliding_panel_system() {
    echo "🖥️ SLIDING PANEL SYSTEM DEEP DIVE"
    echo "================================="
    echo ""
    echo "Our custom UI state management system - one of our most important patterns!"
    echo ""
    
    # Show the sliding panel architecture
    SLIDING_PANEL_README=$(/mcp__filesystem__read_file "/Users/chadupton/Documents/Github/alunai/src/lib/sliding-panel/README.md")
    
    echo "📖 SLIDING PANEL SYSTEM OVERVIEW:"
    echo "----------------------------------"
    echo "$SLIDING_PANEL_README" | head -50
    echo ""
    
    # Show key files
    echo "📁 KEY FILES TO EXPLORE:"
    echo "   /src/lib/sliding-panel/UnifiedSlidingPanelManager.ts - Core manager"
    echo "   /src/lib/sliding-panel/providers/ - Content providers"
    echo "   /src/lib/sliding-panel/observers.ts - React hooks"
    echo ""
    
    # Interactive exploration
    echo "🔍 HANDS-ON EXPLORATION:"
    echo "1. Open UnifiedSlidingPanelManager.ts in your editor"
    echo "2. Look for the 'open' method - this is how panels are opened"
    echo "3. Check out providers/OverviewContentProvider.tsx for an example"
    echo ""
    
    echo "🤔 COMPREHENSION QUESTIONS:"
    echo "1. Why not just use React state for panel management?"
    echo "2. How does the observer pattern work here?"
    echo "3. What's a 'provider' in this context?"
    echo ""
    
    SLIDING_PANEL_EXPLANATION=$(/mcp__gemini__gemini-query "Explain sliding panel system for new engineer:

README content: $SLIDING_PANEL_README

Explain clearly:
1. Why we built custom state management vs React Context
2. How the observer pattern enables performance
3. What providers are and how to create them
4. Common use cases and when to use sliding panels
5. How to extend the system for new features

Make it practical with examples they can try.")

    echo "🎯 UNDERSTANDING SLIDING PANELS:"
    echo "$SLIDING_PANEL_EXPLANATION"
}
```

### 4. **Component Discovery & Hands-On Exploration**
```bash
# Interactive component exploration
hands_on_component_exploration() {
    echo "🧩 HANDS-ON COMPONENT EXPLORATION"
    echo "================================="
    echo ""
    echo "Time to get your hands dirty! Let's explore key components together."
    
    # Component discovery exercise
    discover_key_components
    
    # Code reading exercises
    guided_code_reading_exercises
    
    # Mini implementation challenges
    practical_coding_exercises
}

discover_key_components() {
    echo "🔍 COMPONENT DISCOVERY EXERCISE"
    echo ""
    echo "Let's find and understand our most important shared components..."
    
    # Search for key components
    KEY_COMPONENTS=$(/mcp__filesystem__search_files "/Users/chadupton/Documents/Github/alunai/src/components" "*.tsx")
    
    echo "📂 COMPONENT INVENTORY:"
    echo "----------------------"
    echo "$KEY_COMPONENTS" | grep -E "(AdminLayout|AssetLibrary|BrandSelector|ChannelManager)" | head -10
    echo ""
    
    # Analyze component patterns
    COMPONENT_ANALYSIS=$(/mcp__gemini__gemini-query "Analyze component structure for new engineer:

Key components found: $KEY_COMPONENTS

Help them understand:
1. How components are organized (shared vs feature-specific)
2. Common patterns (props, hooks, state management)
3. Key components every engineer should know
4. How to find the right component for their needs
5. Naming conventions and file organization

Focus on practical guidance for finding and using components.")

    echo "🧩 COMPONENT PATTERNS & ORGANIZATION:"
    echo "$COMPONENT_ANALYSIS"
    echo ""
    
    # Interactive component exploration
    echo "🎯 EXPLORATION EXERCISE:"
    echo "1. Find the BrandSelector component - where is it used?"
    echo "2. Look at AdminLayoutNew.tsx - how does navigation work?"
    echo "3. Explore AssetLibraryPanel.tsx - how does it handle state?"
    echo ""
    echo "💡 Try opening these files and tracing through the code!"
}

guided_code_reading_exercises() {
    echo "📖 GUIDED CODE READING EXERCISES"
    echo "================================"
    echo ""
    echo "Let's practice reading and understanding code together!"
    
    # Exercise 1: OAuth security
    echo "🔐 EXERCISE 1: OAuth Security Flow"
    echo "-----------------------------------"
    
    OAUTH_SECURITY=$(/mcp__filesystem__read_file "/Users/chadupton/Documents/Github/alunai/src/lib/oauth-security.ts" 30)
    
    echo "Here's a snippet from our OAuth security system:"
    echo "```typescript"
    echo "$OAUTH_SECURITY"
    echo "```"
    echo ""
    echo "🤔 Questions to think about:"
    echo "1. What security measures can you identify?"
    echo "2. How is state management handled?"
    echo "3. What might 'PKCE' stand for and why is it important?"
    echo ""
    
    # Exercise 2: API route patterns
    echo "🛠️ EXERCISE 2: API Route Patterns"
    echo "----------------------------------"
    
    API_ROUTE_EXAMPLE=$(/mcp__filesystem__read_file "/Users/chadupton/Documents/Github/alunai/src/app/api/brands/route.ts" 40)
    
    echo "Here's an API route example:"
    echo "```typescript"
    echo "$API_ROUTE_EXAMPLE"
    echo "```"
    echo ""
    echo "🤔 Questions to consider:"
    echo "1. How is authentication handled?"
    echo "2. What's the database access pattern?"
    echo "3. How is error handling done?"
    echo ""
    
    # Exercise 3: Database schema
    echo "🗄️ EXERCISE 3: Database Schema Patterns"
    echo "---------------------------------------"
    
    MIGRATION_EXAMPLE=$(/mcp__filesystem__read_file "/Users/chadupton/Documents/Github/alunai/supabase/migrations" 30)
    
    echo "Let's look at our database patterns:"
    echo "📁 Check: /supabase/migrations/20250710000001_asset_library_system.sql"
    echo ""
    echo "🤔 Key patterns to notice:"
    echo "1. Every table has organization_id (multi-tenancy)"
    echo "2. Snake_case naming throughout"
    echo "3. Comprehensive audit columns (created_at, updated_at, created_by)"
    echo "4. RLS policies for security"
    echo ""
}

practical_coding_exercises() {
    echo "💻 PRACTICAL CODING EXERCISES"
    echo "============================="
    echo ""
    echo "Ready to write some code? Here are beginner-friendly exercises:"
    
    echo "🎯 EXERCISE 1: Create a Simple Component"
    echo "----------------------------------------"
    echo "Goal: Create a 'WelcomeCard' component that:"
    echo "- Takes a 'userName' prop"
    echo "- Displays a welcome message"
    echo "- Uses our design system (Tailwind classes)"
    echo "- Follows our component patterns"
    echo ""
    echo "📍 Create: /src/components/onboarding/WelcomeCard.tsx"
    echo "💡 Hint: Look at existing components for patterns!"
    echo ""
    
    echo "🎯 EXERCISE 2: Add a Simple API Route"
    echo "-------------------------------------"
    echo "Goal: Create an API route that:"
    echo "- Returns onboarding status for a user"
    echo "- Includes proper authentication"
    echo "- Follows our error handling patterns"
    echo ""
    echo "📍 Create: /src/app/api/onboarding/status/route.ts"
    echo "💡 Hint: Copy patterns from /api/brands/route.ts"
    echo ""
    
    echo "🎯 EXERCISE 3: Understand Database Query"
    echo "---------------------------------------"
    echo "Goal: Write a query that:"
    echo "- Gets all brands for current user's organization"
    echo "- Respects RLS security"
    echo "- Uses proper TypeScript types"
    echo ""
    echo "💡 Hint: Look at existing queries in API routes"
    echo ""
    
    # Provide code templates
    provide_exercise_templates
}

provide_exercise_templates() {
    echo "📝 EXERCISE TEMPLATES"
    echo "===================="
    echo ""
    echo "Here are starter templates for the exercises:"
    echo ""
    
    echo "🧩 WelcomeCard Component Template:"
    echo "```typescript"
    echo "// /src/components/onboarding/WelcomeCard.tsx"
    echo "interface WelcomeCardProps {"
    echo "  userName: string;"
    echo "}"
    echo ""
    echo "export function WelcomeCard({ userName }: WelcomeCardProps) {"
    echo "  return ("
    echo "    <div className=\"bg-white rounded-lg shadow-sm border p-6\">"
    echo "      {/* Your implementation here */}"
    echo "    </div>"
    echo "  );"
    echo "}"
    echo "```"
    echo ""
    
    echo "🛠️ API Route Template:"
    echo "```typescript"
    echo "// /src/app/api/onboarding/status/route.ts"
    echo "import { createClient } from '@/lib/supabase/server';"
    echo ""
    echo "export async function GET() {"
    echo "  try {"
    echo "    const supabase = createClient();"
    echo "    // Your implementation here"
    echo "  } catch (error) {"
    echo "    // Error handling"
    echo "  }"
    echo "}"
    echo "```"
}
```

### 5. **Team-Specific Context & JIRA Integration**
```bash
# Team context and recent work analysis
explore_team_context() {
    if [[ -n "$JIRA_PROJECT" ]]; then
        echo "👥 TEAM-SPECIFIC ONBOARDING"
        echo "==========================="
        echo ""
        echo "Let's explore what your team has been working on recently..."
        
        # Fetch recent tickets for the team
        analyze_team_recent_work
        
        # Show relevant code areas
        map_tickets_to_code_areas
        
        # Suggest onboarding priorities
        customize_onboarding_for_team
    else
        # General team context
        show_general_team_structure
    fi
}

analyze_team_recent_work() {
    echo "🎫 RECENT TEAM ACTIVITY ANALYSIS"
    echo ""
    
    # Fetch recent tickets from JIRA project
    RECENT_TICKETS=$(/mcp__jira__jira_search "project = $JIRA_PROJECT AND updated >= -30d" "summary,status,assignee,updated,labels" 10)
    
    echo "📋 Your team's recent work (last 30 days):"
    echo "$RECENT_TICKETS"
    echo ""
    
    # Analyze ticket patterns
    TEAM_FOCUS_ANALYSIS=$(/mcp__gemini__gemini-query "Analyze team focus for new engineer onboarding:

Recent tickets: $RECENT_TICKETS

Help new engineer understand:
1. What types of work does this team typically do?
2. Which areas of the codebase are they working in?
3. What technologies/patterns are most relevant?
4. What should they focus on learning first?
5. Who are the key people to learn from?

Provide practical onboarding guidance based on actual recent work.")

    echo "🎯 TEAM FOCUS ANALYSIS:"
    echo "$TEAM_FOCUS_ANALYSIS"
}

map_tickets_to_code_areas() {
    echo "🗺️ MAPPING TICKETS TO CODE AREAS"
    echo ""
    
    TICKET_CODE_MAPPING=$(/mcp__gemini__gemini-query "Map recent tickets to Alunai code areas:

Recent tickets: $RECENT_TICKETS

For each ticket type, identify:
1. Primary code areas they would touch
2. Key files/components to understand
3. Architectural patterns involved
4. Dependencies with other systems

Help new engineer understand where different types of work happen in the codebase.")

    echo "📍 CODE AREA MAPPING:"
    echo "$TICKET_CODE_MAPPING"
    echo ""
    
    echo "💡 RECOMMENDED EXPLORATION ORDER:"
    echo "Based on your team's recent work, I recommend exploring these areas first:"
    echo "1. [AI will customize based on team activity]"
    echo "2. [AI will customize based on team activity]"
    echo "3. [AI will customize based on team activity]"
}

customize_onboarding_for_team() {
    echo "🎯 CUSTOMIZED ONBOARDING PLAN"
    echo "============================="
    echo ""
    
    CUSTOM_PLAN=$(/mcp__gemini__gemini-query "Create customized onboarding plan:

Team context: $TEAM_FOCUS_ANALYSIS
Code mapping: $TICKET_CODE_MAPPING

Create a specific 7-day onboarding plan:
Day 1: Foundation (most critical concepts for this team)
Day 2-3: Core systems they work with
Day 4-5: Hands-on exercises in their area
Day 6-7: First real contribution preparation

Include:
- Specific files to read
- People to meet/shadow
- Practical exercises
- Mini-projects to attempt

Make it actionable and team-specific.")

    echo "📅 YOUR CUSTOMIZED 7-DAY ONBOARDING PLAN:"
    echo "$CUSTOM_PLAN"
}

show_general_team_structure() {
    echo "👥 GENERAL TEAM STRUCTURE"
    echo "========================"
    echo ""
    echo "💡 Tip: Run '/m-onboard-me [JIRA-PROJECT-KEY]' for team-specific guidance!"
    echo ""
    echo "🏗️ TYPICAL TEAM STRUCTURE AT ALUNAI:"
    echo "- Frontend Team: React components, UI/UX, sliding panels"
    echo "- Backend Team: API routes, database, integrations"
    echo "- Full-stack: Feature development across the stack"
    echo "- Platform Team: Infrastructure, security, performance"
    echo ""
    echo "📋 COMMON WORK TYPES:"
    echo "- New feature development"
    echo "- Social platform integrations"
    echo "- Performance optimization"
    echo "- Security improvements"
    echo "- Bug fixes and maintenance"
}
```

### 6. **Tech Debt & Learning Opportunities**
```bash
# Tech debt analysis and learning opportunities
explore_tech_debt_and_opportunities() {
    echo "🔧 TECH DEBT & LEARNING OPPORTUNITIES"
    echo "====================================="
    echo ""
    echo "Every codebase has areas for improvement. Let's explore ours honestly!"
    
    # Known tech debt areas
    show_known_tech_debt
    
    # Performance improvement areas
    identify_performance_opportunities
    
    # Learning and contribution opportunities
    suggest_learning_contributions
}

show_known_tech_debt() {
    echo "📋 KNOWN TECH DEBT AREAS"
    echo "========================"
    echo ""
    echo "Being transparent about areas we're actively improving:"
    echo ""
    echo "🔄 MIGRATION IN PROGRESS:"
    echo "- Legacy React Context → Class-based patterns (Sliding Panel migration)"
    echo "- OAuth token refresh patterns standardization"
    echo "- Database query optimization"
    echo ""
    echo "🎯 IMPROVEMENT OPPORTUNITIES:"
    echo "- API response caching"
    echo "- Bundle size optimization"
    echo "- Test coverage in some areas"
    echo "- Documentation coverage"
    echo ""
    echo "💡 WHY THIS MATTERS FOR YOU:"
    echo "Understanding tech debt helps you:"
    echo "1. Avoid extending problematic patterns"
    echo "2. Contribute to improvements"
    echo "3. Make informed architectural decisions"
    echo "4. Understand why some code looks different"
    
    TECH_DEBT_EXPLANATION=$(/mcp__gemini__gemini-query "Explain tech debt context for new engineer:

Known areas:
- Sliding panel migration from React Context
- OAuth token refresh standardization  
- Database query optimization
- API caching improvements

Explain:
1. Why each area is considered tech debt
2. How it impacts development
3. What improvements are planned
4. How new engineers can help
5. What patterns to follow vs avoid

Be constructive and educational.")

    echo ""
    echo "🎓 TECH DEBT LEARNING:"
    echo "$TECH_DEBT_EXPLANATION"
}

suggest_learning_contributions() {
    echo "🌱 LEARNING CONTRIBUTION OPPORTUNITIES"
    echo "======================================"
    echo ""
    echo "Great ways to learn while contributing:"
    echo ""
    echo "🏃‍♂️ QUICK WINS (1-2 days):"
    echo "- Add TypeScript types to untyped components"
    echo "- Write tests for utility functions"
    echo "- Improve error handling in API routes"
    echo "- Add loading states to components"
    echo ""
    echo "🎯 MEDIUM PROJECTS (1-2 weeks):"
    echo "- Migrate a component to use sliding panel system"
    echo "- Optimize a slow database query"
    echo "- Add new OAuth provider integration"
    echo "- Implement missing API endpoints"
    echo ""
    echo "🚀 LARGER PROJECTS (1+ months):"
    echo "- Performance optimization initiatives"
    echo "- New feature development"
    echo "- Security improvements"
    echo "- Testing infrastructure"
    echo ""
    echo "💡 RECOMMENDATION: Start with quick wins to build confidence!"
}
```

### 7. **Interactive Q&A and Knowledge Validation**
```bash
# Knowledge validation and interactive Q&A
conduct_onboarding_assessment() {
    echo "🧠 KNOWLEDGE CHECK & INTERACTIVE Q&A"
    echo "===================================="
    echo ""
    echo "Let's validate your understanding and answer any questions!"
    
    # Comprehensive knowledge check
    knowledge_validation_quiz
    
    # Open Q&A session
    interactive_qa_session
    
    # Next steps and resources
    provide_next_steps
}

knowledge_validation_quiz() {
    echo "📝 UNDERSTANDING VALIDATION"
    echo "=========================="
    echo ""
    echo "Test your understanding (think through these, no wrong answers!):"
    echo ""
    echo "🏗️ ARCHITECTURE:"
    echo "1. If you need to add a new admin page, where would you put it?"
    echo "2. How would you ensure it respects multi-tenant isolation?"
    echo "3. Where would you add the API endpoints it needs?"
    echo ""
    echo "🔐 SECURITY:"
    echo "1. How does authentication work in our API routes?"
    echo "2. What's RLS and why do we use it?"
    echo "3. How do OAuth integrations maintain security?"
    echo ""
    echo "🎨 FRONTEND:"
    echo "1. When would you use the sliding panel system vs regular routing?"
    echo "2. How do you access current brand context in a component?"
    echo "3. Where are shared UI components stored?"
    echo ""
    echo "💾 DATABASE:"
    echo "1. What columns does every table have?"
    echo "2. How do you write a query that respects organization boundaries?"
    echo "3. Where are database schema changes managed?"
    echo ""
    
    # Provide answers and explanations
    provide_quiz_explanations
}

provide_quiz_explanations() {
    echo "💡 ANSWER EXPLANATIONS"
    echo "======================"
    echo ""
    
    QUIZ_EXPLANATIONS=$(/mcp__gemini__gemini-query "Provide comprehensive answers to onboarding quiz:

Create detailed explanations for:
1. Architecture questions (admin pages, multi-tenancy, API endpoints)
2. Security questions (auth, RLS, OAuth)
3. Frontend questions (sliding panels, brand context, components)
4. Database questions (table structure, queries, migrations)

Include:
- Clear explanations
- Code examples where helpful
- Links to relevant files
- Common mistakes to avoid

Make it educational and reinforce learning.")

    echo "$QUIZ_EXPLANATIONS"
}

interactive_qa_session() {
    echo "❓ OPEN Q&A SESSION"
    echo "=================="
    echo ""
    echo "Ask me anything about:"
    echo "- Codebase architecture and patterns"
    echo "- Development workflow and tools"
    echo "- Team processes and culture"
    echo "- Specific technical questions"
    echo "- Career growth and learning paths"
    echo ""
    echo "💬 Sample questions to get you started:"
    echo "- 'How do I set up my development environment?'"
    echo "- 'What's the code review process like?'"
    echo "- 'How do I run tests locally?'"
    echo "- 'What are the most important patterns to learn first?'"
    echo "- 'How does deployment work?'"
    echo ""
    echo "🎯 I'm here to help you succeed!"
}

provide_next_steps() {
    echo "🚀 NEXT STEPS & RESOURCES"
    echo "========================="
    echo ""
    echo "🎯 IMMEDIATE NEXT STEPS:"
    echo "1. Set up your development environment (see /docs/setup/SETUP.md)"
    echo "2. Run the app locally and explore the admin interface"
    echo "3. Make your first small contribution (see suggestions above)"
    echo "4. Schedule 1:1s with team members"
    echo "5. Join team standups and planning sessions"
    echo ""
    echo "📚 KEY RESOURCES:"
    echo "- CLAUDE.md: Comprehensive project documentation"
    echo "- /docs/: Technical documentation and guides"
    echo "- /docs/architecture/: System architecture details"
    echo "- Team Slack channels for questions"
    echo "- Code review process documentation"
    echo ""
    echo "👥 PEOPLE TO CONNECT WITH:"
    echo "- Your assigned mentor/buddy"
    echo "- Team lead for project priorities"
    echo "- Frontend/Backend leads based on your role"
    echo "- DevOps for infrastructure questions"
    echo ""
    echo "🏆 30-DAY GOALS:"
    echo "- Complete first meaningful contribution"
    echo "- Understand core architectural patterns"
    echo "- Build relationships with team members"
    echo "- Feel comfortable with development workflow"
    echo ""
    echo "✅ Remember: Everyone learns at their own pace. Don't hesitate to ask questions!"
}
```

## Advanced Onboarding Features

### Development Environment Setup Validation
```bash
# Validate development setup
validate_dev_environment() {
    echo "🔧 DEVELOPMENT ENVIRONMENT VALIDATION"
    echo "===================================="
    echo ""
    echo "Let's make sure everything is set up correctly..."
    
    # Check Node.js version
    NODE_VERSION=$(node --version 2>/dev/null || echo "not installed")
    echo "Node.js: $NODE_VERSION"
    
    # Check npm dependencies
    if [[ -f "package.json" ]]; then
        NPM_CHECK=$(npm list --depth=0 >/dev/null 2>&1 && echo "✅ Dependencies installed" || echo "❌ Run npm install")
        echo "Dependencies: $NPM_CHECK"
    fi
    
    # Check environment variables
    if [[ -f ".env.local" ]]; then
        echo "✅ Environment file exists"
    else
        echo "❌ Create .env.local (see setup docs)"
    fi
    
    # Test database connection
    echo "🗄️ Testing database connection..."
    # Add actual connection test here
    
    echo ""
    echo "🚀 QUICK START COMMANDS:"
    echo "npm run dev          # Start development server"
    echo "npm run test         # Run tests"
    echo "npm run lint         # Check code style"
}
```

### Learning Path Customization
```yaml
learning_paths:
  week_1_foundation:
    day_1: ["Project overview", "Development setup", "Basic architecture"]
    day_2: ["Component patterns", "Routing and navigation", "State management basics"]
    day_3: ["Database concepts", "API patterns", "Authentication flow"]
    day_4: ["Multi-tenancy deep dive", "Security patterns", "OAuth basics"]
    day_5: ["First contribution", "Code review", "Testing patterns"]
    
  specialized_tracks:
    frontend_specialist:
      focus: ["React patterns", "Component library", "Sliding panel system", "UI/UX patterns"]
      exercises: ["Create new component", "Implement sliding panel provider", "Style system usage"]
      
    backend_specialist:  
      focus: ["API design", "Database optimization", "Security patterns", "Integration patterns"]
      exercises: ["Create API endpoint", "Write database migration", "Implement OAuth flow"]
      
    fullstack_generalist:
      focus: ["End-to-end features", "System integration", "Performance", "Architecture"]
      exercises: ["Complete feature implementation", "Cross-system integration", "Performance optimization"]
```

## Configuration & Customization

### Onboarding Personalization
```json
{
  "onboarding_config": {
    "experience_levels": {
      "junior": {
        "pace": "slower",
        "depth": "foundational",
        "support": "high_touch",
        "exercises": "guided"
      },
      "mid_level": {
        "pace": "moderate", 
        "depth": "comprehensive",
        "support": "structured",
        "exercises": "semi_independent"
      },
      "senior": {
        "pace": "faster",
        "depth": "architectural",
        "support": "minimal",
        "exercises": "independent"
      }
    },
    "learning_styles": {
      "visual": ["architecture diagrams", "code examples", "UI walkthroughs"],
      "hands_on": ["coding exercises", "debugging sessions", "implementation tasks"],
      "conceptual": ["architecture discussions", "pattern explanations", "design rationale"]
    }
  }
}
```

## Usage Examples

### Basic Onboarding
```bash
# Start general onboarding
/m-onboard-me

# Team-specific onboarding with JIRA context
/m-onboard-me ALUNAI-FRONTEND

# Frontend-focused onboarding
/m-onboard-me --role frontend

# Experienced developer fast-track
/m-onboard-me --experience senior
```

### Targeted Learning
```bash
# Focus on specific systems
/m-onboard-me --focus sliding-panels
/m-onboard-me --focus oauth-security
/m-onboard-me --focus multi-tenancy

# Practice specific skills
/m-onboard-me --practice components
/m-onboard-me --practice api-development
/m-onboard-me --practice database-patterns
```

This comprehensive onboarding command provides new engineers with an interactive, personalized journey through the Alunai codebase, combining technical education with practical exercises and team-specific context to accelerate their path to productivity.