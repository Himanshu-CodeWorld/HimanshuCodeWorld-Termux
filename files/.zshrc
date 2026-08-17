# Himanshu CodeWorld terminal theme
export HCW_HOME="${HCW_HOME:-$HOME/.Himanshu-CodeWorld}"
export HCW_TOOLS="${HCW_TOOLS:-$HOME/.himuucw-tools}"

if [ -d "$HOME/.oh-my-zsh" ]; then
  ZSH_THEME="himuucw"
fi

plugins=(git)

if [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
  source "$HOME/.oh-my-zsh/oh-my-zsh.sh"
fi

[ -f "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -f "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

alias help="$HCW_TOOLS/help"
alias bname="$HCW_TOOLS/bname"
alias update="$HCW_TOOLS/update"
alias unstall="$HCW_TOOLS/unstall"
alias chat="$HCW_TOOLS/chat"
alias dev="$HCW_TOOLS/dev"
alias report="$HCW_TOOLS/dev"
