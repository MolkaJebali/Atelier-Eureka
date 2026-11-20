@echo off
echo ===================================================
echo Configuration de la base de donnees job_db (MySQL)
echo ===================================================

set MYSQL_BIN=C:\xampp\mysql\bin\mysql.exe

if not exist "%MYSQL_BIN%" (
    echo [INFO] mysql.exe non trouve dans C:\xampp\mysql\bin. Recherche de mysql dans le PATH...
    set MYSQL_BIN=mysql
)

echo Importation du script database/job_db.sql...
"%MYSQL_BIN%" -u root --default-character-set=utf8mb4 < "backend\microservices\job\database\job_db.sql"

if %ERRORLEVEL% equ 0 (
    echo [SUCCES] Base de donnees job_db et tables creees avec succes !
) else (
    echo [ATTENTION] Impossible d'importer automatiquement le script SQL.
    echo Assurez-vous que MySQL (XAMPP) est demarre sur le port 3306,
    echo ou importez manuellement le fichier:
    echo   backend\microservices\job\database\job_db.sql
    echo dans phpMyAdmin (http://localhost/phpmyadmin)
)

pause
