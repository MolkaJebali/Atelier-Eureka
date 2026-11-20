@echo off
title Microservice 4 - Meeting - instance 2 (Port 8093)
cd /d "%~dp0backend\microservices\meeting"
set PORT=8093
echo Deuxieme instance de Meeting sur le port %PORT%
npm start
pause
