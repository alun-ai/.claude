# Multi-Agent Development Workflow: Orchestrated Dev-Review Cycles

**Target:** $ARGUMENTS (Default: previous discussion results or current requirements)

**Scope:** Deploy three specialized agents for coordinated development and review cycles in current directory

## Overview

Orchestrates a sophisticated three-agent development workflow where specialized AI agents collaborate to deliver high-quality code through systematic development and review cycles. Each agent has distinct responsibilities and leverages advanced tools for evidence-based decision making.

**Key Benefits:**
- **Specialized Expertise**: Each agent optimized for specific role
- **Quality Assurance**: Multi-stage review and validation process
- **Evidence-Based Decisions**: Research-backed technology and architecture choices
- **Systematic Approach**: Structured development and review cycles
- **Build Verification**: Integrated compilation and testing validation

## Help Documentation

To see this help documentation, run:
```bash
/m-orchestrated-dev --help
```

## Core Features

### 1. Three-Agent Architecture
- **Agent O (Orchestrator)**: Strategic planning and decision coordination
- **Agent D (Developer)**: Code implementation and iteration
- **Agent R (Reviewer)**: Quality assessment and comprehensive feedback
- **Collaborative Workflow**: Structured interaction between agents

### 2. Advanced Tool Integration
- **Sequential Thinking**: Systematic analysis for complex problems
- **Context7 Research**: Framework and technology validation
- **Web Search**: Current best practices and security validation
- **Build Verification**: Compilation and testing integration

### 3. Evidence-Based Development
- **Research-Backed Decisions**: Technology choices validated externally
- **Industry Standards**: Compliance with current best practices
- **Security Validation**: Vulnerability scanning and assessment
- **Performance Benchmarking**: Performance validation against standards

### 4. Quality Assurance Process
- **Multi-Dimensional Review**: Code, security, performance, standards
- **Iterative Improvement**: Continuous refinement cycles
- **Build Integration**: Compilation verification at each stage
- **Requirements Compliance**: Validation against original requirements

## Usage Examples

### Basic Development Workflow
```bash
# Start orchestrated development
/m-orchestrated-dev "Build user authentication system"

# Continue from previous discussion
/m-orchestrated-dev

# Specific feature implementation
/m-orchestrated-dev "Add OAuth2 integration with security best practices"
```

### Advanced Scenarios
```bash
# Performance-focused development
/m-orchestrated-dev "Optimize database queries" --focus performance

# Security-critical feature
/m-orchestrated-dev "Implement payment processing" --focus security

# Complex architecture
/m-orchestrated-dev "Design microservices architecture" --research-intensive
```

### Workflow Management
```bash
# Resume interrupted workflow
/m-orchestrated-dev --resume

# Fast iteration mode
/m-orchestrated-dev "Fix user login bug" --quick-cycle

# Documentation focus
/m-orchestrated-dev "Update API documentation" --docs-focus
```

## Command Options

```yaml
workflow_modes:
  --research-intensive: "Extended research phase for complex decisions"
  --quick-cycle: "Fast iteration for simple changes"
  --security-focus: "Enhanced security validation and research"
  --performance-focus: "Performance optimization and benchmarking"
  --docs-focus: "Documentation and knowledge sharing emphasis"

agent_control:
  --skip-research: "Skip web research for faster development"
  --no-build-verify: "Skip build verification steps"
  --reviewer-strict: "Enable strict review criteria"
  --developer-creative: "Allow more creative implementation approaches"

workspace_options:
  --clean-start: "Reset workspace to clean state"
  --resume: "Continue from previous session"
  --branch: "Work on specific git branch"
  --preserve-uncommitted: "Keep uncommitted changes"

output_control:
  --verbose: "Detailed agent communication logs"
  --quiet: "Minimal output, focus on results"
  --report-only: "Generate final report without implementation"
  --step-by-step: "Pause between each agent phase"
```

## Workflow Phases

### Phase 1: Strategic Planning (Agent O)
```yaml
planning_activities:
  requirement_analysis:
    - Parse and understand requirements
    - Identify technical constraints
    - Define success criteria
    - Establish acceptance criteria
    
  technology_research:
    - Research current best practices
    - Evaluate framework options
    - Assess security considerations
    - Review performance implications
    
  architecture_design:
    - Design system components
    - Define interfaces and APIs
    - Plan data models
    - Establish testing strategy
    
  development_planning:
    - Break down into tasks
    - Estimate complexity
    - Define milestones
    - Create implementation sequence
```

### Phase 2: Implementation (Agent D)
```yaml
development_activities:
  code_implementation:
    - Write production-ready code
    - Follow established patterns
    - Implement error handling
    - Add appropriate logging
    
  testing_integration:
    - Write unit tests
    - Add integration tests
    - Include edge case testing
    - Verify error scenarios
    
  documentation:
    - Add code comments
    - Update API documentation
    - Create usage examples
    - Document configuration
    
  version_control:
    - Make atomic commits
    - Write descriptive messages
    - Maintain clean history
    - Tag important milestones
```

### Phase 3: Quality Review (Agent R)
```yaml
review_dimensions:
  code_quality:
    - Readability and maintainability
    - Performance optimization
    - Error handling completeness
    - Code organization and structure
    
  security_assessment:
    - Vulnerability scanning
    - Input validation review
    - Authentication/authorization
    - Data protection compliance
    
  standards_compliance:
    - Coding standards adherence
    - Framework best practices
    - Industry standard compliance
    - Documentation completeness
    
  functional_verification:
    - Requirements compliance
    - Test coverage adequacy
    - Edge case handling
    - Integration compatibility
```

## Agent Specializations

## Agent Architecture

### Agent O (Orchestrator)
- **Role:** Workflow coordination and strategic decision making
- **Responsibilities:**
  - Parse requirements and create development plan using **sequential-thinking** for complex analysis
  - Use **context7** for technology selection and framework evaluation
  - Leverage **web_search** for current best practices and solution research
  - Coordinate between Developer and Reviewer agents
  - Make final decisions on review acceptance with evidence-based reasoning
  - Manage development workflow and iteration cycles
  - Verify project builds successfully before final completion

### Agent D (Developer)
- **Role:** Code implementation and iteration
- **Responsibilities:**
  - Implement features based on requirements and architectural decisions
  - Address review feedback and make corrections
  - Maintain code quality during iterations
  - Commit incremental progress with clear messages
  - Focus on execution rather than architectural decision-making

### Agent R (Reviewer)
- **Role:** Code quality assessment and comprehensive feedback
- **Responsibilities:**
  - Conduct thorough code reviews using **sequential-thinking** for systematic analysis
  - Use **context7** to verify framework usage and best practices compliance
  - Leverage **web_search** for security vulnerability checks and performance benchmarks
  - Provide specific, actionable feedback with external validation
  - Verify requirements compliance against industry standards
  - Include basic build verification as part of code review when applicable
  - Approve or reject implementation iterations with detailed reasoning

## Execution Steps

1. **Environment Verification**
   - Verify current working directory is ready for development
   - Check Git status and ensure clean starting state
   - Confirm all three agents have access to shared workspace

2. **Strategic Planning (Agent O)**
   - Use **sequential-thinking** to break down complex requirements systematically
   - Leverage **context7** for framework and library selection research
   - Apply **web_search** to validate technology choices against current best practices
   - Extract clear development requirements with evidence-based decisions
   - Create comprehensive development plan with architectural justifications

3. **Development Cycle (Agent D)**
   - Implement features according to specifications in current directory
   - Write tests and documentation as needed
   - Commit changes with descriptive messages
   - Signal completion to Orchestrator

4. **Comprehensive Review with Build Verification (Agent R)**
   - Use **sequential-thinking** for systematic multi-dimensional code analysis
   - Leverage **context7** to verify framework usage patterns and API compliance
   - Apply **web_search** for security vulnerability scanning and performance benchmarking
   - Attempt project compilation/build to verify technical correctness
   - Check functionality, quality, and requirements compliance against industry standards
   - Generate evidence-backed feedback with external validation and specific improvement points
   - Include build status and any compilation errors in review feedback
   - Provide approval or rejection decision with detailed technical reasoning

5. **Evidence-Based Decision Making (Agent O)**
   - Use **sequential-thinking** to evaluate review results against acceptance criteria
   - Apply **web_search** to research solutions for identified issues
   - Leverage external validation for technical decisions
   - If approved: proceed to finalization with documented rationale
   - If rejected: coordinate next development iteration with research-backed guidance
   - Track progress and maintain cycle momentum with data-driven insights

6. **Cycle Repetition**
   - Repeat steps 3-5 until Agent R approves the implementation
   - Maintain clear communication between all agents
   - Document decisions and iteration rationale

7. **Finalization**
   - **Verify project builds successfully (if applicable)**
   - **If build fails: coordinate fix with Agent D and retry**
   - Validate final implementation state
   - Generate completion report with cycle summary
   - Ensure all changes are committed and workspace is clean

## Advanced Features

### Research Integration
```yaml
research_capabilities:
  technology_validation:
    - Current framework versions
    - Security advisory checks
    - Performance benchmarking
    - Community best practices
    
  solution_verification:
    - Implementation pattern validation
    - Architecture decision research
    - Alternative approach evaluation
    - Risk assessment analysis
    
  compliance_checking:
    - Industry standard verification
    - Regulatory requirement checks
    - Accessibility compliance
    - Performance standard validation
```

### Build Integration
```yaml
build_verification:
  compilation_testing:
    - TypeScript compilation
    - JavaScript bundling
    - CSS processing
    - Asset optimization
    
  test_execution:
    - Unit test suites
    - Integration tests
    - Linting validation
    - Type checking
    
  deployment_preparation:
    - Production build testing
    - Environment configuration
    - Dependency verification
    - Asset generation
```

### Quality Gates
```yaml
quality_criteria:
  code_standards:
    minimum_coverage: "80%"
    lint_compliance: "100%"
    type_safety: "strict"
    documentation: "complete"
    
  security_requirements:
    vulnerability_scan: "pass"
    input_validation: "comprehensive"
    authentication: "secure"
    data_protection: "compliant"
    
  performance_benchmarks:
    load_time: "< 2 seconds"
    bundle_size: "optimized"
    memory_usage: "efficient"
    cpu_utilization: "reasonable"
```

## Workflow Examples

### Feature Development
```bash
# New feature implementation
/m-orchestrated-dev "Add user profile management"

# Agent O: Research profile management best practices
# Agent D: Implement profile CRUD operations
# Agent R: Review security, validation, and UX
# Cycle continues until approval
```

### Bug Fixing
```bash
# Bug resolution workflow
/m-orchestrated-dev "Fix authentication timeout issue" --quick-cycle

# Agent O: Analyze issue and plan fix
# Agent D: Implement targeted solution
# Agent R: Verify fix and check for regressions
```

### Performance Optimization
```bash
# Performance improvement
/m-orchestrated-dev "Optimize database queries" --performance-focus

# Agent O: Research optimization techniques
# Agent D: Implement optimizations
# Agent R: Benchmark and validate improvements
```

### Security Implementation
```bash
# Security feature
/m-orchestrated-dev "Implement rate limiting" --security-focus

# Agent O: Research security patterns and threats
# Agent D: Implement rate limiting middleware
# Agent R: Security audit and penetration testing
```

## Integration Patterns

### Git Workflow Integration
```yaml
git_operations:
  branch_management:
    - Feature branch creation
    - Clean commit history
    - Merge conflict resolution
    - Pull request preparation
    
  commit_strategy:
    - Atomic commits per iteration
    - Descriptive commit messages
    - Squash commits for final merge
    - Tag releases appropriately
```

### CI/CD Integration
```yaml
pipeline_integration:
  pre_commit:
    - Code formatting
    - Lint checking
    - Unit test execution
    - Security scanning
    
  build_pipeline:
    - Compilation verification
    - Integration testing
    - Performance testing
    - Deployment preparation
    
  deployment_validation:
    - Smoke testing
    - Health checks
    - Rollback planning
    - Monitoring setup
```

### Development Environment
```yaml
environment_setup:
  local_development:
    - Development server setup
    - Database configuration
    - Environment variables
    - Hot reload configuration
    
  testing_environment:
    - Test database setup
    - Mock service configuration
    - Test data preparation
    - Isolation guarantees
    
  staging_environment:
    - Production-like setup
    - Real service integration
    - Performance profiling
    - User acceptance testing
```

## Best Practices

### Agent Coordination
1. **Clear Communication**: Each agent documents decisions and rationale
2. **Evidence-Based**: All decisions backed by research and validation
3. **Iterative Improvement**: Continuous refinement through cycles
4. **Quality Focus**: Never compromise on quality for speed

### Development Standards
1. **Test-Driven**: Tests written before or with implementation
2. **Security-First**: Security considerations at every stage
3. **Performance-Aware**: Performance implications always considered
4. **Documentation**: Comprehensive documentation throughout

### Review Process
1. **Multi-Dimensional**: Code, security, performance, standards
2. **Evidence-Based**: External validation and research
3. **Constructive**: Specific, actionable feedback
4. **Standards-Driven**: Industry best practices compliance

## Troubleshooting

### Common Issues

**"Agents not coordinating"**
- Check workspace permissions
- Verify git repository status
- Ensure clean starting state
- Review agent communication logs

**"Build verification failing"**
- Check compilation errors
- Verify dependencies installed
- Review configuration files
- Test build manually

**"Review cycle too long"**
- Use --quick-cycle for simple changes
- Skip research for well-understood tasks
- Focus review on critical areas
- Adjust quality gates if appropriate

**"Conflicting agent decisions"**
- Review orchestrator logic
- Check research findings
- Validate requirements
- Consider external consultation

## Performance Optimization

### Workflow Speed
- **Research Caching**: Cache research results for similar tasks
- **Template Reuse**: Leverage previous successful patterns
- **Parallel Processing**: Run independent tasks simultaneously
- **Quality Gates**: Set appropriate quality thresholds

### Resource Management
- **Memory Usage**: Monitor agent memory consumption
- **CPU Utilization**: Balance agent workload
- **Network Usage**: Optimize external research calls
- **Storage**: Clean up temporary files and caches

## Workspace Management

### Current Directory Usage
- All three agents work in the current working directory
- Shared access to all files and Git operations
- User is responsible for directory setup and branch management
- Agents coordinate through file system and Git state

### Collaboration Requirements
- Clean Git working directory at start (recommended)
- All agents respect existing file structure
- Coordinated commit strategy to avoid conflicts
- Clear communication through commit messages and status updates

## Agent Communication Protocol

### Enhanced Agent Workflow

### Enhanced Development Phase
```
Agent O → Agent D: 
  - Requirements + Research-backed Development Plan
  - Technology selections with context7 validation
  - Architectural decisions with sequential-thinking analysis
  
Agent D → Agent O: 
  - Implementation Complete + Change Summary
  - Self-review results using zen:codereview
  - Implementation rationale and trade-offs
```

### Enhanced Review Phase
```
Agent O → Agent R: 
  - Review Request + Context + Research Background
  - Technology choice justifications and external validation
  
Agent R → Agent O: 
  - Comprehensive Review Results using multiple analysis tools
  - Evidence-backed feedback with external benchmarks
  - Security and performance assessments with web validation
```

### Decision Points
- **Approval**: Agent R accepts → Agent O finalizes
- **Rejection**: Agent R rejects → Agent O coordinates next iteration
- **Max Iterations**: Configurable limit to prevent infinite loops

## Output Format

### Cycle Summary Report
```json
{
  "working_directory": "string - current directory path",
  "git_branch": "string - active branch name",
  "iterations": [
    {
      "cycle": "number",
      "developer_commits": ["commit_hash_1", "commit_hash_2"],
      "review_feedback": "string - detailed review comments",
      "decision": "approved|rejected",
      "reasoning": "string - decision rationale"
    }
  ],
  "final_build_status": "success|failure|not_applicable",
  "final_status": "completed|failed|timeout",
  "total_cycles": "number",
  "completion_time": "string - timestamp"
}
```

### Agent Interaction Log
- Timestamped communication between agents
- Decision rationale and feedback history
- Code change tracking and review evolution

## Configuration Options

### Iteration Limits
- **max_cycles**: Maximum development-review iterations (default: 5)
- **timeout**: Maximum workflow duration (default: 60 minutes)

### Quality Gates & Research Integration
- **technology_validation**: Use context7 to verify framework and library choices
- **security_research**: Apply web_search for vulnerability scanning and security best practices
- **performance_benchmarking**: Leverage external data for performance standards
- **architecture_analysis**: Use sequential-thinking for systematic design evaluation
- **consensus_building**: Apply zen:consensus for complex technical decisions

## Final Output

Return structured report containing:
- Current working directory and Git branch status
- Complete iteration history with decisions
- Final code status and approval details
- Build verification status (when applicable)
- Recommendations for future improvements