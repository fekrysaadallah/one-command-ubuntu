#!/usr/bin/env bash

set -e

# ---------- Helpers ----------

ask_yes_no() {
    local prompt="$1"
    while true; do
        read -p "$prompt (y/n): " choice
        case "$choice" in
            y|Y ) return 0 ;;
            n|N ) return 1 ;;
            * ) echo "Please answer y or n." ;;
        esac
    done
}

install_git() {
    echo "Installing Git..."
    sudo apt update
    sudo apt install -y git
    git --version
}

install_docker() {
    echo "Installing Docker..."

    sudo apt update
    sudo apt install -y ca-certificates curl gnupg

    sudo install -m 0755 -d /etc/apt/keyrings

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    sudo systemctl enable docker
    sudo systemctl start docker

    sudo usermod -aG docker $USER

    echo "Docker installed successfully."
}

install_docker_compose_only() {
    echo "Installing Docker Compose plugin..."
    sudo apt update
    sudo apt install -y docker-compose-plugin
}

create_swap() {
    read -p "Enter swap size (e.g., 1G, 2G, 4G): " SWAP_SIZE

    if [ -f /swapfile ]; then
        echo "Swap already exists. Skipping."
        return
    fi

    echo "Creating swap file of size $SWAP_SIZE..."

    sudo fallocate -l $SWAP_SIZE /swapfile
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile

    echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

    echo "Swap created successfully."
    free -h
}

# ---------- Main ----------

echo "Ubuntu Server Setup Script"
echo "---------------------------"

if ask_yes_no "Install Git?"; then
    install_git
fi

if ask_yes_no "Install Docker?"; then
    install_docker
fi

if ask_yes_no "Install Docker Compose plugin only?"; then
    install_docker_compose_only
fi

if ask_yes_no "Create virtual memory (swap)?"; then
    create_swap
fi

echo "Setup completed."