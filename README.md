# Inception 🐋

Inception est un projet qui a pour objectif de découvrir et mettre en pratique la **virtualisation** et la **containerisation** en utilisant **Docker** et **Docker Compose**.  

## Objectifs

- Déployer une architecture multi-conteneurs cohérente et sécurisée.  
- Mettre en place un environnement de type **WordPress** avec :  
  - **NGINX** (avec TLS/SSL)  
  - **WordPress** (PHP-FPM)  
  - **MariaDB** (base de données)  
- Utiliser des **volumes persistants** pour conserver les données.  
- Créer un réseau Docker dédié pour l’ensemble de l’infrastructure.  

## Pré-requis

Avant de lancer le projet, il est nécessaire de préparer certains fichiers de configuration et secrets :  

1. **Créer un fichier `.env`** dans le dossier `srcs/` pour définir les variables d’environnement suivantes :  
   - `SQL_PASSWORD` : mot de passe de l’utilisateur MariaDB  
   - `SQL_ROOT_PASSWORD` : mot de passe root de MariaDB  
   - `SQL_DATABASE` : nom de la base de données  
   - `SQL_USER` : nom de l’utilisateur WordPress  
   - `WP_ADMIN` : nom de l’administrateur WordPress  
   - `WP_ADMIN_PASSWORD` : mot de passe admin  
   - `WP_ADMIN_EMAIL` : email de l’administrateur  
   - `WP_USER` : nom d’un utilisateur WordPress supplémentaire  
   - `WP_USER_EMAIL` : email de l’utilisateur  
   - `WP_USER_PASSWORD` : mot de passe utilisateur  

2. **Créer un dossier `secret/` local** pour stocker les fichiers de mot de passe :  
   - `db_password.txt` → contenu : mot de passe utilisateur MariaDB  
   - `db_root_password.txt` → contenu : mot de passe root MariaDB  

Ces secrets seront utilisés dans les services Docker pour initialiser la base de données : 

SQL_PASSWORD=$(cat /run/secrets/db_password.txt)

SQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password.txt)



3. **Modifier la configuration NGINX** pour :  
   - Redéfinir le `server_name` avec le nom de domaine ou l’adresse IP souhaitée  
   - Mettre à jour les chemins vers les certificats auto-signés (TLS/SSL)  

---

## Structure du projet

- `nginx/` : configuration du serveur NGINX.  
- `wordpress/` : installation et configuration de WordPress avec PHP-FPM.  
- `mariadb/` : base de données MariaDB.  
- `docker-compose.yml` : orchestration des services.  
- `srcs/.env` : variables d’environnement personnalisées.  
- `secret/` : fichiers de mots de passe sécurisés pour MariaDB.  

---

## Lancement

1. Préparer le `.env` et le dossier `secret` comme indiqué ci-dessus.  
2. Modifier la configuration NGINX si nécessaire (server_name, certificats).  
3. Lancer le projet :  
```bash
make
```

