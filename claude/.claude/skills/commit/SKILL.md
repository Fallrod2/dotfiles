---
description: Crée un commit propre à partir des changements en cours
disable-model-invocation: true
---

## Changements en cours

!`git status --short && git diff --stat`

Crée un commit :
1. Regarde `git diff` pour comprendre les changements
2. Message conventional commits en anglais, concis, focalisé sur le "pourquoi"
3. Stage uniquement les fichiers liés au changement logique en cours
4. Affiche le message proposé AVANT de commit, attends ma validation
