#!/usr/bin/env bash
set -euo pipefail

# Scan l'historique git complet du repo courant avec TruffleHog.
# Prérequis : docker installé (recommandé pour éviter d'installer en local)

REPO_DIR="$(pwd)"

docker run --rm -v "${REPO_DIR}:/repo" ghcr.io/trufflesecurity/trufflehog:latest   git "file:///repo" --results=verified
