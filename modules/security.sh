#!/bin/bash

# Script Name: security.sh
# Description: Performs basic security audits (Firewall, Sudo users, Open ports).
# Author:      Narek <https://github.com/nareknaka>
# Date:        2026-01-31
# Version:     1.0.1

# Usage:       ./modules/security.sh
# Part of:     Linux Sentinel Tool


echo "--- Sentinel Security Check ---"
sudo ufw status

echo "--- Sudo Privileged Users ---"
getent group sudo


echo "--- Open Network Ports ---"

ss -tuln
