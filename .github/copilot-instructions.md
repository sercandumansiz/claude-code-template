# Copilot Instructions

This is a Claude Code template project. It provides a starter template for extending Claude Code with custom configuration.

## Project Structure

- `starter-template/` — Generic template files users copy to their projects
- `.claude/` — This project's own Claude Code configuration (dogfooding example)
- `.claude/agents/` — Specialized agents (source-analyzer, evaluator, template-updater, reviewer, researcher, troubleshooter)
- `.claude/skills/track-update/` — Autonomous pipeline for analyzing external URLs and implementing updates

## Track Update Pipeline

When an issue has a title starting with `track:`, it triggers the track-update pipeline:

1. **Source Analysis** — Fetch and analyze the URL content
2. **Evaluation** — Decide: implement, on hold, or not relevant
3. **Implementation** — If implement: update starter-template, sync root config, create PR
4. **Summary** — Report the decision and actions taken

See `.claude/skills/track-update/SKILL.md` for the full pipeline definition.

## Conventions

- Use conventional commits: `feat:`, `fix:`, `docs:`, `refactor:`, `chore:`
- Templates must be tech-stack agnostic with `<!-- CUSTOMIZE: ... -->` placeholders
- JSON files must be valid (parseable by `jq`)
- Markdown uses consistent heading hierarchy (h1 > h2 > h3)
