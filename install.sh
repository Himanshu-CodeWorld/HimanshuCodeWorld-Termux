#!/usr/bin/env bash
set -e
clear
APP="Himanshu CodeWorld"
APP_DIR="$HOME/.Himanshu-CodeWorld"
TOOL_DIR="$HOME/.himuucw-tools"
TERMUX=false
[ -d "/data/data/com.termux/files/usr" ] && TERMUX=true

mkdir -p "$APP_DIR" "$TOOL_DIR"

# Required packages
if $TERMUX; then
  command -v curl >/dev/null 2>&1 || pkg install curl -y
  command -v git >/dev/null 2>&1 || pkg install git -y
  command -v zsh >/dev/null 2>&1 || pkg install zsh -y
  command -v tput >/dev/null 2>&1 || pkg install ncurses-utils -y
else
  command -v curl >/dev/null 2>&1 || { sudo apt-get update -y && sudo apt-get install -y curl; }
  command -v zsh >/dev/null 2>&1 || { sudo apt-get update -y && sudo apt-get install -y zsh; }
  command -v tput >/dev/null 2>&1 || { sudo apt-get install -y ncurses-bin; }
fi

# Install local tool files
cp -f files/help "$TOOL_DIR/help"
cp -f files/bname "$TOOL_DIR/bname"
cp -f files/update "$TOOL_DIR/update"
cp -f files/unstall "$TOOL_DIR/unstall"
cp -f files/chat "$TOOL_DIR/chat"
cp -f files/dev "$TOOL_DIR/dev"
chmod +x "$TOOL_DIR"/*

# Install zsh theme
ZSH_DIR="${ZSH:-$HOME/.oh-my-zsh}"
if [ -d "$ZSH_DIR" ]; then
  mkdir -p "$ZSH_DIR/custom/themes"
  cp -f files/.himuucw.zsh-theme "$ZSH_DIR/custom/themes/himuucw.zsh-theme"
fi

# Back up existing zshrc once
[ -f "$HOME/.zshrc" ] && [ ! -f "$HOME/.zshrc.hcw-backup" ] && cp "$HOME/.zshrc" "$HOME/.zshrc.hcw-backup"

# Append a managed block instead of overwriting the user's config
if ! grep -q "# >>> Himanshu CodeWorld >>>" "$HOME/.zshrc" 2>/dev/null; then
cat >> "$HOME/.zshrc" <<'EOF'

# >>> Himanshu CodeWorld >>>
export HCW_HOME="$HOME/.Himanshu-CodeWorld"
export HCW_TOOLS="$HOME/.himuucw-tools"
if [ -d "$HOME/.oh-my-zsh" ]; then
  ZSH_THEME="himuucw"
fi
alias help="$HCW_TOOLS/help"
alias bname="$HCW_TOOLS/bname"
alias update="$HCW_TOOLS/update"
alias unstall="$HCW_TOOLS/unstall"
alias chat="$HCW_TOOLS/chat"
alias dev="$HCW_TOOLS/dev"
alias report="$HCW_TOOLS/dev"
# <<< Himanshu CodeWorld <<<
EOF
fi

# Termux theme files
if $TERMUX; then
  mkdir -p "$HOME/.termux"
  cp -f files/colors.properties "$HOME/.termux/colors.properties" 2>/dev/null || true
  cp -f files/font.ttf "$HOME/.termux/font.ttf" 2>/dev/null || true
  command -v termux-reload-settings >/dev/null 2>&1 && termux-reload-settings || true
fi

echo
echo -e "\033[1;96m╔══════════════════════════════════════════════╗\033[0m"
echo -e "\033[1;96m║\033[1;92m      HIMANSHU CODEWORLD INSTALLED ✓         \033[1;96m║\033[0m"
echo -e "\033[1;96m╚══════════════════════════════════════════════╝\033[0m"
echo
echo -e "\033[1;92mCommands:\033[0m help  bname  update  chat  dev  unstall"
echo -e "\033[1;93mRestart your terminal or run: source ~/.zshrc\033[0m"
