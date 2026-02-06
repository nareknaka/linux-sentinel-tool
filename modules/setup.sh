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

show_banner