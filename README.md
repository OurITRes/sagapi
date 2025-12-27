# SAGAPI — Service Account Governance & Automation Programmable Interface

![CI](https://github.com/OurITRes/sagapi/actions/workflows/ci.yml/badge.svg)
![License: AGPL-3.0](https://img.shields.io/badge/License-AGPL--3.0-blue.svg)

SAGAPI est un **monorepo** conçu pour fournir une **API de gouvernance** et des **connecteurs** permettant
d’automatiser des opérations de sécurité (ex: gouvernance de comptes de service, rotation, approbations),
dans une posture **Zero Trust**.

## Documentation

- **Architecture / SAD (document maître)** :
  [`/docs/SAGAPI_Architecture_SAD.md`](docs/SAGAPI_Architecture_SAD.md)  
  (source : [`/docs/architecture/Architecture.md`](docs/architecture/Architecture.md))
- **Gouvernance (WIP)** : [`/docs/GOVERNANCE.md`](docs/GOVERNANCE.md)
- **Runbooks** : [`/docs/runbooks/`](docs/runbooks/)
- **Wiki GitHub (recommandé)** : pages sources à copier depuis [`/docs/wiki/`](docs/wiki/)

## Structure du repo (actuelle)

```Text
/ (Root)
├── /apps
│   ├── /frontend             # Applications Web (React)
│   │   ├── /shell            # Application hôte (Auth & Routing)
│   │   ├── /ops              # Micro-frontend "Opérations" (Espace User)
│   │   └── /admin            # Micro-frontend "Administration" (Espace Admin)
│   │
│   ├── /backend              # Services Serverless (.NET 8)
│   │   ├── /governance       # API Cerveau décisionnel (Logique Métier)
│   │   └── /connector        # API Connecteur AD isolé (Zero Trust)
│   │
│   └── /data                 # Outils de données
│       └── /db-migrations    # Scripts de gestion schéma DynamoDB
│
├── /libs                     # Bibliothèques Partagées (Non déployables seules)
│   ├── /shared               # Code agnostique (C# & TS)
│   │   └── /contracts        # DTOs, Enums et Interfaces partagés (Source de vérité)
│   └── /ui                   # Composants React
│       └── /components       # Design System (Boutons, Tableaux, Layouts)
│
├── /docs                     # Documentation
│   ├── /architecture         # Diagrammes et SAD
│   ├── /governance
│   ├── /runbooks
│   ├── /wiki
│   └── /adrs                 # Architecture Decision Records
│
├── /scripts                  
│   └── /security
│
└── /infra                    # Infrastructure as Code (Terraform/CDK)
```

## Pré-requis (développement local)

Selon le SAD, la cible est typiquement :

- **Node.js LTS** + npm (monorepo tooling / Nx / front)
- **.NET 8 SDK** (APIs serverless / backend)
- **Docker** (services locaux : mocks, DB, etc.)

> ✅ Le dépôt est actuellement un **squelette** (placeholder `.gitkeep`).  
> Les commandes ci-dessous sont fournies comme **conventions** et seront finalisées lorsque le tooling sera
> présent (ex: `package.json`, `nx.json`, solutions .NET, etc.).

## Installation (WIP)

```bash
git clone https://github.com/OurITRes/sagapi.git
cd sagapi
```

### Dépendances Node (si Nx/Node est en place)

```bash
npm ci
```

### Dépendances .NET (si solutions .NET présentes)

```bash
dotnet restore
```

## Builds & Tests (WIP)

### Tests

- **Monorepo Nx (prévu)**  

  ```bash
  npx nx test
  ```

- **.NET (prévu)**  

  ```bash
  dotnet test
  ```

### Build

- **Nx (prévu)**  

  ```bash
  npx nx build <app>
  ```

- **.NET (prévu)**  

  ```bash
  dotnet build -c Release
  ```

## Sécurité — checklist

- [x] **Scan de secrets** (historique git complet) : TruffleHog et/ou git-secrets
- [x] **Licence** : respecter la `LICENSE` (AGPLv3) 
- [x] **Security policy** : `SECURITY.md` (reporting privé, pas d’issue publique)
- [x] **Rulesets** activés sur `master` (PR obligatoire, checks, linear history, no bypass)
- [x] **Documentation** à jour (README + Wiki + runbooks)

Scripts de scan (optionnels) : [`/scripts/security/`](scripts/security/)

## Contribution

- Voir : [`CONTRIBUTING.md`](CONTRIBUTING.md)
- PR obligatoire vers `master` (pas de push direct), CI verte, revue requise.

## Gouvernance

- Gouvernance : [`docs/GOVERNANCE.md`](docs/GOVERNANCE.md)
- Settings recommandés : [`docs/governance/Repository_Settings.md`](docs/governance/Repository_Settings.md)
- Ownership : [`.github/CODEOWNERS`](.github/CODEOWNERS)

## Licence

Ce projet est sous licence **AGPL-3.0**.  
Voir [`LICENSE`](LICENSE).
