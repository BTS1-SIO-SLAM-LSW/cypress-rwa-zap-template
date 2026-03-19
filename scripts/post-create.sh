#!/usr/bin/env bash
set -e

echo "============================================================"
echo "Environnement prêt"
echo "============================================================"
node --version
yarn --version
npm --version

echo
echo "Vous pouvez maintenant :"
echo "1) cloner ou copier l'application cible dans le workspace ;"
echo "2) installer ses dépendances ;"
echo "3) la lancer sur localhost:3000 ;"
echo "4) la tester avec OWASP ZAP."
