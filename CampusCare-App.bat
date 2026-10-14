@echo off
title CampusCare – Launching Application...
cd /d "%~dp0"

echo Starting CampusCare...

:: Check if server is already running
curl -s -o nul http://localhost:5173/
if %ERRORLEVEL% NEQ 0 (
    echo Starting local application engine...
    start /min "CampusCare Backend" cmd /c "npm run dev"
    timeout /t 2 /nobreak > nul
)

:: Try opening in dedicated app window using Edge or Chrome
where msedge >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    start "" msedge --app=http://localhost:5173/ --window-size=1280,850
    exit
)

where chrome >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    start "" chrome --app=http://localhost:5173/ --window-size=1280,850
    exit
)

:: Fallback to default browser
start http://localhost:5173/
exit
