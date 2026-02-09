#!/bin/bash

# Script Name: security.sh
# Description: Performs basic security audits (Firewall, Sudo users, Open ports).
# Author:      Narek <https://github.com/nareknaka>
# Date:        2026-01-31
# Version:     1.0.1

# Usage:       ./modules/security.sh
# Part of:     Linux Sentinel Tool


# 1. Define Log File and Timestamp
SEC_LOG="./logs/security_audit.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")


# Start logging the session
echo "-------------------------------------------" >> "$SEC_LOG"
echo "Security Audit Started at: $TIMESTAMP" >> "$SEC_LOG"
echo "-------------------------------------------" >> "$SEC_LOG"

# 2. Check Firewall (UFW) Status
# Ensures the system is protected by a firewall
echo -e "\n[!] Checking Firewall (UFW) Status..." | tee -a "$SEC_LOG"
echo "--- Sentinel Security Check ---"
sudo ufw status | tee -a "$SEC_LOG"

# 3. Check for Sudo Privileged Users
# Lists users who have administrative rights
echo -e "\n[!] Checking Sudo Privileged Users..." | tee -a "$SEC_LOG"
echo "--- Sudo Privileged Users ---"
getent group sudo | awk -F: '{print $4}' | tee -a "$SEC_LOG"


# 4. Check for Open Network Ports (Listening only)
# Uses 'ss' to find services waiting for network connections
echo -e "\n[!] Checking Open Network Ports (Listening)..." | tee -a "$SEC_LOG"
ss -tuln | grep LISTEN | tee -a "$SEC_LOG"

echo -e "\n--- Audit Complete. Results saved to $SEC_LOG ---"