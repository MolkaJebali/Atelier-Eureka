@echo off
title Microservice 1 - Candidat (Port 8081)
set "JAVA_HOME=C:\Program Files\Java\jdk-19"
set "PATH=%JAVA_HOME%\bin;%PATH%"
cd /d "%~dp0backend\microservices\candidat"
echo ============================================================
echo Demarrage de MS1 - Candidat (Spring Boot) sur le port 8081
echo Swagger UI : http://localhost:8081/swagger-ui.html
echo H2 Console : http://localhost:8081/h2 (JDBC URL: jdbc:h2:mem:candidat, User: Badia)
echo ============================================================
if exist "target\candidat-0.0.1-SNAPSHOT.jar" (
    java -jar target\candidat-0.0.1-SNAPSHOT.jar
) else (
    call .\mvnw.cmd spring-boot:run
)
pause
