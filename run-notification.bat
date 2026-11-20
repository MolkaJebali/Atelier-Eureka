@echo off
title Microservice 5 - Notification (Port 8084)
cd /d "%~dp0backend\microservices\notification"
if "%PORT%"=="" set PORT=8084
echo ============================================================
echo Demarrage de MS5 - Notification (FastAPI / Python) sur le port 8084
echo API        : http://localhost:8084/api/notifications/hello
echo Swagger UI : http://localhost:8084/swagger-ui
echo ============================================================
.\venv\Scripts\python.exe -m uvicorn app.main:app --reload --port %PORT%
pause
