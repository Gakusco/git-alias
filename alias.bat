@echo off
:menu
cls
echo Select an option:
echo 1. Add aliases
echo 2. Clean all aliases
echo 3. Exit

set /p choice=Option: 

if "%choice%"=="1" (
    call :add_aliases
) else if "%choice%"=="2" (
    call :clean_aliases
) else if "%choice%"=="3" (
    echo Exiting the script.
) else (
    echo Invalid option. Try again.
    pause
    goto menu
)

:add_aliases
rem Read aliases from custom_aliases.txt and configure them
for /f "tokens=1,* delims==" %%A in (custom_aliases.txt) do (
    git config --global alias.%%A "%%B"
)
echo Aliases added successfully!
pause
goto menu

:clean_aliases
rem Remove all aliases
for /f "tokens=1,* delims==" %%A in (custom_aliases.txt) do (
    git config --global --unset alias.%%A
)
echo All aliases have been removed!
pause
goto menu

