# GitHub Projects (Kanban) — Configuration SAGAPI

> Objectif : suivre l’avancement architectural et le delivery en mode **Kanban** via GitHub Projects (Beta).

## 1) Créer le Project

- Repo → onglet **Projects** → *New project*
- Template : Board (Kanban)

## 2) Colonnes (Status)

Configurer le champ **Status** avec :

1. Backlog (Idées)
2. Ready (Spécifié)
3. In Progress
4. In Review
5. Done

## 3) Champs personnalisés

Créer des **Single select** :

- Composant : Frontend, Governance-API, Connector, Infra
- Priorité : P0-Critical, P1-High, P2-Medium
- Taille : XS, S, M, L, XL

## 4) Définition de “Ready”

Une carte passe en **Ready** uniquement si :

- user story rédigée (objectif, critères d’acceptation)
- un **diagramme de séquence** existe (ou lien vers SAD/ADR)
- impacts sécurité évalués (auth/authz, secrets, audit)
