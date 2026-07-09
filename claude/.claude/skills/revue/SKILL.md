---
description: Revue de code des changements non commités ou d'un diff de branche
argument-hint: [ref-git optionnelle, ex. main...HEAD]
---

!`git diff $ARGUMENTS`

Fais une revue du diff ci-dessus :
1. Bugs et edge cases (priorité absolue)
2. Sécurité (injection, secrets hardcodés, validation d'input)
3. Lisibilité / conventions du projet

Chaque finding : sévérité + fix concret. Pas de compliments de politesse.
