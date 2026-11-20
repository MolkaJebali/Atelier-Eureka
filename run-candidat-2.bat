@echo off
title Microservice 1 - Candidat - instance 2 (Port 8091)
set "JAVA_HOME=C:\Program Files\Java\jdk-19"
set "PATH=%JAVA_HOME%\bin;%PATH%"
cd /d "%~dp0backend\microservices\candidat"
echo Deuxieme instance de Candidat sur le port 8091 (H2 en memoire : donnees propres a l'instance)
call .\mvnw.cmd spring-boot:run -Dspring-boot.run.arguments=--server.port=8091
pause
