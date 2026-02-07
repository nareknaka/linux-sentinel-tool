#!/bin/bash


# Script Name: setup.sh
# Description: Main entry point for the Linux Sentinel Tool.
#              Provides a menu-driven interface to run all modules.
# Author:      Narek <https://github.com/nareknaka>
# Date:        2026-02-06
# Version:     1.0.0

# Usage:       ./setup.sh
# Part of:     Linux Sentinel Tool



# Color definitions for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color (Reset)

# Function to display the banner
show_banner() {
    clear
    echo -e "${BLUE}==========================================${NC}"
    echo -e "${BLUE}       LINUX SENTINEL TOOL v1.0.0         ${NC}"
    echo -e "${BLUE}==========================================${NC}"
}
# Start an infinite loop to keep the menu running
while true; do
show_banner # Call baner function

# Dispaly menu options to the user 
echo "1) Install Dependencies"
echo "2) Run System Monitoring"
echo "3) Run Security Audit"
echo "4) Exit"
echo -n "Select an option: "

# Read user input into the 'choice' variable
read -r choice

case $choice in
    1)
        echo -e "${GREEN}Running Package Manager...${NC}"
        bash ./modules/packages.sh
        ;;
    2) 
        echo -e "${GREEN}Running System Monitor...${NC}"
        bash ./modules/monitor.sh      
        ;;
    3)
        echo -e "${GREEN}Running Security Audit...${NC}"
        bash ./modules/security.sh
        ;;
    4)
        echo -e "${RED}Exiting...Goodbye!${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}Invalid option. Please run the script again.${NC}"
        ;;
esac

# Wait for the user to press Enter so the output doesn't disappear
echo -e "\nPress Enter to return to menu..."
read -r 
done