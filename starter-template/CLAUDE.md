# Project Instructions

<!-- ============================================================
  CLAUDE.md gives Claude persistent context about your project.
  Loaded at the start of every session — keep under 200 lines.

  Run /init to auto-generate a baseline from your codebase.
  Use @path/to/file to import additional context without bloating.
  Split large instructions into .claude/rules/ for path-scoped rules.

  ✅ INCLUDE                                    ❌ EXCLUDE
  Commands Claude can't guess                   Anything Claude can figure out by reading code
  Style rules that differ from defaults         Standard conventions Claude already knows
  Verification instructions and runners         Detailed API docs (link instead)
  Repository etiquette (branch naming, PRs)     Information that changes frequently
  Architectural decisions specific to project   Long explanations or tutorials
  Environment quirks (required tools, vars)     File-by-file descriptions of the codebase
  Common gotchas or non-obvious behaviors       Self-evident practices like "write clean code"
============================================================ -->

## Commands

<!-- CUSTOMIZE: Commands Claude can't guess.
  Software: `npm run build` / `pytest -x --tb=short` / `cargo build --release`
  Documents: `python scripts/generate_report.py` / `./validate.sh contracts/`
  Data: `make export FORMAT=csv` / `dbt run --models staging`
-->

## Style

<!-- CUSTOMIZE: Rules that differ from defaults.
  Only what's specific to THIS project — don't restate conventions
  Claude already knows.
  Software: Use 2-space indentation / Prefer named exports over default exports
  Documents: Use active voice / Dates in ISO 8601 format (YYYY-MM-DD)
  General: Section headings use Title Case / Currency includes two decimals
-->

## Verification

<!-- CUSTOMIZE: How to verify quality. Use IMPORTANT: and YOU MUST for critical rules.
  Software: IMPORTANT: Run tests before committing / Prefer single test files over full suite
  Documents: All docs must pass spell check / Verify all external links are accessible
  Data: Cross-reference figures with source data / Run `./validate.sh` to check formatting
-->

## Architecture

<!-- CUSTOMIZE: Key architectural decisions and project structure.
  Keep high-level — avoid file-by-file descriptions.
  Software: src/handlers/ — HTTP request handlers, one per resource
  Documents: contracts/active/ — Current client contracts by client name
  Data: reports/quarterly/ — Financial reports, one directory per quarter
-->

## Git Workflow

<!-- CUSTOMIZE: Branch naming, commit conventions, PR requirements.
  - Create feature branches from `main`
  - Use conventional commits: feat:, fix:, docs:, refactor:, test:, chore:
  - Keep PRs focused and under 400 lines when possible
-->

## Environment

<!-- CUSTOMIZE: Environment quirks, required tools, variables.
  Software: Requires Node.js 20+ and pnpm / CI requires all env vars even for unit tests
  Documents: Report template macros require LibreOffice, not Excel
  General: The staging API key is in .env.local (not committed)
-->

## Common Gotchas

<!-- CUSTOMIZE: Non-obvious behaviors that have tripped people up.
  Software: The ORM silently ignores unknown fields — always validate schema
  Documents: Client names in filenames must match CRM exactly (case-sensitive)
  General: Archived items must NOT be modified — create a new version instead
-->

## Additional Context

<!-- Use @path/to/file to import additional context.
  Imported files are expanded at launch. Max 5 levels of nesting.
  @README.md
  @docs/architecture.md
  @package.json
-->
