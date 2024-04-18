@echo off
cls

rem Start config.xlaunch
echo Starting config.xlaunch...
start config.xlaunch

rem Start Docker Desktop from CLI
echo Starting Docker Desktop...
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe" --run

rem Wait until Docker Desktop is open
:WAIT
timeout /t 5 /nobreak >nul
tasklist /FI "IMAGENAME eq Docker Desktop.exe" | find /i "Docker Desktop.exe" >nul
if errorlevel 1 goto WAIT

rem Remove the image called "jap" if it exists
echo Removing 'jap' image if it exists...
docker rm -f jap 2>nul

rem Build the jap image via Docker
echo Building 'jap' image...
docker build -t jap .

rem Run the container start command for the program
echo Starting the container
docker run -it --rm -e DISPLAY=host.docker.internal:0.0 jap
