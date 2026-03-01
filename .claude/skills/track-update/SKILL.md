---
name: track-update
description: "Fully autonomous pipeline: analyze an external URL about Claude Code or AI developments, evaluate its relevance, and update the project if worthwhile. Provide a URL as argument. No human approval needed — agents handle the entire workflow."
---

Fully autonomous update pipeline. Analyze the provided URL, evaluate its relevance to this project, and implement updates if worthwhile.

**Input:** `$ARGUMENTS` must contain a URL. If no URL is provided, respond with: "Usage: /track-update <url>"

## Pipeline

### Step 1: Analyze the Source

Spawn the **source-analyzer** agent with this prompt:

> Analyze this URL: [the URL from $ARGUMENTS]
>
> Fetch the content, cross-reference with official Claude Code docs, and check what this project currently has on the topic. Produce your full structured analysis (Summary, Category, Relevance, Key Findings, Current State, Affected Areas).

Wait for the analysis results.

### Step 2: Evaluate the Findings

Spawn the **evaluator** agent with this prompt:

> Here are the findings from source-analyzer:
>
> [paste the full source-analyzer output]
>
> Evaluate these findings against the current project state. Read the relevant project files, assess impact/accuracy/maturity/effort, and make your decision: implement, on hold, or not relevant.

Wait for the evaluation results.

### Step 3: Act on the Decision

Based on the evaluator's decision:

#### If `implement`:
Spawn the **template-updater** agent (it will work in a worktree) with this prompt:

> Here is the implementation plan from the evaluator:
>
> [paste the evaluator's full change plan]
>
> Execute this plan. Update starter-template first, then sync root config, then README as needed. Run all quality checks when done. Commit your changes with a conventional commit message.

When the template-updater completes, **you** (the main session) must:
1. Display the worktree branch name, summary of changes, and quality check results
2. Create a PR from the worktree branch using `gh pr create`
3. Append an entry to `agentic-workflow-output/approved.md` with date, source URL, category, PR number, and summary

Note: The template-updater works in an isolated worktree — it cannot write to tracking files. Tracking and PR creation are the main session's responsibility.

#### If `on hold`:
Append an entry to `agentic-workflow-output/rejected.md` with:
- Date
- Source URL
- Decision: `on hold`
- Reason: evaluator's explanation of why it's on hold
- Revisit: `yes`

Display the entry that was saved.

#### If `not relevant`:
Append an entry to `agentic-workflow-output/rejected.md` with:
- Date
- Source URL
- Decision: `not relevant`
- Reason: evaluator's explanation of why it doesn't apply
- Revisit: `no`

Display the entry that was saved.

### Step 4: Final Summary

Always end with a concise summary:
- **Source**: URL and title
- **Decision**: implement / on hold / not relevant
- **Action taken**: What was done
- **Next steps**: Any follow-up needed (if applicable)
