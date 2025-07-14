# AI Integration Template for /m-* Commands

Add this section to all `/m-*` commands that should use Gemini CLI:

```markdown
## AI Integration Strategy

### Primary: Gemini CLI Integration
**PRIORITY: Uses Gemini CLI when available for enhanced AI capabilities**

```bash
# Check for Gemini CLI availability and use for enhanced functionality
if command -v gemini >/dev/null 2>&1 && [[ -n "$GEMINI_API_KEY" ]]; then
    # Use Gemini CLI for [SPECIFIC_FUNCTIONALITY]
    gemini [OPTIONS] -p "[CONTEXT_SPECIFIC_PROMPT]" [FORMAT_OPTIONS]
else
    # Fallback to Claude Code native functionality
    echo "Using Claude Code native processing (Gemini CLI not available)"
fi
```

**Fallback**: Use Claude Code native functionality if Gemini CLI unavailable.

### Enhanced AI Capabilities
- **[Capability 1]**: [Description]
- **[Capability 2]**: [Description]
- **[Capability 3]**: [Description]
```

## Commands Updated with Gemini Integration

### Core Commands
- ✅ `/m-commit-push` - AI-powered commit message generation
- ✅ `/m-review-code` - Enhanced code analysis and security review
- ✅ `/m-ask-gemini` - Direct AI assistance interface

### Jira Integration Commands
- ✅ `/m-jira-workflow` - Intelligent workflow management
- ✅ `/m-jira-issue` - Context-aware issue creation
- ✅ `/m-jira-tech-spec` - AI-powered technical specification generation
- ✅ `/m-jira-docs` - Intelligent documentation generation

### Commands Requiring Integration
- 🔄 `/m-jira-update` - Smart issue updates
- 🔄 `/m-jira-dev-start` - AI-guided development initiation
- 🔄 `/m-jira-dev-complete` - Intelligent completion workflows
- 🔄 `/m-jira-test-plan` - AI-generated test planning
- 🔄 `/m-jira-qa-findings` - Smart QA documentation
- 🔄 `/m-jira-sprint` - AI-enhanced sprint management
- 🔄 `/m-jira-planning` - Intelligent project planning
- 🔄 `/m-jira-report` - AI-powered reporting
- 🔄 `/m-jira-metrics` - Advanced analytics

### Integration Priority
1. **High Priority**: Core workflow commands (commit, review, issue management)
2. **Medium Priority**: Documentation and planning commands
3. **Low Priority**: Reporting and analytics commands