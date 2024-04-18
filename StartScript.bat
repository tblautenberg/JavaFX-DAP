@echo off
cls

rem Check if config.xlaunch is running
tasklist /FI "WINDOWTITLE eq Xming" | find /i "Xming" >nul
if not errorlevel 1 (
    echo config.xlaunch is already running.
) else (
    echo Starting config.xlaunch...
    start config.xlaunch
)

rem Check if Docker Desktop is running
tasklist /FI "IMAGENAME eq Docker Desktop.exe" | find /i "Docker Desktop.exe" >nul
if not errorlevel 1 (
    echo Docker Desktop is already running.
) else (
    echo Starting Docker Desktop...
    start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe" --run
)

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

rem Wait for any key press before closing the console
pause >nul
