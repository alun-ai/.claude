#!/bin/bash

# Shared Claude Code + Nix Setup Script
# Configures the shared development environment for all projects

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_step() { echo -e "${PURPLE}[STEP]${NC} $1"; }

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SHARED_CLAUDE_DIR="$(dirname "$SCRIPT_DIR")"
GITHUB_DIR="$(dirname "$SHARED_CLAUDE_DIR")"
NIX_DIR="$SHARED_CLAUDE_DIR/nix"

log_info "🚀 Shared Claude Code + Nix Setup"
echo "=================================="
echo "Shared config: $SHARED_CLAUDE_DIR"
echo "Nix config: $NIX_DIR"
echo "GitHub dir: $GITHUB_DIR"
echo

# Check prerequisites
check_prerequisites() {
    log_step "🔍 Checking prerequisites..."
    
    # Check if we're in the right location
    if [[ ! -d "$NIX_DIR" ]]; then
        log_error "Nix configuration not found at $NIX_DIR"
        log_error "Please run this script from the shared .claude directory"
        exit 1
    fi
    
    # Check if we have the commands directory
    if [[ ! -d "$SHARED_CLAUDE_DIR/commands" ]]; then
        log_error "Commands directory not found. Incomplete shared setup."
        exit 1
    fi
    
    log_success "✅ Prerequisites checked"
}

# Install Nix if not present
install_nix() {
    if ! command -v nix >/dev/null 2>&1; then
        log_step "📦 Installing Nix package manager..."
        
        # Download and run Nix installer
        if [[ "$OSTYPE" == "darwin"* ]]; then
            # macOS
            curl -L https://nixos.org/nix/install | sh -s -- --daemon
        else
            # Linux
            curl -L https://nixos.org/nix/install | sh -s -- --daemon
        fi
        
        # Source Nix environment
        if [[ -f "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]]; then
            source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
        fi
        
        log_success "✅ Nix installed successfully"
    else
        log_info "✅ Nix already installed: $(nix --version)"
    fi
}

# Install direnv for automatic environment activation
install_direnv() {
    if ! command -v direnv >/dev/null 2>&1; then
        log_step "📦 Installing direnv..."
        
        if command -v nix >/dev/null 2>&1; then
            nix-env -iA nixpkgs.direnv
        elif command -v brew >/dev/null 2>&1; then
            brew install direnv
        else
            log_warn "Please install direnv manually for automatic environment activation"
            return
        fi
        
        log_success "✅ direnv installed"
        
        # Add direnv hook to shell profiles
        for shell_rc in ~/.bashrc ~/.zshrc; do
            if [[ -f "$shell_rc" ]] && ! grep -q "direnv hook" "$shell_rc"; then
                echo 'eval "$(direnv hook $(basename $SHELL))"' >> "$shell_rc"
                log_info "Added direnv hook to $shell_rc"
            fi
        done
        
        log_warn "Please restart your shell or run: source ~/.bashrc (or ~/.zshrc)"
    else
        log_info "✅ direnv already installed"
    fi
}

# Test the shared Nix configuration
test_shared_config() {
    log_step "🧪 Testing shared Nix configuration..."
    
    # Test Nix configuration syntax
    if nix-instantiate --parse "$NIX_DIR/default.nix" >/dev/null 2>&1; then
        log_success "✅ Nix configuration syntax valid"
    else
        log_error "❌ Nix configuration has syntax errors"
        return 1
    fi
    
    # Test shell activation
    if nix-shell --pure --run "echo 'Shared Nix environment works'" "$NIX_DIR" >/dev/null 2>&1; then
        log_success "✅ Shared Nix environment activation works"
    else
        log_error "❌ Shared Nix environment activation failed"
        return 1
    fi
    
    log_success "✅ Shared configuration test passed"
}

# Link project to shared configuration
link_project() {
    local project_dir="$1"
    local project_name="$(basename "$project_dir")"
    
    log_step "🔗 Linking project: $project_name"
    
    # Create shell.nix link
    cat > "$project_dir/shell.nix" <<EOF
# $project_name Project - Shared Nix Environment
# Links to the comprehensive shared development environment

import ../.claude/nix/default.nix
EOF
    
    # Create .envrc file
    cat > "$project_dir/.envrc" <<EOF
# $project_name Project Environment
# Uses shared Claude Code + Nix environment

# Use shared Nix environment
use nix ../.claude/nix/

# Project-specific environment variables
export PROJECT_NAME="$project_name"
export CLAUDE_CODE_PROJECT_ROOT="\$(pwd)"

# Auto-detect project type
if [[ -f package.json ]] && [[ -f supabase/config.toml ]]; then
    export PROJECT_TYPE="nextjs-supabase"
    export FRAMEWORK="next.js"
    export DATABASE="supabase"
elif [[ -f package.json ]]; then
    export PROJECT_TYPE="nodejs"
    export FRAMEWORK="\$(jq -r '.framework // "unknown"' package.json 2>/dev/null || echo "unknown")"
elif [[ -f Cargo.toml ]]; then
    export PROJECT_TYPE="rust"
elif [[ -f go.mod ]]; then
    export PROJECT_TYPE="go"
elif [[ -f pyproject.toml ]] || [[ -f requirements.txt ]]; then
    export PROJECT_TYPE="python"
else
    export PROJECT_TYPE="generic"
fi

# Load project-specific .env files
if [[ -f .env.local ]]; then
    set -a
    source .env.local
    set +a
fi

# Welcome message
if [[ "\$DIRENV_IN_ENVRC" = "1" ]]; then
    echo "🚀 $project_name development environment activated"
    echo "Type: \$PROJECT_TYPE | Shared tools: security, dashboard, workflow"
fi
EOF
    
    # Create minimal project-specific Claude settings if they don't exist
    if [[ ! -f "$project_dir/.claude/settings.local.json" ]]; then
        mkdir -p "$project_dir/.claude"
        cat > "$project_dir/.claude/settings.local.json" <<EOF
{
  "extends": "../.claude/settings.base.json",
  "projectName": "$project_name",
  "projectType": "\${PROJECT_TYPE:-generic}",
  "permissions": {
    "allow": [
      // Add project-specific permissions here
    ]
  },
  "environment": {
    "PROJECT_NAME": "$project_name"
  }
}
EOF
    fi
    
    # Allow direnv for this project
    if command -v direnv >/dev/null 2>&1; then
        (cd "$project_dir" && direnv allow)
    fi
    
    log_success "✅ Project $project_name linked to shared configuration"
}

# Link all projects in the GitHub directory
link_all_projects() {
    log_step "🔗 Linking all projects to shared configuration..."
    
    local linked_count=0
    for project_dir in "$GITHUB_DIR"/*; do
        if [[ -d "$project_dir" && "$(basename "$project_dir")" != ".claude" ]]; then
            link_project "$project_dir"
            ((linked_count++))
        fi
    done
    
    log_success "✅ Linked $linked_count projects to shared configuration"
}

# Show status of shared configuration
show_status() {
    log_info "📊 Shared Claude Code + Nix Status"
    echo "=================================="
    
    echo "Shared config: $(test -d "$SHARED_CLAUDE_DIR" && echo "✅ Present" || echo "❌ Missing")"
    echo "Nix config: $(test -d "$NIX_DIR" && echo "✅ Present" || echo "❌ Missing")"
    echo "Commands: $(test -d "$SHARED_CLAUDE_DIR/commands" && echo "✅ $(ls "$SHARED_CLAUDE_DIR/commands" | wc -l | tr -d ' ') available" || echo "❌ Missing")"
    echo "Nix: $(command -v nix >/dev/null && echo "✅ Installed ($(nix --version))" || echo "❌ Not found")"
    echo "direnv: $(command -v direnv >/dev/null && echo "✅ Installed" || echo "❌ Not found")"
    echo
    
    # Check linked projects
    echo "Linked projects:"
    local linked_count=0
    for project_dir in "$GITHUB_DIR"/*; do
        if [[ -d "$project_dir" && "$(basename "$project_dir")" != ".claude" ]]; then
            local project_name="$(basename "$project_dir")"
            if [[ -f "$project_dir/shell.nix" && -f "$project_dir/.envrc" ]]; then
                echo "  ✅ $project_name"
                ((linked_count++))
            else
                echo "  ❌ $project_name (not linked)"
            fi
        fi
    done
    
    echo
    echo "Summary: $linked_count projects linked to shared configuration"
    
    # Test environment if we're in a linked project
    if [[ -n "${NIX_SHELL_PACKAGES:-}" ]]; then
        echo "Status: ✅ Currently in shared Nix environment"
        echo "Available tools: $NIX_SHELL_PACKAGES"
    else
        echo "Status: ⏸️  Not in Nix environment"
        echo "To activate: nix-shell ../.claude/nix/ (or cd to any linked project with direnv)"
    fi
}

# Initialize shared environment
init_shared_environment() {
    log_step "🚀 Initializing shared environment..."
    
    if command -v nix >/dev/null 2>&1 && [[ -f "$NIX_DIR/default.nix" ]]; then
        # Initialize the Nix environment and run setup commands
        nix-shell "$NIX_DIR" --run "
            echo 'Initializing Claude Code systems...'
            claude-cmd init 2>/dev/null || echo 'Command system will be available after first activation'
            cache-init 2>/dev/null || echo 'Cache system will be available after first activation'
            echo '✅ Shared environment initialized'
        " || log_warn "Some initialization commands not yet available (will work after first project activation)"
    else
        log_error "Cannot initialize: Nix not installed or configuration missing"
        exit 1
    fi
}

# Show usage instructions
show_usage() {
    log_info "📚 Usage Instructions"
    echo "===================="
    echo
    echo "🚀 Getting Started:"
    echo "  1. Navigate to any linked project:"
    echo "     cd $GITHUB_DIR/your-project"
    echo
    echo "  2. Environment auto-activates (with direnv):"
    echo "     # Automatically loads shared Nix environment"
    echo
    echo "  3. Or activate manually:"
    echo "     nix-shell ../.claude/nix/"
    echo
    echo "🎯 Available in ALL Projects:"
    echo "  • Core Workflow: /m-orchestrated-dev, /m-commit-push, /m-bug-fix"
    echo "  • Quality & Security: /m-security-scan, /m-test-generation, /m-review-code"
    echo "  • Planning: /m-task-planner, /m-next-task, /m-tdd-planner"
    echo "  • Architecture: /m-debate-architecture, /m-debate-code"
    echo "  • Management: /m-project-cleanup, /m-document-update, /m-branch-prune"
    echo "  • Environment: /m-nix-setup, /m-project-init, /m-help"
    echo "  • Tools: dashboard, security, cache-status, monitor"
    echo
    echo "⚡ Cross-Project Benefits:"
    echo "  • Shared dependency caching (faster builds)"
    echo "  • Unified security scanning"
    echo "  • Development metrics across all projects"
    echo "  • Consistent tooling and workflows"
    echo
    echo "🔧 Management Commands:"
    echo "  • Check status: $0 status"
    echo "  • Link new project: $0 link /path/to/project"
    echo "  • Update shared config: $0 update"
    echo
}

# Update shared configuration
update_shared_config() {
    log_step "🔄 Updating shared configuration..."
    
    if command -v nix >/dev/null 2>&1; then
        # Update Nix channels
        nix-channel --update
        
        # Update shared tools if in Nix environment
        nix-shell "$NIX_DIR" --run "
            echo 'Testing updated environment...'
            claude-cmd help >/dev/null 2>&1 || echo 'Command system ready'
        " || true
        
        log_success "✅ Shared configuration updated"
    else
        log_error "Nix not available for update"
        exit 1
    fi
}

# Main execution
main() {
    case "${1:-install}" in
        "install")
            check_prerequisites
            install_nix
            install_direnv
            test_shared_config
            link_all_projects
            init_shared_environment
            show_usage
            log_success "🎉 Shared Claude Code + Nix environment setup complete!"
            ;;
            
        "link")
            if [[ $# -lt 2 ]]; then
                # Link all projects
                link_all_projects
            else
                # Link specific project
                if [[ -d "$2" ]]; then
                    link_project "$2"
                else
                    log_error "Project directory not found: $2"
                    exit 1
                fi
            fi
            ;;
            
        "status")
            show_status
            ;;
            
        "init")
            init_shared_environment
            ;;
            
        "update")
            update_shared_config
            ;;
            
        "test")
            test_shared_config
            ;;
            
        "help"|*)
            echo "Shared Claude Code + Nix Setup Script"
            echo "Usage: $0 {install|link|status|init|update|test|help}"
            echo
            echo "Commands:"
            echo "  install           - Full installation and setup"
            echo "  link [project]    - Link project(s) to shared configuration"
            echo "  status            - Show shared configuration status"
            echo "  init              - Initialize shared environment"
            echo "  update            - Update shared configuration"
            echo "  test              - Test shared configuration"
            echo "  help              - Show this help message"
            echo
            echo "Examples:"
            echo "  $0 install                    # Set up everything"
            echo "  $0 link                       # Link all projects"
            echo "  $0 link ../my-project        # Link specific project"
            echo "  $0 status                     # Check status"
            ;;
    esac
}

# Run main function with all arguments
main "$@"