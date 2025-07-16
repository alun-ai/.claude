# Shared Claude Code Configuration

This is a shared Claude Code configuration system that provides reusable development tools and workflows across all projects through git submodules.

## 🚀 Architecture

```
Documents/Github/
├── .claude/                    # Shared Claude configuration (as submodule)
│   ├── commands/              # Reusable Claude commands
│   ├── templates/             # Project templates
│   ├── workflows/             # Development workflows
│   └── docs/                  # Documentation
├── project1/
│   ├── .claude/               # Submodule linked to shared config
│   └── .claude_config.json    # Project-specific settings
├── project2/
│   ├── .claude/               # Submodule linked to shared config
│   └── .claude_config.json    # Project-specific settings
└── ...
```

## 📁 Directory Structure

### `/commands/` - Reusable Commands
Claude Code slash commands available across all projects after adding the submodule and restarting Claude (all use `/m-*` prefix):

#### Core Development Workflow
- `/m-execute` - Multi-agent development workflow
- `/m-commit-push` - Intelligent commit and push
- `/m-bug-fix` - Comprehensive bug analysis and fixing
- `/m-project-init` - Initialize project with shared configuration

#### Code Quality & Security
- `/m-security-scan` - Security vulnerability scanning
- `/m-test-generation` - Automated test creation
- `/m-review-code` - Code quality review
- `/m-cleanup` - Project maintenance and cleanup

#### Planning & Analysis
- `/m-explore` - Dev task plan workflow with dual-AI analysis
- `/m-tdd-planner` - Test-driven development planning
- `/m-next-task` - Next action recommendations
- `/m-next-context` - Context compilation and analysis

#### Architecture & Design
- `/m-debate-architecture` - Architecture review and analysis
- `/m-debate-code` - Tactical code review

#### Project Management
- `/m-document-update` - Documentation maintenance
- `/m-branch-prune` - Branch cleanup and management
- `/m-branch-prune-lite` - Lightweight branch cleanup

#### Help & Discovery
- `/m-help` - Context-aware help and command discovery

### `/templates/` - Project Templates
Ready-to-use project templates with Claude configuration:
- Node.js/TypeScript projects
- Python projects
- Rust projects
- Full-stack applications
- Supabase projects

### `/workflows/` - Development Workflows
Predefined development workflows:
- CI/CD pipelines
- Release processes
- Security workflows
- Testing strategies

## 🚀 Getting Started

### For Existing Projects
1. **Add shared configuration as submodule**:
   ```bash
   git submodule add https://github.com/alun-ai/.claude .claude
   ```

2. **Setup MCP configuration**:
   ```bash
   # Copy MCP configuration to project root
   cp .claude/.mcp.json.example .mcp.json

   # Edit .mcp.json to enable/disable MCP servers as needed
   ```

3. **Setup environment variables** (if using MCP servers):
   ```bash
   # Ensure direnv is properly configured
   echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
   echo 'eval "$(direnv hook bash)"' >> ~/.bashrc

   # Copy environment variables example
   cp .claude/.envrc.example .envrc

   # Edit .envrc with your actual API keys
   code .envrc  # or use your preferred editor

   # Allow direnv for this project
   direnv allow

   # Check if direnv is working:
   direnv status
   ```

> NOTE: You should run `direnv reload` once you add new variables or values

4. **Restart Claude Code**:
   ```bash
   # Commands and MCP servers will be available after restart
   ```

5. **Update or Create ../CLAUDE.md:**
   ```bash
   # REQUIRED
    - Memorize into project memory ./claude/CLAUDE.md
   ```

### For New Projects
1. **Create project and add submodule**:
   ```bash
   mkdir my-app && cd my-app
   git init
   git submodule add https://github.com/alun-ai/.claude .claude
   ```

2. **Setup MCP and environment**:
   ```bash
   # Copy configurations
   cp .claude/.mcp.json.example .mcp.json
   cp .claude/.envrc.example .envrc
   ```

3. **Setup environment variables** (if using MCP servers):
   ```bash
   # Ensure direnv is properly configured
   echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
   echo 'eval "$(direnv hook bash)"' >> ~/.bashrc

   # Copy environment variables example
   cp .claude/.envrc.example .envrc

   # Edit .envrc with your actual API keys
   code .envrc  # or use your preferred editor

   # Allow direnv for this project
   direnv allow

   # Check if direnv is working:
   direnv status
   ```

> NOTE: You should run `direnv reload` once you add new variables or values

4. **Restart Claude Code to access commands and MCP servers**

5. **Update or Create ../CLAUDE.md:**
   ```bash
   # REQUIRED
    - Memorize into project memory ./claude/CLAUDE.md
   ```

## 📊 Command Integration

All shared commands automatically work from any project directory and adapt to the local project configuration:

### Development Workflow
```bash
/m-explore              # Dev task plan workflow with dual-AI analysis
/m-execute              # Multi-agent development workflow
/m-commit-push           # Intelligent commits
/m-bug-fix              # Comprehensive debugging
```

### Quality Assurance
```bash
/m-security-scan         # Vulnerability scanning
/m-test-generation       # Automated testing
/m-review-code          # Code quality review
/m-cleanup              # Maintenance
```

### Planning & Architecture
```bash
/m-tdd-planner          # Test-driven development
/m-debate-architecture   # Architecture review
/m-debate-code          # Tactical code review
/m-next-task            # Next action planning
```

### Project Management
```bash
/m-document-update      # Documentation sync
/m-branch-prune         # Branch management
/m-next-context         # Context compilation
/m-help                 # Interactive help
```

## 🎛 Configuration Inheritance

Projects automatically inherit shared configuration while allowing local overrides:

1. **Shared Commands**: Available from `.claude/commands/` after restart
2. **Project Override**: `.claude_config.json` for project-specific settings
3. **Environment Variables**: Project-specific environment via `.envrc`

## 🔐 Environment Variable Configuration

### direnv Setup for MCP Servers

When using environment variables in your MCP configuration (e.g., `${GEMINI_API_KEY}`, `${GITHUB_TOKEN}`), proper direnv setup is **critical** for Claude Code to access these variables.

#### Shell Configuration

**For Zsh users** (most common):
```bash
# Add to ~/.zshrc
eval "$(direnv hook zsh)"
```

**For Bash users**:
```bash
# Add to ~/.bashrc
eval "$(direnv hook bash)"
```

**⚠️ Common Issue**: Having `direnv hook bash` in `.zshrc` or vice versa will prevent environment loading.

#### Project .envrc Setup

Create `.envrc` in your project root:
```bash
# Example .envrc file
export GEMINI_API_KEY="your-gemini-api-key"
export GITHUB_PERSONAL_ACCESS_TOKEN="your-github-token"
export SUPABASE_DB_URL="your-database-url"
export JIRA_API_TOKEN="your-jira-token"
```

#### Allow direnv for your project:
```bash
direnv allow
```
#### Troubleshooting Environment Variables

**Check if direnv is working**:
```bash
direnv status
```

**Verify environment variables are loaded**:
```bash
echo $GEMINI_API_KEY
env | grep GEMINI
```

**Common fixes**:
1. **Wrong shell hook**: Ensure `direnv hook zsh` for zsh, `direnv hook bash` for bash
2. **Not allowed**: Run `direnv allow` in project directory
3. **Shell restart**: Restart terminal after adding direnv hook
4. **MCP connection fails**: Claude Code inherits environment from shell - ensure variables are exported
5. **GEMINI** - Gemini MCP can be weird and depending on the environment not want to use the environment variable.  You may have to hardcode it into the .mcp.json to get it to work.

#### Security Best Practices

- **Never commit** `.envrc` files with actual API keys
- **Use** `.envrc.example` files for documentation
- **Add** `.envrc` to `.gitignore`
- **Rotate** API keys regularly

## 🔄 Updates

Update the shared configuration:

```bash
# Update submodule to latest version
cd .claude
git pull origin main
cd ..

# Restart Claude Code to apply updates
```

## 🤝 Contributing

To add new shared functionality:

1. **Commands**: Add to `/commands/` in the shared repository
2. **Templates**: Add to `/templates/` in the shared repository
3. **Documentation**: Update relevant docs
4. **Commit and push**: Changes will be available to all projects after update

## 🆘 Troubleshooting

### Common Issues

**Commands not found**:
```bash
# Ensure submodule is properly added
ls -la .claude/commands/

# Restart Claude Code after adding submodule
```

**MCP servers failing to connect**:
```bash
# Check direnv configuration
direnv status
echo $GEMINI_API_KEY

# Common fixes:
# 1. Fix shell hook in ~/.zshrc or ~/.bashrc
# 2. Run 'direnv allow' in project directory
# 3. Restart terminal after hook changes
```

**Environment variables not loading**:
```bash
# Debug direnv issues
direnv status
direnv reload

# Verify shell hook is correct
grep direnv ~/.zshrc  # or ~/.bashrc
```

**Submodule not initialized**:
```bash
# Initialize and update submodules
git submodule init
git submodule update
```

### Getting Help

- Review shared configuration documentation
- Use `/m-help` for context-aware assistance (after restart)
- Ensure Claude Code is restarted after adding submodule

---

*This shared configuration system enables consistent, powerful development environments across all your projects through simple git submodule integration.*