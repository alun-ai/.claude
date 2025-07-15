# Claude Code MCP Server Configuration

## Available MCP Servers

### Core MCP Servers
These MCP servers are available for use with Claude Code:

#### Filesystem Server
- **Server**: `filesystem`
- **Purpose**: Enhanced file system operations
- **Configuration**:
  ```json
  {
    "type": "stdio",
    "command": "mcp-server-filesystem",
    "args": ["/Users/user/Documents/Github/project"]
  }
  ```

#### Memory Server
- **Server**: `memory`
- **Purpose**: Knowledge graph management and persistent memory
- **Configuration**:
  ```json
  {
    "type": "stdio",
    "command": "mcp-server-memory"
  }
  ```

#### Puppeteer Server
- **Server**: `puppeteer`
- **Purpose**: Browser automation and web scraping
- **Configuration**:
  ```json
  {
    "type": "stdio",
    "command": "mcp-server-puppeteer"
  }
  ```

#### Database Server (DBHub PostgreSQL)
- **Server**: `dbhub-postgres-npx`
- **Purpose**: PostgreSQL database operations
- **Configuration**:
  ```json
  {
    "type": "stdio",
    "command": "npx",
    "args": ["mcp-server-dbhub-postgres"]
  }
  ```

### Additional MCP Servers (Environment Dependent)
These servers require environment variables to be configured:

#### Gemini AI Server
- **Server**: `gemini`
- **Purpose**: Google Gemini AI integration
- **Environment Variable**: `GEMINI_API_KEY`

#### GitHub Server
- **Server**: `github`
- **Purpose**: GitHub API integration
- **Environment Variable**: `GITHUB_PERSONAL_ACCESS_TOKEN`

#### Jira Server
- **Server**: `jira`
- **Purpose**: Jira API integration
- **Environment Variables**:
  - `JIRA_API_TOKEN`
  - `JIRA_BASE_URL`
  - `JIRA_USERNAME`

#### Notion Server
- **Server**: `notion`
- **Purpose**: Notion API integration
- **Environment Variable**: `NOTION_API_KEY`

#### Supabase Server
- **Server**: `supabase`
- **Purpose**: Supabase operations
- **Environment Variables**:
  - `SUPABASE_ACCESS_TOKEN`
  - `SUPABASE_PROJECT_ID`

## MCP Server Functions

### Available Tools by Server

#### Filesystem Tools
- `mcp__filesystem__read_file`
- `mcp__filesystem__write_file`
- `mcp__filesystem__edit_file`
- `mcp__filesystem__create_directory`
- `mcp__filesystem__list_directory`
- `mcp__filesystem__search_files`
- `mcp__filesystem__move_file`
- `mcp__filesystem__get_file_info`

#### Memory Tools
- `mcp__memory__create_entities`
- `mcp__memory__create_relations`
- `mcp__memory__add_observations`
- `mcp__memory__read_graph`
- `mcp__memory__search_nodes`
- `mcp__memory__open_nodes`

#### Puppeteer Tools
- `mcp__puppeteer__puppeteer_navigate`
- `mcp__puppeteer__puppeteer_screenshot`
- `mcp__puppeteer__puppeteer_click`
- `mcp__puppeteer__puppeteer_fill`
- `mcp__puppeteer__puppeteer_evaluate`

#### Database Tools
- `mcp__dbhub-postgres-npx__execute_sql`

#### Gemini AI Tools
- `mcp__gemini__gemini-query`
- `mcp__gemini__gemini-brainstorm`
- `mcp__gemini__gemini-analyze-code`
- `mcp__gemini__gemini-analyze-text`
- `mcp__gemini__gemini-summarize`

#### GitHub Tools
- `mcp__github__create_or_update_file`
- `mcp__github__search_repositories`
- `mcp__github__get_file_contents`
- `mcp__github__create_issue`
- `mcp__github__create_pull_request`
- `mcp__github__list_commits`
- `mcp__github__merge_pull_request`

#### Jira Tools
- `mcp__jira__jira_get_issue`
- `mcp__jira__jira_search`
- `mcp__jira__jira_create_issue`
- `mcp__jira__jira_update_issue`
- `mcp__jira__jira_get_transitions`
- `mcp__jira__jira_transition_issue`
- `mcp__jira__jira_add_comment`

#### Notion Tools
- `mcp__notion__notion_retrieve_page`
- `mcp__notion__notion_create_database`
- `mcp__notion__notion_query_database`
- `mcp__notion__notion_append_block_children`
- `mcp__notion__notion_create_comment`

#### Supabase Tools
- `mcp__supabase__create_branch`
- `mcp__supabase__list_tables`
- `mcp__supabase__execute_sql`
- `mcp__supabase__apply_migration`
- `mcp__supabase__get_logs`

## Configuration Notes

### Environment Variables
- MCP servers requiring environment variables must have them set before launching Claude Code
- Use `direnv` for automatic environment variable loading in project directories
- Variables loaded after Claude Code startup won't be available

### Server Configuration
- MCP servers are configured globally in `~/.claude.json`
- Project-specific servers can be configured in `.claude_config.json`
- Server definitions follow the MCP protocol specifications

### Usage
- MCP tools are accessed through the function calling interface
- Tool names follow the pattern: `mcp__<server>__<function>`
- All MCP operations are performed through the Claude Code interface