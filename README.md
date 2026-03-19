# TP – Test de Cypress Real World App avec OWASP ZAP (via GitHub Codespaces)

## Objectif pédagogique (BTS SIO SLAM)

Ce TP a pour objectif de :

- Déployer une application web moderne (Cypress Real World App)
- Comprendre l'environnement Node.js
- Utiliser Yarn
- Tester une application avec OWASP ZAP
- Identifier des vulnérabilités OWASP Top 10
- Réaliser un audit sécurité applicatif

---

# Important : pas de localhost dans Codespaces

Dans GitHub Codespaces, l’application **ne sera PAS accessible via localhost:3000**.

Elle sera accessible via une URL sécurisée de type :

https://<nom-du-codespace>-3000.app.github.dev

Exemple :

https://glowing-space-xyz-3000.app.github.dev

GitHub crée automatiquement cette URL lorsque le port est exposé.

---

# Étape 1 – Ouvrir le projet dans Codespaces

1 Aller sur le repository GitHub  
2 Cliquer sur :

Code → Codespaces → Create Codespace

Attendre la construction du container.

---

# Étape 2 – Installer l’application Cypress Real World App

Dans le terminal Codespaces :

```bash
chmod +x scripts/clone-rwa.sh
./scripts/clone-rwa.sh
```

Ce script va :

- cloner le projet officiel
- installer les dépendances
- préparer la base SQLite

---

# Étape 3 – Lancer l’application

Dans le terminal :

```bash
chmod +x scripts/run-rwa.sh
./scripts/run-rwa.sh
```

ou manuellement :

```bash
cd cypress-realworld-app
yarn dev
```

---

# Étape 4 – Ouvrir l’application

1 Aller dans l’onglet :

PORTS

2 Repérer le port :

3000

3 Cliquer sur :

Open in Browser

OU copier l’URL fournie par Codespaces.

---

# Étape 5 – Comptes de test

Login :

username:

johndoe

password:

s3cret

Autre compte :

janedoe / s3cret

---

# Étape 6 – Lancer Cypress

Dans un second terminal :

```bash
cd cypress-realworld-app
yarn cypress:open
```

---

# Étape 7 – Tester avec OWASP ZAP

## Configuration du proxy

Configurer le navigateur :

Proxy :

localhost

Port :

8080

Puis dans ZAP :

Quick Start → Automated Scan

Entrer l’URL Codespaces :

https://<codespace>-3000.app.github.dev

---

# Étape 8 – Travail demandé

Identifier :

- XSS
- Cookies non sécurisés
- Headers manquants
- JWT faibles
- API exposées
- Mauvaises configurations CORS

Compléter le tableau :

| Vulnérabilité | Gravité | Description | Correction |
|---------------|---------|-------------|------------|

---

# Compétences BTS SIO mobilisées

Bloc 3 cybersécurité :

✔ Sécuriser une application  
✔ Identifier vulnérabilités  
✔ Tester une application  
✔ Protéger les données  
✔ OWASP Top 10  

---

# Commandes utiles

Installation :

```bash
yarn install
```

Lancement :

```bash
yarn dev
```

Tests :

```bash
yarn cypress:open
```

---

# Problèmes fréquents

Application inaccessible :

→ vérifier port 3000 ouvert

Erreur yarn :

→ relancer :

```bash
yarn install
```

Port non visible :

→ vérifier onglet PORTS

---

# Bonnes pratiques sécurité

Ne jamais tester :

- Google
- Amazon
- sites entreprises
- administrations

Sans autorisation.

Seulement :

✔ applications locales  
✔ environnements pédagogiques  
✔ applications vulnérables volontaires  

---

# Livrable attendu

Un rapport PDF contenant :

- vulnérabilités trouvées
- captures écran ZAP
- analyse risques
- corrections proposées

---

# Fin du TP
