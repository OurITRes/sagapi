# Repository Settings (recommandé) — SAGAPI

Objectif : aligner le repo avec une gouvernance Open Source **security-first**.

## 1) Settings → General

- **Default branch** : `master`
- **Pull Requests**
  - ✅ Allow squash merging (recommandé)
  - ✅ Allow rebase merging (ok)
  - ❌ Merge commits (optionnel, mais déconseillé si vous voulez un historique linéaire)
- **Issues** : activé (avec issue forms)
- **Discussions** : optionnel (utile pour support/roadmap)

## 2) Settings → Rules → Rulesets

Créer un ruleset “master protection” sur `master` :

- Require a pull request before merging
  - Require approvals: **1+**
  - Dismiss stale approvals on new commits: **on**
  - Require review from Code Owners: **on**
- Require status checks to pass
  - Exiger la workflow **CI - Governance & Security Guardrails**
- Require linear history
- Do not allow bypassing the above settings

> Détails : voir `docs/governance/Rulesets.md`.

## 3) Settings → Code security and analysis

Recommandations (selon votre plan GitHub) :

- ✅ Dependabot alerts
- ✅ Dependabot security updates
- ✅ Secret scanning (si disponible)
- ✅ Code scanning (CodeQL) avant passage en public

## 4) Security → Advisories

- Activer **Private vulnerability reporting**
- Vérifier que les maintainers savent traiter les rapports (voir `SECURITY.md`)
