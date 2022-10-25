  autoload -Uz colors && colors

doNotDir () {
    declare -a text;
    text=(\
        "Thou shalt be using LS and LS only!"\
        "You like DIR? Go use Windows!"\
        "This is the congreation of the LS! Be gone worshipper of the DIR!"\
        "DIR command not found, do you mean LS?"\
        "In my shell you will use LS!"\
    );
    rand=$((RANDOM%5+1));
    # printf "${text}\n";
    # printf "rand=${rand}\n";
    printf $fg_bold[red];
    # printf "${text[$rand]}\n";
    cowsay -d "${text[$rand]}";
    printf $reset_color;
    return 127;  # program not found
}
doNotApt () {
    declare -a text;
    text=(\
        "Thou shalt be using NALA and NALA only!"\
        "You like APT? Go use default Debian!"\
        "This is the congreation of the NALA! Be gone worshipper of the APT!"\
        "APT command not found, do you mean NALA?"\
        "In my shell you will use NALA!"\
    );
    rand=$((RANDOM%5+1));
    printf $fg_bold[red];
    cowsay -d "${text[$rand]}";
    printf $reset_color;
    return 127;  # program not found
}

  HISTFILE=~/.config/zsh/.histfile
  HISTSIZE=1000
  SAVEHIST=1000

  setopt extended_glob
  setopt globdots

  autoload -Uz compinit

  zstyle ':completion:*' menu select
  zmodload zsh/complist

  compinit

  _comp_options=(globdots)

if [[ -x /usr/lib/command-not-found ]] ; then
        function command_not_found_handler() {
                /usr/lib/command-not-found --no-failure-msg -- $1
        }
fi

  bindkey -v

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

  source ~/data/dots/zsh/_src/powerlevel10k/powerlevel10k.zsh-theme
  [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

  alias dir='doNotDir'
  alias apt='doNotApt'
  alias grep='grep --color'
  alias ls='ls --color'
  alias mpv='flatpak run io.mpv.Mpv'

neofetch
fortune | cowsay -s -W 79 -f www | lolcat
print ""
print ""

source $HOME/.zplug/init.zsh

zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

zplug load
