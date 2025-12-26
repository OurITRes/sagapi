# CODEOWNERS — Guide

Le fichier `.github/CODEOWNERS` permet d’assigner automatiquement des reviewers/approvers à des chemins.

## Pourquoi

- Forcer une revue sur des zones sensibles (infra, CI, auth, sécurité).
- Réduire les merges “accidentels” sans expertise.

## À activer côté GitHub

Dans le ruleset de la branche protégée :

- “Require review from Code Owners”

## Bonnes pratiques

- Un owner “global” (`*`) + owners spécifiques par zone
- Garder CODEOWNERS petit et lisible
- Utiliser des **teams** plutôt que des individus
