# Contributing — SAGAPI

## Workflow

1. Créez une branche : `feature/<topic>` ou `fix/<topic>`
2. Commits atomiques, descriptifs
3. Ouvrez une Pull Request vers `master`
4. CI verte + revue obligatoire
5. Merge via squash/rebase (historique linéaire)

## Conventions (suggestions)

- Code : formatters/lint (selon stack)
- Docs : mise à jour dans `/docs`
- ADR : toute décision structurante dans `/docs/adrs`

## Sécurité

- Ne commitez jamais de secrets (tokens, mots de passe, clés privées)
- Pour une vulnérabilité : voir `SECURITY.md` (reporting privé)
