#!/bin/bash

# Upgrade LMDE 6 to LMDE 7 Script

# Function to display messages
function msg {
    echo -e "\n\033[1;32m$1\033[0m\n"
}

msg "Starting upgrade process..."

# Update the package lists
msg "Updating package lists..."
sudo apt update && sudo apt upgrade -y

# Perform a full upgrade
msg "Performing a full upgrade..."
sudo apt full-upgrade -y

# Clean up unnecessary packages
msg "Removing unnecessary packages..."
sudo apt autoremove -y

# Edit sources.list for LMDE 7
msg "Updating sources list..."
sudo sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list

# Update the package lists again for LMDE 7
msg "Updating package lists for LMDE 7..."
sudo apt update

# Perform a full upgrade to LMDE 7
msg "Upgrading to LMDE 7..."
sudo apt full-upgrade -y

# Clean up after upgrade
msg "Cleaning up..."
sudo apt autoremove -y

# Reboot the system
msg "Rebooting the system..."
sudo reboot

msg "Upgrade process completed."

