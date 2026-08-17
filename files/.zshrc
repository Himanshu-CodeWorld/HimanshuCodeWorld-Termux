ZSH_THEME="himanshucodeworld"

if [ -d "/data/data/com.termux/files/usr/" ]; then
    export ZSH=$HOME/.oh-my-zsh
    TOOLX_DIR="$HOME/.toolx"
    D1="$HOME/.termux"
    PLUGINS_DIR="/data/data/com.termux/files/home/.oh-my-zsh/plugins"
    alias rd='termux-reload-settings'
else
    export ZSH=$HOME/.oh-my-zsh
    TOOLX_DIR="$HOME/.toolx"
    D1="$HOME/.CODEX"
    PLUGINS_DIR="$HOME/.oh-my-zsh/plugins"
    alias rd='source ~/.zshrc 2>/dev/null'
fi

plugins=(git)

if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    source "$ZSH/oh-my-zsh.sh" >/dev/null 2>&1
fi

if [ -f "$PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" >/dev/null 2>&1
fi

if [ -f "$PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >/dev/null 2>&1
fi

if command -v lsd >/dev/null 2>&1; then
alias la='lsd -l --blocks size,name --color always | column -c $(tput cols)'
alias ls='lsd -l --blocks size,name --color always'
alias lt='lsd --tree --blocks size,name --color always --icon always'
fi

[ -f "$TOOLX_DIR/chat" ] && alias chat="$TOOLX_DIR/chat"
[ -f "$TOOLX_DIR/unstall" ] && alias unstall="$TOOLX_DIR/unstall"
[ -f "$TOOLX_DIR/dev" ] && alias dev="$TOOLX_DIR/dev"
[ -f "$TOOLX_DIR/dev" ] && alias report="$TOOLX_DIR/dev"
[ -f "$TOOLX_DIR/update" ] && alias update="$TOOLX_DIR/update"
[ -f "$TOOLX_DIR/bname" ] && alias bname="$TOOLX_DIR/bname"
[ -f "$TOOLX_DIR/help" ] && alias help="$TOOLX_DIR/help"

r='\033[91m'
p='\033[1;95m'
y='\033[93m'
g='\033[92m'
n='\033[0m'
b='\033[94m'
c='\033[96m'

X='\033[1;92m[\033[1;00m⎯꯭̽𓆩\033[1;92m]\033[1;96m'
D='\033[1;92m[\033[1;00m〄\033[1;92m]\033[1;93m'
E='\033[1;92m[\033[1;00m×\033[1;92m]\033[1;91m'
A='\033[1;92m[\033[1;00m+\033[1;92m]\033[1;92m'
C='\033[1;92m[\033[1;00m</>\033[1;32m]\033[1;92m'
lm='\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m〄\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'
dm='\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m〄\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'
aHELL="\uf489"
USER="\uf007"
TERMINAL="\ue7a2"
PKGS="\uf8d6"
UPT="\uf49b"
CAL="\uf073"

bol='\033[1m'
bold="${bol}\e[4m"
THRESHOLD=100

check_disk_usage() {
    local threshold=${1:-$THRESHOLD}
    local total_size
    local used_size
    local disk_usage
    
    total_size=$(df -h "$HOME" | awk 'NR==2 {print $2}')
    used_size=$(df -h "$HOME" | awk 'NR==2 {print $3}')
    disk_usage=$(df "$HOME" | awk 'NR==2 {print $5}' | sed 's/%//g')

    if [ -z "$disk_usage" ]; then disk_usage=0; fi 

    if [ "$disk_usage" -ge "$threshold" ]; then
        echo -e " ${g}[${n}\uf0a0${g}] ${r}WARN: ${c}Disk Full ${g}${disk_usage}% ${c}| ${c}U${g}${used_size} ${c}of ${c}T${g}${total_size}"
    else
        echo -e " ${g}[${n}\uf0e7${g}] ${c}Disk usage: ${g}${disk_usage}% ${c}| ${c}U${g}${used_size} ${c}of ${c}T${g}${total_size}"
    fi
}

banner() {
command clear
echo
echo -e "    ${y}██╗  ██╗██╗███╗   ███╗ █████╗ ███╗   ██╗███████╗██╗  ██╗██╗   ██╗"
echo -e "    ${y}██║  ██║██║████╗ ████║██╔══██╗████╗  ██║██╔════╝██║  ██║██║   ██║"
echo -e "    ${c}███████║██║██╔████╔██║███████║██╔██╗ ██║███████╗███████║██║   ██║"
echo -e "    ${c}██╔══██║██║██║╚██╔╝██║██╔══██║██║╚██╗██║╚════██║██╔══██║██║   ██║"
echo -e "    ${c}██║  ██║██║██║ ╚═╝ ██║██║  ██║██║ ╚████║███████║██║  ██║╚██████╔╝${n}"    fi

    PUT 13 1
    NORM
}

smart_clear() {
    if [ "$1" = "n" ]; then
        command clear
    else
        command clear
        draw_dashboard
    fi
}
alias clear='smart_clear'

udp
HIDECURSOR
load
command clear
draw_dashboard
