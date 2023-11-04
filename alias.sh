#!/bin/bash

add_aliases() {
    # Read aliases from custom_aliases.txt and configure them
    while IFS= read -r line
    do
        alias_key=$(echo "$line" | cut -d'=' -f1)
        alias_value=$(echo "$line" | cut -d'=' -f2)
        git config --global "alias.$alias_key" "$alias_value"
    done < custom_aliases.txt

    echo "Aliases added successfully!"
    read -n 1 -s -r -p "Press any key to continue..."
}

clean_aliases() {
    # Remove all aliases
    while IFS= read -r line
    do
        alias_key=$(echo "$line" | cut -d'=' -f1)
        git config --global --unset "alias.$alias_key"
    done < custom_aliases.txt

    echo "All aliases have been removed!"
    read -n 1 -s -r -p "Press any key to continue..."
}

while :
do
    clear
    echo "Select an option:"
    echo "1. Add aliases"
    echo "2. Clean all aliases"
    echo "3. Exit"
    read choice

    case $choice in
        1)
            add_aliases
            ;;
        2)
            clean_aliases
            ;;
        3)
            echo "Exiting the script."
            exit
            ;;
        *)
            echo "Invalid option. Try again."
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
    esac
done

