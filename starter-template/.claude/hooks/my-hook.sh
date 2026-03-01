#!/bin/bash
# =============================================================================
# CUSTOMIZE: Hook Script Template
# =============================================================================
# Hooks are shell commands that run at specific points in Claude Code's lifecycle.
# They provide deterministic control — certain actions ALWAYS happen, rather than
# relying on the LLM to choose to run them.
#
# This script is referenced from settings.json. Example:
#   "hooks": {
#     "PreToolUse": [{
#       "matcher": "Bash",
#       "hooks": [{ "type": "command", "command": ".claude/hooks/my-hook.sh" }]
#     }]
#   }
#
# Hook types: command (shell), http (HTTP POST), prompt (LLM eval), agent (multi-turn)
#
# Hook events:
#   PreToolUse         Before a tool executes (can block)
#   PostToolUse        After a tool succeeds
#   PostToolUseFailure After a tool fails
#   SessionStart       Session begins/resumes/compacts
#   SessionEnd         Session terminates
#   UserPromptSubmit   When you submit a prompt
#   Notification       When Claude sends a notification
#   PermissionRequest  When a permission dialog appears
#   SubagentStart      When a subagent is spawned
#   SubagentStop       When a subagent finishes
#   Stop               When Claude finishes responding
#   TeammateIdle       When a teammate is idle
#   TaskCompleted      When a task is marked complete
#   ConfigChange       When a config file changes
#   PreCompact         Before context compaction
#   WorktreeCreate     When a worktree is created
#   WorktreeRemove     When a worktree is removed
#
# Exit codes:
#   0 = allow (stdout added to context for SessionStart/UserPromptSubmit)
#   2 = block (stderr becomes Claude's feedback)
#   other = allow (stderr logged, not shown to Claude)
#
# Input: JSON on stdin with tool_name, tool_input, session_id, cwd, etc.
# Output: stdout for JSON decisions, stderr for feedback messages
# =============================================================================

INPUT=$(cat)

# Extract fields from JSON input (requires jq)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# CUSTOMIZE: Add your hook logic below.
#
# Example — Block destructive commands (PreToolUse + matcher: "Bash"):
#
# if echo "$COMMAND" | grep -qE '(rm\s+-rf\s+/|git\s+push\s+--force|DROP\s+TABLE)'; then
#   jq -n '{
#     hookSpecificOutput: {
#       hookEventName: "PreToolUse",
#       permissionDecision: "deny",
#       permissionDecisionReason: "Destructive command blocked by hook"
#     }
#   }'
#   exit 0
# fi
#
# Example — Validate JSON after edits (PostToolUse + matcher: "Edit|Write"):
#
# if [[ "$FILE_PATH" == *.json ]] && [ -f "$FILE_PATH" ]; then
#   if ! jq . "$FILE_PATH" > /dev/null 2>&1; then
#     echo "WARNING: $FILE_PATH is not valid JSON" >&2
#   fi
# fi
#
# Example — Block edits to protected files (PreToolUse + matcher: "Edit|Write"):
#
# PROTECTED=(".env" "package-lock.json" ".git/")
# for pattern in "${PROTECTED[@]}"; do
#   if [[ "$FILE_PATH" == *"$pattern"* ]]; then
#     echo "Blocked: $FILE_PATH matches protected pattern '$pattern'" >&2
#     exit 2
#   fi
# done

exit 0
