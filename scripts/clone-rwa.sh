#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/cypress-io/cypress-realworld-app"
TARGET_DIR="app"

if [ -d "$TARGET_DIR/.git" ] || [ -f "$TARGET_DIR/package.json" ]; then
  echo "Le dossier '$TARGET_DIR' existe déjà."
  echo "Aucune action effectuée."
  exit 0
fi

echo "============================================================"
echo "Clonage de Cypress Real World App"
echo "============================================================"
git clone "$REPO_URL" "$TARGET_DIR"
cd "$TARGET_DIR"

corepack enable
corepack prepare yarn@1.22.22 --activate

echo "============================================================"
echo "Installation des dépendances"
echo "============================================================"
yarn

echo "============================================================"
echo "Installation terminée"
echo "============================================================"
echo "Application installée dans : $(pwd)"
echo "Pour lancer l'application :"
echo "  bash ../scripts/run-rwa.sh"
