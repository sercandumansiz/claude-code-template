#!/bin/bash
# =============================================================================
# PreToolUse Hook: Enforce Conventional Commits
# =============================================================================
# This hook runs BEFORE every Bash tool invocation and checks that
# git commit messages follow the conventional commits format.
#
# Expected format: type(scope): description
# Allowed types: feat, fix, docs, style, refactor, test, chore, perf
#
# How it works:
#   - Reads JSON input from stdin (Claude Code passes tool context)
#   - Extracts the bash command being executed
#   - If the command is a git commit, validates the message format
#   - Returns a deny decision if the format is wrong
#
# To customize:
#   - Add or remove allowed types in the grep regex
#   - Adjust the regex to match your project's commit conventions
# =============================================================================

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if [ -z "$COMMAND" ]; then
  exit 0
fi

# Only check git commit commands
if echo "$COMMAND" | grep -qE '^git commit'; then
  # Extract commit message from -m flag (handles both single and double quotes)
  MSG=$(echo "$COMMAND" | sed -n 's/.*-m[[:space:]]*["\x27]\([^"\x27]*\)["\x27].*/\1/p')

  if [ -n "$MSG" ] && ! echo "$MSG" | grep -qE '^(feat|fix|docs|style|refactor|test|chore|perf)(\(.+\))?: .+'; then
    jq -n '{
      hookSpecificOutput: {
        hookEventName: "PreToolUse",
        permissionDecision: "deny",
        permissionDecisionReason: "Commit message must follow conventional commits format: type(scope): description. Allowed types: feat, fix, docs, style, refactor, test, chore, perf"
      }
    }'
    exit 0
  fi
fi

exit 0
