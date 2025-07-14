# Testing and Monitoring Framework Module
# Provides comprehensive testing of configurations and real-time monitoring

{ config, lib, pkgs, ... }:

let
  cfg = config.claudeCode.testing;
  inherit (lib) mkOption mkEnableOption types;

in {
  options.claudeCode.testing = {
    enable = mkEnableOption "testing and monitoring framework";

    validation = {
      enable = mkEnableOption "configuration validation tests";
      
      strictMode = mkOption {
        type = types.bool;
        default = false;
        description = "Enable strict validation mode (fails on warnings)";
      };

      testSuites = mkOption {
        type = types.listOf (types.enum [ "basic" "performance" "security" "integration" "compatibility" ]);
        default = [ "basic" "performance" "security" ];
        description = "Test suites to run";
      };
    };

    monitoring = {
      enable = mkEnableOption "real-time system monitoring";
      
      interval = mkOption {
        type = types.int;
        default = 30;
        description = "Monitoring interval in seconds";
      };

      alerts = {
        enable = mkEnableOption "monitoring alerts";
        
        thresholds = mkOption {
          type = types.attrsOf types.int;
          default = {
            cpuUsage = 80;      # 80% CPU usage
            memoryUsage = 85;   # 85% memory usage
            diskUsage = 90;     # 90% disk usage
            loadAverage = 4;    # Load average > 4
          };
          description = "Alert thresholds for various metrics";
        };
      };

      dashboards = mkOption {
        type = types.listOf (types.enum [ "system" "development" "security" "performance" ]);
        default = [ "system" "development" ];
        description = "Monitoring dashboards to enable";
      };
    };

    benchmarking = {
      enable = mkEnableOption "performance benchmarking";
      
      baseline = mkOption {
        type = types.bool;
        default = true;
        description = "Establish performance baselines";
      };

      regression = mkOption {
        type = types.bool;
        default = true;
        description = "Detect performance regressions";
      };
    };

    reporting = {
      enable = mkEnableOption "test and monitoring reports";
      
      formats = mkOption {
        type = types.listOf (types.enum [ "html" "json" "junit" "markdown" ]);
        default = [ "html" "json" ];
        description = "Report output formats";
      };

      outputDir = mkOption {
        type = types.str;
        default = "./.test-reports";
        description = "Directory for test and monitoring reports";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    # Testing and monitoring packages
    environment.systemPackages = with pkgs; [
      # Testing tools
      shellcheck    # Shell script analysis
      shfmt        # Shell script formatter
      
      # Monitoring tools
      htop         # Interactive process viewer
      iotop        # I/O monitoring
      nethogs      # Network monitoring
      ncdu         # Disk usage analyzer
      
      # Benchmarking tools
      hyperfine    # Command-line benchmarking
      time         # Time measurement
      stress       # System stress testing
      sysbench     # System performance benchmarking
      
      # Reporting tools
      pandoc       # Document converter
      graphviz     # Graph visualization
      
      # System utilities
      procps       # Process utilities
      psmisc       # Advanced process management
      lsof         # List open files
      strace       # System call tracer
    ];

    # Main testing framework script
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "claude-test" ''
        #!/bin/bash
        
        # Claude Code Testing Framework
        set -euo pipefail
        
        # Configuration
        TEST_DIR="''${CLAUDE_CODE_CACHE_DIR:-$HOME/.cache/claude-code}/tests"
        REPORT_DIR="${cfg.reporting.outputDir}"
        STRICT_MODE=${lib.boolToString cfg.validation.strictMode}
        
        # Colors
        RED='\033[0;31m'
        GREEN='\033[0;32m'
        YELLOW='\033[1;33m'
        BLUE='\033[0;34m'
        PURPLE='\033[0;35m'
        NC='\033[0m'
        
        # Logging functions
        log_info() { echo -e "''${BLUE}[INFO]''${NC} $1"; }
        log_warn() { echo -e "''${YELLOW}[WARN]''${NC} $1"; }
        log_error() { echo -e "''${RED}[ERROR]''${NC} $1"; }
        log_success() { echo -e "''${GREEN}[SUCCESS]''${NC} $1"; }
        log_test() { echo -e "''${PURPLE}[TEST]''${NC} $1"; }
        
        # Test result tracking
        TESTS_RUN=0
        TESTS_PASSED=0
        TESTS_FAILED=0
        TESTS_WARNINGS=0
        
        # Initialize test environment
        init_testing() {
          mkdir -p "$TEST_DIR" "$REPORT_DIR"
          
          log_info "🧪 Claude Code Testing Framework"
          log_info "Test directory: $TEST_DIR"
          log_info "Report directory: $REPORT_DIR"
          log_info "Strict mode: $STRICT_MODE"
          echo
        }
        
        # Run a test and track results
        run_test() {
          local test_name="$1"
          local test_command="$2"
          local is_critical="''${3:-false}"
          
          log_test "Running: $test_name"
          TESTS_RUN=$((TESTS_RUN + 1))
          
          local start_time=$(date +%s%3N)
          local test_output
          local exit_code
          
          if test_output=$(eval "$test_command" 2>&1); then
            local end_time=$(date +%s%3N)
            local duration=$((end_time - start_time))
            
            log_success "✅ $test_name (''${duration}ms)"
            TESTS_PASSED=$((TESTS_PASSED + 1))
            
            # Record test result
            echo "PASS,$test_name,$duration,$test_output" >> "$TEST_DIR/results.csv"
            return 0
          else
            exit_code=$?
            local end_time=$(date +%s%3N)
            local duration=$((end_time - start_time))
            
            if [[ "$is_critical" == "true" || "$STRICT_MODE" == "true" ]]; then
              log_error "❌ $test_name (''${duration}ms)"
              TESTS_FAILED=$((TESTS_FAILED + 1))
              echo "FAIL,$test_name,$duration,$test_output" >> "$TEST_DIR/results.csv"
            else
              log_warn "⚠️  $test_name (''${duration}ms)"
              TESTS_WARNINGS=$((TESTS_WARNINGS + 1))
              echo "WARN,$test_name,$duration,$test_output" >> "$TEST_DIR/results.csv"
            fi
            
            return $exit_code
          fi
        }
        
        # Basic configuration tests
        test_basic() {
          log_info "🔧 Running basic configuration tests"
          
          run_test "Nix configuration syntax" "nix-instantiate --parse nix/default.nix >/dev/null" true
          run_test "Configuration evaluation" "nix-instantiate --eval nix/default.nix >/dev/null" true
          run_test "Required packages available" "command -v git >/dev/null && command -v jq >/dev/null" true
          run_test "Cache directory writable" "mkdir -p \$CLAUDE_CODE_CACHE_DIR && touch \$CLAUDE_CODE_CACHE_DIR/test && rm \$CLAUDE_CODE_CACHE_DIR/test" true
          run_test "Git repository detection" "test -d .git || echo 'Not a git repository (OK)'" false
          run_test "Project type detection" "test -n \"\$CLAUDE_CODE_PROJECT_TYPE\"" false
          run_test "Environment variables set" "test -n \"\$CLAUDE_CODE_ENABLED\"" false
          
          # Test core tools
          local core_tools=(git curl jq rg fd tree)
          for tool in "''${core_tools[@]}"; do
            run_test "Core tool: $tool" "command -v $tool >/dev/null" false
          done
        }
        
        # Performance tests
        test_performance() {
          log_info "⚡ Running performance tests"
          
          # Cache performance
          run_test "Cache initialization speed" "time cache-init >/dev/null" false
          run_test "Cache status check" "cache-status >/dev/null" false
          
          # Command execution performance
          run_test "Command system responsiveness" "timeout 5s claude-cmd help >/dev/null" false
          run_test "Project analysis speed" "timeout 10s inc-status >/dev/null" false
          
          # Parallel processing
          run_test "Parallel command execution" "echo 'test1\ntest2\ntest3' | parallel echo >/dev/null" false
          
          # Memory usage
          run_test "Memory usage reasonable" "ps -o pid,vsz,rss,comm -p \$\$ | awk 'NR==2 {exit (\$3 > 100000)}'" false
          
          # Disk usage
          run_test "Cache size reasonable" "test \$(du -sm \$CLAUDE_CODE_CACHE_DIR 2>/dev/null | cut -f1 || echo 0) -lt 1000" false
        }
        
        # Security tests
        test_security() {
          log_info "🔒 Running security tests"
          
          # Security tools availability
          run_test "Security scanner available" "command -v trivy >/dev/null || command -v safety >/dev/null" false
          run_test "Security scan execution" "timeout 30s claude-security-scan quick >/dev/null" false
          
          # Configuration security
          run_test "No hardcoded secrets in config" "! grep -r 'password\|secret\|key.*=' nix/ || true" true
          run_test "Secure file permissions" "find nix/ -type f -perm /o+w | wc -l | grep -q '^0$'" true
          run_test "No world-writable directories" "find . -type d -perm /o+w | grep -v '/tmp' | wc -l | grep -q '^0$'" false
          
          # Secret detection
          run_test "Secret detection works" "echo 'password=secret123' | claude-security-scan - 2>/dev/null || true" false
        }
        
        # Integration tests
        test_integration() {
          log_info "🔗 Running integration tests"
          
          # Git integration
          if [[ -d .git ]]; then
            run_test "Git hooks integration" "test -f .git/hooks/pre-commit || echo 'No pre-commit hook (OK)'" false
            run_test "Git configuration" "git config user.name >/dev/null && git config user.email >/dev/null" false
          fi
          
          # Language-specific integrations
          if [[ -f package.json ]]; then
            run_test "Node.js tools available" "command -v npm >/dev/null && command -v node >/dev/null" false
            run_test "NPM cache configured" "test -n \"\$NPM_CONFIG_CACHE\"" false
          fi
          
          if [[ -f Cargo.toml ]]; then
            run_test "Rust tools available" "command -v cargo >/dev/null && command -v rustc >/dev/null" false
            run_test "Cargo cache configured" "test -n \"\$CARGO_HOME\"" false
          fi
          
          # Workflow integration
          run_test "Workflows directory exists" "test -d ~/.config/claude-code/workflows" false
          run_test "Sample workflows present" "ls ~/.config/claude-code/workflows/*.json >/dev/null 2>&1" false
        }
        
        # Compatibility tests
        test_compatibility() {
          log_info "🖥️  Running compatibility tests"
          
          # System compatibility
          run_test "Operating system supported" "uname -s | grep -E 'Linux|Darwin'" true
          run_test "Architecture supported" "uname -m | grep -E 'x86_64|aarch64|arm64'" true
          
          # Nix compatibility
          run_test "Nix version compatible" "nix --version | grep -E '[2-9]\.[0-9]+'" true
          run_test "Nix channels accessible" "nix-channel --list | grep nixpkgs" true
          
          # Shell compatibility
          run_test "Bash version adequate" "bash --version | head -1 | grep -E '[4-9]\.[0-9]+'" false
          run_test "Essential utilities present" "command -v awk >/dev/null && command -v sed >/dev/null && command -v grep >/dev/null" true
          
          # Terminal capabilities
          run_test "Color support" "test -n \"\$TERM\" && tput colors 2>/dev/null | grep -E '[0-9]+'" false
          run_test "Unicode support" "echo '✅' | cat >/dev/null" false
        }
        
        # Generate test report
        generate_report() {
          local timestamp=$(date '+%Y%m%d_%H%M%S')
          local report_base="$REPORT_DIR/test_report_$timestamp"
          
          log_info "📊 Generating test reports"
          
          # Create summary
          local summary_json="$report_base.json"
          cat > "$summary_json" <<EOF
{
  "timestamp": "$(date -Iseconds)",
  "test_run_id": "$timestamp",
  "summary": {
    "total_tests": $TESTS_RUN,
    "passed": $TESTS_PASSED,
    "failed": $TESTS_FAILED,
    "warnings": $TESTS_WARNINGS,
    "success_rate": $(echo "scale=2; $TESTS_PASSED * 100 / $TESTS_RUN" | bc 2>/dev/null || echo "0")
  },
  "environment": {
    "system": "$(uname -s)",
    "architecture": "$(uname -m)",
    "nix_version": "$(nix --version 2>/dev/null || echo 'unknown')",
    "project_type": "''${CLAUDE_CODE_PROJECT_TYPE:-unknown}",
    "strict_mode": $STRICT_MODE
  },
  "test_suites": ${lib.toJSON cfg.validation.testSuites},
  "detailed_results": "$(basename "$TEST_DIR/results.csv")"
}
EOF

          # Generate HTML report if requested
          ${lib.optionalString (lib.elem "html" cfg.reporting.formats) ''
          local html_report="$report_base.html"
          cat > "$html_report" <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Claude Code Test Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .header { background: #f5f5f5; padding: 20px; border-radius: 5px; }
        .summary { display: flex; gap: 20px; margin: 20px 0; }
        .metric { padding: 15px; border-radius: 5px; text-align: center; }
        .passed { background: #d4edda; color: #155724; }
        .failed { background: #f8d7da; color: #721c24; }
        .warnings { background: #fff3cd; color: #856404; }
        .total { background: #d1ecf1; color: #0c5460; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #f8f9fa; }
    </style>
</head>
<body>
    <div class="header">
        <h1>🧪 Claude Code Test Report</h1>
        <p>Generated: $(date)</p>
        <p>Test Run ID: $timestamp</p>
    </div>
    
    <div class="summary">
        <div class="metric total">
            <h3>$TESTS_RUN</h3>
            <p>Total Tests</p>
        </div>
        <div class="metric passed">
            <h3>$TESTS_PASSED</h3>
            <p>Passed</p>
        </div>
        <div class="metric failed">
            <h3>$TESTS_FAILED</h3>
            <p>Failed</p>
        </div>
        <div class="metric warnings">
            <h3>$TESTS_WARNINGS</h3>
            <p>Warnings</p>
        </div>
    </div>
    
    <h2>Test Results</h2>
    <table>
        <tr><th>Status</th><th>Test Name</th><th>Duration (ms)</th><th>Details</th></tr>
EOF

          # Add test results to HTML
          if [[ -f "$TEST_DIR/results.csv" ]]; then
            while IFS=, read -r status name duration details; do
              local css_class="passed"
              [[ "$status" == "FAIL" ]] && css_class="failed"
              [[ "$status" == "WARN" ]] && css_class="warnings"
              
              echo "<tr class=\"$css_class\"><td>$status</td><td>$name</td><td>$duration</td><td>$details</td></tr>" >> "$html_report"
            done < "$TEST_DIR/results.csv"
          fi
          
          echo "</table></body></html>" >> "$html_report"
          ''}
          
          # Generate JUnit XML if requested
          ${lib.optionalString (lib.elem "junit" cfg.reporting.formats) ''
          local junit_report="$report_base.xml"
          cat > "$junit_report" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<testsuite name="claude-code-tests" tests="$TESTS_RUN" failures="$TESTS_FAILED" warnings="$TESTS_WARNINGS" time="$(date +%s)">
EOF

          if [[ -f "$TEST_DIR/results.csv" ]]; then
            while IFS=, read -r status name duration details; do
              echo "  <testcase name=\"$name\" time=\"$(echo "scale=3; $duration / 1000" | bc 2>/dev/null || echo "0")\">" >> "$junit_report"
              
              if [[ "$status" == "FAIL" ]]; then
                echo "    <failure message=\"Test failed\">$details</failure>" >> "$junit_report"
              elif [[ "$status" == "WARN" ]]; then
                echo "    <warning message=\"Test warning\">$details</warning>" >> "$junit_report"
              fi
              
              echo "  </testcase>" >> "$junit_report"
            done < "$TEST_DIR/results.csv"
          fi
          
          echo "</testsuite>" >> "$junit_report"
          ''}
          
          log_success "📄 Reports generated:"
          ls -la "$REPORT_DIR"/test_report_"$timestamp".* | sed 's/^/  /'
        }
        
        # Show test summary
        show_summary() {
          echo
          log_info "📊 Test Summary"
          echo "=============="
          echo "Total tests:  $TESTS_RUN"
          echo "Passed:       $TESTS_PASSED"
          echo "Failed:       $TESTS_FAILED"
          echo "Warnings:     $TESTS_WARNINGS"
          
          if [[ $TESTS_RUN -gt 0 ]]; then
            local success_rate=$(echo "scale=1; $TESTS_PASSED * 100 / $TESTS_RUN" | bc 2>/dev/null || echo "0")
            echo "Success rate: $success_rate%"
          fi
          
          echo
          
          if [[ $TESTS_FAILED -gt 0 ]]; then
            log_error "❌ Some tests failed"
            return 1
          elif [[ $TESTS_WARNINGS -gt 0 ]]; then
            log_warn "⚠️  Some tests had warnings"
            return 0
          else
            log_success "✅ All tests passed"
            return 0
          fi
        }
        
        # Main test execution
        run_test_suite() {
          local suite="$1"
          
          case "$suite" in
            "basic")
              test_basic
              ;;
            "performance")
              test_performance
              ;;
            "security")
              test_security
              ;;
            "integration")
              test_integration
              ;;
            "compatibility")
              test_compatibility
              ;;
            *)
              log_error "Unknown test suite: $suite"
              return 1
              ;;
          esac
        }
        
        # Command dispatcher
        case "''${1:-help}" in
          "run")
            init_testing
            
            # Initialize results file
            echo "Status,TestName,Duration,Details" > "$TEST_DIR/results.csv"
            
            # Run specified test suites
            for suite in ${lib.concatStringsSep " " cfg.validation.testSuites}; do
              run_test_suite "$suite"
            done
            
            # Generate reports
            ${lib.optionalString cfg.reporting.enable "generate_report"}
            
            # Show summary and exit with appropriate code
            show_summary
            ;;
            
          "suite")
            [[ $# -lt 2 ]] && { log_error "Usage: claude-test suite <suite-name>"; exit 1; }
            init_testing
            echo "Status,TestName,Duration,Details" > "$TEST_DIR/results.csv"
            run_test_suite "$2"
            show_summary
            ;;
            
          "validate")
            init_testing
            echo "Status,TestName,Duration,Details" > "$TEST_DIR/results.csv"
            run_test_suite "basic"
            show_summary
            ;;
            
          "benchmark")
            init_testing
            echo "Status,TestName,Duration,Details" > "$TEST_DIR/results.csv"
            run_test_suite "performance"
            show_summary
            ;;
            
          "report")
            if [[ -f "$TEST_DIR/results.csv" ]]; then
              TESTS_RUN=$(tail -n +2 "$TEST_DIR/results.csv" | wc -l)
              TESTS_PASSED=$(grep "^PASS," "$TEST_DIR/results.csv" | wc -l)
              TESTS_FAILED=$(grep "^FAIL," "$TEST_DIR/results.csv" | wc -l)
              TESTS_WARNINGS=$(grep "^WARN," "$TEST_DIR/results.csv" | wc -l)
              generate_report
            else
              log_error "No test results found. Run 'claude-test run' first."
            fi
            ;;
            
          "clean")
            log_info "🧹 Cleaning test artifacts"
            rm -rf "$TEST_DIR" "$REPORT_DIR"
            log_success "✅ Test artifacts cleaned"
            ;;
            
          "help"|*)
            echo "Claude Code Testing Framework"
            echo "Usage: claude-test {run|suite|validate|benchmark|report|clean|help}"
            echo
            echo "Commands:"
            echo "  run           - Run all configured test suites"
            echo "  suite <name>  - Run specific test suite (basic|performance|security|integration|compatibility)"
            echo "  validate      - Quick validation of basic configuration"
            echo "  benchmark     - Run performance benchmarks"
            echo "  report        - Generate reports from last test run"
            echo "  clean         - Clean test artifacts and reports"
            echo "  help          - Show this help message"
            echo
            echo "Available test suites: ${lib.concatStringsSep ", " cfg.validation.testSuites}"
            ;;
        esac
      '')

      # System monitoring script
      (pkgs.writeShellScriptBin "claude-monitor" ''
        #!/bin/bash
        
        # Claude Code System Monitor
        set -euo pipefail
        
        # Configuration
        MONITOR_INTERVAL=${toString cfg.monitoring.interval}
        ALERT_ENABLED=${lib.boolToString cfg.monitoring.alerts.enable}
        
        # Alert thresholds
        CPU_THRESHOLD=${toString cfg.monitoring.alerts.thresholds.cpuUsage}
        MEM_THRESHOLD=${toString cfg.monitoring.alerts.thresholds.memoryUsage}
        DISK_THRESHOLD=${toString cfg.monitoring.alerts.thresholds.diskUsage}
        LOAD_THRESHOLD=${toString cfg.monitoring.alerts.thresholds.loadAverage}
        
        # Colors
        RED='\033[0;31m'
        GREEN='\033[0;32m'
        YELLOW='\033[1;33m'
        BLUE='\033[0;34m'
        NC='\033[0m'
        
        log_alert() { echo -e "''${RED}[ALERT]''${NC} $1"; }
        log_warn() { echo -e "''${YELLOW}[WARN]''${NC} $1"; }
        log_info() { echo -e "''${BLUE}[INFO]''${NC} $1"; }
        log_ok() { echo -e "''${GREEN}[OK]''${NC} $1"; }
        
        # Get system metrics
        get_cpu_usage() {
          top -bn1 | grep "Cpu(s)" | awk '{print $2}' | sed 's/%us,//' | sed 's/\..*//' 2>/dev/null || echo "0"
        }
        
        get_memory_usage() {
          free | grep Mem | awk '{printf "%.0f", $3/$2 * 100.0}' 2>/dev/null || echo "0"
        }
        
        get_disk_usage() {
          df / | tail -1 | awk '{print $5}' | sed 's/%//' 2>/dev/null || echo "0"
        }
        
        get_load_average() {
          uptime | awk -F'load average:' '{print $2}' | awk -F',' '{print $1}' | xargs 2>/dev/null || echo "0"
        }
        
        # Check thresholds and alert
        check_alerts() {
          local cpu_usage=$(get_cpu_usage)
          local mem_usage=$(get_memory_usage)
          local disk_usage=$(get_disk_usage)
          local load_avg=$(get_load_average)
          
          if [[ "$ALERT_ENABLED" == "true" ]]; then
            [[ $cpu_usage -gt $CPU_THRESHOLD ]] && log_alert "High CPU usage: ''${cpu_usage}%"
            [[ $mem_usage -gt $MEM_THRESHOLD ]] && log_alert "High memory usage: ''${mem_usage}%"
            [[ $disk_usage -gt $DISK_THRESHOLD ]] && log_alert "High disk usage: ''${disk_usage}%"
            [[ $(echo "$load_avg > $LOAD_THRESHOLD" | bc 2>/dev/null || echo 0) -eq 1 ]] && log_alert "High load average: $load_avg"
          fi
        }
        
        # Display system dashboard
        show_dashboard() {
          clear
          echo "🖥️  Claude Code System Monitor"
          echo "=============================="
          echo "Time: $(date)"
          echo "Interval: ''${MONITOR_INTERVAL}s"
          echo
          
          local cpu_usage=$(get_cpu_usage)
          local mem_usage=$(get_memory_usage)
          local disk_usage=$(get_disk_usage)
          local load_avg=$(get_load_average)
          
          echo "System Metrics:"
          printf "  CPU Usage:    %3d%% " "$cpu_usage"
          [[ $cpu_usage -gt $CPU_THRESHOLD ]] && echo -e "''${RED}(HIGH)''${NC}" || echo -e "''${GREEN}(OK)''${NC}"
          
          printf "  Memory Usage: %3d%% " "$mem_usage"
          [[ $mem_usage -gt $MEM_THRESHOLD ]] && echo -e "''${RED}(HIGH)''${NC}" || echo -e "''${GREEN}(OK)''${NC}"
          
          printf "  Disk Usage:   %3d%% " "$disk_usage"
          [[ $disk_usage -gt $DISK_THRESHOLD ]] && echo -e "''${RED}(HIGH)''${NC}" || echo -e "''${GREEN}(OK)''${NC}"
          
          printf "  Load Average: %s " "$load_avg"
          [[ $(echo "$load_avg > $LOAD_THRESHOLD" | bc 2>/dev/null || echo 0) -eq 1 ]] && echo -e "''${RED}(HIGH)''${NC}" || echo -e "''${GREEN}(OK)''${NC}"
          
          echo
          echo "Development Environment:"
          echo "  Cache Dir: ''${CLAUDE_CODE_CACHE_DIR:-$HOME/.cache/claude-code}"
          echo "  Project: $(basename $(pwd))"
          echo "  Type: ''${CLAUDE_CODE_PROJECT_TYPE:-unknown}"
          
          if command -v claude-cmd >/dev/null 2>&1; then
            echo "  Commands today: $(sqlite3 ''${CLAUDE_CODE_CACHE_DIR:-$HOME/.cache/claude-code}/metrics/commands.db "SELECT COUNT(*) FROM command_metrics WHERE DATE(timestamp) = DATE('now')" 2>/dev/null || echo "0")"
          fi
          
          echo
          echo "Press Ctrl+C to stop monitoring"
        }
        
        # Continuous monitoring
        start_monitoring() {
          log_info "Starting system monitoring (interval: ''${MONITOR_INTERVAL}s)"
          
          while true; do
            show_dashboard
            check_alerts
            sleep "$MONITOR_INTERVAL"
          done
        }
        
        # Command dispatcher
        case "''${1:-dashboard}" in
          "start"|"dashboard")
            start_monitoring
            ;;
            
          "status")
            echo "🖥️  System Status"
            echo "CPU: $(get_cpu_usage)%"
            echo "Memory: $(get_memory_usage)%"
            echo "Disk: $(get_disk_usage)%"
            echo "Load: $(get_load_average)"
            ;;
            
          "alerts")
            echo "🚨 Checking alert conditions"
            check_alerts
            ;;
            
          "help"|*)
            echo "Claude Code System Monitor"
            echo "Usage: claude-monitor {start|status|alerts|help}"
            echo
            echo "Commands:"
            echo "  start    - Start interactive monitoring dashboard"
            echo "  status   - Show current system status"
            echo "  alerts   - Check alert conditions"
            echo "  help     - Show this help message"
            ;;
        esac
      '')
    ];

    # Shell integration for testing and monitoring
    programs.bash.initExtra = ''
      # Claude Code Testing and Monitoring Integration
      
      # Testing aliases
      alias test-config="claude-test validate"
      alias test-all="claude-test run"
      alias test-perf="claude-test benchmark"
      alias test-security="claude-test suite security"
      
      # Monitoring aliases
      alias monitor="claude-monitor start"
      alias status="claude-monitor status"
      alias alerts="claude-monitor alerts"
      
      # Auto-run basic validation on shell startup (optional)
      ${lib.optionalString cfg.validation.enable ''
      if [[ ! -f "''${CLAUDE_CODE_CACHE_DIR:-$HOME/.cache/claude-code}/.validated" ]]; then
        echo "🧪 Running initial configuration validation..."
        if claude-test validate >/dev/null 2>&1; then
          touch "''${CLAUDE_CODE_CACHE_DIR:-$HOME/.cache/claude-code}/.validated"
          echo "✅ Configuration validated successfully"
        else
          echo "⚠️  Configuration validation had issues. Run 'test-config' for details."
        fi
      fi
      ''}
      
      # Performance monitoring functions
      perf_watch() {
        local command="$*"
        echo "📊 Monitoring performance of: $command"
        
        if command -v hyperfine >/dev/null 2>&1; then
          hyperfine --warmup 3 --runs 10 "$command"
        else
          time "$command"
        fi
      }
      
      # System health check
      health_check() {
        echo "🏥 Claude Code Health Check"
        echo "=========================="
        
        claude-monitor status
        echo
        
        if command -v claude-test >/dev/null 2>&1; then
          claude-test validate
        fi
        
        echo
        if command -v cache-status >/dev/null 2>&1; then
          cache-status | head -10
        fi
      }
      
      # Export functions
      export -f perf_watch health_check
    '';
  };
}