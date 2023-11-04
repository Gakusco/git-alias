#!/bin/bash

# Función para agregar los alias
add_aliases() {
    git config --global alias.lo "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --branches"
    git config --global alias.s "status -s"
    git config --global alias.alias "config --get-regexp ^alias\\."
    git config --global alias.c "checkout"

    echo "¡Alias agregados con éxito!"
}

# Función para limpiar los alias
clean_aliases() {
    git config --global --unset alias.lo
    git config --global --unset alias.s
    git config --global --unset alias.alias
    git config --global --unset alias.c

    echo "¡Todos los alias han sido eliminados!"
}

# Menú principal
while true; do
    echo "Seleccione una opción:"
    echo "1. Agregar alias"
    echo "2. Limpiar todos los alias"
    echo "3. Salir"

    read -p "Opción: " choice

    case $choice in
        1)
            add_aliases
            ;;
        2)
            clean_aliases
            ;;
        3)
            echo "Saliendo del script."
            exit
            ;;
        *)
            echo "Opción no válida. Inténtalo de nuevo."
            ;;
    esac
done

