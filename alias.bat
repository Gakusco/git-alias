@echo off
:menu
cls
echo Select an option:
echo 1. Add aliases
echo 2. Clean all aliases

set /p choice=Option: 

if "%choice%"=="1" (
    call :add_aliases
) else if "%choice%"=="2" (
    call :clean_aliases
) else (
    echo Invalid option. Try again.
    pause
    goto menu
)

:add_aliases
git config --global alias.lo "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)^<%an>%^Creset' --abbrev-commit --date=relative --branches"
git config --global alias.s "status -s"
git config --global alias.alias "config --get-regexp ^alias\."
git config --global alias.c "checkout"
echo Aliases added successfully!
pause
goto menu

:clean_aliases
git config --global --unset alias.lo
git config --global --unset alias.s
git config --global --unset alias.alias
git config --global --unset alias.c
echo All aliases have been removed!
pause
goto menu

