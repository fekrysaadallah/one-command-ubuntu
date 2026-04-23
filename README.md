# one-command-ubuntu

`one-command-ubuntu` is a small, opinionated Ubuntu bootstrap script for developers deploying Docker-based apps on fresh Ubuntu servers.

It is designed for fresh Ubuntu VPS machines that will run Docker Compose workloads. The goal is simple: install a few common server dependencies so a new machine is ready for practical deployment work faster.

## Who This Is For

- Developers setting up a fresh Ubuntu server for Docker Compose deployments
- Small projects, side projects, client apps, and internal tools that run in containers
- People who want a lightweight starting point instead of repeating the same manual setup steps

## What It Installs / Configures

Today, the script can:

- Install Git
- Install Docker Engine
- Install the Docker Compose plugin
- Enable and start the Docker service
- Add your user to the `docker` group
- Optionally create swap

## Opinionated Defaults

This project keeps things simple:

- Containers are managed with Docker Compose
- The server starts clean, with minimal preinstalled tooling
- Setup is interactive, so you choose what gets installed

## Quick Start

Best used on a fresh Ubuntu server with a user that has `sudo` access.

```bash
sudo apt update
sudo apt install -y curl
curl -O https://raw.githubusercontent.com/fekrysaadallah/one-command-ubuntu/main/setup.sh
chmod +x setup.sh
./setup.sh
```

If you prefer using Git:

```bash
git clone https://github.com/fekrysaadallah/one-command-ubuntu.git
cd one-command-ubuntu
chmod +x setup.sh
./setup.sh
```

The script is interactive. It will ask whether you want to install Git, Docker, the Docker Compose plugin, and swap.

## Example Use Cases

- Preparing a fresh Ubuntu VPS before deploying an app with `docker compose up -d`
- Setting up a small client server with Git, Docker, and optional swap
- Creating a repeatable starting point for Ubuntu servers running containerized apps

## Safety Note

Read `setup.sh` before running it.

This script installs packages, adds the Docker APT repository, enables services, modifies group membership, and can create swap. Make sure you understand what it does before running it with `sudo` or as `root`.

## Contributing

Contributions are welcome if they keep the project focused and practical.

Useful contributions include:

- Fixing bugs in the setup flow
- Improving Ubuntu and Docker installation reliability
- Tightening the documentation
- Adding small features that help fresh-server Docker Compose setups
