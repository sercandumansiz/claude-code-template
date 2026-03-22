---
name: scan-sources
description: "Scan external sources for Claude Code related content, deduplicate against pipeline logs, and feed new URLs to /track-update. Run daily via scheduled task or manually."
---

Scan all registered sources for new Claude Code related content and feed relevant URLs into the track-update pipeline.

## Source Registry Schema

Sources are defined in `.claude/sources.json`. Fields:

| Field | Required | Description |
|-------|----------|-------------|
| `id` | Yes | Unique kebab-case identifier |
| `name` | Yes | Human-readable source name |
| `url` | Yes | Source URL (index page or profile) |
| `strategy` | Yes | `fetch` (load page directly) or `search` (use WebSearch) |
| `searchQuery` | If search | Query string passed to WebSearch |
| `notes` | No | Guidance on what to look for in this source |

## Phase 1: Load Deduplication Set

Read both tracking files to build the set of already-processed URLs:

1. Read `agentic-workflow-output/approved.md`
2. Read `agentic-workflow-output/rejected.md`
3. Extract all URLs from lines matching `**Source**:` pattern
4. Store these as the dedup set. Normalize URLs by stripping trailing slashes and `utm_*` query parameters.

## Phase 2: Scan Sources

Read `.claude/sources.json` to get the source list. For each source, use the appropriate strategy:

### Strategy: `fetch`
Use WebFetch to load the source URL. Identify links to new articles or content related to:
- Claude Code features, updates, or best practices
- AI coding agents and agentic workflows
- Context engineering and prompt design
- Developer tooling for AI-assisted coding

Extract the individual article/content URLs (not the index page itself).

### Strategy: `search`
Use WebSearch with the source's `searchQuery` field. Focus on results from the last 48 hours. Extract result URLs.

### For all strategies:
- If a source is unreachable or returns an error, log the failure and skip to the next source. Do not abort the entire scan.
- For X/Twitter results: if a tweet links to external content (blog post, docs page, changelog), use the linked URL instead of the tweet URL. Skip tweets that are purely announcements without substantive external links.
- Normalize discovered URLs (strip trailing slashes, remove utm parameters).
- Check each URL against the dedup set. Discard already-processed URLs.

## Phase 3: Relevance Pre-filter

For each candidate URL, evaluate relevance based on the title and snippet:

**High relevance** (process first):
- Official Claude Code feature announcements or changelogs
- Breaking changes or deprecations in Claude Code
- Best practice guides specifically about Claude Code configuration

**Medium relevance** (process if budget allows):
- General AI coding agent best practices applicable to Claude Code
- Context engineering articles with practical takeaways
- Developer tooling comparisons involving Claude Code

**Low relevance** (skip):
- General AI/LLM news without Claude Code connection
- Opinion pieces without actionable configuration insights
- Content already covered by official Claude Code documentation

Discard low relevance URLs. Sort remaining by relevance (high first).

## Phase 4: Feed to Pipeline

For each relevant URL, up to a **maximum of 5 per run**:

1. Run `/track-update <url>`
2. Wait for completion before starting the next one (sequential processing)
3. Record the outcome (implement / on hold / not relevant)

If no relevant URLs are found, report that all sources were scanned with no new content.

## Phase 5: Summary

End with a summary report:

```
## Source Scan Summary: YYYY-MM-DD

- **Sources scanned**: X/Y (list any failures)
- **New URLs discovered**: N
- **URLs after dedup**: N
- **URLs after relevance filter**: N
- **URLs sent to pipeline**: N (max 5)
- **Pipeline results**:
  - implement: N
  - on hold: N
  - not relevant: N
- **Skipped URLs** (if any beyond the max 5): list them for manual follow-up
```
