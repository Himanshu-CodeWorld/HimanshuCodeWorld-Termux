# Himanshu CodeWorld — Zsh theme
autoload -Uz add-zsh-hook
setopt prompt_subst

_hcw_prompt() {
  local cwd="${PWD/#$HOME/~}"
  PROMPT='%F{green}[HIMANSHU%f〄%F{cyan}CODEWORLD%f]-[%F{yellow}'"$cwd"'%f]
%F{green}└────╼ %F{cyan}❯❯❯%f '
  RPROMPT='%F{blue}%D{%H:%M:%S}%f'
}
add-zsh-hook precmd _hcw_prompt
