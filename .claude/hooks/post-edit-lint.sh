#!/bin/bash
# =============================================================================
# PostToolUse Hook: Lint After File Edits
# =============================================================================
# This hook runs AFTER every Edit or Write tool invocation and can
# automatically lint or format the modified file.
#
# How it works:
#   - Reads JSON input from stdin (Claude Code passes tool context)
#   - Extracts the edited file path
#   - Runs your linter/formatter on that file
#
# To customize:
#   - Uncomment and modify the lint commands below for your stack
#   - Add file-type-specific linting logic
# =============================================================================

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

# =============================================================================
# Uncomment and customize the linting commands for your project:
# =============================================================================

# JavaScript/TypeScript:
# npx eslint --fix "$FILE_PATH" 2>&1 || true

# Python:
# ruff check --fix "$FILE_PATH" 2>&1 || true

# Go:
# gofmt -w "$FILE_PATH" 2>&1 || true

# Rust:
# rustfmt "$FILE_PATH" 2>&1 || true

# Generic formatter (Prettier):
# npx prettier --write "$FILE_PATH" 2>&1 || true

exit 0
