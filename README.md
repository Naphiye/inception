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

## Structure du projet

- `nginx/` : configuration du serveur NGINX.  
- `wordpress/` : installation et configuration de WordPress avec PHP-FPM.  
- `mariadb/` : base de données MariaDB.  
- `docker-compose.yml` : orchestration des services.  

## Lancement

```bash
make
