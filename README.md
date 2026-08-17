# HimanshuCodeWorld-Termux

A customized Termux/Linux shell environment inspired by the original CODEX setup, rebranded for **HimanshuCodeWorld**.

## Features
- HimanshuCodeWorld Zsh theme and terminal prompt
- Termux and Debian/Ubuntu Linux support
- Oh My Zsh, autosuggestions and syntax highlighting
- Useful commands: `help`, `bname`, `update`, `chat`, `dev`, `report`, `code`, `simu`
- Terminal dashboard with device and disk information
- Custom font and Termux colors
- Update system configurable through environment variables

## Install on Termux

```bash
pkg update -y
pkg install git -y
git clone https://github.com/himuucodes/HimanshuCodeWorld-Termux.git
cd HimanshuCodeWorld-Termux
chmod +x install.sh
bash install.sh
```

If your repository uses a different GitHub URL, replace the clone URL with your repository URL.

## Commands

```text
help      Show HimanshuCodeWorld commands
bname     Change the terminal banner name
update    Update installed tools
chat      Open the chat utility
dev       Developer/report utility
report    Developer/report utility
code      Code utility
simu      Terminal simulator
```

## Update configuration

The installer/update script supports:

```bash
export HIMANSHUCODEWORLD_REPO="https://github.com/himuucodes/HimanshuCodeWorld-Termux.git"
export HIMANSHUCODEWORLD_SERVER="https://himuucodes-server.onrender.com"
```

> Review external URLs before publishing your own fork.
