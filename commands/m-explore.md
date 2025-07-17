# Phased Project Exploration: Strategic Analysis & Implementation Planning

**Target:** $ARGUMENTS (Default: analyze current project requirements)

**Scope:** Generate comprehensive phased implementation plan with findings structure

**Context Extension:** For analysis and exploration, always use "ultrathink" mode to allocate maximum computational budget.

## Overview

Transforms project requirements into a structured, phased implementation plan that's stored in the `.claude/findings/` directory for systematic execution. This command creates a comprehensive analysis broken down into discrete, actionable phases that can be executed independently.

**Key Benefits:**
- **Phased Approach**: Breaks complex projects into manageable phases
- **Structured Findings**: Generates organized directory structure for execution
- **Phase Tracking**: Creates tracker for progress monitoring
- **Evidence-Based**: Research-backed analysis and recommendations
- **Execution-Ready**: Directly compatible with m-execute command

## Command Usage

```bash
# Analyze current project and generate phased plan
/m-explore "implement user authentication system"

# Analyze specific feature or requirement
/m-explore "build OAuth integration with rate limiting"

# Create plan from existing documentation
/m-explore "docs/requirements/user-management.md"

# Generate plan with specific focus
/m-explore "optimize database performance" --focus performance
```

## Advanced Options

```bash
# Research-intensive analysis
/m-explore "design microservices architecture" --deep-research

# Quick planning for simple features
/m-explore "add user profile page" --quick-plan

# Security-focused analysis
/m-explore "implement payment processing" --security-focus

# Performance optimization planning
/m-explore "optimize API response times" --performance-focus
```

## Execution Process

### Phase 1: Initial Analysis & Research
1. **Requirement Understanding**: Parse and analyze the provided requirements
2. **Context Research**: Use MCP tools to research current best practices
3. **Technology Validation**: Verify framework and library choices
4. **Architecture Planning**: Design system components and interfaces

### Phase 2: Phase Structure Generation
1. **Phase Detection**: Identify natural breakpoints and dependencies
2. **Task Decomposition**: Break down complex features into actionable tasks
3. **Directory Creation**: Generate `.claude/findings/<topic>/` structure
4. **Template Population**: Create phase files from templates

### Phase 3: Content Generation
1. **Overview Creation**: Generate comprehensive project overview
2. **Phase Documentation**: Create detailed phase files with tasks
3. **Tracker Setup**: Initialize phase tracker with progress monitoring
4. **Validation Criteria**: Define success metrics for each phase

## Generated Structure

The command automatically creates:

```
.claude/findings/<topic>/
├── 00-overview.md              # High-level summary and context
├── 01-research-phase.md        # Research findings and decisions
├── 02-architecture-phase.md    # System design and architecture
├── 03-implementation-phase.md  # Core implementation tasks
├── 04-testing-phase.md         # Testing strategy and validation
├── 05-deployment-phase.md      # Deployment and monitoring
├── 99-follow-up.md            # Future improvements and maintenance
└── phase-tracker.json         # Progress tracking and status
```

## Phase File Contents

Each phase file includes:
- **Objective**: Clear statement of phase goals
- **Prerequisites**: Dependencies and requirements
- **Tasks**: Specific, actionable items with acceptance criteria
- **Validation Criteria**: Success metrics and quality gates
- **Deliverables**: Expected outputs and artifacts
- **Next Steps**: Handoff to subsequent phases
- **Notes**: Implementation guidance and gotchas

## Phase Tracker Integration

The `phase-tracker.json` file enables:
- **Progress Monitoring**: Real-time completion tracking
- **Phase Status**: Current phase identification
- **Task Counting**: Completed vs. total tasks
- **Timeline Tracking**: Start and completion dates
- **Dependency Management**: Phase prerequisite validation

## Integration with m-execute

The generated findings structure integrates seamlessly with m-execute:

```bash
# Execute all phases in sequence
/m-execute --from-findings .claude/findings/auth-system/

# Execute specific phase
/m-execute --phase .claude/findings/auth-system/02-architecture-phase.md

# Resume current phase
/m-execute --resume-phase
```

## Research Integration

The command leverages advanced research capabilities:

### MCP Tool Integration
- **Documentation Research**: `mcp__ref__ref_search_documentation`
- **Technology Validation**: `mcp__context7__get-library-docs`
- **Security Research**: `mcp__ref__ref_search_documentation` for security patterns
- **Performance Analysis**: Web research for benchmarking standards

### Sequential Thinking
- **Complex Analysis**: Uses `mcp__sequential-thinking__sequentialthinking`
- **Architecture Planning**: Systematic design evaluation
- **Risk Assessment**: Comprehensive threat modeling
- **Dependency Analysis**: Cross-phase impact evaluation

## Output Format

### Console Output
- **Topic Summary**: Brief description of generated plan
- **Phase Overview**: List of created phases with task counts
- **Findings Location**: Path to generated directory structure
- **Next Steps**: Recommended execution approach

### File Generation
- **Comprehensive Documentation**: All phases fully documented
- **Executable Structure**: Ready for m-execute integration
- **Progress Tracking**: JSON tracker for workflow coordination
- **Template-Based**: Consistent format across all phases

## Best Practices

### Planning Excellence
1. **Clear Objectives**: Each phase has specific, measurable goals
2. **Task Granularity**: Tasks are small enough to complete in one session
3. **Dependency Management**: Prerequisites clearly defined
4. **Quality Gates**: Validation criteria for each phase
5. **Realistic Estimates**: Timeline expectations based on complexity

### Research Standards
1. **Current Information**: Always use latest documentation and best practices
2. **Evidence-Based**: All recommendations backed by research
3. **Technology Validation**: Verify framework and library choices
4. **Security First**: Security considerations at every phase
5. **Performance Aware**: Performance implications always considered

### Documentation Quality
1. **Actionable Tasks**: Every task has clear acceptance criteria
2. **Context Preservation**: Maintain rationale for decisions
3. **Handoff Clarity**: Clear prerequisites and deliverables
4. **Future Reference**: Documentation useful for maintenance
5. **Consistent Format**: Standardized across all phases

## Implementation Notes

The command automatically:
1. Creates the findings directory structure if it doesn't exist
2. Generates topic-specific subdirectory with timestamp
3. Populates phase files using established templates
4. Initializes phase tracker with current status
5. Provides console summary with next steps

## Error Handling

If issues occur:
- **Directory Creation**: Automatically creates missing directories
- **Template Missing**: Falls back to built-in templates
- **Research Failures**: Continues with available information
- **Analysis Errors**: Provides partial results with warnings

## Success Metrics

A successful m-explore execution generates:
- Complete phase file structure (7 files minimum)
- Phase tracker with accurate task counts
- Actionable tasks with clear acceptance criteria
- Research-backed technology recommendations
- Clear execution roadmap for m-execute

---

*This command creates the foundation for systematic project execution. Use m-execute to implement the generated plan phase by phase.*