# Partie Backend

## Initialiser NodeJS

Après avoir installer node, lancer `npm install` dans `backend/`

## Détail des fichiers

### NodeJS

- index.js : chargement du fichier de conf et connexion à la BDD
- test.js et func.js : tests sur l'import/export manuel des modules
- server.js : serveur http (express) minimal

### SQL

- DESTIT_DB.sql : script de création de la BDD
- DEV_DB.sql : script de création d'une BDD minimales pour les tests
- USERS.sql : script de création des utilisateurs "reader" et "wrieter"

### Autres

- package* : fichier de config nécessaires (cf. `npm install`)
- server.conf.json : système de configuration pour le serveur
