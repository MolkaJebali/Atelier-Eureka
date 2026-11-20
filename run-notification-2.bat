@echo off
title Microservice 5 - Notification - instance 2 (Port 8094)
cd /d "%~dp0backend\microservices\notification"
set PORT=8094
echo Deuxieme instance de Notification sur le port %PORT%
.\venv\Scripts\python.exe -m uvicorn app.main:app --port %PORT%
pause
