#!/bin/bash

# Update and upgrade packages
pkg update && pkg upgrade -y

# Dependencies
DEPENDENCIES=(
    git gh tree fd tmate android-tools python-pillow termux-tools termux-exec openssh openssl-tool root-repo tsu python wpa-supplicant pixiewps iw openssl zsh curl rxfetch tmux htop byobu jq wget bc proot
)

# Install dependencies if not already installed
for package in "${DEPENDENCIES[@]}"; do
    if ! command -v "$package" &>/dev/null; then
        pkg install "$package" -y
    fi
done

echo "All dependencies installed successfully!"

# OneShot repository
echo "Cloning OneShot repository..."
git clone https://github.com/tanvir-projects-archive/OneShot.git "$HOME/OneShot"

# Pixeldrain
echo "Downloading and setting up Pixeldrain..."
wget https://raw.githubusercontent.com/tanvirr007/scripts/main/scripts/pixeldrain.sh -O "/data/data/com.termux/files/usr/bin/pixeldrain" && chmod +x "/data/data/com.termux/files/usr/bin/pixeldrain"

# Gofile
echo "Downloading and setting up Gofile..."
wget https://raw.githubusercontent.com/tanvirr007/scripts/main/scripts/gofile.sh -O "/data/data/com.termux/files/usr/bin/gofile" && chmod +x "/data/data/com.termux/files/usr/bin/gofile"

echo "Setup completed successfully!"
