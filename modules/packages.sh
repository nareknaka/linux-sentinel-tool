#!/bin/bash



# Script Name: packages.sh
# Description: Checks and installs required dependencies (bc, curl, ufw, etc.)
# Author:      Narek <https://github.com/nareknaka>
# Date:        2026-02-05
# Version:     1.0.0

# Usage:       ./modules/packages.sh
# Part of:     Linux Sentinel Tool




# Define an array of required packages
PKGS=("bc" "ufw" "curl" "htop" "net-tools")

echo "Checking packages..."

# Update package lists and upgrade existing packages to the latest versions
sudo apt update && sudo apt upgrade -y 

# Loop through each package in the array
for pkg in "${PKGS[@]}"; do

    # Check if the package is already installed using dpkg
    # grep -q searches quietly; if the pattern is found, the exit code is 0 (success)
    if ! dpkg -l | grep -q "^ii  $pkg "; then
        # If the package is not found, print a message and install it
        echo "$pkg is not installed. installing..."
        sudo apt install -y "$pkg"
    else
        # If the package is already installed, notify the user
        echo "[ok] $pkg is already there."
    fi
done