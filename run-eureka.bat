@echo off
title Eureka Server (Port 8761)
set "JAVA_HOME=C:\Program Files\Java\jdk-19"
set "PATH=%JAVA_HOME%\bin;%PATH%"
cd /d "%~dp0backend\eureka"
echo ============================================================
echo Demarrage du serveur Eureka sur le port 8761
echo Dashboard : http://localhost:8761
echo ============================================================
call .\mvnw.cmd spring-boot:run
pause
