#!/bin/bash



# Script Name: monitor.sh
# Description: Monitors system resurces (Ram, Disk) and logs warnings.
# Author:      Narek <https://github.com/nareknaka>
# Date:        2026-01-31
# Version:     1.0.0

# Usage:       ./modules/monitor.sh
# Part of:     Linux Sentinel Tool



# Define the path to the log file
LOG_FILE="../logs/system_monitor.log"

# Generate a current timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Log the execution start time to the file
echo "--- Check started at: $TIMESTAMP ---" >> "$LOG_FILE"



# 1. Functions to get system data
cpu_usage() {
    top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}'

}

memory_usage() {
    free | awk '/Mem/ {printf "%.2f", $3/$2 * 100}'

}

disk_usage() {
    df / | awk 'NR==2 {print $5}' | sed 's/%//'
}