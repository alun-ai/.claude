# Advanced Command System with Metrics and Monitoring
# Provides intelligent command execution, metrics collection, and development insights

{ config, lib, pkgs, ... }:

let
  cfg = config.claudeCode.commands;
  inherit (lib) mkOption mkEnableOption types;

in {
  options.claudeCode.commands = {
    enable = mkEnableOption "advanced command system with metrics";

    metrics = {
      enable = mkEnableOption "command execution metrics";
      
      storage = mkOption {
        type = types.enum [ "file" "database" "memory" ];
        default = "file";
        description = "Where to store metrics data";
      };

      retention = mkOption {
        type = types.int;
        default = 30;
        description = "Days to retain metrics data";
      };
    };

    automation = {
      enable = mkEnableOption "automated command sequences";
      
      workflows = mkOption {
        type = types.attrsOf (types.submodule {
          options = {
            description = mkOption {
              type = types.str;
              description = "Workflow description";
            };
            commands = mkOption {
              type = types.listOf types.str;
              description = "List of commands to execute";
            };
            parallel = mkOption {
              type = types.bool;
              default = false;
              description = "Execute commands in parallel";
            };
            condition = mkOption {
              type = types.str;
              default = "true";
              description = "Condition to check before running workflow";
            };
          };
        });
        default = {};
        description = "Predefined workflow definitions";
      };
    };

    intelligence = {
      enable = mkEnableOption "intelligent command suggestions";
      
      contextAware = mkOption {
        type = types.bool;
        default = true;
        description = "Provide context-aware command suggestions";
      };

      learningEnabled = mkOption {
        type = types.bool;
        default = true;
        description = "Learn from command usage patterns";
      };
    };

    monitoring = {
      enable = mkEnableOption "real-time command monitoring";
      
      alertThresholds = mkOption {
        type = types.attrsOf types.int;
        default = {
          executionTime = 300; # 5 minutes
          memoryUsage = 80;    # 80% of available memory
          cpuUsage = 90;       # 90% CPU usage
        };
        description = "Alert thresholds for various metrics";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    # Command system packages
    environment.systemPackages = with pkgs; [
      # Performance monitoring
      hyperfine      # Benchmarking
      time          # Time measurement
      htop          # System monitoring
      iotop         # I/O monitoring
      
      # Process management
      parallel      # Parallel execution
      watch         # Command monitoring
      pv            # Progress viewer
      
      # System utilities
      procps        # Process utilities
      psmisc        # Process management
      lsof          # List open files
      
      # Data processing
      jq            # JSON processing
      yq            # YAML processing
      sqlite        # Local database
    ];

    # Command system scripts
    environment.systemPackages = [
      # Main command system manager
      (pkgs.writeShellScriptBin "claude-cmd" ''
        #!/bin/bash
        
        # Claude Code Command System
        set -euo pipefail
        
        # Configuration
        METRICS_DIR="''${CLAUDE_CODE_CACHE_DIR:-$HOME/.cache/claude-code}/metrics"
        WORKFLOWS_DIR="$HOME/.config/claude-code/workflows"
        DATABASE="$METRICS_DIR/commands.db"
        
        # Colors
        RED='\033[0;31m'
        GREEN='\033[0;32m'
        YELLOW='\033[1;33m'
        BLUE='\033[0;34m'
        PURPLE='\033[0;35m'
        CYAN='\033[0;36m'
        NC='\033[0m'
        
        # Logging functions
        log_info() { echo -e "''${BLUE}[INFO]''${NC} $1"; }
        log_warn() { echo -e "''${YELLOW}[WARN]''${NC} $1"; }
        log_error() { echo -e "''${RED}[ERROR]''${NC} $1"; }
        log_success() { echo -e "''${GREEN}[SUCCESS]''${NC} $1"; }
        log_metric() { echo -e "''${PURPLE}[METRIC]''${NC} $1"; }
        
        # Initialize metrics database
        init_database() {
          mkdir -p "$METRICS_DIR"
          
          if command -v sqlite3 >/dev/null 2>&1; then
            sqlite3 "$DATABASE" <<EOF
CREATE TABLE IF NOT EXISTS command_metrics (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
  command TEXT NOT NULL,
  duration_ms INTEGER,
  exit_code INTEGER,
  memory_peak_kb INTEGER,
  cpu_percent REAL,
  project_path TEXT,
  git_commit TEXT,
  workflow TEXT
);

CREATE TABLE IF NOT EXISTS command_suggestions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  context TEXT NOT NULL,
  command TEXT NOT NULL,
  frequency INTEGER DEFAULT 1,
  last_used DATETIME DEFAULT CURRENT_TIMESTAMP,
  success_rate REAL DEFAULT 1.0
);

CREATE INDEX IF NOT EXISTS idx_command_timestamp ON command_metrics(timestamp);
CREATE INDEX IF NOT EXISTS idx_command_name ON command_metrics(command);
CREATE INDEX IF NOT EXISTS idx_context ON command_suggestions(context);
EOF
          fi
        }
        
        # Record command metrics
        record_metrics() {
          local command="$1"
          local duration_ms="$2"
          local exit_code="$3"
          local memory_kb="''${4:-0}"
          local cpu_percent="''${5:-0.0}"
          local workflow="''${6:-manual}"
          
          local project_path="$(pwd)"
          local git_commit=""
          
          if command -v git >/dev/null 2>&1 && [[ -d .git ]]; then
            git_commit=$(git rev-parse --short HEAD 2>/dev/null || echo "")
          fi
          
          if command -v sqlite3 >/dev/null 2>&1; then
            sqlite3 "$DATABASE" <<EOF
INSERT INTO command_metrics (command, duration_ms, exit_code, memory_peak_kb, cpu_percent, project_path, git_commit, workflow)
VALUES ('$command', $duration_ms, $exit_code, $memory_kb, $cpu_percent, '$project_path', '$git_commit', '$workflow');
EOF
          fi
          
          log_metric "Recorded: $command (''${duration_ms}ms, exit: $exit_code)"
        }
        
        # Execute command with monitoring
        execute_monitored() {
          local command="$1"
          local workflow="''${2:-manual}"
          
          log_info "Executing: $command"
          
          local start_time=$(date +%s%3N)
          local temp_log=$(mktemp)
          
          # Run command with monitoring
          if command -v time >/dev/null 2>&1; then
            /usr/bin/time -f "%M %P" bash -c "$command" 2>"$temp_log"
            local exit_code=$?
          else
            bash -c "$command"
            local exit_code=$?
          fi
          
          local end_time=$(date +%s%3N)
          local duration=$((end_time - start_time))
          
          # Parse memory and CPU usage
          local memory_kb=0
          local cpu_percent=0.0
          
          if [[ -f "$temp_log" ]]; then
            local time_output=$(cat "$temp_log")
            memory_kb=$(echo "$time_output" | awk '{print $1}' | head -1)
            cpu_percent=$(echo "$time_output" | awk '{print $2}' | sed 's/%//' | head -1)
          fi
          
          # Record metrics
          record_metrics "$command" "$duration" "$exit_code" "$memory_kb" "$cpu_percent" "$workflow"
          
          # Check thresholds and alert if necessary
          if [[ $duration -gt $((${toString cfg.monitoring.alertThresholds.executionTime} * 1000)) ]]; then
            log_warn "Command took longer than expected: ''${duration}ms"
          fi
          
          if [[ $(echo "$cpu_percent > ${toString cfg.monitoring.alertThresholds.cpuUsage}" | bc 2>/dev/null || echo 0) -eq 1 ]]; then
            log_warn "High CPU usage detected: ''${cpu_percent}%"
          fi
          
          rm -f "$temp_log"
          return $exit_code
        }
        
        # Get command suggestions based on context
        get_suggestions() {
          local context="$1"
          
          if command -v sqlite3 >/dev/null 2>&1 && [[ -f "$DATABASE" ]]; then
            log_info "💡 Suggestions for context: $context"
            
            sqlite3 "$DATABASE" -header -column <<EOF
SELECT command, frequency, success_rate, 
       datetime(last_used) as last_used
FROM command_suggestions 
WHERE context LIKE '%$context%' 
ORDER BY frequency DESC, success_rate DESC 
LIMIT 5;
EOF
          fi
        }
        
        # Learn from command usage
        learn_command() {
          local context="$1"
          local command="$2"
          local success="''${3:-true}"
          
          if command -v sqlite3 >/dev/null 2>&1; then
            local success_rate=$(echo "$success" | grep -q "true" && echo "1.0" || echo "0.0")
            
            sqlite3 "$DATABASE" <<EOF
INSERT OR REPLACE INTO command_suggestions (context, command, frequency, last_used, success_rate)
VALUES (
  '$context',
  '$command',
  COALESCE((SELECT frequency + 1 FROM command_suggestions WHERE context = '$context' AND command = '$command'), 1),
  CURRENT_TIMESTAMP,
  COALESCE((SELECT (success_rate * frequency + $success_rate) / (frequency + 1) FROM command_suggestions WHERE context = '$context' AND command = '$command'), $success_rate)
);
EOF
          fi
        }
        
        # Execute workflow
        execute_workflow() {
          local workflow_name="$1"
          local workflow_file="$WORKFLOWS_DIR/$workflow_name.json"
          
          if [[ ! -f "$workflow_file" ]]; then
            log_error "Workflow not found: $workflow_name"
            return 1
          fi
          
          log_info "🚀 Executing workflow: $workflow_name"
          
          local description=$(jq -r '.description' "$workflow_file")
          local commands=($(jq -r '.commands[]' "$workflow_file"))
          local parallel=$(jq -r '.parallel // false' "$workflow_file")
          local condition=$(jq -r '.condition // "true"' "$workflow_file")
          
          log_info "Description: $description"
          
          # Check condition
          if ! eval "$condition"; then
            log_warn "Workflow condition not met: $condition"
            return 1
          fi
          
          if [[ "$parallel" == "true" ]]; then
            log_info "Running commands in parallel..."
            
            local pids=()
            for cmd in "''${commands[@]}"; do
              execute_monitored "$cmd" "$workflow_name" &
              pids+=($!)
            done
            
            # Wait for all parallel commands
            local exit_code=0
            for pid in "''${pids[@]}"; do
              wait $pid || exit_code=1
            done
            
            return $exit_code
          else
            log_info "Running commands sequentially..."
            
            for cmd in "''${commands[@]}"; do
              if ! execute_monitored "$cmd" "$workflow_name"; then
                log_error "Command failed: $cmd"
                return 1
              fi
            done
          fi
          
          log_success "✅ Workflow completed: $workflow_name"
        }
        
        # Show metrics dashboard
        show_dashboard() {
          log_info "📊 Claude Code Command Dashboard"
          echo
          
          if command -v sqlite3 >/dev/null 2>&1 && [[ -f "$DATABASE" ]]; then
            # Most used commands
            echo -e "''${CYAN}Most Used Commands (Last 7 days):''${NC}"
            sqlite3 "$DATABASE" -header -column <<EOF
SELECT command, COUNT(*) as usage_count, 
       AVG(duration_ms) as avg_duration_ms,
       AVG(CASE WHEN exit_code = 0 THEN 1.0 ELSE 0.0 END) * 100 as success_rate
FROM command_metrics 
WHERE timestamp > datetime('now', '-7 days')
GROUP BY command 
ORDER BY usage_count DESC 
LIMIT 10;
EOF
            echo
            
            # Performance trends
            echo -e "''${CYAN}Performance Trends:''${NC}"
            sqlite3 "$DATABASE" -header -column <<EOF
SELECT DATE(timestamp) as date,
       COUNT(*) as commands_run,
       AVG(duration_ms) as avg_duration,
       MAX(duration_ms) as max_duration
FROM command_metrics 
WHERE timestamp > datetime('now', '-7 days')
GROUP BY DATE(timestamp)
ORDER BY date DESC;
EOF
            echo
            
            # Slow commands
            echo -e "''${CYAN}Slowest Commands (Last 24h):''${NC}"
            sqlite3 "$DATABASE" -header -column <<EOF
SELECT command, duration_ms, datetime(timestamp) as when_run
FROM command_metrics 
WHERE timestamp > datetime('now', '-1 day')
ORDER BY duration_ms DESC 
LIMIT 5;
EOF
          else
            log_warn "No metrics database found. Run 'claude-cmd init' first."
          fi
        }
        
        # Create sample workflows
        create_sample_workflows() {
          mkdir -p "$WORKFLOWS_DIR"
          
          # Development workflow
          cat > "$WORKFLOWS_DIR/dev.json" <<EOF
{
  "description": "Standard development workflow",
  "condition": "test -f package.json || test -f Cargo.toml || test -f go.mod",
  "parallel": false,
  "commands": [
    "git pull",
    "claude-incremental lint",
    "claude-incremental build",
    "claude-incremental test"
  ]
}
EOF
          
          # Release workflow
          cat > "$WORKFLOWS_DIR/release.json" <<EOF
{
  "description": "Release preparation workflow",
  "condition": "git status --porcelain | wc -l | grep -q '^0$'",
  "parallel": false,
  "commands": [
    "claude-incremental test",
    "claude-security-scan full",
    "claude-incremental build",
    "git tag -a v$(date +%Y%m%d) -m 'Release $(date +%Y-%m-%d)'"
  ]
}
EOF
          
          # CI/CD simulation
          cat > "$WORKFLOWS_DIR/ci.json" <<EOF
{
  "description": "Continuous integration simulation",
  "condition": "true",
  "parallel": true,
  "commands": [
    "claude-incremental lint",
    "claude-incremental test",
    "claude-security-scan quick"
  ]
}
EOF
          
          log_success "✅ Created sample workflows in $WORKFLOWS_DIR"
        }
        
        # Main command dispatcher
        case "''${1:-help}" in
          "init")
            log_info "🔧 Initializing Claude Code command system"
            init_database
            create_sample_workflows
            log_success "✅ Command system initialized"
            ;;
            
          "run")
            [[ $# -lt 2 ]] && { log_error "Usage: claude-cmd run <command>"; exit 1; }
            shift
            execute_monitored "$*"
            ;;
            
          "workflow")
            [[ $# -lt 2 ]] && { log_error "Usage: claude-cmd workflow <name>"; exit 1; }
            execute_workflow "$2"
            ;;
            
          "suggest")
            context="''${2:-$(basename $(pwd))}"
            get_suggestions "$context"
            ;;
            
          "learn")
            [[ $# -lt 3 ]] && { log_error "Usage: claude-cmd learn <context> <command>"; exit 1; }
            learn_command "$2" "$3" "''${4:-true}"
            ;;
            
          "dashboard")
            show_dashboard
            ;;
            
          "metrics")
            if command -v sqlite3 >/dev/null 2>&1 && [[ -f "$DATABASE" ]]; then
              sqlite3 "$DATABASE" -header -column "SELECT * FROM command_metrics ORDER BY timestamp DESC LIMIT 20;"
            else
              log_error "Metrics database not found"
            fi
            ;;
            
          "workflows")
            log_info "📋 Available workflows:"
            if [[ -d "$WORKFLOWS_DIR" ]]; then
              for workflow in "$WORKFLOWS_DIR"/*.json; do
                if [[ -f "$workflow" ]]; then
                  local name=$(basename "$workflow" .json)
                  local desc=$(jq -r '.description' "$workflow" 2>/dev/null || echo "No description")
                  echo "  ''${name}: $desc"
                fi
              done
            else
              log_warn "No workflows directory found. Run 'claude-cmd init' first."
            fi
            ;;
            
          "clean")
            log_info "🧹 Cleaning old metrics data"
            if command -v sqlite3 >/dev/null 2>&1 && [[ -f "$DATABASE" ]]; then
              sqlite3 "$DATABASE" "DELETE FROM command_metrics WHERE timestamp < datetime('now', '-${toString cfg.metrics.retention} days');"
              log_success "✅ Cleaned metrics older than ${toString cfg.metrics.retention} days"
            fi
            ;;
            
          "help"|*)
            echo "Claude Code Command System"
            echo "Usage: claude-cmd {init|run|workflow|suggest|learn|dashboard|metrics|workflows|clean|help}"
            echo
            echo "Commands:"
            echo "  init              - Initialize command system and database"
            echo "  run <command>     - Execute command with monitoring"
            echo "  workflow <name>   - Execute predefined workflow"
            echo "  suggest [context] - Get command suggestions"
            echo "  learn <ctx> <cmd> - Learn command for context"
            echo "  dashboard         - Show metrics dashboard"
            echo "  metrics           - Show recent command metrics"
            echo "  workflows         - List available workflows"
            echo "  clean             - Clean old metrics data"
            echo "  help              - Show this help message"
            ;;
        esac
      '')

      # Smart command wrapper
      (pkgs.writeShellScriptBin "smart" ''
        #!/bin/bash
        
        # Smart command execution with context awareness
        COMMAND="$*"
        PROJECT_TYPE=""
        
        # Detect project type
        if [[ -f package.json ]]; then
          PROJECT_TYPE="nodejs"
        elif [[ -f Cargo.toml ]]; then
          PROJECT_TYPE="rust"
        elif [[ -f go.mod ]]; then
          PROJECT_TYPE="go"
        elif [[ -f pyproject.toml ]] || [[ -f requirements.txt ]]; then
          PROJECT_TYPE="python"
        fi
        
        # Context-aware command suggestions
        if [[ -z "$COMMAND" ]]; then
          echo "💡 Smart command suggestions for $PROJECT_TYPE project:"
          claude-cmd suggest "$PROJECT_TYPE"
          exit 0
        fi
        
        # Execute with learning
        if claude-cmd run "$COMMAND"; then
          claude-cmd learn "$PROJECT_TYPE" "$COMMAND" "true"
        else
          claude-cmd learn "$PROJECT_TYPE" "$COMMAND" "false"
          exit 1
        fi
      '')
    ];

    # Shell integration for command system
    programs.bash.initExtra = ''
      # Claude Code Command System Integration
      
      # Auto-initialize on first use
      if [[ ! -f "''${CLAUDE_CODE_CACHE_DIR:-$HOME/.cache/claude-code}/metrics/commands.db" ]]; then
        claude-cmd init >/dev/null 2>&1
      fi
      
      # Command aliases
      alias cmd="claude-cmd run"
      alias workflow="claude-cmd workflow"
      alias suggest="claude-cmd suggest"
      alias dashboard="claude-cmd dashboard"
      
      # Smart aliases for common tasks
      alias dev="claude-cmd workflow dev"
      alias ci="claude-cmd workflow ci"
      alias release="claude-cmd workflow release"
      
      # Wrapper function for learning common commands
      c() {
        if [[ $# -eq 0 ]]; then
          smart
        else
          smart "$@"
        fi
      }
      
      # Command history analysis
      analyze_history() {
        echo "🔍 Analyzing command history for patterns..."
        
        # Get recent commands from history
        history | tail -100 | awk '{$1=""; print $0}' | sort | uniq -c | sort -nr | head -10
      }
      
      # Project-specific command shortcuts
      if [[ -f package.json ]]; then
        alias start="claude-cmd run 'npm start'"
        alias install="claude-cmd run 'npm install'"
        alias update="claude-cmd run 'npm update'"
      fi
      
      if [[ -f Cargo.toml ]]; then
        alias check="claude-cmd run 'cargo check'"
        alias clippy="claude-cmd run 'cargo clippy'"
        alias fmt="claude-cmd run 'cargo fmt'"
      fi
      
      if [[ -f go.mod ]]; then
        alias gorun="claude-cmd run 'go run .'"
        alias gotest="claude-cmd run 'go test ./...'"
        alias gofmt="claude-cmd run 'go fmt ./...'"
      fi
      
      # Export functions
      export -f analyze_history c
    '';

    # Pre-defined workflows based on configuration
    claudeCode.commands.automation.workflows = lib.mkDefault {
      dev = {
        description = "Standard development workflow";
        commands = [ "git pull" "claude-incremental lint" "claude-incremental build" "claude-incremental test" ];
        parallel = false;
        condition = "test -f package.json || test -f Cargo.toml || test -f go.mod";
      };

      ci = {
        description = "Continuous integration simulation";
        commands = [ "claude-incremental lint" "claude-incremental test" "claude-security-scan quick" ];
        parallel = true;
        condition = "true";
      };

      release = {
        description = "Release preparation workflow";
        commands = [ "claude-incremental test" "claude-security-scan full" "claude-incremental build" ];
        parallel = false;
        condition = "git status --porcelain | wc -l | grep -q '^0$'";
      };
    };
  };
}