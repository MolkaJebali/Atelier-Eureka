@echo off
echo ============================================================
echo Lancement de l'ensemble des Microservices dans des fenetres separees
echo ============================================================

echo 0. Lancement du serveur Eureka (:8761)...
start "Eureka (8761)" cmd /c "run-eureka.bat"
echo Attente du demarrage d'Eureka (30 s)...
timeout /t 30 /nobreak >nul

echo 1. Lancement de MS1 - Candidat (:8081)...
start "MS1 - Candidat (8081)" cmd /c "run-candidat.bat"

echo 2. Lancement de MS2 - Job (:8082)...
start "MS2 - Job (8082)" cmd /c "run-job.bat"

echo 3. Lancement de MS3 - Candidature (:8085)...
start "MS3 - Candidature (8085)" cmd /c "run-candidature.bat"

echo 4. Lancement de MS4 - Meeting (:8083)...
start "MS4 - Meeting (8083)" cmd /c "run-meeting.bat"

echo 5. Lancement de MS5 - Notification (:8084)...
start "MS5 - Notification (8084)" cmd /c "run-notification.bat"

echo ============================================================
echo Tous les microservices ont ete lances !
echo - Eureka       : http://localhost:8761
echo - Candidat     : http://localhost:8081/swagger-ui.html
echo - Job          : http://localhost:8082/swagger-ui.html
echo - Meeting      : http://localhost:8083/swagger-ui
echo - Notification : http://localhost:8084/swagger-ui
echo - Candidature  : http://localhost:8085/mic3/candidature/hello
echo ============================================================
pause
