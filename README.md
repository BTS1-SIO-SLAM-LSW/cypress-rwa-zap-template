# Template repository — Cypress Real World App + Node.js + Yarn dans Docker/devcontainer

Ce template est pensé pour des **élèves** qui doivent lancer la **Cypress Real World App (RWA)** dans **GitHub Codespaces** ou dans un **Dev Container**, sans droits administrateur sur le poste local.

Il fournit un conteneur prêt à l'emploi avec :

- **Node.js** préinstallé ;
- **Yarn Classic** via Corepack ;
- les ports utiles déjà redirigés ;
- des scripts pour cloner, installer et lancer la RWA.

L'objectif est de pouvoir exécuter la RWA sur :

- `http://localhost:3000` pour le **frontend** ;
- `http://localhost:3001` pour l'**API backend**.

Ces ports et commandes sont conformes au README du dépôt de la Cypress Real World App. Le projet upstream précise notamment que :

- la RWA est une application **Express/React** avec une base JSON locale ;
- `yarn dev` lance l'application ;
- le frontend utilise le port **3000** et le backend le port **3001** par défaut ;
- **Yarn Classic** est requis, pas Yarn Modern ;
- le mot de passe par défaut des utilisateurs d'exemple est **`s3cret`** ;
- la liste des comptes de démonstration peut être affichée avec `yarn list:dev:users`. fileciteturn1file0

---

## 1. Structure du template

```text
.devcontainer/
  Dockerfile
  devcontainer.json
scripts/
  clone-rwa.sh
  post-create.sh
  run-rwa.sh
README.md
.gitignore
```

---

## 2. Ouvrir le template dans GitHub Codespaces

1. Créer un dépôt GitHub à partir de ce template.
2. Ouvrir ce dépôt dans **Codespaces**.
3. Attendre la construction complète du conteneur.
4. Ouvrir le terminal intégré.
5. Vérifier l'environnement :

```bash
node --version
npm --version
yarn --version
```

Le conteneur active **Corepack** et prépare **Yarn Classic** automatiquement.

---

## 3. Cloner l'application Cypress Real World App dans le workspace

Dans le terminal du Codespace, exécuter :

```bash
bash scripts/clone-rwa.sh
```

Ce script :

- clone le dépôt officiel `cypress-io/cypress-realworld-app` dans le dossier `app/` ;
- active Corepack ;
- force l'usage de **Yarn Classic** ;
- installe les dépendances avec `yarn`.

### Alternative manuelle

Si vous préférez tout faire à la main :

```bash
git clone https://github.com/cypress-io/cypress-realworld-app app
cd app
corepack enable
yarn --version
yarn
```

---

## 4. Vérifier les prérequis spécifiques à la RWA

D'après le README du dépôt officiel, la RWA nécessite :

- **Node.js** ;
- **Yarn Classic** ;
- de préférence les ports **3000** et **3001** libres. fileciteturn1file0

### Point important sur Yarn

Le dépôt officiel précise que :

- **Yarn Classic** est compatible ;
- **Yarn Modern (v2+) n'est pas compatible**. fileciteturn1file0

Dans ce template, cet aspect est déjà pris en compte.

---

## 5. Lancer l'application

Depuis la racine du template, exécuter :

```bash
bash scripts/run-rwa.sh
```

Ce script se place dans `app/` et lance :

```bash
yarn dev
```

### Lancement manuel

```bash
cd app
yarn dev
```

Le README officiel indique que :

- le **frontend** écoute sur `3000` ;
- le **backend** écoute sur `3001` ;
- les deux sont démarrés par `yarn dev`. fileciteturn1file0

Une fois démarrée, l'application est accessible sur :

```text
http://localhost:3000
```

---

## 6. Comptes de démonstration

Le dépôt officiel précise que la base locale contient déjà des données d'exemple et que le mot de passe par défaut de tous les utilisateurs est :

```text
s3cret
```

Pour afficher la liste des utilisateurs de développement :

```bash
cd app
yarn list:dev:users
```

Ces informations viennent directement du README du dépôt officiel. fileciteturn1file0

---

## 7. Démarrer Cypress

Quand l'application tourne, ouvrir un second terminal et exécuter :

```bash
cd app
yarn cypress:open
```

Le README officiel donne cette commande pour lancer Cypress. fileciteturn1file0

---

## 8. Utiliser OWASP ZAP dans un cadre légal

Vous pouvez utiliser **OWASP ZAP** sur cette application **uniquement parce qu'elle est exécutée dans votre propre environnement d'entraînement**.

Cadre légal recommandé :

- application exécutée dans votre Codespace ou votre Dev Container ;
- application de démonstration clonée par vous ;
- pas de scan sur un site tiers sans autorisation explicite.

### Cible à analyser

Quand la RWA tourne, la cible à donner à ZAP est :

```text
http://localhost:3000
```

### Avec le proxy ZAP

Si vous utilisez ZAP en mode proxy, configurez le navigateur de test pour passer par :

```text
Host: localhost
Port: 8080
```

Le port `8080` est déjà prévu dans le template comme port auxiliaire.

---

## 9. Changer les ports si nécessaire

Le README officiel indique que si vous changez les ports, il faut modifier :

- `PORT` ;
- `VITE_BACKEND_PORT` ;
- éventuellement `cypress.config.ts` pour garder une configuration cohérente. fileciteturn1file0

### Exemple

Si vous choisissez :

```env
PORT=13000
VITE_BACKEND_PORT=13001
```

alors il faudra adapter localement dans `cypress.config.ts` :

- `e2e.baseUrl`
- `env.apiUrl`
- `env.url`

Le README du projet officiel recommande aussi de **ne pas committer ces changements locaux de ports**. fileciteturn1file0

---

## 10. Base locale et réinitialisation des données

Le README officiel précise que :

- la base locale est un fichier JSON situé dans `data/database.json` ;
- la base est réinitialisée à partir d'un seed au démarrage avec `yarn dev` ;
- les tests E2E réinitialisent également les données. fileciteturn1file0

Conséquence pédagogique importante :

- vous pouvez réaliser des tests, modifier des données, puis relancer `yarn dev` pour retrouver un état de départ cohérent.

---

## 11. Commandes utiles à retenir pour les élèves

### Installer la RWA

```bash
bash scripts/clone-rwa.sh
```

### Lancer la RWA

```bash
bash scripts/run-rwa.sh
```

### Afficher les utilisateurs d'exemple

```bash
cd app
yarn list:dev:users
```

### Lancer Cypress

```bash
cd app
yarn cypress:open
```

### Générer une nouvelle base JSON

```bash
cd app
yarn db:seed
```

Ces commandes correspondent aux usages décrits dans le README officiel du projet. fileciteturn1file0

---

## 12. Dépannage rapide

### `yarn` ne marche pas

Exécuter :

```bash
corepack enable
corepack prepare yarn@1.22.22 --activate
yarn --version
```

### Le dossier `app/` n'existe pas

Exécuter :

```bash
bash scripts/clone-rwa.sh
```

### Le port 3000 ou 3001 est déjà utilisé

Modifier `.env` dans `app/`, puis adapter `cypress.config.ts` comme indiqué dans le README officiel. fileciteturn1file0

### ZAP ne voit rien passer

Vérifier que :

- la RWA est bien démarrée ;
- l'URL testée est `http://localhost:3000` ;
- le navigateur passe bien par le proxy ZAP si vous utilisez le mode intercept/proxy.

---

## 13. Conseils pour le travail demandé aux élèves

Séquence recommandée :

1. ouvrir le template dans Codespaces ;
2. exécuter `bash scripts/clone-rwa.sh` ;
3. lancer l'application avec `bash scripts/run-rwa.sh` ;
4. vérifier l'accès à `http://localhost:3000` ;
5. identifier un compte de démonstration avec `yarn list:dev:users` ;
6. lancer Cypress ou ZAP selon l'activité demandée ;
7. consigner les observations dans un rapport.

---

## 14. Rappel important

Ce template sert à **héberger légalement une application de test** dans un environnement contrôlé.

Il ne doit pas être utilisé pour scanner :

- des sites publics ;
- des applications d'entreprise ;
- des cibles sans autorisation.
