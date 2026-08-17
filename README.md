# Himanshu CodeWorld

A clean, cross-platform terminal customization for **Termux and Linux**, inspired by the original CODEX-style setup.

## Features

- HIMANSHU CODEWORLD Zsh prompt
- Device and disk information
- `help`, `bname`, `update`, `chat`, `dev`, `report`, `unstall`
- Termux colors/font support
- Does not overwrite your existing `.zshrc`
- No obfuscated payloads or hidden network updater

## Install — Termux

```bash
pkg update -y
pkg install git -y
git clone <your-repository-url>
cd Himanshu-CodeWorld
chmod +x install.sh files/*
bash install.sh
```

## Install — Ubuntu/Debian

```bash
sudo apt update
sudo apt install -y git zsh curl
git clone <your-repository-url>
cd Himanshu-CodeWorld
chmod +x install.sh files/*
bash install.sh
```

Restart the terminal, then run:

```bash
help
```
