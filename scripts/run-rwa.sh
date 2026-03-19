#!/usr/bin/env bash
set -euo pipefail

if [ ! -f "app/package.json" ]; then
  echo "Le dossier app/ n'existe pas encore."
  echo "Lancez d'abord : bash scripts/clone-rwa.sh"
  exit 1
fi

cd app
corepack enable
corepack prepare yarn@1.22.22 --activate

echo "============================================================"
echo "Démarrage de Cypress Real World App"
echo "============================================================"
echo "Frontend attendu : http://localhost:3000"
echo "Backend attendu  : http://localhost:3001"
echo

yarn dev
