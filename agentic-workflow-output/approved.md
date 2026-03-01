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

## 2026-03-02 — Clarify disable-model-invocation trigger axis in SKILL.md
- **Source**: https://martinfowler.com/articles/exploring-gen-ai/context-engineering-coding-agents.html
- **Category**: best-practice
- **PR**: #3
- **Summary**: Added inline comment to `# disable-model-invocation` in `starter-template/.claude/skills/my-skill/SKILL.md` clarifying that `true` means human must invoke the skill via `/skill`, while `false`/omitted means the LLM decides when to load it based on the description field. Two other proposed changes (hook tradeoff framing, CLAUDE.md Additional Context) were evaluated as already covered or net-negative due to template bloat risk.
