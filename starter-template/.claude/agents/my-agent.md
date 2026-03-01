---
name: my-agent
description: <!-- CUSTOMIZE: When Claude should delegate to this subagent. Write a clear description so Claude knows when to use it. Include "use proactively" to encourage automatic delegation. -->
tools: Read, Grep, Glob
# disallowedTools: Write, Edit
model: sonnet
# maxTurns: 15
# permissionMode: default
# memory: local
# skills:
#   - api-conventions
# mcpServers:
#   - slack
# background: false
# isolation: worktree
# hooks:
#   PreToolUse:
#     - matcher: "Bash"
#       hooks:
#         - type: command
#           command: "./scripts/validate-command.sh"
---

<!-- CUSTOMIZE: Replace everything below with your subagent's system prompt.
  The body becomes the system prompt that guides the subagent's behavior.
  Subagents receive only this prompt (plus basic environment details),
  not the full Claude Code system prompt.

  Two main patterns:

  READ-ONLY AGENT — Research, review, analysis.
  Set tools: Read, Grep, Glob (no Edit/Write).
  Examples: code reviewer, researcher, security auditor.

  ACTION AGENT — Can modify files and run commands.
  Set tools: Read, Edit, Write, Bash, Grep, Glob.
  Examples: debugger, migrator, test runner.

  Memory scopes (optional):
  - user:    ~/.claude/agent-memory/<name>/         (all projects)
  - project: .claude/agent-memory/<name>/           (shared via git)
  - local:   .claude/agent-memory-local/<name>/     (not in git)

  Isolation (optional):
  - isolation: worktree — runs in a temporary git worktree copy

  Tips:
  - Design focused subagents: each should excel at one specific task
  - Write detailed descriptions: Claude uses them to decide when to delegate
  - Limit tool access: grant only necessary permissions
  - Check into version control: share project subagents with your team
-->

<!-- CUSTOMIZE: Example system prompt structure:

You are a [role]. [Brief description of expertise].

## Process

1. **Step one** — What to do first
2. **Step two** — Next action
3. **Step three** — Final step

## Principles

- Focus on [primary concern]
- Prefer [approach] over [alternative]
- Always [important constraint]

## Output Format

### Summary
Brief overview of findings.

### Details
Specific findings with references.

### Recommendations
Actionable next steps.
-->
