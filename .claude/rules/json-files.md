---
paths:
  - "**/*.json"
---

# JSON File Rules

- Must be valid JSON parseable by `jq`
- No trailing commas
- Use 2-space indentation
- Since JSON does not support comments, document all fields in accompanying markdown files or README sections
- Permission patterns use glob syntax: `Tool(pattern)` with `*` as wildcard
- MCP server configs should use `${VAR}` environment variable expansion for secrets
