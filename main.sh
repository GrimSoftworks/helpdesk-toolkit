#!/bin/bash

# Check if script is being run with sudo
if [ "$EUID" -ne 0 ]
  then echo "This script requires sudo to function."
  exit
fi

# Banner
function banner {
    echo -e "\e[1m\e[32m"
    cat << "EOF"
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⢀⣴⠶⠀⠀⠀⠀⠀⣈⣿⣦⠀⠀⠀⠀
⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠹⣿⣿⡆⠀⠀⠀
⠀⠀⠀⠀⠀  ⠀⠀⠀⢰⣿⣿⣤⣤⣴⣤⣤⣄⠀⢠⣿⣿⠇⠀⠀⠀
⠀⠀⠀  ⠀⠀⠀⠀⠀⢸⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀
⠀⠀⠀  ⠀⠀⠀⠀⠀⣾⠋⠈⢻⣿⡝⠁⠀⢻⣿⣿⠋⠀⠀⠀⠀⠀
⠀⠀⠀  ⠀⠀⠀⠀⠈⣿⣄⣠⣿⣿⣧⣀⣠⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀  ⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀
⠀⠀⠀  ⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⡿⠟⠀⣀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀  ⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣷⡾⠿⠛⠀⠀⠀⠀⠀
⠀⠀⠀  ⠀⠀⢀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⡿⠓⠀⠀⠀⠀⠀⠀⠀
⠀  ⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣀⡀⠀⠀⠀⠀⠀
⠀  ⣰⡟⠉⣼⣿⠟⣡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⡀⠀
  ⢠⣿⠀⠀⣿⣿⣾⠿⠛⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡛⠻⠑⡀
  ⠈⣿⠀⡼⢿⡏⠀⠀⠀⠹⣿⡆⠉⠻⣿⣿⣿⣿⣿⡻⢿⣿⠷⠞⠁
  ⠀⢸⠇⠀⠈⡇⠀⠀⠀⠀⠘⢿⡄⠀⠸⡏⠀⠀⠉⡇⠀⠹⢦⡄⠀
   ⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠸⠁⠀
    NAME Helpdesk Toolkit
    If there are any errors please utilize the GITLAB Board

EOF
    echo -e "\e[0m"
}

# Confirm
function confirm {
    read -r -p "Are you sure you want to use the Helpdesk Toolkit? [y/N] " response
    response=${response,,}
    if [[ "$response" =~ ^(yes|y)$ ]]; then
        main
    else
        echo "Exiting..."
        exit 1
    fi
}

# Main function
function main {
    echo "Welcome to the BLANK Helpdesk Toolkit!"

    # Prompt the user for which action to perform
    PS3="Please select an action (1-7): "
    options=("one" "two" "three" "four" "five" "six" "Quit")

    select option in "${options[@]}"; do
        case $option in
            "one")
                sudo bash file_management/first-script.sh
                ;;
            "two")
                sudo bash file_management/second-script.sh
                ;;
            "three")
                sudo bash file_management/third-script.sh
                ;;
            "four")
                sudo bash network_management/fourth-script.sh
                ;;
            "five")
                sudo bash network_management/fifth-script.sh
                ;;
            "six")
                sudo bash network_management/sixth-script.sh
                ;;
            "Quit")
                exit 0
                ;;
            *)
                echo "Invalid option"
                ;;
        esac
    done
}

# Start the Helpdesk Toolkit
banner
confirm
