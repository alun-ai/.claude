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
- `/m-execute` - Multi-agent development workflow orchestration
- `/m-commit` - Intelligent local git commit with AI-powered commit message generation (no push)
- `/m-commit-push` - Intelligent git commit and push with AI-powered message generation
- `/m-fix-bug` - Systematic bug analysis, reproduction, root cause identification, and verification
- `/m-project-init` - Initialize project with shared configuration and intelligent environment setup

#### Advanced Development Tools
- `/m-ask-gemini` - AI-powered development assistant with direct access to Google Gemini
- `/m-parallel-tasks` - Multi-agent asynchronous development workflow with checkpoint-based coordination
- `/m-fix-build` - Comprehensive build error detection and fixing across local, production, and CircleCI environments
- `/m-generate-claude-md` - AI-powered CLAUDE.md generation with ultrathink mode extensions
- `/m-onboard-me` - Platform-agnostic onboarding system with intelligent technology stack detection
- `/m-product-canvas` - AI-powered product strategy workshop with template-driven canvas development
- `/m-product-tech-spec` - Chief Software Architect guidance for technical specifications with component reusability analysis

#### Code Quality & Security
- `/m-security-scan` - Security vulnerability scanning with comprehensive threat analysis
- `/m-test-generation` - Automated test creation with intelligent test case generation
- `/m-review-code` - Code quality review with AI-powered analysis
- `/m-cleanup` - Project maintenance and cleanup with intelligent debt detection
- `/m-qa` - Quality assurance validation with comprehensive testing

#### Planning & Analysis
- `/m-explore` - Dev task plan workflow with dual-AI analysis and strategic planning
- `/m-tdd-planner` - Test-driven development planning with comprehensive test strategy
- `/m-next-task` - Next action recommendations with intelligent task prioritization
- `/m-next-context` - Context compilation and analysis for development continuity

#### Architecture & Design
- `/m-debate-architecture` - Architecture review and analysis with expert consultation
- `/m-debate-code` - Tactical code review with intelligent feedback

#### Project Management
- `/m-document-update` - Documentation maintenance with intelligent content synchronization
- `/m-branch-prune` - Branch cleanup and management with intelligent branch analysis
- `/m-branch-prune-lite` - Lightweight branch cleanup for quick maintenance

#### Jira Integration
- `/m-jira-test-plan` - Comprehensive testing strategy generation with automated test case creation
- `/m-jira-qa-findings` - Quality assurance documentation with intelligent bug tracking
- `/m-jira-sprint` - Sprint planning and execution with AI-powered sprint master capabilities
- `/m-jira-report` - Analytics and reporting with AI-powered analytics engine
- `/m-jira-workflow` - Issue management with AI-powered workflow orchestration
- `/m-jira-dev-start` - Development workflow initialization with AI-powered issue selection
- `/m-jira-dev-complete` - Development completion with AI-powered quality intelligence
- `/m-jira-issue` - Unified issue management with AI-powered issue intelligence
- `/m-jira-planning` - Project planning with intelligent resource allocation
- `/m-jira-docs` - Documentation management with automated content generation
- `/m-jira-estimate` - Estimation and planning with AI-powered effort analysis
- `/m-jira-metrics` - Performance metrics and analytics with intelligent insights

#### Environment & Setup
- `/m-nix-setup` - Shared Nix development environment setup with unified infrastructure

#### Help & Discovery
- `/m-help` - Context-aware help and command discovery with intelligent assistance

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

## 🔌 MCP Server Integration

### What are MCP Servers?

**Model Context Protocol (MCP)** servers are specialized services that extend Claude Code's capabilities by providing access to external systems, APIs, and tools. They act as bridges between Claude and various services, enabling seamless integration with databases, development tools, documentation, and more.

MCP servers run as separate processes and communicate with Claude Code via a standardized protocol, providing enhanced functionality while maintaining security and isolation.

### Available MCP Servers

Our shared configuration includes these powerful MCP servers:

#### 🗂️ **Filesystem Server**
- **Purpose**: Enhanced file system operations beyond basic read/write
- **Tools**: `read_file`, `write_file`, `edit_file`, `search_files`, `list_directory`, `directory_tree`
- **Value**: Enables complex file operations, batch processing, and intelligent file navigation
- **Use Cases**: Codebase analysis, bulk file operations, project structure exploration

#### 🧠 **Memory Server**
- **Purpose**: Persistent knowledge graph for storing and retrieving project context
- **Tools**: `create_entities`, `create_relations`, `search_nodes`, `read_graph`
- **Value**: Maintains long-term project knowledge, remembers decisions and patterns
- **Use Cases**: Architecture documentation, team knowledge sharing, pattern recognition

#### 🌐 **Puppeteer Server**
- **Purpose**: Browser automation and web scraping capabilities
- **Tools**: `navigate`, `screenshot`, `click`, `fill`, `evaluate`
- **Value**: Enables web testing, UI debugging, and data extraction
- **Use Cases**: E2E testing, UI regression detection, web app debugging

#### 🤖 **Gemini Server**
- **Purpose**: Google Gemini AI integration for advanced analysis
- **Tools**: `gemini-query`, `gemini-brainstorm`, `gemini-analyze-code`
- **Value**: Provides additional AI perspectives and specialized analysis
- **Use Cases**: Code review, architectural analysis, complex problem solving

#### 🐙 **GitHub Server**
- **Purpose**: Direct GitHub API integration
- **Tools**: `search_repositories`, `create_issue`, `get_file_contents`, `create_pull_request`
- **Value**: Streamlines GitHub workflows and repository management
- **Use Cases**: Issue tracking, repository analysis, automated PR creation

#### 📊 **Jira Server**
- **Purpose**: Atlassian Jira integration for project management
- **Tools**: `jira_get_issue`, `jira_create_issue`, `jira_search`, `jira_update_issue`
- **Value**: Enables seamless issue tracking and project management
- **Use Cases**: Ticket creation, sprint planning, issue analysis

#### 🗄️ **Database Server (DBHub)**
- **Purpose**: Direct database query and management
- **Tools**: `execute_sql`
- **Value**: Enables direct database interaction and analysis
- **Use Cases**: Database debugging, schema analysis, data validation

#### 📝 **Notion Server**
- **Purpose**: Notion workspace integration
- **Tools**: `retrieve_page`, `create_database`, `query_database`
- **Value**: Integrates documentation and knowledge management
- **Use Cases**: Documentation updates, knowledge base management

#### ⚡ **Supabase Server**
- **Purpose**: Supabase platform integration
- **Tools**: `list_tables`, `execute_sql`, `apply_migration`
- **Value**: Streamlines Supabase development and management
- **Use Cases**: Database migrations, real-time features, authentication

#### 🔄 **CircleCI Server**
- **Purpose**: CI/CD pipeline integration
- **Tools**: `get_build_logs`, `run_pipeline`, `get_test_results`
- **Value**: Enables CI/CD automation and monitoring
- **Use Cases**: Build debugging, deployment automation, test analysis

#### 🧭 **Sequential Thinking Server**
- **Purpose**: Advanced reasoning and step-by-step analysis
- **Tools**: `sequentialthinking`
- **Value**: Provides structured problem-solving and complex analysis
- **Use Cases**: Architecture planning, debugging complex issues, systematic analysis

#### 📚 **Ref Server**
- **Purpose**: Technical documentation search and retrieval
- **Tools**: `ref_search_documentation`, `ref_read_url`
- **Value**: Provides access to up-to-date technical documentation
- **Use Cases**: API reference lookup, best practices research, technology learning

#### 🔍 **Context7 Server**
- **Purpose**: Library documentation and code examples
- **Tools**: `resolve-library-id`, `get-library-docs`
- **Value**: Provides comprehensive library documentation and examples
- **Use Cases**: Framework learning, API integration, code examples

#### 🕰️ **Claude Historian Server**
- **Purpose**: Claude Code conversation history and context
- **Tools**: `search_conversations`, `find_file_context`
- **Value**: Enables learning from previous interactions and context
- **Use Cases**: Context continuity, learning from past solutions, debugging patterns

### MCP Server Benefits

1. **Enhanced Capabilities**: Extends Claude's functionality beyond built-in tools
2. **Seamless Integration**: Works transparently with existing workflows
3. **Specialized Tools**: Each server provides domain-specific expertise
4. **Scalable Architecture**: Easy to add new servers as needs evolve
5. **Secure Isolation**: Each server runs independently with controlled access
6. **Standardized Protocol**: Consistent interface across all servers

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