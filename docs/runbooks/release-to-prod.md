# Runbook — Déployer une nouvelle version en Production

## Pré-requis

- CI verte sur `master`
- Release notes prêtes
- Validation sécurité si changements auth/crypto/infra

## Procédure (générique)

1. Tagger une version (SemVer)
2. Déclencher pipeline de build/release
3. Déployer en staging
4. Smoke tests + non-régression
5. Déployer en prod (fenêtre)
6. Vérifier observabilité (logs/metrics/alerts)
7. Rollback prêt (si régression)
