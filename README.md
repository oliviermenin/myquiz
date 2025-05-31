# Quiz App - Application de Quiz Interactive

Une application de quiz développée avec Angular (frontend) et Laravel (backend), entièrement dockerisée pour un déploiement facile.

## Fonctionnalités

- Interface utilisateur avec Angular
- API REST avec Laravel
- Base de données MySQL
- Système de quiz par catégories
- Classement des joueurs
- Statistiques détaillées
- Architecture dockerisée

## Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Installation et Configuration

### 1. Cloner le projet

```bash
git clone git@github.com:oliviermenin/myquiz.git myquiz
cd myquiz
```

### 2. Configuration du Backend Laravel

Créez le fichier de configuration Laravel :

```bash
# Créer le fichier .env dans le dossier backend
touch backend/.env
```

Copiez le contenu suivant dans `backend/.env` :

```env
APP_NAME="My Quiz"
APP_ENV=local
APP_KEY=base64:tJqPTguZ1axVm3e4100hj1cN+tJ2KuNgoY/3cPUZgKs=
APP_DEBUG=true
APP_URL=http://localhost:8000

APP_LOCALE=fr
APP_FALLBACK_LOCALE=en
APP_FAKER_LOCALE=fr_FR

APP_MAINTENANCE_DRIVER=file
PHP_CLI_SERVER_WORKERS=4
BCRYPT_ROUNDS=12

LOG_CHANNEL=stack
LOG_STACK=single
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=myquiz
DB_USERNAME=quiz_user
DB_PASSWORD=quiz_password

SESSION_DRIVER=database
SESSION_LIFETIME=120
SESSION_ENCRYPT=false
SESSION_PATH=/
SESSION_DOMAIN=null

BROADCAST_CONNECTION=log
FILESYSTEM_DISK=local
QUEUE_CONNECTION=database

CACHE_STORE=database

REDIS_CLIENT=phpredis
REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=log
MAIL_SCHEME=null
MAIL_HOST=127.0.0.1
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_FROM_ADDRESS="quiz@example.com"
MAIL_FROM_NAME="\${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

SANCTUM_STATEFUL_DOMAINS=localhost:4200
SPA_URL=http://localhost:4200
SESSION_DOMAIN=localhost

VITE_APP_NAME="\${APP_NAME}"
```

## Démarrage avec Docker

### 1. Construction et démarrage des services

```bash
# Construire et démarrer tous les services
docker compose up --build

## Accès à l'application

Une fois tous les services démarrés, vous pouvez accéder à :

- Application Frontend (Angular) : http://localhost:4200

## Base de données

### Structure

L'application utilise les tables suivantes :
- `categorie` : Catégories de quiz
- `question` : Questions des quiz
- `reponse` : Réponses possibles pour chaque question
- `quiz_results` : Résultats des quiz des utilisateurs

### Données de test

La base de données est automatiquement peuplée avec :
- 6 catégories de quiz (Informatique, Histoire, Sciences, Sport, Géographie, Littérature)
- 10 questions par catégorie
- 4 réponses par question
