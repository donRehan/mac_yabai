autoload -U colors && colors
export XDG_CONFIG_HOME="$HOME/.config"
export BASH_SILENCE_DEPRECATION_WARNING=1
#export PS1='\[\033[31m\][\[\033[32m\]\[\033[1;33m\]\u\[\033[0m\]\[\033[32m\]@\[\033[1;34m\]donRehan\[\033[0m\]\[\033[31m\]:\[\033[35m\]\w\[\033[0m\]\[\033[31m\]]\$\[\033[0m\] '
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}donRehan %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
export CLICOLOR=1
export PATH=$HOME/.local/bin:$PATH
export MAVEN_HOME=/opt/apache-maven-3.8.4
export PATH=$PATH:~/jdk/

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Aliases
alias dk="cd $HOME/uni51t/Desk/"
alias nv="nvim -u ~/.config/nvim/init.lua"
alias nvim="nvim -u ~/.config/nvim/init.lua"
alias t="tree .macports"
alias ports="source ."
alias bach="cd ~/uni51t/Desk/myFork_MGraf"
alias sneps="cd /Users/alhussien/uni51t/Desk/sneps/Java-SNePS-3.0/src/sneps/snebr"
alias tmux="TERM=screen-256color-bce tmux"
alias rmd="sudo rm -r"
alias condainit="source ~/.condainitrc"
alias gs="git status"
alias sem="cd ~/../../Volumes/Rehan\ -\ Data/Semster\ 9/"
alias ai="cd ~/../../Volumes/Rehan\ -\ Data/Semster\ 9/AI/project2/"
alias uni="cd ~/uni51t/"
alias vi="vim"
alias t="tree ."
alias l="ls -l"
alias tmux="TERM=screen-256color-bce tmux"
alias neofetch="neofetch --ascii_distro debian"
alias apt="brew"

#functions
gh() {
  echo "Enter commit message: "
  read message
  git add .
  git commit -m "$message"
  git push origin main
}
ghb() {
  echo "Enter commit message: "
  read message
  echo "Enter Branch : "
  read branch
  git add .
  git commit -m "$message"
  git push origin $branch
}

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# Load zsh-syntax-highlighting; should be last.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
