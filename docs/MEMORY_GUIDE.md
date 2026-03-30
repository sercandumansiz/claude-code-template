# Memory & Configuration Guide

## Directory Structure

Claude Code uses two primary configuration directories:

```
your-project/
├── CLAUDE.md              # Project instructions (committed to git)
├── .claude/               # Project configuration (committed to git)
│   ├── settings.json
│   ├── rules/             # Modular instructions by topic or file type
│   ├── commands/
│   ├── skills/
│   ├── agents/
│   └── hooks/
│
~/.claude/                 # User-level configuration (personal, not committed)
├── CLAUDE.md              # Personal global instructions
├── settings.json
└── projects/
    └── <project-hash>/
        └── memory/
            └── MEMORY.md  # Auto-generated memory for this project
```

**Key Differences:**
- **Project-level (`.claude/`)** — Shared with your team via git. Configuration and instructions everyone should use.
- **User-level (`~/.claude/`)** — Personal preferences and auto-memory. Stays on your machine.

## CLAUDE.md vs Rules vs Memory

Claude Code has three distinct systems for providing context. Understanding when to use each is critical:

| System | Written By | When Loaded | Purpose | Location |
|--------|-----------|-------------|---------|----------|
| **CLAUDE.md** | You (manually) | Every session start | Core project instructions, commands, conventions | Project root, `~/.claude/` |
| **Rules** | You (manually) | Every session, or when matching files opened | Topic-specific or file-scoped instructions | `.claude/rules/*.md` |
| **Memory** | Claude (automatically) | Every session start | Learned preferences, corrections, usage patterns | `~/.claude/projects/<hash>/memory/` |

**When to use each:**

- **CLAUDE.md** — Core instructions that apply to your whole project. Build commands, coding standards, architectural decisions, workflow conventions. This is your project's constitution.

- **Rules** — Modular instructions that either apply globally or only when working with specific files. Break down large CLAUDE.md files into focused topics (e.g., `testing.md`, `api-design.md`). Use path scoping to load rules only when relevant files are opened.

- **Memory** — Automatic learning. Claude writes facts here based on your corrections, preferences, and patterns. You typically don't edit these files manually. Examples: "User prefers single quotes", "Build requires --legacy-peer-deps flag", "Tests must run with TZ=UTC".

## Auto Memory (MEMORY.md)

Auto memory is Claude's learning system. When enabled (`"autoMemoryEnabled": true` in settings), Claude automatically stores facts about your project and preferences.

**How it works:**
1. As you work with Claude, it observes patterns and corrections
2. Claude stores these as facts in `~/.claude/projects/<project-hash>/memory/MEMORY.md`
3. In future sessions, Claude loads this memory to avoid repeating mistakes
4. Memory is per-project and stored locally (never committed to git)

**Memory is capped at 200 lines or 25KB** per project to ensure fast loading. Focus on actionable, high-value facts.

**Examples of what gets stored:**
- Build or test commands that work for your environment
- Corrections you make repeatedly ("use camelCase, not snake_case")
- Environment-specific quirks ("npm install fails without --legacy-peer-deps")
- Preferences for how tasks should be completed

**Controlling auto memory:**
- Enable/disable: Set `"autoMemoryEnabled": true/false` in `.claude/settings.json`
- Storage location: Defaults to `~/.claude/projects/<project-hash>/memory/`
- Manual review: Check `~/.claude/projects/` to see what Claude has learned
- Clear memory: Delete files in the memory directory to reset

**Pro tip:** Auto memory complements CLAUDE.md. Use CLAUDE.md for explicit instructions everyone should follow. Let auto memory handle personal preferences and environment-specific learnings.

## Modular Rules with `.claude/rules/`

Instead of putting all instructions in one large CLAUDE.md file, split them into focused rule files:

```
.claude/rules/
├── code-style.md        # Naming conventions, formatting
├── testing.md           # Test patterns, coverage requirements
├── api-design.md        # API conventions, validation rules
└── security.md          # Security practices, auth patterns
```

**Global rules** (no path frontmatter) — Loaded every session:
```markdown
# Code Style
- Use camelCase for variables and functions
- Prefer named exports over default exports
```

**Path-scoped rules** (with paths frontmatter) — Only loaded when working with matching files:
```markdown
---
paths:
  - "src/**/*.test.ts"
  - "tests/**/*.ts"
---

# Testing Rules
- Every test must have a descriptive name
- Follow Arrange-Act-Assert (AAA) pattern
- Mock external dependencies
```

This approach:
- Keeps context focused (Claude only loads relevant rules)
- Reduces merge conflicts (team members edit different rule files)
- Makes maintenance easier (update one topic without affecting others)

## Multiple Directories & Hierarchical Loading

For monorepos or projects with distinct components, you can place CLAUDE.md files at multiple levels:

```
monorepo/
├── CLAUDE.md                    # Monorepo-wide instructions
├── apps/
│   ├── web/
│   │   └── CLAUDE.md            # Web app specific instructions
│   └── api/
│       └── CLAUDE.md            # API specific instructions
└── packages/
    └── shared/
        └── CLAUDE.md            # Shared package instructions
```

**Loading order (higher levels override lower):**
1. User global: `~/.claude/CLAUDE.md`
2. Project root: `your-project/CLAUDE.md`
3. Subdirectory: `your-project/apps/web/CLAUDE.md`

This allows you to:
- Set global standards at the root
- Override or specialize for specific components
- Keep component-specific instructions localized

**Best practice:** Use sparingly. Too many CLAUDE.md files can create confusion. Prefer `.claude/rules/` with path scoping for most modularity needs.
