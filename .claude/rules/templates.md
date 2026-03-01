---
paths:
  - "starter-template/**/*"
---

# Template & Example Rules

- Templates must be tech-stack agnostic — no framework-specific code or commands
- Use HTML comment placeholders to guide users: `<!-- CUSTOMIZE: description -->`
- Include inline best practice notes explaining WHY, not just WHAT
- Keep CLAUDE.md templates under 200 lines (larger files reduce Claude's adherence)
- JSON files must be syntactically valid — users should be able to use them as-is
- Hook scripts must include header comments explaining how they work and how to customize
- Agent definitions must include all required frontmatter fields (name, description, tools, model)
- Skill definitions must include clear step-by-step instructions
