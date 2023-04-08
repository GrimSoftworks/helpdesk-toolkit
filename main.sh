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
    options=("User Management" "two" "three" "four" "five" "six" "Quit")

    select option in "${options[@]}"; do
        case $option in
            "User Management")
                echo "Loading User Management Module..."
                sleep 1
                (
                    echo "10"
                    echo "# Loading User Management Module..."
                    for i in {1..10}; do
                        sleep 0.2
                        echo "$((i*10))"
                    done
                ) | whiptail --gauge "Please wait while User Management is loaded..." 6 60 0
                sudo bash ./modules/user-management.sh
                ;;
            "two")
                echo "Loading option two..."
                sleep 1
                (
                    echo "10"
                    echo "# Loading option two..."
                    for i in {1..10}; do
                        sleep 0.2
                        echo "$((i*10))"
                    done
                ) | whiptail --gauge "Please wait while option two is loaded..." 6 60 0
                sudo bash file_management/second-script.sh
                ;;
            "three")
                echo "Loading option three..."
                sleep 1
                (
                    echo "10"
                    echo "# Loading option three..."
                    for i in {1..10}; do
                        sleep 0.2
                        echo "$((i*10))"
                    done
                ) | whiptail --gauge "Please wait while option three is loaded..." 6 60 0
                sudo bash file_management/third-script.sh
                ;;
            "four")
                echo "Loading option four..."
                sleep 1
                (
                    echo "10"
                    echo "# Loading option four..."
                    for i in {1..10}; do
                        sleep 0.2
                        echo "$((i*10))"
                    done
                ) | whiptail --gauge "Please wait while option four is loaded..." 6 60 0
                sudo bash network_management/fourth-script.sh
                ;;
            "five")
                echo "Loading option five..."
                sleep 1
                (
                    echo "10"
                    echo "# Loading option five..."
                    for i in {1..10}; do
                        sleep 0.2
                        echo "$((i*10))"
                    done
                ) | whiptail --gauge "Please wait while option five is loaded..." 6 60 0
                sudo bash network_management/fifth-script.sh
                ;;
            "six")
                echo "Loading option six..."
                sleep 1
                (
                    echo "10"
                    echo "# Loading option six..."
                    for i in {1..10}; do
                        sleep 0.2
                        echo "$((i*10))"
                    done
                ) | whiptail --gauge "Please wait while option six is loaded..." 6 60 0
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
