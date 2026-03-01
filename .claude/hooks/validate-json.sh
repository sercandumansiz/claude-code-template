#!/bin/bash
# =============================================================================
# PostToolUse Hook: Validate JSON After Edits
# =============================================================================
# This hook runs AFTER every Edit or Write tool invocation and validates
# that JSON files remain valid after modification.
#
# How it works:
#   - Reads JSON input from stdin (Claude Code passes tool context)
#   - Extracts the edited file path
#   - If the file has a .json extension, validates it with jq
#   - Outputs a warning to stderr if validation fails
#
# Exit codes:
#   - 0: Always (PostToolUse hooks cannot undo actions)
#   - Warnings are sent to stderr for Claude's feedback
# =============================================================================

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# Only validate JSON files
if [[ "$FILE_PATH" == *.json ]] && [ -f "$FILE_PATH" ]; then
  if ! jq . "$FILE_PATH" > /dev/null 2>&1; then
    echo "WARNING: $FILE_PATH is not valid JSON. Please fix syntax errors." >&2
  fi
fi

exit 0
