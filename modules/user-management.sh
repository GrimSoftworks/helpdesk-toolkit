#!/bin/bash

# Check if script is being run with sudo
if [ "$EUID" -ne 0 ]
  then echo "This script requires sudo to function."
  exit
fi

# Get username input
read -p "Enter the username: " username

# Check if user exists
if id "$username" >/dev/null 2>&1; then
    echo "User $username exists:"
    echo "Groups: $(id -Gn $username)"
    echo "Shell: $(getent passwd $username | cut -d':' -f7)"
    echo "Last Login: $(lastlog -u $username)"
    password_status=$(chage -l $username | grep "Password expires" | cut -d':' -f2)
    if [[ $password_status == *"never"* ]]; then
        echo "Password Expiration: Never"
    elif [[ $password_status == *"Jan 01"* ]]; then
        echo "Password Expiration: Expired"
    else
        echo "Password Expiration: $password_status"
    fi
    account_status=$(getent passwd $username | cut -d':' -f3)
    if [ $account_status -eq 0 ]; then
        echo "Account Status: Active"
    else
        echo "Account Status: Inactive"
    fi
else
    echo "User $username does not exist."
    exit 1
fi
