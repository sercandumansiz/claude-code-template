# Rejected Updates

Pipeline decisions where the evaluator chose `not relevant` or `on hold`. Kept as a log so you can revisit ideas later.

<!-- Entries are added automatically by the /track-update pipeline.
     Format:
     ## YYYY-MM-DD — Short Title
     - **Source**: URL
     - **Decision**: not relevant | on hold
     - **Reason**: Why it was rejected or put on hold
     - **Revisit**: yes | no — whether to check again later
-->

## 2026-03-08 - Agentic Loop Documentation

- **Source**: https://code.claude.com/docs/en/how-claude-code-works
- **Decision**: not relevant
- **Reason**: The finding describes Claude Code's core execution model accurately, but implementing conceptual documentation about the agentic loop does not align with this project's purpose. This is a configuration template repository, not a Claude Code tutorial. The README's "Building Blocks" table already links to official documentation. Duplicating conceptual content from official docs would increase maintenance burden and risk divergence. The template files provide practical configuration examples with inline guidance on customization, not explanations of how Claude Code works internally. The official Claude Code documentation already covers the agentic loop comprehensively.

## 2026-03-01 — agents.md vs Skills Approach

- **Source**: https://vercel.com/blog/agents-md-outperforms-skills-in-our-agent-evals
- **Decision**: not relevant
- **Reason**: Our architecture already follows Vercel's winning approach. We use CLAUDE.md as persistent, always-loaded context (equivalent to their AGENTS.md), which achieved 100% pass rate in their evals. While we also offer skills for user-invocable workflows, our core design already prioritizes persistent context over on-demand retrieval. The article validates our current architecture rather than suggesting changes. Key insight: Passive persistent context (CLAUDE.md) is more reliable than active skill invocation - which we already implement correctly.
- **Revisit**: no
