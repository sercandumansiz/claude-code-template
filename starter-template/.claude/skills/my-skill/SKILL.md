---
name: my-skill
description: <!-- CUSTOMIZE: What this skill does and when Claude should use it. Claude uses this to decide when to load it automatically. -->
# argument-hint: [arg1] [arg2]
# disable-model-invocation: true
# user-invocable: false
# allowed-tools: Read, Grep, Glob
# model: sonnet
# context: fork
# agent: Explore
---

<!-- CUSTOMIZE: Replace everything below with your skill's instructions.
  This is the content Claude receives when the skill is invoked.

  Two types of skill content:

  REFERENCE CONTENT — Knowledge Claude applies to your current work.
  Conventions, patterns, style guides, domain knowledge.
  Runs inline alongside your conversation context.

  TASK CONTENT — Step-by-step instructions for a specific action.
  Deployments, commits, code generation workflows.
  Often used with disable-model-invocation: true.

  String substitutions available:
  - $ARGUMENTS        → All arguments passed to the skill
  - $ARGUMENTS[N]     → Specific argument by index (0-based)
  - $N                → Shorthand for $ARGUMENTS[N]
  - ${CLAUDE_SESSION_ID} → Current session ID
  - !`command`        → Dynamic context injection (runs before Claude sees the prompt)
-->

# My Skill

<!-- CUSTOMIZE: Your skill instructions here.
  Keep SKILL.md under 500 lines. Move detailed reference material to separate files.

  Example task skill:

  Perform the task described in $ARGUMENTS:

  1. **Research** — Understand the requirements
  2. **Plan** — Identify files and changes needed
  3. **Execute** — Make the changes
  4. **Verify** — Run checks and tests
  5. **Report** — Summarize what was done

  Example reference skill:

  When working with API endpoints in this project:
  - Use RESTful naming conventions
  - Return consistent error formats: { error: { code, message } }
  - Include request validation using zod schemas
-->

<!-- OPTIONAL DIRECTORY STRUCTURE
  Skills can include supporting files in their directory:

  my-skill/
  ├── SKILL.md           # Main instructions (required)
  ├── references/        # Detailed docs, API specs, schemas
  ├── scripts/           # Executable scripts Claude can run
  └── examples/          # Example outputs showing expected format

  Reference these files from SKILL.md:
  - For complete API details, see [reference.md](references/reference.md)
  - For usage examples, see [examples/sample.md](examples/sample.md)
-->
