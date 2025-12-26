# Rulesets (Protection de branche) — SAGAPI

Objectif : garantir la qualité et l’intégrité du code sur `master`, en vue d’une ouverture Open Source.

## 1) Pré-requis

- Activer au moins l’une des méthodes de merge : **Squash** ou **Rebase** (nécessaire pour “linear history”).

## 2) Ruleset “master”

Repo → Settings → Rules → Rulesets → New ruleset

Cible : branches → `master`

Activer :

1. **Require a pull request before merging**
   - Empêche les push directs sur `master`

2. **Require status checks to pass**
   - Sélectionner les checks CI (Build + Tests)

3. **Require linear history**
   - Forcer squash/rebase, éviter les merge commits

4. **Do not allow bypassing**
   - Interdire le contournement, même admin

## 3) Recommandations (avant Public)

- Minimum 1 review obligatoire
- CODEOWNERS sur dossiers sensibles (`apps/backend/**`, `infra/**`)
- Secret scanning activé côté GitHub (si disponible)
