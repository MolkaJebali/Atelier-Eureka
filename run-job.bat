@echo off
title Microservice 2 - Job (Port 8082)
set "JAVA_HOME=C:\Program Files\Java\jdk-19"
set "PATH=%JAVA_HOME%\bin;%PATH%"
cd /d "%~dp0backend\microservices\job"
echo ============================================================
echo Demarrage de MS2 - Job (Spring Boot) sur le port 8082
echo Swagger UI : http://localhost:8082/swagger-ui.html
echo Note : Necessite MySQL demarre sur localhost:3306 (XAMPP)
echo ============================================================
if exist "target\job-0.0.1-SNAPSHOT.jar" (
    java -jar target\job-0.0.1-SNAPSHOT.jar
) else (
    call .\mvnw.cmd spring-boot:run
)
pause
