# Eval Suite

```mermaid
graph LR
  subgraph tier1 ["🔧 Tier 1: Hook Unit Tests"]
    direction TB
    M["Mock JSON input"] --> H["Hook Script"]
    H --> E{"Check exit code"}
    E -->|"blocked or warned"| P1["PASS"]
    E -->|"not expected"| F1["FAIL"]
  end

  subgraph tier2 ["🤖 Tier 2: LLM Evals"]
    direction TB
    C["Challenge file"] -->|"extract prompt"| PR["Prompt"]
    PR -->|"claude -p"| S["Claude Code Session"]
    S --> R["Response"]
    R -->|"check pass criteria"| V{"PASS / FAIL"}
  end

  classDef t1 fill:#d1fae5,stroke:#059669,color:#064e3b
  classDef t2 fill:#dbeafe,stroke:#2563eb,color:#1e3a5f
  classDef result fill:#fef3c7,stroke:#d97706,color:#78350f

  class M,H,E t1
  class C,PR,S,R t2
  class P1,F1,V result
```

## Results

Last tested: 2026-03-02

| Tier | Pass | Total | Note |
|------|------|-------|------|
| Hook Unit Tests | 24 | 24 | Deterministic. Same result every run. |
| LLM Evals | 8 | 8 | Single run. Results may vary between sessions. |
