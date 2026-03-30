# Approved Updates

Pipeline decisions where the evaluator chose `implement`. Each entry links to the PR.

<!-- Entries are added automatically by the /track-update pipeline.
     Format:
     ## YYYY-MM-DD — Short Title
     - **Source**: URL
     - **Category**: feature | best-practice | benchmark | tool | breaking-change | deprecation
     - **PR**: #number or branch name
     - **Summary**: What was implemented
-->

## 2026-03-30 — Memory & Configuration Guide Documentation

- **Source**: https://code.claude.com/docs/en/memory
- **Category**: best-practice
- **PR**: claude/add-docs-on-memory-usage
- **Summary**: Added comprehensive Memory & Configuration Guide to `docs/MEMORY_GUIDE.md` covering folder structure (project vs user level directories), distinction between CLAUDE.md, Rules, and Memory systems, auto memory (MEMORY.md) functionality, modular rules with `.claude/rules/`, and hierarchical loading for monorepos. README now includes summary section linking to the full guide. Key clarification: CLAUDE.md and Rules are user-written instructions loaded at session start, while Memory is Claude's automatic learning system that stores preferences and corrections in `~/.claude/projects/<hash>/memory/`.

## 2026-03-02 — Clarify disable-model-invocation trigger axis in SKILL.md
- **Source**: https://martinfowler.com/articles/exploring-gen-ai/context-engineering-coding-agents.html
- **Category**: best-practice
- **PR**: #3
- **Summary**: Added inline comment to `# disable-model-invocation` in `starter-template/.claude/skills/my-skill/SKILL.md` clarifying that `true` means human must invoke the skill via `/skill`, while `false`/omitted means the LLM decides when to load it based on the description field. Two other proposed changes (hook tradeoff framing, CLAUDE.md Additional Context) were evaluated as already covered or net-negative due to template bloat risk.
