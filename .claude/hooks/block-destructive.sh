#!/bin/bash
# =============================================================================
# PreToolUse Hook: Block Destructive Commands
# =============================================================================
# This hook runs BEFORE every Bash tool invocation and blocks dangerous
# commands that could cause data loss or irreversible changes.
#
# How it works:
#   - Reads JSON input from stdin (Claude Code passes tool context)
#   - Extracts the bash command being executed
#   - Checks against a blocklist of destructive patterns
#   - Returns a deny decision if matched, otherwise allows execution
#
# To customize:
#   - Add patterns to the grep -qE regex below
#   - Remove patterns you intentionally want to allow
# =============================================================================

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if [ -z "$COMMAND" ]; then
  exit 0
fi

# Block destructive commands
if echo "$COMMAND" | grep -qE '(rm\s+-rf\s+/|git\s+push\s+--force|git\s+reset\s+--hard|DROP\s+TABLE|DROP\s+DATABASE|TRUNCATE\s+TABLE)'; then
  jq -n '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: "Destructive command blocked by project hook. If this is intentional, remove the hook or modify .claude/hooks/block-destructive.sh"
    }
  }'
else
  exit 0
fi
