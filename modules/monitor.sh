#!/bin/bash



# Script Name: monitor.sh
# Description: Monitors system resources (CPU, Ram, Disk) and logs warnings.
# Author:      Narek <https://github.com/nareknaka>
# Date:        2026-01-31
# Version:     1.1.0

# Usage:       ./modules/monitor.sh
# Part of:     Linux Sentinel Tool



# Define the path to the log file
LOG_FILE="../logs/system_monitor.log"

# Generate a current timestamp
TIMESTAMP=$(TZ="Asia/Yerevan" date "+%Y-%m-%d %H:%M:%S")

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



# 2. Collect current metrics
CPU=$(cpu_usage)
MEM=$(memory_usage)
DISK=$(disk_usage)

# 3. Write metrics to log file
echo "CPU: $CPU% | MEM: $MEM% | DISK: $DISK%" >> "$LOG_FILE"



# 4. Check for limits (Alerts)
if (( $(echo "$CPU > 80" | bc -l) )); then
    echo "[$TIMESTAMP] [WARNING] High CPU Usage: $CPU%" >> "$LOG_FILE"
fi

if (( $(echo "$MEM > 75" | bc -l) )); then
    echo "[$TIMESTAMP] [WARNING] High Memory Usage: $MEM%" >> "$LOG_FILE"
fi

if [[ "$DISK" -gt 85 ]]; then
    echo "[$TIMESTAMP] [WARNING] Disk Space Critical: $DISK%" >> "$LOG_FILE"
fi