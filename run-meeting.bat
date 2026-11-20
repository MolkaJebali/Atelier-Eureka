@echo off
title Microservice 4 - Meeting (Port 8083)
cd /d "%~dp0backend\microservices\meeting"
echo ============================================================
echo Demarrage de MS4 - Meeting (Node.js / Express) sur le port 8083
echo API        : http://localhost:8083/api/meetings/hello
echo Swagger UI : http://localhost:8083/swagger-ui
echo ============================================================
npm start
pause
