@echo off
setlocal enabledelayedexpansion
goto :main

:main
setlocal

    if exist %1 (
        echo Directory %1 exists
        set /a counter=0
        for /d /r %1 %%d in ( System* ) do (
            echo %%d
            set /a counter+=1
        )
        echo Directories found: !counter!
    ) else (
        echo Selected directory doesn't exist
    )
    pause

endlocal
goto :eof