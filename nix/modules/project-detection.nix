# Project Detection Module
# Provides intelligent project type detection and configuration

{ lib, ... }:

let
  inherit (lib) types mkOption;

in {
  options = {
    projectDetection = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "Enable automatic project type detection";
      };

      customRules = mkOption {
        type = types.attrsOf (types.submodule {
          options = {
            files = mkOption {
              type = types.listOf types.str;
              description = "List of files that indicate this project type";
            };
            priority = mkOption {
              type = types.int;
              default = 100;
              description = "Priority for this detection rule (lower = higher priority)";
            };
            packages = mkOption {
              type = types.listOf types.str;
              default = [];
              description = "Additional packages to include for this project type";
            };
          };
        });
        default = {};
        description = "Custom project detection rules";
      };
    };
  };

  config = {
    # Built-in detection rules
    projectDetection.customRules = {
      nodejs = {
        files = [ "package.json" "yarn.lock" "pnpm-lock.yaml" ".nvmrc" ];
        priority = 10;
        packages = [ "nodejs" "npm" "yarn" "pnpm" ];
      };

      python = {
        files = [ "pyproject.toml" "requirements.txt" "setup.py" "Pipfile" "poetry.lock" ];
        priority = 10;
        packages = [ "python3" "pip" "poetry" "ruff" "black" ];
      };

      rust = {
        files = [ "Cargo.toml" "Cargo.lock" ];
        priority = 10;
        packages = [ "rustc" "cargo" "clippy" "rustfmt" ];
      };

      go = {
        files = [ "go.mod" "go.sum" ];
        priority = 10;
        packages = [ "go" "golangci-lint" ];
      };

      java = {
        files = [ "pom.xml" "build.gradle" "gradlew" ];
        priority = 10;
        packages = [ "openjdk17" "maven" "gradle" ];
      };

      docker = {
        files = [ "Dockerfile" "docker-compose.yml" "docker-compose.yaml" ".dockerignore" ];
        priority = 20;
        packages = [ "docker" "docker-compose" "hadolint" ];
      };

      supabase = {
        files = [ "supabase/config.toml" ];
        priority = 5;
        packages = [ "supabase-cli" "postgresql" ];
      };

      vercel = {
        files = [ "vercel.json" ".vercel/project.json" ];
        priority = 20;
        packages = [ ];
      };

      nextjs = {
        files = [ "next.config.js" "next.config.mjs" "next.config.ts" ];
        priority = 5;
        packages = [ ];
      };

      typescript = {
        files = [ "tsconfig.json" "tsconfig.base.json" ];
        priority = 15;
        packages = [ "typescript" ];
      };

      eslint = {
        files = [ ".eslintrc.js" ".eslintrc.json" "eslint.config.js" ];
        priority = 25;
        packages = [ ];
      };

      prettier = {
        files = [ ".prettierrc" ".prettierrc.json" "prettier.config.js" ];
        priority = 25;
        packages = [ ];
      };

      git = {
        files = [ ".git/config" ];
        priority = 30;
        packages = [ "git" "gh" ];
      };
    };
  };
}