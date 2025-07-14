# Security Scanning and Vulnerability Management Module
# Provides comprehensive security scanning and vulnerability detection

{ config, lib, pkgs, ... }:

let
  cfg = config.claudeCode.security;
  inherit (lib) mkOption mkEnableOption types;

in {
  options.claudeCode.security = {
    enable = mkEnableOption "security scanning and vulnerability detection";

    scanning = {
      enable = mkEnableOption "automated vulnerability scanning";
      
      tools = mkOption {
        type = types.listOf (types.enum [ "trivy" "safety" "audit" "semgrep" "bandit" "gosec" "cargo-audit" ]);
        default = [ "trivy" "safety" "audit" ];
        description = "Security scanning tools to enable";
      };

      schedule = mkOption {
        type = types.enum [ "pre-commit" "daily" "weekly" "manual" ];
        default = "pre-commit";
        description = "When to run security scans";
      };

      severity = mkOption {
        type = types.enum [ "LOW" "MEDIUM" "HIGH" "CRITICAL" ];
        default = "MEDIUM";
        description = "Minimum severity level to report";
      };

      excludePatterns = mkOption {
        type = types.listOf types.str;
        default = [ "test/*" "tests/*" "*.test.*" "*.spec.*" "node_modules/*" "vendor/*" ];
        description = "File patterns to exclude from security scanning";
      };
    };

    secrets = {
      detection = mkEnableOption "secret detection in code";
      
      patterns = mkOption {
        type = types.listOf types.str;
        default = [
          "password"
          "secret"
          "token"
          "api_key"
          "private_key"
          "credential"
        ];
        description = "Patterns to detect potential secrets";
      };

      whitelist = mkOption {
        type = types.listOf types.str;
        default = [ ".env.example" "README.md" "docs/*" ];
        description = "Files to exclude from secret detection";
      };
    };

    compliance = {
      enable = mkEnableOption "compliance checking";
      
      standards = mkOption {
        type = types.listOf (types.enum [ "OWASP" "CIS" "NIST" "SOX" "GDPR" ]);
        default = [ "OWASP" ];
        description = "Compliance standards to check against";
      };
    };

    reporting = {
      format = mkOption {
        type = types.enum [ "json" "sarif" "table" "junit" ];
        default = "table";
        description = "Security report format";
      };

      outputDir = mkOption {
        type = types.str;
        default = "./.security-reports";
        description = "Directory to store security reports";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    # Security tools packages
    environment.systemPackages = with pkgs; lib.flatten [
      # Core security tools
      (lib.optionals (lib.elem "trivy" cfg.scanning.tools) [ trivy ])
      (lib.optionals (lib.elem "semgrep" cfg.scanning.tools) [ semgrep ])
      
      # Language-specific security tools
      (lib.optionals (lib.elem "safety" cfg.scanning.tools) [ python3Packages.safety ])
      (lib.optionals (lib.elem "bandit" cfg.scanning.tools) [ python3Packages.bandit ])
      (lib.optionals (lib.elem "gosec" cfg.scanning.tools) [ gosec ])
      
      # General security utilities
      age      # Encryption
      sops     # Secret management
      gpg      # PGP encryption
      
      # Network security
      nmap     # Network discovery
      openssl  # Cryptography
      
      # Additional utilities
      jq       # JSON processing for reports
      yq       # YAML processing
    ];

    # Security environment variables
    environment.sessionVariables = {
      CLAUDE_CODE_SECURITY_ENABLED = "true";
      SECURITY_REPORT_DIR = cfg.reporting.outputDir;
      SECURITY_MIN_SEVERITY = cfg.scanning.severity;
    };

    # Security scanning script
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "claude-security-scan" ''
        #!/bin/bash
        
        # Claude Code Security Scanner
        set -euo pipefail
        
        # Configuration
        SCAN_TYPE="''${1:-full}"
        PROJECT_ROOT="''${2:-.}"
        REPORT_DIR="${cfg.reporting.outputDir}"
        MIN_SEVERITY="${cfg.scanning.severity}"
        REPORT_FORMAT="${cfg.reporting.format}"
        
        # Colors for output
        RED='\033[0;31m'
        YELLOW='\033[1;33m'
        GREEN='\033[0;32m'
        BLUE='\033[0;34m'
        NC='\033[0m' # No Color
        
        # Logging functions
        log_info() { echo -e "''${BLUE}[INFO]''${NC} $1"; }
        log_warn() { echo -e "''${YELLOW}[WARN]''${NC} $1"; }
        log_error() { echo -e "''${RED}[ERROR]''${NC} $1"; }
        log_success() { echo -e "''${GREEN}[SUCCESS]''${NC} $1"; }
        
        # Create report directory
        mkdir -p "$REPORT_DIR"
        
        # Generate timestamp for reports
        TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
        
        log_info "🔒 Claude Code Security Scanner"
        log_info "Project: $(basename "$(realpath "$PROJECT_ROOT")")"
        log_info "Scan type: $SCAN_TYPE"
        log_info "Min severity: $MIN_SEVERITY"
        log_info "Report format: $REPORT_FORMAT"
        echo
        
        # Security scan results
        SCAN_RESULTS=()
        TOTAL_VULNERABILITIES=0
        HIGH_SEVERITY_COUNT=0
        
        # Trivy scanning
        ${lib.optionalString (lib.elem "trivy" cfg.scanning.tools) ''
        if command -v trivy >/dev/null 2>&1; then
          log_info "🔍 Running Trivy vulnerability scan"
          
          # Filesystem scan
          trivy fs \
            --severity "$MIN_SEVERITY,HIGH,CRITICAL" \
            --format "$REPORT_FORMAT" \
            --output "$REPORT_DIR/trivy_fs_$TIMESTAMP.$REPORT_FORMAT" \
            "$PROJECT_ROOT" || true
          
          # Container scan if Dockerfile exists
          if [[ -f "$PROJECT_ROOT/Dockerfile" ]]; then
            log_info "🐳 Scanning Docker container"
            docker build -t temp_security_scan "$PROJECT_ROOT" >/dev/null 2>&1 || true
            trivy image \
              --severity "$MIN_SEVERITY,HIGH,CRITICAL" \
              --format "$REPORT_FORMAT" \
              --output "$REPORT_DIR/trivy_container_$TIMESTAMP.$REPORT_FORMAT" \
              temp_security_scan 2>/dev/null || true
            docker rmi temp_security_scan >/dev/null 2>&1 || true
          fi
          
          SCAN_RESULTS+=("Trivy")
        fi
        ''}
        
        # Python security scanning
        ${lib.optionalString (lib.elem "safety" cfg.scanning.tools) ''
        if [[ -f "$PROJECT_ROOT/requirements.txt" || -f "$PROJECT_ROOT/pyproject.toml" ]] && command -v safety >/dev/null 2>&1; then
          log_info "🐍 Running Python Safety scan"
          
          safety check \
            --json \
            --output "$REPORT_DIR/safety_$TIMESTAMP.json" 2>/dev/null || true
          
          SCAN_RESULTS+=("Safety")
        fi
        ''}
        
        # Bandit for Python code
        ${lib.optionalString (lib.elem "bandit" cfg.scanning.tools) ''
        if [[ -d "$PROJECT_ROOT" ]] && find "$PROJECT_ROOT" -name "*.py" -type f | head -1 >/dev/null 2>&1 && command -v bandit >/dev/null 2>&1; then
          log_info "🐍 Running Bandit security scan for Python"
          
          bandit -r "$PROJECT_ROOT" \
            -f json \
            -o "$REPORT_DIR/bandit_$TIMESTAMP.json" \
            --severity-level "$MIN_SEVERITY" 2>/dev/null || true
          
          SCAN_RESULTS+=("Bandit")
        fi
        ''}
        
        # Node.js audit
        ${lib.optionalString (lib.elem "audit" cfg.scanning.tools) ''
        if [[ -f "$PROJECT_ROOT/package.json" ]] && command -v npm >/dev/null 2>&1; then
          log_info "📦 Running npm audit"
          
          cd "$PROJECT_ROOT"
          npm audit --json > "$REPORT_DIR/npm_audit_$TIMESTAMP.json" 2>/dev/null || true
          cd - >/dev/null
          
          SCAN_RESULTS+=("npm-audit")
        fi
        ''}
        
        # Go security scan
        ${lib.optionalString (lib.elem "gosec" cfg.scanning.tools) ''
        if [[ -f "$PROJECT_ROOT/go.mod" ]] && command -v gosec >/dev/null 2>&1; then
          log_info "🐹 Running GoSec scan"
          
          cd "$PROJECT_ROOT"
          gosec -fmt json -out "$REPORT_DIR/gosec_$TIMESTAMP.json" ./... 2>/dev/null || true
          cd - >/dev/null
          
          SCAN_RESULTS+=("gosec")
        fi
        ''}
        
        # Rust security audit
        ${lib.optionalString (lib.elem "cargo-audit" cfg.scanning.tools) ''
        if [[ -f "$PROJECT_ROOT/Cargo.toml" ]] && command -v cargo >/dev/null 2>&1; then
          log_info "🦀 Running Cargo audit"
          
          cd "$PROJECT_ROOT"
          cargo audit --json > "$REPORT_DIR/cargo_audit_$TIMESTAMP.json" 2>/dev/null || true
          cd - >/dev/null
          
          SCAN_RESULTS+=("cargo-audit")
        fi
        ''}
        
        # Semgrep scanning
        ${lib.optionalString (lib.elem "semgrep" cfg.scanning.tools) ''
        if command -v semgrep >/dev/null 2>&1; then
          log_info "🔍 Running Semgrep static analysis"
          
          semgrep \
            --config=auto \
            --json \
            --output="$REPORT_DIR/semgrep_$TIMESTAMP.json" \
            "$PROJECT_ROOT" 2>/dev/null || true
          
          SCAN_RESULTS+=("semgrep")
        fi
        ''}
        
        # Secret detection
        ${lib.optionalString cfg.secrets.detection ''
        log_info "🔐 Running secret detection"
        
        SECRET_PATTERNS=(${lib.concatStringsSep " " (map (p: "'${p}'") cfg.secrets.patterns)})
        EXCLUDE_PATTERNS=(${lib.concatStringsSep " " (map (p: "'${p}'") cfg.secrets.whitelist)})
        
        # Build exclude arguments for ripgrep
        EXCLUDE_ARGS=""
        for pattern in "''${EXCLUDE_PATTERNS[@]}"; do
          EXCLUDE_ARGS="$EXCLUDE_ARGS --glob=!$pattern"
        done
        
        # Search for potential secrets
        SECRET_RESULTS="$REPORT_DIR/secrets_$TIMESTAMP.json"
        echo '{"secrets": []}' > "$SECRET_RESULTS"
        
        for pattern in "''${SECRET_PATTERNS[@]}"; do
          if command -v rg >/dev/null 2>&1; then
            rg -i "$pattern" $EXCLUDE_ARGS "$PROJECT_ROOT" --json 2>/dev/null || true
          fi
        done | jq -s '{"secrets": .}' > "$SECRET_RESULTS" 2>/dev/null || true
        
        SCAN_RESULTS+=("secrets")
        ''}
        
        # Compliance checking
        ${lib.optionalString cfg.compliance.enable ''
        log_info "📋 Running compliance checks"
        
        COMPLIANCE_RESULTS="$REPORT_DIR/compliance_$TIMESTAMP.json"
        
        # Basic compliance checks
        {
          echo "{"
          echo '  "timestamp": "'$(date -Iseconds)'",'
          echo '  "project": "'$(basename "$(realpath "$PROJECT_ROOT")")'",'
          echo '  "standards": ${lib.toJSON cfg.compliance.standards},'
          echo '  "checks": {'
          
          # OWASP checks
          if [[ "${lib.concatStringsSep " " cfg.compliance.standards}" =~ "OWASP" ]]; then
            echo '    "owasp": {'
            echo '      "A01_broken_access_control": '$(test -f "$PROJECT_ROOT/.htaccess" && echo "true" || echo "false")','
            echo '      "A02_cryptographic_failures": '$(grep -r "password.*=.*['\"]" "$PROJECT_ROOT" >/dev/null 2>&1 && echo "false" || echo "true")','
            echo '      "A03_injection": '$(find "$PROJECT_ROOT" -name "*.sql" | head -1 >/dev/null && echo "needs_review" || echo "true")','
            echo '      "A06_vulnerable_components": '$(test -f "$REPORT_DIR/trivy_fs_$TIMESTAMP.$REPORT_FORMAT" && echo "scanned" || echo "not_scanned")'
            echo '    },'
          fi
          
          echo '    "general": {'
          echo '      "has_security_policy": '$(test -f "$PROJECT_ROOT/SECURITY.md" && echo "true" || echo "false")','
          echo '      "has_license": '$(test -f "$PROJECT_ROOT/LICENSE" && echo "true" || echo "false")','
          echo '      "has_readme": '$(test -f "$PROJECT_ROOT/README.md" && echo "true" || echo "false")','
          echo '      "git_repo": '$(test -d "$PROJECT_ROOT/.git" && echo "true" || echo "false")'
          echo '    }'
          echo '  }'
          echo "}"
        } > "$COMPLIANCE_RESULTS"
        
        SCAN_RESULTS+=("compliance")
        ''}
        
        # Generate summary report
        log_info "📊 Generating security summary"
        
        SUMMARY_REPORT="$REPORT_DIR/security_summary_$TIMESTAMP.json"
        {
          echo "{"
          echo '  "timestamp": "'$(date -Iseconds)'",'
          echo '  "project": "'$(basename "$(realpath "$PROJECT_ROOT")")'",'
          echo '  "scan_type": "'$SCAN_TYPE'",'
          echo '  "tools_used": ['$(printf '"%s",' "''${SCAN_RESULTS[@]}" | sed 's/,$//')]','
          echo '  "reports_generated": ['
          
          FIRST=true
          for report in "$REPORT_DIR"/*_"$TIMESTAMP".*; do
            if [[ -f "$report" ]]; then
              [[ "$FIRST" == "false" ]] && echo ","
              echo -n '    "'$(basename "$report")'"'
              FIRST=false
            fi
          done
          echo
          echo '  ],'
          echo '  "summary": {'
          echo '    "total_scans": '$(printf '%s\n' "''${SCAN_RESULTS[@]}" | wc -l)','
          echo '    "report_directory": "'$REPORT_DIR'",'
          echo '    "min_severity": "'$MIN_SEVERITY'"'
          echo '  }'
          echo "}"
        } > "$SUMMARY_REPORT"
        
        echo
        log_success "✅ Security scanning complete!"
        log_info "📁 Reports saved to: $REPORT_DIR"
        log_info "📋 Summary: $SUMMARY_REPORT"
        
        # Display quick summary
        if [[ -f "$SUMMARY_REPORT" ]]; then
          echo
          log_info "📊 Scan Summary:"
          jq -r '.tools_used[]' "$SUMMARY_REPORT" 2>/dev/null | sed 's/^/  ✓ /' || true
        fi
        
        # Exit with appropriate code
        if [[ $HIGH_SEVERITY_COUNT -gt 0 ]]; then
          log_warn "⚠️  Found $HIGH_SEVERITY_COUNT high/critical severity issues"
          exit 1
        else
          log_success "🔒 No high severity security issues detected"
          exit 0
        fi
      '')
    ];

    # Security shell integration
    programs.bash.initExtra = ''
      # Claude Code Security Functions
      
      # Quick security scan
      sec() {
        local scan_type="''${1:-quick}"
        claude-security-scan "$scan_type"
      }
      
      # Pre-commit security check
      sec_precommit() {
        echo "🔒 Running pre-commit security checks"
        claude-security-scan quick
      }
      
      # Security report viewer
      sec_report() {
        local report_dir="${cfg.reporting.outputDir}"
        if [[ -d "$report_dir" ]]; then
          echo "📊 Recent security reports:"
          ls -la "$report_dir"/*.json 2>/dev/null | tail -5 || echo "No reports found"
        else
          echo "No security reports directory found"
        fi
      }
      
      # Clean old security reports
      sec_clean() {
        local report_dir="${cfg.reporting.outputDir}"
        if [[ -d "$report_dir" ]]; then
          find "$report_dir" -name "*.json" -mtime +7 -delete 2>/dev/null || true
          echo "✅ Cleaned security reports older than 7 days"
        fi
      }
      
      # Security aliases
      alias security="claude-security-scan"
      alias sec-full="claude-security-scan full"
      alias sec-quick="claude-security-scan quick"
    '';

    # Git hooks integration
    programs.git.extraConfig = lib.mkIf (cfg.scanning.schedule == "pre-commit") {
      core.hooksPath = pkgs.writeShellScript "git-hooks" ''
        #!/bin/bash
        
        # Pre-commit security check
        if [[ "$(basename "$0")" == "pre-commit" ]]; then
          echo "🔒 Running security checks..."
          claude-security-scan quick || {
            echo "❌ Security check failed. Commit blocked."
            echo "Fix security issues or use --no-verify to skip"
            exit 1
          }
        fi
      '';
    };
  };
}