@echo off
setlocal enabledelayedexpansion
title Execution de tous les tests

set "JAVA_HOME=C:\Program Files\Java\jdk-19"
set "PATH=%JAVA_HOME%\bin;%PATH%"
set "MAVEN_OPTS=-Djava.net.preferIPv4Stack=true"
set MVN_CMD="C:\Users\Lenovo\.m2\wrapper\dists\apache-maven-3.9.16\0daed3be3ebd1c706f0e69e8b07c6b73f5cc4ea3dfce72a8d0ec2e849ca2ddb0\bin\mvn.cmd"

echo ============================================================
echo 1. Tests Microservice 1 : Candidat (Spring Boot)
echo ============================================================
call %MVN_CMD% -f "%~dp0backend\microservices\candidat\pom.xml" test
if !ERRORLEVEL! neq 0 (echo [ECHEC] Candidat tests ont echoue) else (echo [OK] Candidat tests reussis)

echo ============================================================
echo 2. Tests Microservice 2 : Job (Spring Boot)
echo ============================================================
call %MVN_CMD% -f "%~dp0backend\microservices\job\pom.xml" test
if !ERRORLEVEL! neq 0 (echo [ECHEC] Job tests ont echoue) else (echo [OK] Job tests reussis)

echo ============================================================
echo 3. Tests Microservice 3 : Candidature (Spring Boot)
echo ============================================================
call %MVN_CMD% -f "%~dp0backend\microservices\canditature\pom.xml" test
if !ERRORLEVEL! neq 0 (echo [ECHEC] Candidature tests ont echoue) else (echo [OK] Candidature tests reussis)

echo ============================================================
echo 4. Tests Microservice 4 : Meeting (Node.js)
echo ============================================================
pushd "%~dp0backend\microservices\meeting"
call npm test
if !ERRORLEVEL! neq 0 (echo [ECHEC] Meeting tests ont echoue) else (echo [OK] Meeting tests reussis)
popd

echo ============================================================
echo 5. Tests Microservice 5 : Notification (FastAPI / pytest)
echo ============================================================
pushd "%~dp0backend\microservices\notification"
call .\venv\Scripts\pytest
if !ERRORLEVEL! neq 0 (echo [ECHEC] Notification tests ont echoue) else (echo [OK] Notification tests reussis)
popd

echo ============================================================
echo Termine !
echo ============================================================
pause
