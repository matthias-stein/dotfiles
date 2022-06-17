HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt extendedglob

autoload -Uz compinit

zstyle ':completion:*' menu select
zmodload zsh/complist

compinit

_comp_options=(globdots)

bindkey -v

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

source ~/data/dots/zsh/_src/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

alias ls='ls --color'

neofetch
fortune | cowsay -s -W 79 -f www | lolcat
print ""
print ""
