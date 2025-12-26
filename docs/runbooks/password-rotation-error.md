# Runbook — Erreur de rotation de mot de passe

## Symptômes

- Échec d’un job de rotation / pipeline
- Erreurs d’authentification (401/403)
- Logs : *invalid credentials*, *access denied*, *cannot update secret*

## Vérifications rapides

1. Identité utilisée (service account / IAM / token)
2. Permissions minimales sur le coffre à secrets
3. Synchronisation horaire (clock skew)
4. Logs côté cible (AD / connecteur / API)

## Actions correctives

- Si suspicion d’exposition : **révoquer/rotater** immédiatement
- Recréer un secret propre et le publier dans le coffre
- Rejouer la rotation et valider
- Ouvrir une ADR / post-mortem si incident significatif
