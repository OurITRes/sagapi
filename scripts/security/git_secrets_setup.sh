#!/usr/bin/env bash
set -euo pipefail

# Installe et configure git-secrets (macOS brew) pour ce repo.
# NOTE: sur Linux, installez git-secrets via votre gestionnaire de paquets ou depuis la source.

command -v git-secrets >/dev/null 2>&1 || {
  echo "git-secrets introuvable. Sur macOS: brew install git-secrets"
  exit 1
}

git secrets --install
git secrets --register-aws
echo "OK. Vous pouvez lancer: git secrets --scan-history"
