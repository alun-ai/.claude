# CLAUDE.md - Universal Development Principles

This document contains universal development principles and practices for AI assistants working on any project. These principles are derived from battle-tested practices and represent a philosophy of clear, honest, and systematic development.

## Required Tools and Research Methods

### 1. Mandatory MCP Tool Usage

BEFORE ANY ACTION, you MUST use these tools. Tool names use double underscores between segments.

#### Documentation Research (ALWAYS FIRST)
Use MCP-native tools BEFORE any other approach:

```bash
# PRIORITY 1: MCP-native documentation search
mcp__ref__ref_search_documentation "[language/framework] [feature] best practices 2025"
mcp__ref__ref_search_documentation "[API name] documentation"
mcp__ref__ref_search_documentation "[technology] [pattern] implementation"

# Read the actual documentation URLs found:
mcp__ref__ref_read_url "[documentation URL from search]"

# PRIORITY 2: MCP filesystem operations for local docs
mcp__filesystem__search_files "docs" "*.md"
mcp__filesystem__read_file "path/to/documentation.md"

# PRIORITY 3: MCP memory for project knowledge
mcp__memory__search_nodes "[feature or concept]"
mcp__memory__read_graph

# PRIORITY 4: MCP GitHub for external references
mcp__github__search_repositories "[technology] [pattern]"
mcp__github__get_file_contents "owner" "repo" "README.md"

# PRIORITY 5: MCP Supabase for database docs
mcp__supabase__search_docs 'query { searchDocs(query: "[database feature]") { nodes { title href content } } }'

# PRIORITY 6: MCP Puppeteer for web automation and console logs
mcp__puppeteer__puppeteer_navigate "https://app.example.com"
mcp__puppeteer__puppeteer_screenshot "page-state"
mcp__puppeteer__puppeteer_evaluate "console.log('Testing console'); return document.title;"
mcp__puppeteer__puppeteer_click "button[data-testid='submit']"
mcp__puppeteer__puppeteer_fill "input[name='email']" "test@example.com"

# PRIORITY 7: MCP web search as fallback only
WebSearch "[technology] [feature] official documentation 2025"
WebFetch "https://docs.example.com/api"
```

#### Sequential Thinking (FOR COMPLEX TASKS)
Use `mcp__sequential-thinking__sequentialthinking` for:
- ANY feature implementation (even "simple" ones have edge cases)
- Debugging ANY issue (systematic analysis beats guessing)
- Architecture decisions (consider all implications)
- Performance optimizations (measure, analyze, implement)
- Security implementations (threat model first)
- Refactoring plans (understand current state fully)
- API integrations (error cases, rate limits, costs)
- State management changes (race conditions, cleanup)

#### Git History Analysis
```bash
# BEFORE modifying ANY file:
mcp__git__git_log --oneline -20  # Recent commits
mcp__git__git_log [filename] -10  # File history
mcp__git__git_diff HEAD~1  # What changed recently

# When tests fail or CI issues:
mcp__git__git_log .github/workflows/ -10  # Workflow changes
mcp__git__git_show [commit_hash]  # Understand specific changes

# Before implementing features:
mcp__git__git_grep "[feature_name]"  # Find related code
```

#### Puppeteer Web Automation (FOR BROWSER TESTING & DEBUGGING)
Use `mcp__puppeteer__*` tools for:
- **Web app debugging**: Navigate to your app and capture console errors
- **UI testing verification**: Screenshot states and interact with elements
- **API debugging**: Monitor network requests and responses
- **Console log analysis**: Execute JavaScript and capture console output
- **Form testing**: Fill inputs and validate form behavior
- **Authentication flows**: Test login/logout scenarios
- **Performance monitoring**: Measure page load times and interactions

```bash
# Navigation and page state
mcp__puppeteer__puppeteer_navigate "http://localhost:3000/dashboard"
mcp__puppeteer__puppeteer_screenshot "dashboard-loaded" 

# Console debugging and JavaScript execution
mcp__puppeteer__puppeteer_evaluate "
  console.error('Debug info:', window.location.href);
  return {
    title: document.title,
    errors: window.errors || [],
    userAgent: navigator.userAgent
  };
"

# Form interactions and UI testing
mcp__puppeteer__puppeteer_fill "input[data-testid='email']" "test@example.com"
mcp__puppeteer__puppeteer_click "button[type='submit']"
mcp__puppeteer__puppeteer_hover "nav .dropdown-trigger"

# Advanced debugging scenarios
mcp__puppeteer__puppeteer_evaluate "
  // Capture network errors
  window.addEventListener('error', e => console.error('JS Error:', e.error));
  
  // Monitor API calls
  const originalFetch = window.fetch;
  window.fetch = (...args) => {
    console.log('API Call:', args[0]);
    return originalFetch.apply(this, args)
      .then(r => { console.log('API Response:', r.status); return r; })
      .catch(e => { console.error('API Error:', e); throw e; });
  };
  
  return 'Monitoring enabled';
"
```

#### Code Validation Requirements
```bash
# ALWAYS run before saying "done":
mcp__ide__getDiagnostics  # TypeScript/ESLint errors
```

### 2. Required Questions Before Implementation

ASK QUESTIONS. LOTS OF THEM.

**Before implementing features**:
- "What exact user experience are you envisioning?"
- "Should this be configurable? What are the defaults?"
- "How should this integrate with existing features?"

**For error handling**:
- "What should happen when this fails?"
- "Should errors be retried? How many times?"
- "What logging/monitoring would help debug issues?"

**For performance**:
- "Are there performance constraints I should consider?"
- "What's the expected behavior on slow networks/devices?"
- "How much data will this typically process?"

**For security**:
- "Are there security implications to consider?"
- "Does this handle user data? How should it be protected?"
- "Are there any compliance or regulatory requirements?"

**For maintenance**:
- "What's the migration path for existing users/data?"
- "How will this be tested?"
- "What documentation needs updating?"

NEVER ASSUME. ALWAYS CLARIFY.

## Code Quality Standards

### Clear Code Principles

Write code as if the person maintaining it is a violent psychopath who knows where you live:

- **NO CLEVER TRICKS**: Clear, obvious code only
- **DESCRIPTIVE NAMING**: `processTextNodes()` not `ptn()` or `handleStuff()`
- **COMMENT THE WHY**: Only explain why, never what. Code shows what
- **SINGLE RESPONSIBILITY**: Each function does ONE thing
- **EXPLICIT ERROR HANDLING**: No silent failures
- **MEASURE THEN OPTIMIZE**: No premature optimization
- **SIMPLICITY FIRST**: Remove everything non-essential

### Honest Technical Assessment

ALWAYS provide honest assessment of technical decisions:

- If code has problems, explain the specific issues
- If an approach has limitations, quantify them
- If there are security risks, detail them clearly
- If performance will degrade, provide metrics
- If implementation is complex, justify why
- If you chose a suboptimal solution, explain the tradeoffs
- If you're uncertain, say so explicitly

Examples of honest assessment:
- "This will work for 1000 users but will break at 10,000 due to database bottleneck"
- "This fix addresses the symptom but not the root cause - we'll see this bug again"
- "This implementation is 3x more complex than needed because of legacy constraints"
- "I'm not certain this handles all edge cases - particularly around concurrent access"
- "This violates best practices but is necessary due to framework limitations"

### Context and Documentation

Preserve technical context. Never delete important information.

Keep these details:
- Code examples with line numbers
- Performance measurements and metrics
- Rationale for architectural decisions
- Explanations of non-obvious patterns
- Cross-references to related issues
- Technology-specific best practices

Remove only:
- Decorative elements (emojis, ascii art) unless project style requires them
- Marketing language or subjective praise
- Redundant information documented elsewhere
- Clearly obsolete information

## Version Control and Commits

### Conventional Commits Standard

Follow Conventional Commits v1.0.0:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Commit Types**:
- `feat`: New feature (MINOR version)
- `fix`: Bug fix (PATCH version)
- `refactor`: Code restructuring without behavior change
- `perf`: Performance improvement
- `docs`: Documentation only
- `test`: Test additions or corrections
- `build`: Build system or dependency changes
- `ci`: CI/CD configuration changes
- `chore`: Maintenance tasks
- `style`: Code formatting (whitespace, semicolons, etc)

**Breaking Changes**:
- Add `!` after type/scope: `feat(api)!: remove deprecated endpoints`
- Or use footer: `BREAKING CHANGE: description of the breaking change`

**Example Commit**:
```
fix(auth): prevent race condition in token refresh

Add mutex to ensure only one token refresh happens at a time.
Previous implementation could cause multiple simultaneous refreshes
under high load.

Fixes: #123
```

**Commit Requirements**:
- One logical change per commit
- Run tests before committing
- Include context for future developers
- Reference issue numbers when applicable
- Never mention "Claude" or "AI" in commits

## Development Workflow

### First Task Checklist

When given any task, ALWAYS execute these steps in order:

#### 1. Understand Context (2-3 minutes)
- [ ] Read the user's request completely
- [ ] Identify task type (feature/bug/refactor/debug)
- [ ] Note any specific constraints mentioned

#### 2. Research Current State (5-10 minutes)
- [ ] `mcp__git__git_log --oneline -20` - Check recent commits
- [ ] `mcp__git__git_grep "[feature_name]"` - Find related code
- [ ] `/map [affected_area]` - Understand code structure
- [ ] Look for existing similar implementations

#### 3. Verify Understanding (2-3 minutes)
- [ ] Ask clarifying questions based on context
- [ ] Confirm scope and constraints
- [ ] Identify potential edge cases

#### 4. Research Best Practices (5 minutes)
- [ ] `mcp__Ref__ref_search_documentation "[tech] [feature] 2025"`
- [ ] Read at least 2 relevant documentation links
- [ ] Note security and performance considerations

#### 5. Plan Approach (3-5 minutes)
- [ ] Use `/explore` for complex features
- [ ] Or use `mcp__sequential-thinking__sequentialthinking` for analysis
- [ ] Break into concrete steps (not timeframes)

#### 6. Execute (varies)
- [ ] Follow planned steps
- [ ] Run `mcp__ide__getDiagnostics` after major changes
- [ ] Test edge cases identified earlier

#### 7. Validate (2-3 minutes)
- [ ] `/qa` - Run quality checks
- [ ] Verify all requirements met
- [ ] Check for unintended side effects

#### 8. Complete (1-2 minutes)
- [ ] `/commit` - Create proper commit
- [ ] Summarize what was done
- [ ] Note any follow-up tasks

### Slash Commands for Common Workflows

Commands located in `~/.claude/commands/`:

- `/m-explore [topic]` - Research and plan before implementing
- `/m-qa [area]` - Quality assurance and validation
- `/m-commit [type]` - Create conventional commits
- `/m-map [area]` - Understand code structure and dependencies
- `/m-cleanup [target]` - Find and remove technical debt
- `/m-refactor [pattern]` - Safe code restructuring
- `/m-debug [issue]` - Systematic debugging approach

### Workflow Patterns

**Standard Development**:
```
/explore → Write code → /qa → /commit
```

**Debugging**:
```
/debug → /map → Fix → /qa → /commit
```

**Maintenance**:
```
/cleanup → /refactor → /qa → /commit
```

### Advanced Features

**Extended Thinking** - For complex analysis:
- "Think through the architectural implications of X"
- "Think step-by-step through this debugging process"
- "Think about the edge cases for this implementation"

**Visual Input** - For UI debugging:
- Paste screenshots directly when describing issues
- Use with `/debug` for visual bug analysis
- Works in interactive mode

**Documentation Philosophy**:
- Derive documentation on-demand using slash commands
- Git history is the source of truth
- Keep only essential static docs (README, CONTRIBUTING)
- Let code and commits tell the story

## Technical Standards

### Naming Conventions

Follow TypeScript/JavaScript standards:

**Functions and Variables**:
- Use `camelCase`: `getUserData`, `processRequest`
- Boolean prefixes: `is`, `has`, `can`, `should`, `will`, `did`
- Example: `isLoading`, `hasPermission`, `canEdit`

**Types and Interfaces**:
- Use `PascalCase`: `UserProfile`, `RequestHandler`
- No `I` prefix for interfaces (use `User` not `IUser`)
- Type for data: `UserData`, Interface for contracts: `UserService`

**Constants**:
- Global constants: `SCREAMING_SNAKE_CASE` (e.g., `MAX_RETRIES`)
- Local constants: `camelCase` (e.g., `defaultTimeout`)
- Enum values: `SCREAMING_SNAKE_CASE`

**File Names**:
- Components: `UserProfile.tsx`
- Utilities: `date-helpers.ts`
- Types: `user.types.ts`
- Tests: `user.test.ts` or `user.spec.ts`
- Constants: `constants.ts`

### Planning Methodology

Always plan in concrete STEPS, not timeframes:
- ❌ "Week 1: Implement authentication"
- ✅ "Step 1: Create user model with password hashing"
- ✅ "Step 2: Implement JWT token generation"
- ✅ "Step 3: Add refresh token mechanism"

Steps are actionable and measurable. Timeframes are guesses that become lies.

### Security Requirements

1. NEVER store secrets in code or commits
2. ALWAYS validate and sanitize ALL inputs
3. NO eval() or dynamic code execution with user data
4. IMPLEMENT rate limiting where appropriate
5. USE security headers and CSP policies
6. ENCRYPT sensitive data at rest and in transit
7. ASSUME all user input is hostile
8. VALIDATE permissions on every request
9. LOG security events for monitoring
10. FAIL securely - errors shouldn't leak information

## Implementation Patterns

### Error Handling

Use centralized error handling with proper TypeScript types:

```typescript
// Import paths: @ represents project src directory
import { withErrorHandling } from '@/shared/patterns/error-handler';
// Or use relative imports
import { withErrorHandling } from '../shared/patterns/error-handler';

// For async operations
const result = await withErrorHandling(
  async () => someAsyncOperation(),
  { operation: 'fetch.user', component: 'UserProfile' }
);

// With default value on error
const data = await withErrorHandling(
  async () => fetchData(),
  { operation: 'fetch.data' },
  [] // default empty array on error
);

// Manual error handling
try {
  await riskyOperation();
} catch (error: unknown) {
  // Type guard before use
  if (error instanceof Error) {
    logger.error('Operation failed', error);
  }
  throw error; // Re-throw after logging
}
```

### Type Safety

Prefer `unknown` over `any` in catch blocks:

```typescript
// Bad - no type safety
catch (error: any) {
  console.log(error.message); // Could crash
}

// Good - type safe
catch (error: unknown) {
  if (error instanceof Error) {
    logger.error(error.message);
  } else {
    logger.error('Unknown error', error);
  }
}
```

### Performance Optimization Process

1. **Measure first**: Use browser profiler to identify bottlenecks
2. **Analyze**: Use sequential thinking to understand the issue
3. **Implement**: Apply optimization following established patterns
4. **Verify**: Measure again to confirm improvement
5. **Document**: Record the optimization and its impact

### State Management Guidelines

- **Single source of truth**: One place for each piece of state
- **Immutable updates**: Never mutate, always create new objects
- **Cleanup on unmount**: Remove listeners, cancel requests
- **Handle race conditions**: Cancel outdated async operations
- **Optimistic updates**: Update UI immediately, rollback on error

## Tool Usage Guidelines

### When to Use Documentation Search
- Before writing ANY new code
- When using unfamiliar APIs or libraries
- To find best practices for patterns
- For performance optimization techniques
- For security implementation guidelines

### When to Use Sequential Thinking
- Planning features with multiple steps
- Debugging complex issues systematically
- Analyzing performance bottlenecks
- Designing system architecture
- Evaluating trade-offs between approaches

### When to Use Git Tools
- Before modifying any existing file
- When tests fail unexpectedly
- To find related code across the codebase
- To understand feature evolution
- To debug CI/CD pipeline issues

### When to Use Code Validation
- Before claiming any task is complete
- After refactoring code
- When TypeScript errors seem wrong
- Before creating commits
- After merging branches

## Core Development Principles

1. ALWAYS use MCP tools before coding
2. NEVER assume - always ask for clarification
3. Write clear, obvious code without clever tricks
4. Provide honest assessment of technical decisions
5. Preserve context - don't delete valuable information
6. Make atomic commits with clear messages
7. Document why decisions were made, not just what was done
8. Test thoroughly before declaring completion
9. Handle all errors explicitly
10. Treat user data as sacred

## Quick Reference

- Codebase > Documentation > Training data (in order of truth)
- Research current docs, don't trust outdated knowledge
- Ask questions early and often
- Use slash commands for consistent workflows
- Derive documentation on-demand
- Request extended thinking for complex problems
- Use visual inputs for UI/UX debugging
- Test locally before pushing
- Keep it simple: clear, obvious, no bullshit

---

Remember: Write code as if the person maintaining it is a violent psychopath who knows where you live. Make it that clear.