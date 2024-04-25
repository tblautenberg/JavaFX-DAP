@echo off
cls

rem Prompt the user to enter a new remote repository URL
set /p newRemoteRepoURL=Enter the new remote repository URL: 

rem Modify the Java source file to update remoteRepoURL
powershell -Command "(Get-Content -Path 'JavaFX-DAP\src\main\java\org\example\App.java') -replace 'String remoteRepoURL = \".*\";', 'String remoteRepoURL = \"%newRemoteRepoURL%\";' | Set-Content -Path 'JavaFX-DAP\src\main\java\org\example\App.java'"

rem Check if the modification was successful
if %errorlevel% equ 0 (
    echo Remote repository URL updated successfully. To open target javaFX project, please use StarScript.bat.
    echo Press any key to close the program...
) else (
    echo Failed to update remote repository URL.
    Press any key to close the program...
    pause
    exit /b 1
)

rem Wait for any key press before closing the console
pause >nul
