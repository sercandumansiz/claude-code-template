<!-- ============================================================
  Rules are modular instructions that apply automatically.
  Each .md file in .claude/rules/ covers one topic.

  WITHOUT paths: frontmatter → applies to ALL files, loaded every session.
  WITH paths: frontmatter → only loads when Claude works with matching files.

  CLAUDE.md vs Rules vs Skills:
  ┌──────────────┬────────────────────────────────────────────────────┐
  │ CLAUDE.md    │ Every session. Core conventions and commands.      │
  │ Rules        │ Every session, or when matching files are opened.  │
  │              │ Language-specific or directory-specific guidelines. │
  │ Skills       │ On demand, when invoked or relevant.               │
  │              │ Reference material, repeatable workflows.          │
  └──────────────┴────────────────────────────────────────────────────┘

  Use rules to keep CLAUDE.md focused. Path-scoped rules save context
  by only loading when Claude works with matching files.

  Glob patterns:
  - **/*.ts           → All TypeScript files in any directory
  - src/**/*          → All files under src/
  - *.md              → Markdown files in project root
  - src/**/*.{ts,tsx} → Multiple extensions with brace expansion
============================================================ -->

<!-- CUSTOMIZE: Uncomment and adjust paths to scope this rule.
  Remove the paths block entirely to apply to all files.
---
paths:
  - "src/**/*.ts"
  - "lib/**/*.ts"
---
-->

<!-- CUSTOMIZE: Replace with your project's rules.

  Example — Global style rule (no paths):

  # Style
  - Use consistent naming conventions
  - Prefer descriptive names over abbreviations
  - Follow existing patterns over introducing new ones

  Example — Path-scoped test rule:

  # Testing Rules
  - Every test must have a descriptive name
  - Follow Arrange-Act-Assert (AAA) pattern
  - Mock external dependencies
  - Test both success and failure cases

  Example — Path-scoped API rule:

  # API Design Rules
  - All endpoints must validate input
  - Use consistent error response format
  - Never expose internal error details to clients
  - Implement rate limiting for public endpoints
-->
