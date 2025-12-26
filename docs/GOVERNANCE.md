# Gouvernance — SAGAPI (WIP)

Cette gouvernance vise à rendre SAGAPI **prêt pour l’Open Source** tout en conservant une posture **Security-first** et une trajectoire **Privé → Public**.

## 0) Portée

Couvre :

- règles de contribution (PR, issues, reviews)
- ownership (CODEOWNERS, maintainers)
- sécurité (secrets, vulnérabilités, divulgation)
- qualité (CI, checks, releases, docs)
- pilotage (GitHub Projects)

Ne couvre pas (encore) :

- exigences produit détaillées / backlog complet
- runbooks exhaustifs (ils seront enrichis au fil des intégrations)

## 1) Principes

1. **Zero Trust** : aucune intégration n’est implicitement fiable.
2. **Least privilege** : scopes, rôles, IAM, service accounts au minimum nécessaire.
3. **Secure-by-default** : pas de configuration “dangereuse” par défaut.
4. **Observability** : logs, audit, métriques dès le début.
5. **Traçabilité** : décisions (ADR), PRs, releases.

---

## 2) Rôles & responsabilités

- **Maintainers** : ownership du repo, merges, releases
- **Security Champion(s)** : relectures sécurité, triage vulnérabilités
- **Contributeurs** : PR/Docs/Issues (hors vulnérabilités)

Référence : `docs/governance/Maintainers.md`

## 3) Ownership (CODEOWNERS)

- Fichier : `.github/CODEOWNERS`
- Objectif : forcer des revues sur zones sensibles (infra, auth, CI, scripts security).
- Règle : activer “Require review from Code Owners” dans le ruleset de la branche protégée.

## 4) Stratégie de branches

- Branche protégée : `master`
- Branches de travail : `feature/*`, `fix/*`, `chore/*`, `docs/*`
- **Pull Request obligatoire** pour merge dans `master`
- Merge via **squash** ou **rebase** (historique linéaire)

## 5) Pull Requests (PR) — règles minimales

Une PR doit :

- être petite et focalisée (1 sujet = 1 PR)
- inclure tests/validation quand applicable
- décrire l’impact sécurité si le change touche auth/roles/secrets
- être liée à une Issue / card Project (si possible)

Template : `.github/PULL_REQUEST_TEMPLATE.md`

## 6) Issues — règles minimales

- Utiliser les **Issue Forms** (bug/feature).
- Désactiver les “blank issues”.
- **Sécurité** : pas d’issue publique → reporting privé (Security Advisory).

Templates : `.github/ISSUE_TEMPLATE/*`

## 7) Quality Gates (CI) — avant merge

Minimum requis :

- ✅ PR obligatoire
- ✅ Require Status checks to pass - mandatory (CI)
- ✅ 1+ approval (et codeowners sur zones sensibles)
- ✅ Require linear history
- ✅ Do not allow bypassing

Workflow fourni : `.github/workflows/ci_governance.yml`
Doc pas à pas : `docs/governance/Rulesets.md`

- Vérifie les fichiers de gouvernance requis
- Lance un scan secrets via **TruffleHog** (git scan)

> Quand le code arrive (Nx/.NET/etc.), il faudra ajouter des jobs `build` / `test` à ce workflow.

## 8) Gestion des secrets

Règles :

- ❌ Interdit dans Git : clés cloud, mots de passe, tokens, certificats privés
- ✅ Autorisés : placeholders + références à un coffre (Secrets Manager/Vault/etc).
- Avant “Public” :
  - scan complet de l’historique (`trufflehog git ...`)
  - rotation/révocation immédiate si fuite détectée

Outils :

- **TruffleHog** pour scanner l’historique
- **git-secrets** pour prévenir les commits

Scripts utiles (dans ce repo) :

- `scripts/security/trufflehog_scan_git.sh`
- `scripts/security/git_secrets_setup.sh`

## 9) Vulnérabilités & divulgation

- Politique : `SECURITY.md`
- Pas d’issue publique pour une vulnérabilité
- Canal recommandé : GitHub **Security Advisories** (**privée**)
- Process : triage → patch → advisory → release

## 10) Pilotage (GitHub Projects) — Suivi

SAGAPI utilise **GitHub Projects (Beta)** en mode Kanban.
Board Kanban : Backlog → Ready → In Progress → In Review → Done

### Colonnes

1. **Backlog (Idées)**
2. **Ready (Spécifié)** *(User Story + diagramme de séquence associé)*
3. **In Progress**
4. **In Review** *(PR ouverte)*
5. **Done** *(déployé + validé)*

### Champs personnalisés

- **Composant** : Frontend, Governance-API, Connector, Infra
- **Priorité** : P0-Critical, P1-High, P2-Medium
- **Taille** : XS, S, M, L, XL

Doc : `docs/governance/GitHub_Projects.md`

## 11) ADRs (décisions d’architecture)

- Dossier : `docs/adrs/`
- Chaque décision importante (auth, secrets, storage, flux) doit être capturée
- Template : `docs/adrs/ADR-0000-template.md`

## 12) Documentation (Wiki & /docs)

- Wiki GitHub = point d’entrée onboarding
- Source de vérité = `/docs`
- Pages Wiki (source) : `docs/wiki/*`
- Runbooks : `docs/runbooks/*`
- Architecture SAD entrypoint : `docs/SAGAPI_Architecture_SAD.md` (redirige vers `docs/architecture/Architecture.md`)
- ADRs : `docs/adrs/`

## 13) Dépendances & mises à jour (Dependabot)

- Config : `.github/dependabot.yml`
- Objectif : garder les GitHub Actions à jour (minimum). Étendre à npm/nuget quand les manifests existent.

## 14) Checklist “Privé → Public” (Gate final)

### Obligatoire

- [ ] Scan secrets sur **tout l’historique** (TruffleHog/git-secrets)
- [x] Licence AGPLv3 à la racine
- [x] `SECURITY.md` en place + private reporting activé
- [ ] Rulesets sur `master` (PR + checks + linear + no bypass + codeowners)
- [x] Issue forms + redirection sécurité (pas d’issue “blank”)
- [x] CODEOWNERS en place
- [ ] CI avec au minimum : secret scan + build + tests (quand le code existe)
- [ ] Revue manuelle : aucune logique “sensible” exposée (auth, secrets, keys, endpoints)

### Recommandé

- [ ] Code scanning (CodeQL) activé
- [ ] SBOM / provenance (selon maturité)
- [ ] Release notes et tagging SemVer
