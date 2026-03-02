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

## 2026-03-01 — agents.md vs Skills Approach

- **Source**: https://vercel.com/blog/agents-md-outperforms-skills-in-our-agent-evals
- **Decision**: not relevant
- **Reason**: Our architecture already follows Vercel's winning approach. We use CLAUDE.md as persistent, always-loaded context (equivalent to their AGENTS.md), which achieved 100% pass rate in their evals. While we also offer skills for user-invocable workflows, our core design already prioritizes persistent context over on-demand retrieval. The article validates our current architecture rather than suggesting changes. Key insight: Passive persistent context (CLAUDE.md) is more reliable than active skill invocation - which we already implement correctly.
- **Revisit**: no
