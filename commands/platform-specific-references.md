# Platform-Specific References in .claude/commands

## Summary of Findings

After searching through all markdown files in the `.claude/commands` directory, here are the platform-specific references that need to be generalized:

### 1. **"Alunai" References** (18 occurrences)
- **m-jira-docs.md**: Lines 503, 509 - URLs like "https://docs.alunai.com", "https://api.alunai.com"
- **m-jira-estimate.md**: Lines 103, 108, 135, 193, 201, 203, 242, 283, 386, 622
- **m-jira-metrics.md**: Line 479 - team name "alunai-development-team"
- **m-next-context.md**: Line 425
- **m-onboard-me.md**: Lines 5, 120, 173, 216, 233, 276

### 2. **"Social Media" References** (16 occurrences)
- **m-jira-planning.md**: Lines 173, 175, 200, 204, 268, 392
- **m-jira-sprint.md**: Line 421
- **m-next-context.md**: Line 425
- **m-onboard-me.md**: Lines 235, 248, 308
- **m-product-canvas.md**: Line 534
- **m-product-tech-spec.md**: Line 428
- **m-security-scan.md**: Lines 308, 503

### 3. **Framework-Specific References**
#### Next.js (20+ occurrences)
- **m-debate-code.md**: Line 440
- **m-fix-build.md**: Lines 9, 29, 34, 135, 193, 198, 202, 207, 208, 210, 212, 258, 422, 551
- **m-help.md**: Line 346
- **m-jira-estimate.md**: Lines 204, 250
- **m-onboard-me.md**: Lines 145, 235

#### Supabase (20+ occurrences)
- **m-fix-build.md**: Lines 425, 560
- **m-jira-estimate.md**: Lines 205, 255, 285, 387, 544
- **m-jira-issue.md**: Line 493
- **m-next-context.md**: Line 437
- **m-onboard-me.md**: Lines 62, 73, 147, 157, 235, 238, 287, 290, 291, 342, 362

#### Other Technologies
- **Vercel**: m-product-tech-spec.md (line 276), m-project-init.md (line 214)
- **Stripe**: m-fix-build.md (line 426)

### 4. **Architecture-Specific Patterns**
- **Sliding Panel System**: Referenced in multiple files as a specific UI pattern
- **OAuth integrations**: Mentioned as "10+ social platforms" specifically
- **Multi-tenant architecture**: "Organizations → Teams → Brands" hierarchy
- **Enterprise security patterns**: Specific to the platform's security implementation

## Recommendations for Generalization

1. **Replace "Alunai" with**:
   - `{{PROJECT_NAME}}` or `{{APP_NAME}}`
   - `{{DOMAIN}}` for URLs
   - `{{TEAM_NAME}}` for team references

2. **Replace "Social Media Management Platform" with**:
   - `{{PLATFORM_TYPE}}` or `{{PROJECT_DESCRIPTION}}`
   - Allow configuration of the platform purpose

3. **Framework References**:
   - Keep technology references but make them configurable
   - Use variables like `{{FRONTEND_FRAMEWORK}}`, `{{BACKEND_SERVICE}}`, `{{DATABASE_PROVIDER}}`

4. **Architecture Patterns**:
   - Make these optional/configurable features
   - Use feature flags or configuration options like:
     - `ENABLE_MULTI_TENANT=true`
     - `UI_PATTERN=sliding_panel`
     - `AUTH_PROVIDERS=["oauth2", "social"]`

5. **Domain-Specific Terms**:
   - Replace "brands", "organizations", "teams" with configurable entity names
   - Use `{{PRIMARY_ENTITY}}`, `{{SECONDARY_ENTITY}}`, etc.

## Files Requiring Major Updates

1. **m-onboard-me.md** - Heavy platform-specific content
2. **m-jira-estimate.md** - Contains hardcoded architecture context
3. **m-jira-planning.md** - Social media specific examples
4. **m-fix-build.md** - Framework-specific troubleshooting
5. **m-security-scan.md** - Platform-specific security patterns

## Implementation Strategy

1. Create a configuration file (`.claude-config.json`) with project-specific values
2. Update commands to read from this configuration
3. Use template variables throughout the commands
4. Provide sensible defaults for generic use cases