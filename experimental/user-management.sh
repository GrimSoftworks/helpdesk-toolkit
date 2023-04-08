#!/bin/bash

########################################
####                                ####
####       Experimental Scipt       ####
####                                ####
########################################

# This script is an attempt to use remote management. SSH may need to be troubleshot, not tested.

# Check if script is being run with sudo
if [ "$EUID" -ne 0 ]
  then echo "This script requires sudo to function."
  exit
fi

# Get remote server input
read -p "Enter the remote server IP or hostname: " remote_server

# Get username input
read -p "Enter the username: " username

# Check if user exists on remote server
if ssh $remote_server id "$username" >/dev/null 2>&1; then
    echo "User $username exists on $remote_server:"
else
    echo "User $username does not exist on $remote_server."
    exit 1
fi

# Prompt the user for which information to view
PS3="Select which information to view for $username on $remote_server: "
options=("Groups" "Shell" "Last Login" "Password Expiration" "Account Status" "Quit")
select option in "${options[@]}"; do
    case $option in
        "Groups")
            echo "Groups: $(ssh $remote_server id -Gn $username)"
            ;;
        "Shell")
            echo "Shell: $(ssh $remote_server getent passwd $username | cut -d':' -f7)"
            ;;
        "Last Login")
            echo "Last Login: $(ssh $remote_server lastlog -u $username)"
            ;;
        "Password Expiration")
            password_status=$(ssh $remote_server chage -l $username | grep "Password expires" | cut -d':' -f2)
            if [[ $password_status == *"never"* ]]; then
                echo "Password Expiration: Never"
            elif [[ $password_status == *"Jan 01"* ]]; then
                echo "Password Expiration: Expired"
            else
                echo "Password Expiration: $password_status"
            fi
            ;;
        "Account Status")
            account_status=$(ssh $remote_server getent passwd $username | cut -d':' -f3)
            if [ $account_status -eq 0 ]; then
                echo "Account Status: Active"
            else
                echo "Account Status: Inactive"
            fi
            ;;
        "Quit")
            exit 0
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done
