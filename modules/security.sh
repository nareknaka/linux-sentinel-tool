#!/bin/bash

echo "--- Sentinel Security Check ---"
sudo ufw status

echo "--- Sudo Privileged Users ---"
getent group sudo


echo "--- Open Network Ports ---"

ss -tuln
