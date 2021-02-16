@echo off
setlocal enabledelayedexpansion
goto :main

:main
setlocal
    if exist %~1 (
        echo Directory %1 exists
        set /a counter=0
        for /r "%~1" %%d in ( *.exe *.com *.bat ) do (
            echo %%d
            set /a counter+=1
        )
        echo Files found: !counter!
    ) else (
        echo Selected directory doesn't exist
    )
    pause
endlocal
goto :eof