#!/bin/bash



# Script Name: packages.sh
# Description: Checks and installs required dependencies (bc, curl, ufw, etc.)
# Author:      Narek <https://github.com/nareknaka>
# Date:        2026-02-05
# Version:     1.0.0

# Usage:       ./modules/packages.sh
# Part of:     Linux Sentinel Tool



#!/bin/bash

# Define an array of required packages
PKGS=("bc" "ufw" "curl" "htop" "net-tools")

echo "Checking packages..."
