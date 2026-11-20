@echo off
title Microservice 3 - Candidature (Port 8085)
set "JAVA_HOME=C:\Program Files\Java\jdk-19"
set "PATH=%JAVA_HOME%\bin;%PATH%"
cd /d "%~dp0backend\microservices\canditature"
echo ============================================================
echo Demarrage de MS3 - Candidature (Spring Boot) sur le port 8085
echo Endpoint : http://localhost:8085/mic3/candidature/hello
echo ============================================================
if exist "target\canditature-0.0.1-SNAPSHOT.jar" (
    java -jar target\canditature-0.0.1-SNAPSHOT.jar
) else (
    call .\mvnw.cmd spring-boot:run
)
pause
