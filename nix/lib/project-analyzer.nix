# Advanced Project Analyzer
# Provides intelligent project analysis and tool recommendation

{ lib, ... }:

let
  inherit (lib) types;

  # File pattern matching utilities
  matchPatterns = patterns: path:
    lib.any (pattern: lib.hasInfix pattern path) patterns;

  # Analyze package.json for framework detection
  analyzePackageJson = packageJsonPath:
    let
      packageJson = if builtins.pathExists packageJsonPath
        then builtins.fromJSON (builtins.readFile packageJsonPath)
        else {};
      
      dependencies = (packageJson.dependencies or {}) // (packageJson.devDependencies or {});
      scripts = packageJson.scripts or {};
      
      frameworks = {
        nextjs = builtins.hasAttr "next" dependencies;
        react = builtins.hasAttr "react" dependencies;
        vue = builtins.hasAttr "vue" dependencies;
        angular = builtins.hasAttr "@angular/core" dependencies;
        svelte = builtins.hasAttr "svelte" dependencies;
        nuxt = builtins.hasAttr "nuxt" dependencies;
        gatsby = builtins.hasAttr "gatsby" dependencies;
        express = builtins.hasAttr "express" dependencies;
        fastify = builtins.hasAttr "fastify" dependencies;
        nestjs = builtins.hasAttr "@nestjs/core" dependencies;
        typescript = builtins.hasAttr "typescript" dependencies;
        jest = builtins.hasAttr "jest" dependencies;
        vitest = builtins.hasAttr "vitest" dependencies;
        webpack = builtins.hasAttr "webpack" dependencies;
        vite = builtins.hasAttr "vite" dependencies;
        eslint = builtins.hasAttr "eslint" dependencies;
        prettier = builtins.hasAttr "prettier" dependencies;
        tailwind = builtins.hasAttr "tailwindcss" dependencies;
        prisma = builtins.hasAttr "prisma" dependencies;
        supabase = builtins.hasAttr "@supabase/supabase-js" dependencies;
        vercel = builtins.hasAttr "vercel" dependencies;
      };
    in {
      inherit frameworks scripts;
      packageManager = 
        if builtins.pathExists "../pnpm-lock.yaml" then "pnpm"
        else if builtins.pathExists "../yarn.lock" then "yarn"
        else "npm";
    };

  # Analyze Python project structure
  analyzePythonProject = projectPath:
    let
      pyprojectPath = "${projectPath}/pyproject.toml";
      requirementsPath = "${projectPath}/requirements.txt";
      setupPyPath = "${projectPath}/setup.py";
      
      hasPoetry = builtins.pathExists pyprojectPath && 
        lib.hasInfix "poetry" (builtins.readFile pyprojectPath);
      
      frameworks = {
        django = builtins.pathExists "${projectPath}/manage.py";
        flask = builtins.pathExists requirementsPath && 
          lib.hasInfix "flask" (builtins.readFile requirementsPath);
        fastapi = builtins.pathExists requirementsPath && 
          lib.hasInfix "fastapi" (builtins.readFile requirementsPath);
        poetry = hasPoetry;
        pytest = builtins.pathExists "${projectPath}/pytest.ini" ||
          builtins.pathExists "${projectPath}/tests/";
      };
    in {
      inherit frameworks;
      packageManager = if hasPoetry then "poetry" else "pip";
    };

  # Analyze Docker setup
  analyzeDockerProject = projectPath:
    let
      dockerfilePath = "${projectPath}/Dockerfile";
      dockerComposePath = "${projectPath}/docker-compose.yml";
      
      dockerfileContent = if builtins.pathExists dockerfilePath
        then builtins.readFile dockerfilePath
        else "";
      
      baseImages = {
        node = lib.hasInfix "FROM node" dockerfileContent;
        python = lib.hasInfix "FROM python" dockerfileContent;
        nginx = lib.hasInfix "FROM nginx" dockerfileContent;
        alpine = lib.hasInfix "FROM alpine" dockerfileContent;
        ubuntu = lib.hasInfix "FROM ubuntu" dockerfileContent;
        golang = lib.hasInfix "FROM golang" dockerfileContent;
        rust = lib.hasInfix "FROM rust" dockerfileContent;
      };
    in {
      hasDockerfile = builtins.pathExists dockerfilePath;
      hasDockerCompose = builtins.pathExists dockerComposePath;
      inherit baseImages;
      isMultiStage = lib.hasInfix "FROM.*as.*" dockerfileContent;
    };

  # Main project analyzer
  analyzeProject = projectPath:
    let
      # Basic file detection
      files = {
        packageJson = builtins.pathExists "${projectPath}/package.json";
        pyprojectToml = builtins.pathExists "${projectPath}/pyproject.toml";
        cargoToml = builtins.pathExists "${projectPath}/Cargo.toml";
        goMod = builtins.pathExists "${projectPath}/go.mod";
        dockerfile = builtins.pathExists "${projectPath}/Dockerfile";
        makefile = builtins.pathExists "${projectPath}/Makefile";
        justfile = builtins.pathExists "${projectPath}/justfile";
        gitignore = builtins.pathExists "${projectPath}/.gitignore";
        readme = builtins.pathExists "${projectPath}/README.md";
        license = builtins.pathExists "${projectPath}/LICENSE";
        editorconfig = builtins.pathExists "${projectPath}/.editorconfig";
        gitattributes = builtins.pathExists "${projectPath}/.gitattributes";
        envrc = builtins.pathExists "${projectPath}/.envrc";
      };

      # Framework-specific analysis
      nodeAnalysis = if files.packageJson 
        then analyzePackageJson "${projectPath}/package.json"
        else { frameworks = {}; scripts = {}; packageManager = "npm"; };

      pythonAnalysis = if files.pyprojectToml || builtins.pathExists "${projectPath}/requirements.txt"
        then analyzePythonProject projectPath
        else { frameworks = {}; packageManager = "pip"; };

      dockerAnalysis = if files.dockerfile
        then analyzeDockerProject projectPath
        else { hasDockerfile = false; hasDockerCompose = false; baseImages = {}; isMultiStage = false; };

      # Directory structure analysis
      directories = {
        src = builtins.pathExists "${projectPath}/src";
        lib = builtins.pathExists "${projectPath}/lib";
        bin = builtins.pathExists "${projectPath}/bin";
        tests = builtins.pathExists "${projectPath}/tests" || builtins.pathExists "${projectPath}/test";
        docs = builtins.pathExists "${projectPath}/docs" || builtins.pathExists "${projectPath}/documentation";
        scripts = builtins.pathExists "${projectPath}/scripts";
        config = builtins.pathExists "${projectPath}/config";
        public = builtins.pathExists "${projectPath}/public";
        assets = builtins.pathExists "${projectPath}/assets";
        components = builtins.pathExists "${projectPath}/components";
        pages = builtins.pathExists "${projectPath}/pages";
        app = builtins.pathExists "${projectPath}/app";
      };

      # Project complexity assessment
      complexity = {
        fileCount = 0; # Would need shell command to count
        hasMultipleLanguages = (if files.packageJson then 1 else 0) +
                             (if files.pyprojectToml then 1 else 0) +
                             (if files.cargoToml then 1 else 0) +
                             (if files.goMod then 1 else 0) > 1;
        hasTests = directories.tests || nodeAnalysis.frameworks.jest or false || nodeAnalysis.frameworks.vitest or false;
        hasDocumentation = directories.docs || files.readme;
        hasContainerization = dockerAnalysis.hasDockerfile;
        hasAutomation = files.makefile || files.justfile || (builtins.length (builtins.attrNames nodeAnalysis.scripts) > 0);
      };

      # Recommended tools based on analysis
      recommendedTools = 
        # Core tools (always recommended)
        [ "git" "curl" "jq" "ripgrep" "fd" "tree" ] ++
        
        # Language-specific tools
        (lib.optionals files.packageJson [ "nodejs" "npm" nodeAnalysis.packageManager ]) ++
        (lib.optionals nodeAnalysis.frameworks.typescript [ "typescript" ]) ++
        (lib.optionals nodeAnalysis.frameworks.eslint [ "eslint" ]) ++
        (lib.optionals nodeAnalysis.frameworks.prettier [ "prettier" ]) ++
        
        (lib.optionals (files.pyprojectToml || builtins.pathExists "${projectPath}/requirements.txt") [ "python3" "pip" ]) ++
        (lib.optionals pythonAnalysis.frameworks.poetry [ "poetry" ]) ++
        
        (lib.optionals files.cargoToml [ "rustc" "cargo" "clippy" "rustfmt" ]) ++
        (lib.optionals files.goMod [ "go" "golangci-lint" ]) ++
        
        # DevOps tools
        (lib.optionals dockerAnalysis.hasDockerfile [ "docker" "docker-compose" "hadolint" ]) ++
        
        # Development tools
        (lib.optionals complexity.hasTests [ "just" ]) ++
        (lib.optionals files.envrc [ "direnv" ]) ++
        
        # Security tools
        (lib.optionals (files.packageJson || files.pyprojectToml) [ "trivy" ]);

    in {
      inherit files directories complexity recommendedTools;
      inherit nodeAnalysis pythonAnalysis dockerAnalysis;
      
      # Summary
      primaryLanguage = 
        if files.packageJson then "javascript"
        else if files.pyprojectToml then "python"
        else if files.cargoToml then "rust"
        else if files.goMod then "go"
        else "unknown";
      
      projectType = 
        if nodeAnalysis.frameworks.nextjs then "nextjs"
        else if nodeAnalysis.frameworks.react then "react"
        else if nodeAnalysis.frameworks.vue then "vue"
        else if pythonAnalysis.frameworks.django then "django"
        else if pythonAnalysis.frameworks.flask then "flask"
        else if dockerAnalysis.hasDockerfile then "containerized"
        else "generic";
      
      developmentStage = 
        if !files.readme then "early"
        else if !complexity.hasTests then "development"
        else if !complexity.hasDocumentation then "testing"
        else "mature";
    };

in {
  inherit analyzeProject analyzePackageJson analyzePythonProject analyzeDockerProject;
  
  # Helper functions for configuration generation
  generateDevShell = projectAnalysis: {
    packages = projectAnalysis.recommendedTools;
    shellHook = ''
      echo "🚀 Claude Code Environment for ${projectAnalysis.projectType} project"
      echo "Primary language: ${projectAnalysis.primaryLanguage}"
      echo "Development stage: ${projectAnalysis.developmentStage}"
      ${lib.optionalString projectAnalysis.complexity.hasMultipleLanguages "echo 'Multi-language project detected'"}
    '';
  };
  
  # Generate project-specific hooks
  generateHooks = projectAnalysis: {
    pre-commit = lib.flatten [
      # Language-specific linting
      (lib.optionals projectAnalysis.nodeAnalysis.frameworks.eslint [ "npm run lint" ])
      (lib.optionals projectAnalysis.nodeAnalysis.frameworks.prettier [ "npm run format" ])
      (lib.optionals projectAnalysis.files.cargoToml [ "cargo clippy" "cargo fmt --check" ])
      (lib.optionals projectAnalysis.files.goMod [ "golangci-lint run" "go fmt ./..." ])
      
      # Testing
      (lib.optionals projectAnalysis.complexity.hasTests [ "npm test" ])
      
      # Security
      (lib.optionals (projectAnalysis.files.packageJson || projectAnalysis.files.pyprojectToml) [ "trivy fs ." ])
    ];
    
    post-checkout = [
      "direnv allow"
    ] ++ lib.optionals projectAnalysis.files.packageJson [
      "${projectAnalysis.nodeAnalysis.packageManager} install"
    ];
  };
}