# One Command Ubuntu 🚀

Turn a fresh Ubuntu server into a ready-to-use development environment with one command.

---

## ✨ Features

- Install Git
- Install Docker & Docker Compose
- Setup swap memory
- System update & essential packages

---

## ⚡ Quick Start (No Git required)

Run this on a fresh Ubuntu server:

```bash
sudo apt update
sudo apt install -y curl
curl -O https://raw.githubusercontent.com/fekrysaadallah/one-command-ubuntu/main/setup.sh
chmod +x setup.sh
./setup.sh
```

---

## 🔁 Alternative (Using Git)

If Git is already installed:

```bash
git clone https://github.com/fekrysaadallah/one-command-ubuntu.git
cd one-command-ubuntu
chmod +x setup.sh
./setup.sh
```

---

## 🧩 What This Script Does

This script automates common setup steps for a fresh Ubuntu system, including:

- Installing development tools
- Preparing Docker environment
- Configuring system essentials
- Reducing repetitive manual setup work

---

## ⚠️ Notes

- Designed for **fresh Ubuntu installations**
- You may need to run with `sudo`

---

## 📌 Future Improvements

- Add optional flags (e.g. `--docker`, `--git`)
- Add logging output
- Improve error handling
- Support more tools and packages

---

## 📄 License

This project is licensed under the MIT License.
