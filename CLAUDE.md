# Claude Code Template - Project Instructions

## Commands

No build step required. This is a documentation and template project.

- Validate all JSON files: `find . -name "*.json" -not -path "./.git/*" -exec jq . {} +`
- Validate YAML files: `find .github -name "*.yml" -exec python3 -c "import yaml,sys; yaml.safe_load(open(sys.argv[1]))" {} \;`
- Check hook permissions: `ls -la starter-template/.claude/hooks/`

## Style

- All documentation and templates MUST be in English
- Templates MUST be tech-stack agnostic — use placeholder comments like `<!-- CUSTOMIZE: ... -->`
- `starter-template/CLAUDE.md` must stay under 200 lines (root CLAUDE.md can grow as needed)
- JSON files must be valid (no trailing commas, no comments)
- Markdown files must use consistent heading hierarchy (h1 → h2 → h3)
- Do not use em dashes (—) in guidance or instruction text. Use clear and complete sentences instead of formats like "guidance — open" or "instructions — loaded"
- Follow existing patterns in the repository

## Verification

IMPORTANT: Validate all JSON files with `jq` before committing changes.
IMPORTANT: Validate all YAML files before committing changes.
YOU MUST verify that all internal documentation links resolve to existing files.
YOU MUST ensure `.gitignore` correctly ignores local files but NOT `starter-template/` local templates.
YOU MUST keep `agentic-workflow-output/` files append-only — never delete or overwrite existing entries.
When making cross-cutting changes (terminology, conventions, file structure), verify ALL project files are updated consistently — including agents, skills, CLAUDE.md itself, and README.

## Architecture

This project itself uses its own template (dogfooding) — the root `.claude/` is this project's real configuration, while `starter-template/` contains the generic template for others.

- `starter-template/` — Generic template files users copy to their projects
- `.claude/` — This project's own Claude Code configuration (dogfooding example)
- `.github/workflows/` — GitHub Actions for remote triggers (track-update pipeline, Copilot @claude)
- `agentic-workflow-output/` — Pipeline decision logs (`approved.md` and `rejected.md`). Written by the main session after `/track-update` runs. Append-only — never delete entries.

## Git Workflow

- Use conventional commits: `feat:`, `fix:`, `docs:`, `refactor:`, `chore:`
- Main branch: `main`
- Keep PRs focused and under 400 lines when possible

## Pipeline Terminology

The `/track-update` evaluator uses these decisions — use them consistently across all files:

- `implement` → changes applied, logged in `agentic-workflow-output/approved.md`
- `on hold` → worth revisiting later, logged in `agentic-workflow-output/rejected.md`
- `not relevant` → doesn't apply, logged in `agentic-workflow-output/rejected.md`

Do NOT use: `skip`, `defer`, `document-only` — these are deprecated terms.

## Common Gotchas

- `starter-template/.claude/hooks/*.sh` must have executable permissions (`chmod +x`)
- `starter-template/.gitignore` is the TEMPLATE gitignore users copy — root `.gitignore` is for THIS repo
- Don't confuse root `.claude/` (this project's config) with `starter-template/.claude/` (the template)
- `starter-template/CLAUDE.local.md` and `starter-template/.claude/settings.local.json` are committed to git because they are template files, not actual local files
- GitHub Actions workflows require `ANTHROPIC_API_KEY` in repository secrets (from console.anthropic.com, separate from Max/Pro plan)
- Copilot `@claude` uses your Copilot Pro+ subscription — no API key needed but doesn't run custom agents/skills
- `template-updater` works in a worktree — it cannot write to `agentic-workflow-output/`. The main session handles tracking and PR creation.
