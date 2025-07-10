#!/bin/bash

while true; do
    echo ""
    echo "1. Add user"
    echo "2. Remove user"
    echo "3. Update password for current user"
    echo "4. List all actual users and count them"
    echo "5. Exit"
    read -p "Choose an option [1-5]: " choice

    case $choice in
        1)
            read -p "Enter username to add: " username
            sudo adduser "$username"
            ;;
        2)
            read -p "Enter username to remove: " username
            sudo deluser "$username"
            ;;
        3)
            echo "Updating password for user: $USER"
            sudo passwd "$USER"
            ;;
        4)
            echo "Actual users (with home directories):"
            users=$(awk -F: '$3 >= 1000 && $3 != 65534 {print $1}' /etc/passwd)
            echo "$users"
            count=$(echo "$users" | wc -l)
            echo "Total users: $count"
            ;;
        5)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid option. Please choose between 1 and 5."
            ;;
    esac
done
