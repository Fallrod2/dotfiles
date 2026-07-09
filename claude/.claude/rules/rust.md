---
paths:
  - "**/*.rs"
---

# Rust

- Pas de `unwrap()` hors tests, erreurs via `thiserror` (libs) / `anyhow` (binaires)
- Après toute modif : `cargo clippy` puis `cargo test`
- Préférer les itérateurs aux boucles indexées, pas de `clone()` réflexe
