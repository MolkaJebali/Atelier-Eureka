# Guide d'Installation et d'Utilisation - Correction Prosit Microservices

Ce projet contient la correction du Prosit sur l'architecture Microservices pour le module **App Web (4ème année)**.

---

## 🏛️ Architecture du Projet

Le système se compose de 5 microservices indépendants :

| Microservice | Technologie | Port | Base de données | Swagger UI / Documentation | Endpoint Hello / Test |
|---|---|---|---|---|---|
| **MS1 - Candidat** | Spring Boot 3.2 / Java 19 | `8081` | H2 (in-memory) | [http://localhost:8081/swagger-ui.html](http://localhost:8081/swagger-ui.html) | `GET /api/candidates` & `GET /mic1/candidates` |
| **MS2 - Job** | Spring Boot 3.2 / Java 19 | `8082` | MySQL (`job_db`) | [http://localhost:8082/swagger-ui.html](http://localhost:8082/swagger-ui.html) | `GET /api/jobs` & `GET /mic2/jobs` |
| **MS3 - Candidature** | Spring Boot 4.0 / Java 19 | `8085` | - | - | [http://localhost:8085/mic3/candidature/hello](http://localhost:8085/mic3/candidature/hello) |
| **MS4 - Meeting** | Node.js / Express | `8083` | - (TODO étudiants) | [http://localhost:8083/swagger-ui](http://localhost:8083/swagger-ui) | [http://localhost:8083/api/meetings/hello](http://localhost:8083/api/meetings/hello) |
| **MS5 - Notification** | Python 3.11 / FastAPI | `8084` | - (TODO étudiants) | [http://localhost:8084/swagger-ui](http://localhost:8084/swagger-ui) | [http://localhost:8084/api/notifications/hello](http://localhost:8084/api/notifications/hello) |

---

## 🚀 Démarrage Rapide

Des scripts prêts à l'emploi ont été créés à la racine du projet :

### 1. Démarrer tous les microservices en un clic :
Double-cliquez sur :
```bat
start-all.bat
```
*(Chaque microservice s'ouvrira dans sa propre console dédiée).*

### 2. Démarrage individuel :
- **Candidat (MS1)** : double-cliquez sur `run-candidat.bat`
- **Job (MS2)** : double-cliquez sur `run-job.bat` *(nécessite MySQL/XAMPP démarré)*
- **Candidature (MS3)** : double-cliquez sur `run-candidature.bat`
- **Meeting (MS4)** : double-cliquez sur `run-meeting.bat`
- **Notification (MS5)** : double-cliquez sur `run-notification.bat`

---

## 🗄️ Configuration de la Base de Données MySQL (pour le service Job)

1. Démarrez **MySQL** depuis **XAMPP Control Panel** (port 3306).
2. Exécutez le script automatique :
   ```bat
   setup-database.bat
   ```
   *(Ou importez manuellement le fichier `backend/microservices/job/database/job_db.sql` dans **phpMyAdmin**).*
3. La configuration JPA a été réglée sur `spring.jpa.hibernate.ddl-auto=update` pour créer et synchroniser automatiquement les tables.

Pour le service **Candidat (MS1)** :
- Utilise une base **H2 en mémoire**.
- Console H2 accessible sur : [http://localhost:8081/h2](http://localhost:8081/h2)
- JDBC URL : `jdbc:h2:mem:candidat`
- Identifiant : `Badia` (mot de passe vide).

---

## 🧪 Tests et Validation

Tous les tests d'intégration et unitaires ont été exécutés et validés avec succès :
- **Candidat** : 8/8 tests passés avec succès (`BUILD SUCCESS`).
- **Job** : 7/7 tests passés avec succès (`BUILD SUCCESS`).
- **Candidature** : 1/1 test passé avec succès (`BUILD SUCCESS`).
- **Meeting** : 4/4 tests passés avec succès (Node.js test runner).
- **Notification** : 4/4 tests passés avec succès (pytest FastAPI).

Pour relancer l'ensemble des tests à tout moment :
```bat
test-all.bat
```

---

## 📂 Organisation des Dossiers

```
codeSource_correctionProsit/
├── documentation/
│   ├── diagrams/                         # Diagrammes d'architecture microservices & classes
│   └── Scenario_MicroService_explicatif.mp4 # Vidéo explicative du flux microservices
├── backend/
│   └── microservices/
│       ├── candidat/                     # MS1 (Spring Boot 3.2, H2, Swagger)
│       ├── job/                          # MS2 (Spring Boot 3.2, MySQL, Swagger)
│       ├── canditature/                  # MS3 (Spring Boot 4.0)
│       ├── meeting/                      # MS4 (Node.js Express, Swagger)
│       └── notification/                 # MS5 (FastAPI Python, Swagger)
├── FrontEnd/                             # Répertoire Frontend
├── run-candidat.bat
├── run-job.bat
├── run-candidature.bat
├── run-meeting.bat
├── run-notification.bat
├── start-all.bat
├── test-all.bat
└── setup-database.bat
```
