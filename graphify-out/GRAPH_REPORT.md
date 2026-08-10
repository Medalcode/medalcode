# Graph Report - .  (2026-08-10)

## Corpus Check
- Corpus is ~4,122 words - fits in a single context window. You may not need a graph.

## Summary
- 18 nodes · 25 edges · 4 communities (3 shown, 1 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 1,200 input · 450 output

## Community Hubs (Navigation)
- Asset Generation & Script Tooling
- Medalcode Agent & Super-Skills System
- Developer Profile & Featured Projects
- Git Sync Automation Script

## God Nodes (most connected - your core abstractions)
1. `main()` - 9 edges
2. `test_scripts.sh script` - 3 edges
3. `generate-assets.sh script` - 2 edges
4. `show_help()` - 2 edges
5. `init_structure()` - 2 edges
6. `screenshot_guide()` - 2 edges
7. `optimize_images()` - 2 edges
8. `generate_badges()` - 2 edges
9. `create_diagram_template()` - 2 edges
10. `check_missing_assets()` - 2 edges

## Surprising Connections (you probably didn't know these)
- `main()` --calls--> `init_structure()`  [EXTRACTED]
  generate-assets.sh → generate-assets.sh  _Bridges community 0 → community 1_

## Import Cycles
- None detected.

## Communities (4 total, 1 thin omitted)

### Community 0 - "Asset Generation & Script Tooling"
Cohesion: 0.33
Nodes (3): check_missing_assets(), init_structure(), screenshot_guide()

### Community 1 - "Medalcode Agent & Super-Skills System"
Cohesion: 0.33
Nodes (6): create_diagram_template(), generate_badges(), main(), optimize_images(), generate-assets.sh script, show_help()

### Community 2 - "Developer Profile & Featured Projects"
Cohesion: 0.83
Nodes (3): assert_exit_code(), assert_output_contains(), test_scripts.sh script

## Knowledge Gaps
- **1 isolated node(s):** `git_sync.sh script`
  These have ≤1 connection - possible missing edges or undocumented components.
- **1 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `main()` connect `Medalcode Agent & Super-Skills System` to `Asset Generation & Script Tooling`?**
  _High betweenness centrality (0.103) - this node is a cross-community bridge._
- **What connects `git_sync.sh script` to the rest of the system?**
  _1 weakly-connected nodes found - possible documentation gaps or missing edges._