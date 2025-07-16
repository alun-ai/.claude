# Parallel Task Execution: Multi-Agent Asynchronous Development Workflow

**Target:** $ARGUMENTS (Default: execute task plan from latest workspace file)

**Scope:** Orchestrate multiple Claude Code subagents to execute development tasks in parallel with checkpoint-based coordination

**Context Extension:** For the purpose of analysis and exploration always use "ultrathink" mode to allocate the most computational budget possible.

## Overview

Transforms Claude into your AI-powered Parallel Execution Orchestrator, providing enterprise-grade multi-agent coordination with sophisticated task distribution and intelligent workflow management. This command delivers revolutionary parallel processing capabilities, checkpoint-based synchronization, and comprehensive resource optimization that enables simultaneous execution of complex development tasks while maintaining perfect coordination and consistency across all agent operations.

**Key Benefits:**
- **AI-Powered Multi-Agent Orchestration**: Intelligent coordination of multiple Claude Code instances with automatic dependency resolution and workload balancing
- **Enterprise-Grade Checkpoint System**: Sophisticated state management with recovery capabilities and asynchronous coordination primitives
- **Revolutionary Parallel Processing**: Simultaneous execution of analysis, security, performance, and testing tasks with optimal resource utilization
- **Intelligent Conflict Resolution**: Advanced file locking, branch management, and merge conflict prevention for seamless parallel operations
- **Comprehensive Progress Tracking**: Real-time monitoring of all agents with detailed metrics and performance analytics

## Help Documentation

To see this help documentation, run:
```bash
/m-parallel-tasks --help
```

## Core Features

### 1. AI-Powered Multi-Agent Orchestration Engine
- **Intelligent Agent Spawning**: Dynamic creation and management of multiple Claude Code instances with optimal resource allocation
- **Advanced Dependency Resolution**: Machine learning-based task dependency analysis with automatic execution ordering
- **Dynamic Workload Balancing**: Real-time redistribution of tasks based on agent performance and system resources
- **Fault-Tolerant Coordination**: Resilient agent management with automatic failure recovery and task reassignment

### 2. Enterprise-Grade Checkpoint Management System
- **Atomic State Persistence**: Transactional checkpoint creation with rollback capabilities for consistent state management
- **Asynchronous Coordination Primitives**: Advanced synchronization mechanisms including distributed locks and semaphores
- **Progress Tracking Infrastructure**: Comprehensive monitoring of task execution with milestone tracking and ETA prediction
- **Recovery and Resumption**: Seamless session recovery from any checkpoint with complete state restoration

### 3. Revolutionary Parallel Processing Platform
- **Task-Specific Agent Specialization**: Dedicated agents for analysis, security, performance, testing, and feature development
- **Pipeline Parallelization**: Intelligent task pipeline construction with parallel and sequential execution optimization
- **Resource Optimization Engine**: Dynamic resource allocation based on task requirements and system capabilities
- **Performance Scaling**: Linear scalability with agent count for maximum throughput and efficiency

### 4. Intelligent Conflict Resolution and Integration
- **Advanced File Locking Mechanism**: Distributed locking system preventing concurrent file modifications
- **Git Branch Orchestration**: Automatic branch creation, management, and intelligent merging strategies
- **Result Consolidation Framework**: Smart aggregation of agent outputs with conflict resolution and deduplication
- **Communication Infrastructure**: High-performance inter-agent messaging with event broadcasting and state synchronization

## Execution Framework

### 1. **Strategic Session Initialization and Planning Phase**
- **Workspace Architecture Creation**: Establishment of isolated workspace with structured directories for agents, checkpoints, logs, and results
- **Session Metadata Management**: Comprehensive session tracking with unique identifiers, timestamps, and status monitoring
- **Task Plan Analysis**: Intelligent parsing of task plans with dependency graph construction and optimization
- **Resource Allocation Planning**: Assessment of system capabilities and optimal agent count determination
- **Security Context Establishment**: Initialization of secure communication channels and access control mechanisms

### 2. **Advanced Task Distribution and Agent Assignment Phase**
- **Dependency Graph Construction**: Building of comprehensive task dependency graph with topological sorting
- **Agent Pool Creation**: Dynamic spawning of specialized agents based on task types and requirements
- **Workload Distribution Algorithm**: Intelligent assignment of tasks to agents based on capabilities and load
- **Priority Queue Management**: Task prioritization based on dependencies, criticality, and resource availability
- **Conflict Prevention Planning**: Preemptive identification of potential conflicts and resource contentions

### 3. **Parallel Execution and Coordination Phase**
- **Concurrent Agent Execution**: Simultaneous execution of multiple agents with isolated environments
- **Checkpoint-Based Synchronization**: Regular state persistence with atomic operations and consistency guarantees
- **Inter-Agent Communication**: High-performance messaging system for coordination and data sharing
- **Progress Monitoring Infrastructure**: Real-time tracking of all agent activities with performance metrics
- **Dynamic Resource Reallocation**: Adaptive resource management based on execution patterns and bottlenecks

### 4. **Result Aggregation and Consolidation Phase**
- **Artifact Collection**: Systematic gathering of all agent outputs with validation and verification
- **Intelligent Result Merging**: Smart consolidation of findings with deduplication and conflict resolution
- **Quality Assurance Validation**: Automated verification of task completion and success criteria
- **Report Generation**: Comprehensive reporting with executive summaries and detailed findings
- **Knowledge Base Integration**: Extraction and storage of reusable insights and patterns

### 5. **Session Completion and Optimization Phase**
- **Final State Persistence**: Complete session state capture for audit and recovery purposes
- **Performance Analytics**: Detailed analysis of execution efficiency and optimization opportunities
- **Resource Cleanup**: Systematic cleanup of temporary resources and agent instances
- **Lessons Learned Extraction**: Identification of improvements for future parallel executions
- **Integration Preparation**: Packaging of results for downstream processes and systems

# Task parsing and assignment
parse_and_assign_tasks() {
    local TASK_PLAN="$1"
    local WORKSPACE="$2"

    echo "📋 Parsing task plan and creating agent assignments..."

    # Extract tasks from JSON in markdown
    TASKS=$(grep -A 1000 '"tasks"' "$TASK_PLAN" | grep -B 1000 '^```' | head -n -1 | tail -n +2)

    # Create individual agent task files
    echo "$TASKS" | jq -r '.[] | @base64' | while read -r task; do
        DECODED_TASK=$(echo "$task" | base64 --decode)
        TASK_ID=$(echo "$DECODED_TASK" | jq -r '.id')
        TASK_TYPE=$(echo "$DECODED_TASK" | jq -r '.type')

        # Create agent-specific task file
        cat > "${WORKSPACE}/agents/agent-${TASK_ID}.json" << EOF
{
  "agentId": "agent-${TASK_ID}",
  "task": ${DECODED_TASK},
  "status": "pending",
  "assignedAt": "$(date -Iseconds)",
  "checkpointPath": "${WORKSPACE}/checkpoints/checkpoint-${TASK_ID}.json",
  "logPath": "${WORKSPACE}/logs/agent-${TASK_ID}.log",
  "resultPath": "${WORKSPACE}/results/result-${TASK_ID}.json"
}
EOF

        echo "📝 Created agent assignment: agent-${TASK_ID} (${TASK_TYPE})"
    done
}

# Start ready agents based on dependency resolution
start_ready_agents() {
    local WORKSPACE="$1"
    local -n ACTIVE_AGENTS=$2
    local MAX_AGENTS="${3:-3}"

    # Find agents that are ready to start
    local AGENT_FILES=($(find "${WORKSPACE}/agents" -name "agent-*.json"))

    for agent_file in "${AGENT_FILES[@]}"; do
        local TASK_ID=$(jq -r '.task.id' "$agent_file")

        # Skip if already running
        if [[ -n "${ACTIVE_AGENTS[$TASK_ID]}" ]]; then
            continue
        fi

        # Check if at capacity
        if [[ ${#ACTIVE_AGENTS[@]} -ge $MAX_AGENTS ]]; then
            break
        fi

        # Check dependencies
        local DEPS_CHECK=$(check_task_dependencies "$TASK_ID" "$WORKSPACE")
        local DEPS_READY=$(echo "$DEPS_CHECK" | jq -r '.ready')

        if [[ "$DEPS_READY" == "true" ]]; then
            echo "🤖 Starting ready agent for task: $TASK_ID"
            (execute_agent_task "$agent_file" "$WORKSPACE") &
            local AGENT_PID=$!
            ACTIVE_AGENTS[$TASK_ID]=$AGENT_PID
        fi
    done
}
```

### Checkpoint-Based Coordination System
**Enable asynchronous coordination through shared state:**

```bash
# Checkpoint management functions
create_checkpoint() {
    local AGENT_ID="$1"
    local TASK_ID="$2"
    local STATUS="$3"
    local PROGRESS="$4"
    local WORKSPACE="$5"

    local CHECKPOINT_FILE="${WORKSPACE}/checkpoints/checkpoint-${TASK_ID}.json"

    cat > "$CHECKPOINT_FILE" << EOF
{
  "agentId": "${AGENT_ID}",
  "taskId": "${TASK_ID}",
  "status": "${STATUS}",
  "progress": ${PROGRESS},
  "timestamp": "$(date -Iseconds)",
  "workingDirectory": "$(pwd)",
  "gitCommit": "$(git rev-parse HEAD 2>/dev/null || echo 'none')",
  "dependencies": $(check_task_dependencies "$TASK_ID" "$WORKSPACE"),
  "blockers": [],
  "artifacts": [],
  "nextSteps": []
}
EOF

    echo "✅ Checkpoint created: ${TASK_ID} (${STATUS})"
    update_session_status "$WORKSPACE"
}

# Dependency checking
check_task_dependencies() {
    local TASK_ID="$1"
    local WORKSPACE="$2"

    # Get task dependencies from original plan
    local TASK_FILE="${WORKSPACE}/agents/agent-${TASK_ID}.json"
    local DEPENDENCIES=$(jq -r '.task.dependencies[]?' "$TASK_FILE" 2>/dev/null || echo "[]")

    # Check if dependencies are completed
    local READY=true
    echo "$DEPENDENCIES" | jq -r '.[]?' | while read -r dep; do
        local DEP_CHECKPOINT="${WORKSPACE}/checkpoints/checkpoint-${dep}.json"
        if [[ -f "$DEP_CHECKPOINT" ]]; then
            local DEP_STATUS=$(jq -r '.status' "$DEP_CHECKPOINT")
            if [[ "$DEP_STATUS" != "completed" ]]; then
                READY=false
            fi
        else
            READY=false
        fi
    done

    echo "{\"ready\": $READY, \"dependencies\": $(echo "$DEPENDENCIES" | jq -s '.')}"
}
```

### Agent Execution Framework
**Individual agent execution with coordination:**

```bash
# Single agent execution function
execute_agent_task() {
    local AGENT_FILE="$1"
    local WORKSPACE="$2"

    local AGENT_ID=$(jq -r '.agentId' "$AGENT_FILE")
    local TASK_ID=$(jq -r '.task.id' "$AGENT_FILE")
    local TASK_TYPE=$(jq -r '.task.type' "$AGENT_FILE")
    local TASK_DESC=$(jq -r '.task.description' "$AGENT_FILE")
    local LOG_FILE=$(jq -r '.logPath' "$AGENT_FILE")

    echo "🤖 Agent ${AGENT_ID} starting task: ${TASK_DESC}" | tee "$LOG_FILE"

    # Create initial checkpoint
    create_checkpoint "$AGENT_ID" "$TASK_ID" "in_progress" "0" "$WORKSPACE"

    # Execute task based on type
    case "$TASK_TYPE" in
        "analysis")
            execute_analysis_task "$AGENT_ID" "$TASK_ID" "$WORKSPACE" "$LOG_FILE"
            ;;
        "security")
            execute_security_task "$AGENT_ID" "$TASK_ID" "$WORKSPACE" "$LOG_FILE"
            ;;
        "performance")
            execute_performance_task "$AGENT_ID" "$TASK_ID" "$WORKSPACE" "$LOG_FILE"
            ;;
        "test")
            execute_testing_task "$AGENT_ID" "$TASK_ID" "$WORKSPACE" "$LOG_FILE"
            ;;
        "feature")
            execute_feature_task "$AGENT_ID" "$TASK_ID" "$WORKSPACE" "$LOG_FILE"
            ;;
        *)
            execute_generic_task "$AGENT_ID" "$TASK_ID" "$WORKSPACE" "$LOG_FILE"
            ;;
    esac

    # Create completion checkpoint
    create_checkpoint "$AGENT_ID" "$TASK_ID" "completed" "100" "$WORKSPACE"
    echo "✅ Agent ${AGENT_ID} completed task: ${TASK_ID}" | tee -a "$LOG_FILE"
}

# Task-specific execution functions
execute_analysis_task() {
    local AGENT_ID="$1"
    local TASK_ID="$2"
    local WORKSPACE="$3"
    local LOG_FILE="$4"

    echo "🔍 Executing analysis task..." | tee -a "$LOG_FILE"

    # Use MCP agents for comprehensive analysis
    if command -v mcp__gemini__gemini-analyze-code &> /dev/null; then
        echo "Using Gemini for code analysis..." | tee -a "$LOG_FILE"

        # Create analysis prompt based on task requirements
        local ANALYSIS_RESULT=$(mcp__gemini__gemini-analyze-code "Conduct comprehensive codebase analysis:

        Focus areas:
        - Incomplete features and TODO markers
        - Technical debt and code quality issues
        - Security vulnerabilities and access control
        - Performance bottlenecks and optimization opportunities
        - Architecture patterns and design decisions

        Provide detailed findings with specific file locations and remediation suggestions.")

        # Save analysis results
        echo "$ANALYSIS_RESULT" > "${WORKSPACE}/results/analysis-${TASK_ID}.md"

        # Update checkpoint with progress
        create_checkpoint "$AGENT_ID" "$TASK_ID" "in_progress" "50" "$WORKSPACE"

        # Generate actionable recommendations
        local RECOMMENDATIONS=$(mcp__gemini__gemini-query "Based on the analysis results, create specific actionable recommendations:

        ${ANALYSIS_RESULT}

        Format as:
        1. Priority level (High/Medium/Low)
        2. Specific action required
        3. Estimated effort (hours)
        4. Dependencies or blockers
        5. Success criteria")

        echo "$RECOMMENDATIONS" > "${WORKSPACE}/results/recommendations-${TASK_ID}.md"
    fi

    echo "Analysis task completed" | tee -a "$LOG_FILE"
}

execute_security_task() {
    local AGENT_ID="$1"
    local TASK_ID="$2"
    local WORKSPACE="$3"
    local LOG_FILE="$4"

    echo "🔒 Executing security analysis task..." | tee -a "$LOG_FILE"

    # OAuth security review
    echo "Analyzing OAuth implementation..." | tee -a "$LOG_FILE"

    # Search for OAuth-related files
    find . -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" | \
    xargs grep -l -i "oauth\|auth\|token\|session" > "${WORKSPACE}/results/auth-files-${TASK_ID}.txt"

    # Use Gemini for security analysis
    if command -v mcp__gemini__gemini-analyze-code &> /dev/null; then
        local AUTH_FILES=$(head -10 "${WORKSPACE}/results/auth-files-${TASK_ID}.txt")
        local SECURITY_ANALYSIS=$(mcp__gemini__gemini-analyze-code "Conduct security analysis of OAuth implementation:

        Files to analyze: ${AUTH_FILES}

        Focus on:
        - Token storage and encryption
        - PKCE implementation
        - State parameter validation
        - Redirect URI validation
        - Session management security
        - Multi-tenant access control

        Identify specific vulnerabilities with remediation steps.")

        echo "$SECURITY_ANALYSIS" > "${WORKSPACE}/results/security-analysis-${TASK_ID}.md"
    fi

    # Create security checklist
    cat > "${WORKSPACE}/results/security-checklist-${TASK_ID}.md" << EOF
# Security Review Checklist

## OAuth Implementation
- [ ] PKCE parameters properly generated and validated
- [ ] State parameters encrypted and validated
- [ ] Redirect URIs validated against whitelist
- [ ] Tokens encrypted at rest
- [ ] Token refresh handling secure

## Multi-tenant Security
- [ ] Row Level Security policies active
- [ ] Organization isolation verified
- [ ] API endpoints properly scoped
- [ ] User permission validation

## General Security
- [ ] Input validation on all endpoints
- [ ] SQL injection prevention
- [ ] XSS protection enabled
- [ ] CSRF tokens implemented
- [ ] Rate limiting configured
EOF

    echo "Security analysis completed" | tee -a "$LOG_FILE"
}

execute_performance_task() {
    local AGENT_ID="$1"
    local TASK_ID="$2"
    local WORKSPACE="$3"
    local LOG_FILE="$4"

    echo "⚡ Executing performance analysis task..." | tee -a "$LOG_FILE"

    # Run Next.js build analysis
    echo "Analyzing Next.js build performance..." | tee -a "$LOG_FILE"

    # Create performance baseline
    npm run build > "${WORKSPACE}/results/build-output-${TASK_ID}.txt" 2>&1

    # Bundle analysis (if available)
    if command -v npx &> /dev/null; then
        npx next-bundle-analyzer > "${WORKSPACE}/results/bundle-analysis-${TASK_ID}.txt" 2>&1 || true
    fi

    # Generate performance recommendations
    if command -v mcp__gemini__gemini-analyze-code &> /dev/null; then
        local BUILD_OUTPUT=$(cat "${WORKSPACE}/results/build-output-${TASK_ID}.txt")
        local PERF_ANALYSIS=$(mcp__gemini__gemini-analyze-code "Analyze Next.js build performance:

        Build output: ${BUILD_OUTPUT}

        Identify:
        - Bundle size optimization opportunities
        - Code splitting improvements
        - Image optimization issues
        - JavaScript optimization opportunities
        - Loading performance improvements

        Provide specific optimization recommendations.")

        echo "$PERF_ANALYSIS" > "${WORKSPACE}/results/performance-recommendations-${TASK_ID}.md"
    fi

    echo "Performance analysis completed" | tee -a "$LOG_FILE"
}
```

### Parallel Execution Controller
**Main execution logic with coordination:**

```bash
# Main parallel execution function
execute_parallel_tasks() {
    local WORKSPACE="$1"
    local MAX_PARALLEL_AGENTS="${2:-3}"

    echo "🚀 Starting parallel task execution (max ${MAX_PARALLEL_AGENTS} agents)"

    # Create agent pool
    local AGENT_POOL=()
    local ACTIVE_AGENTS=0

    # Get all agent task files
    local AGENT_FILES=($(find "${WORKSPACE}/agents" -name "agent-*.json"))

    for agent_file in "${AGENT_FILES[@]}"; do
        # Check if we can start this agent (dependencies met)
        local TASK_ID=$(jq -r '.task.id' "$agent_file")
        local DEPS_CHECK=$(check_task_dependencies "$TASK_ID" "$WORKSPACE")
        local DEPS_READY=$(echo "$DEPS_CHECK" | jq -r '.ready')

        if [[ "$DEPS_READY" == "true" && $ACTIVE_AGENTS -lt $MAX_PARALLEL_AGENTS ]]; then
            # Start agent in background
            echo "🤖 Starting agent for task: $TASK_ID"
            (execute_agent_task "$agent_file" "$WORKSPACE") &
            local AGENT_PID=$!
            AGENT_POOL[$TASK_ID]=$AGENT_PID
            ((ACTIVE_AGENTS++))
        fi
    done

    # Monitor and manage agent execution
    monitor_agent_execution "$WORKSPACE" AGENT_POOL
}

# Agent execution monitoring
monitor_agent_execution() {
    local WORKSPACE="$1"
    local -n AGENTS=$2

    echo "👀 Monitoring agent execution..."

    while [[ ${#AGENTS[@]} -gt 0 ]]; do
        for task_id in "${!AGENTS[@]}"; do
            local pid=${AGENTS[$task_id]}

            # Check if process is still running
            if ! kill -0 $pid 2>/dev/null; then
                echo "✅ Agent completed: $task_id"
                unset AGENTS[$task_id]

                # Check if new agents can be started
                start_ready_agents "$WORKSPACE" AGENTS
            fi
        done

        # Update session status
        update_session_status "$WORKSPACE"

        # Wait before next check
        sleep 5
    done

    echo "🎉 All agents completed successfully"
}

# Session status management
update_session_status() {
    local WORKSPACE="$1"
    local SESSION_FILE="${WORKSPACE}/session.json"

    # Count completed tasks
    local COMPLETED_COUNT=$(find "${WORKSPACE}/checkpoints" -name "checkpoint-*.json" -exec jq -r '.status' {} \; | grep -c "completed" || echo 0)
    local TOTAL_COUNT=$(find "${WORKSPACE}/agents" -name "agent-*.json" | wc -l)

    # Update session file
    jq --arg completed "$COMPLETED_COUNT" --arg total "$TOTAL_COUNT" --arg timestamp "$(date -Iseconds)" \
       '.completedTasks = ($completed | tonumber) | .totalTasks = ($total | tonumber) | .lastUpdate = $timestamp' \
       "$SESSION_FILE" > "${SESSION_FILE}.tmp" && mv "${SESSION_FILE}.tmp" "$SESSION_FILE"
}
```

## Usage Examples

### Basic Parallel Execution
```bash
# Execute latest task plan with default settings (3 parallel agents)
/m-parallel-tasks

# Execute specific task plan file
/m-parallel-tasks docs/workspaces/task-plan-07-14-18-53-33.md

# Execute with custom parallel agent limit
/m-parallel-tasks --max-agents 5

# Execute specific phase only
/m-parallel-tasks --phase 1

# Resume interrupted session
/m-parallel-tasks --resume parallel-session-20250714-185333
```

### Advanced Coordination
```bash
# Monitor active session
/m-parallel-tasks --monitor parallel-session-20250714-185333

# Generate session report
/m-parallel-tasks --report parallel-session-20250714-185333

# Force restart failed agents
/m-parallel-tasks --restart-failed parallel-session-20250714-185333

# Dry run (show what would be executed)
/m-parallel-tasks --dry-run
```

### Integration with Git Workflow
```bash
# Auto-commit agent results
/m-parallel-tasks --auto-commit

# Create branch per agent
/m-parallel-tasks --branch-per-agent

# Merge results automatically
/m-parallel-tasks --auto-merge
```

## Coordination Features

### State Synchronization
- **Shared Workspace**: All agents work in isolated but coordinated workspace
- **Checkpoint System**: Regular state saves for recovery and coordination
- **Dependency Tracking**: Automatic dependency resolution and blocking
- **Progress Monitoring**: Real-time progress tracking across all agents

### Conflict Resolution
- **File Locking**: Prevent concurrent file modifications
- **Git Integration**: Automatic branch management and merge conflict resolution
- **Result Consolidation**: Intelligent merging of agent outputs
- **Error Recovery**: Automatic retry and fallback mechanisms

### Communication Patterns
- **Asynchronous Messaging**: Agents communicate through checkpoint files
- **Event Broadcasting**: Status changes broadcast to all agents
- **Resource Sharing**: Shared analysis results and intermediate artifacts
- **Coordination Primitives**: Semaphores and locks for critical sections

## Output Format

### Session Summary
```json
{
  "sessionId": "20250714-185333",
  "status": "completed",
  "duration": "45 minutes",
  "tasksCompleted": 8,
  "tasksTotal": 10,
  "agentMetrics": {
    "totalAgents": 5,
    "averageExecutionTime": "12 minutes",
    "parallelEfficiency": "85%"
  },
  "artifacts": [
    "analysis-results.md",
    "security-audit.md",
    "performance-baseline.json",
    "test-coverage-report.html"
  ]
}
```

### Agent Performance Report
```json
{
  "agentPerformance": [
    {
      "agentId": "agent-analysis-001",
      "taskType": "analysis",
      "duration": "8 minutes",
      "status": "completed",
      "artifactsCreated": 3,
      "checkpointsHit": 5
    }
  ]
}
```

## Error Handling & Recovery

### Checkpoint Recovery
- Automatic recovery from last successful checkpoint
- Partial task completion preservation
- Dependency state restoration
- Resource cleanup on failure

### Agent Failure Management
- Automatic agent restart on failure
- Graceful degradation with reduced parallelism
- Error propagation and notification
- Manual intervention triggers

## Integration Points

### MCP Agent Utilization
- **Gemini Agent**: Code analysis, security review, performance optimization
- **GitHub Agent**: Repository operations, issue tracking, PR management
- **Jira Agent**: Task tracking, progress reporting, workflow integration
- **CircleCI Agent**: CI/CD integration, build monitoring, test execution

### File System Management
- **Workspace Isolation**: Separate workspace per session
- **Artifact Management**: Organized output storage and retrieval
- **Log Aggregation**: Centralized logging with agent identification
- **Result Consolidation**: Automatic merging of agent outputs

---

**Final Output:**
- Session workspace: `docs/workspaces/parallel-session-{timestamp}/`
- Consolidated report: `docs/workspaces/parallel-execution-report-{timestamp}.md`
- Agent artifacts: Individual analysis, security, performance, and test results
- Checkpoint recovery: Complete session state for resumption capability