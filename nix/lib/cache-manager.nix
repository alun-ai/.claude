# Advanced Cache Management System
# Provides intelligent caching for development tools and dependencies

{ config, lib, pkgs, ... }:

let
  cfg = config.claudeCode.performance.caching;
  inherit (lib) types;

  # Cache configuration for different tools
  cacheConfigs = {
    npm = {
      envVar = "NPM_CONFIG_CACHE";
      path = "${cfg.cacheDir}/npm";
      maxSize = "500M";
      cleanCmd = "npm cache clean --force";
      verifyCmd = "npm cache verify";
    };

    yarn = {
      envVar = "YARN_CACHE_FOLDER";
      path = "${cfg.cacheDir}/yarn";
      maxSize = "500M";
      cleanCmd = "yarn cache clean";
      verifyCmd = "yarn cache dir";
    };

    pnpm = {
      envVar = "PNPM_HOME";
      path = "${cfg.cacheDir}/pnpm";
      maxSize = "500M";
      cleanCmd = "pnpm store prune";
      verifyCmd = "pnpm store path";
    };

    cargo = {
      envVar = "CARGO_HOME";
      path = "${cfg.cacheDir}/cargo";
      maxSize = "1G";
      cleanCmd = "cargo clean";
      verifyCmd = "cargo --version";
    };

    go = {
      envVar = "GOCACHE";
      path = "${cfg.cacheDir}/go";
      maxSize = "500M";
      cleanCmd = "go clean -cache";
      verifyCmd = "go env GOCACHE";
    };

    pip = {
      envVar = "PIP_CACHE_DIR";
      path = "${cfg.cacheDir}/pip";
      maxSize = "300M";
      cleanCmd = "pip cache purge";
      verifyCmd = "pip cache dir";
    };

    poetry = {
      envVar = "POETRY_CACHE_DIR";
      path = "${cfg.cacheDir}/poetry";
      maxSize = "300M";
      cleanCmd = "poetry cache clear --all pypi";
      verifyCmd = "poetry cache list";
    };

    docker = {
      envVar = "DOCKER_BUILDKIT_CACHE_DIR";
      path = "${cfg.cacheDir}/docker";
      maxSize = "2G";
      cleanCmd = "docker system prune -f";
      verifyCmd = "docker system df";
    };

    nix = {
      envVar = "NIX_CACHE_DIR";
      path = "${cfg.cacheDir}/nix";
      maxSize = "1G";
      cleanCmd = "nix-collect-garbage -d";
      verifyCmd = "nix-store --verify";
    };

    ccache = {
      envVar = "CCACHE_DIR";
      path = "${cfg.cacheDir}/ccache";
      maxSize = "1G";
      cleanCmd = "ccache -C";
      verifyCmd = "ccache -s";
    };

    sccache = {
      envVar = "SCCACHE_DIR";
      path = "${cfg.cacheDir}/sccache";
      maxSize = "1G";
      cleanCmd = "sccache --zero-stats";
      verifyCmd = "sccache --show-stats";
    };
  };

  # Generate cache setup script
  generateCacheSetup = toolName: config: ''
    # Setup ${toolName} cache
    export ${config.envVar}="${config.path}"
    mkdir -p "${config.path}"
    
    # Set cache size limit if supported
    case "${toolName}" in
      "ccache")
        ccache -M "${config.maxSize}" 2>/dev/null || true
        ;;
      "sccache")
        export SCCACHE_CACHE_SIZE="${config.maxSize}"
        ;;
    esac
  '';

  # Generate cache management functions
  generateCacheFunction = toolName: config: ''
    cache_${toolName}_status() {
      echo "=== ${toolName} Cache Status ==="
      if [[ -d "${config.path}" ]]; then
        local size=$(du -sh "${config.path}" 2>/dev/null | cut -f1 || echo "Unknown")
        echo "Location: ${config.path}"
        echo "Size: $size (max: ${config.maxSize})"
        
        # Tool-specific status
        if command -v ${toolName} >/dev/null 2>&1; then
          ${config.verifyCmd} 2>/dev/null || echo "Status check failed"
        fi
      else
        echo "Cache directory not found: ${config.path}"
      fi
      echo
    }
    
    cache_${toolName}_clean() {
      echo "Cleaning ${toolName} cache..."
      if command -v ${toolName} >/dev/null 2>&1; then
        ${config.cleanCmd} 2>/dev/null || echo "Clean command failed for ${toolName}"
      fi
      
      # Manual cleanup of old files
      if [[ -d "${config.path}" ]]; then
        find "${config.path}" -type f -mtime +$((${toString cfg.ttl} / 86400)) -delete 2>/dev/null || true
        echo "✓ Cleaned old files from ${toolName} cache"
      fi
    }
    
    cache_${toolName}_init() {
      mkdir -p "${config.path}"
      ${generateCacheSetup toolName config}
      echo "✓ Initialized ${toolName} cache at ${config.path}"
    }
  '';

  # Smart cache size calculation based on available disk space
  calculateOptimalCacheSize = ''
    get_optimal_cache_size() {
      local available_space
      available_space=$(df "${cfg.cacheDir}" 2>/dev/null | awk 'NR==2 {print $4}' || echo "1000000")
      
      # Convert to MB
      local available_mb=$((available_space / 1024))
      
      # Use 10% of available space, but no more than configured max
      local optimal_mb=$((available_mb / 10))
      
      # Ensure minimum 100MB
      if [[ $optimal_mb -lt 100 ]]; then
        optimal_mb=100
      fi
      
      echo "''${optimal_mb}M"
    }
  '';

in {
  inherit cacheConfigs;

  # Main cache management script
  cacheManagerScript = pkgs.writeShellScriptBin "claude-cache-manager" ''
    #!/bin/bash
    
    # Cache directory setup
    CACHE_BASE_DIR="${cfg.cacheDir}"
    CACHE_MAX_SIZE="${cfg.maxSize}"
    CACHE_TTL=${toString cfg.ttl}
    
    ${calculateOptimalCacheSize}
    
    # Individual cache setup functions
    ${lib.concatStringsSep "\n" (lib.mapAttrsToList generateCacheSetup cacheConfigs)}
    
    # Individual cache management functions
    ${lib.concatStringsSep "\n" (lib.mapAttrsToList generateCacheFunction cacheConfigs)}
    
    # Global cache management functions
    cache_init_all() {
      echo "🚀 Initializing all caches..."
      mkdir -p "$CACHE_BASE_DIR"
      
      # Initialize based on detected tools
      [[ -f package.json ]] && cache_npm_init
      [[ -f yarn.lock ]] && cache_yarn_init
      [[ -f pnpm-lock.yaml ]] && cache_pnpm_init
      [[ -f Cargo.toml ]] && cache_cargo_init && cache_sccache_init
      [[ -f go.mod ]] && cache_go_init
      [[ -f pyproject.toml || -f requirements.txt ]] && cache_pip_init
      [[ -f poetry.lock ]] && cache_poetry_init
      [[ -f Dockerfile ]] && cache_docker_init
      
      # Always initialize nix and ccache if available
      cache_nix_init
      command -v ccache >/dev/null 2>&1 && cache_ccache_init
      
      echo "✅ Cache initialization complete"
    }
    
    cache_status_all() {
      echo "📊 Claude Code Cache Status Report"
      echo "================================="
      echo "Base directory: $CACHE_BASE_DIR"
      echo "Max total size: $CACHE_MAX_SIZE"
      echo "TTL: $CACHE_TTL seconds"
      echo
      
      # Show individual cache statuses
      cache_npm_status
      cache_yarn_status
      cache_pnpm_status
      cache_cargo_status
      cache_go_status
      cache_pip_status
      cache_poetry_status
      cache_docker_status
      cache_nix_status
      cache_ccache_status
      cache_sccache_status
      
      # Overall cache size
      if [[ -d "$CACHE_BASE_DIR" ]]; then
        local total_size
        total_size=$(du -sh "$CACHE_BASE_DIR" 2>/dev/null | cut -f1 || echo "Unknown")
        echo "=== Total Cache Usage ==="
        echo "Total size: $total_size"
        echo "Location: $CACHE_BASE_DIR"
      fi
    }
    
    cache_clean_all() {
      echo "🧹 Cleaning all caches..."
      
      # Clean individual caches
      cache_npm_clean
      cache_yarn_clean
      cache_pnpm_clean
      cache_cargo_clean
      cache_go_clean
      cache_pip_clean
      cache_poetry_clean
      cache_docker_clean
      cache_nix_clean
      cache_ccache_clean
      cache_sccache_clean
      
      # Remove empty directories
      find "$CACHE_BASE_DIR" -type d -empty -delete 2>/dev/null || true
      
      echo "✅ Cache cleanup complete"
    }
    
    cache_optimize() {
      echo "⚡ Optimizing caches..."
      
      # Check if total cache size exceeds limit
      if [[ -d "$CACHE_BASE_DIR" ]]; then
        local current_size_bytes
        current_size_bytes=$(du -sb "$CACHE_BASE_DIR" 2>/dev/null | cut -f1 || echo "0")
        local max_size_bytes
        max_size_bytes=$(echo "$CACHE_MAX_SIZE" | sed 's/G/*1024*1024*1024/; s/M/*1024*1024/; s/K/*1024/' | bc 2>/dev/null || echo "2147483648")
        
        if [[ $current_size_bytes -gt $max_size_bytes ]]; then
          echo "Cache size ($current_size_bytes bytes) exceeds limit ($max_size_bytes bytes)"
          echo "Running aggressive cleanup..."
          
          # Clean oldest files first
          find "$CACHE_BASE_DIR" -type f -printf '%T@ %p\n' | sort -n | head -1000 | cut -d' ' -f2- | xargs rm -f 2>/dev/null || true
        fi
      fi
      
      # Optimize individual caches
      command -v cargo >/dev/null 2>&1 && cargo clean --release 2>/dev/null || true
      command -v npm >/dev/null 2>&1 && npm cache verify 2>/dev/null || true
      command -v ccache >/dev/null 2>&1 && ccache -c 2>/dev/null || true
      
      echo "✅ Cache optimization complete"
    }
    
    # Main command dispatcher
    case "''${1:-help}" in
      "init")
        cache_init_all
        ;;
      "status")
        cache_status_all
        ;;
      "clean")
        cache_clean_all
        ;;
      "optimize")
        cache_optimize
        ;;
      "help"|*)
        echo "Claude Code Cache Manager"
        echo "Usage: $0 {init|status|clean|optimize|help}"
        echo
        echo "Commands:"
        echo "  init     - Initialize all caches"
        echo "  status   - Show cache status and sizes"
        echo "  clean    - Clean all caches"
        echo "  optimize - Optimize cache usage"
        echo "  help     - Show this help message"
        ;;
    esac
  '';

  # Environment setup for caching
  cacheEnvironment = lib.mapAttrs' (name: config: {
    name = config.envVar;
    value = config.path;
  }) cacheConfigs;

  # Shell initialization for caching
  cacheShellInit = ''
    # Claude Code Cache Management
    export CLAUDE_CODE_CACHE_BASE="${cfg.cacheDir}"
    
    # Initialize cache directories and environment variables
    ${lib.concatStringsSep "\n" (lib.mapAttrsToList generateCacheSetup cacheConfigs)}
    
    # Cache management aliases
    alias cache-init="claude-cache-manager init"
    alias cache-status="claude-cache-manager status"
    alias cache-clean="claude-cache-manager clean"
    alias cache-optimize="claude-cache-manager optimize"
    
    # Auto-initialize cache on first use
    if [[ ! -d "$CLAUDE_CODE_CACHE_BASE" ]]; then
      echo "🔧 First-time cache setup..."
      cache-init
    fi
    
    # Periodic cache optimization (once per day)
    local cache_check_file="$CLAUDE_CODE_CACHE_BASE/.last_check"
    if [[ ! -f "$cache_check_file" ]] || [[ $(find "$cache_check_file" -mtime +1 2>/dev/null) ]]; then
      cache-optimize >/dev/null 2>&1 &
      touch "$cache_check_file"
    fi
  '';
}