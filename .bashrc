export BASH_SILENCE_DEPRECATION_WARNING=1
#export PS1='\[\033[31m\][\[\033[32m\]\[\033[1;33m\]\u\[\033[0m\]\[\033[32m\]@\[\033[1;34m\]donRehan\[\033[0m\]\[\033[31m\]:\[\033[35m\]\w\[\033[0m\]\[\033[31m\]]\$\[\033[0m\] '
export PS1='\[\033[31m\][\[\033[32m\]\[\033[1;33m\]\u\[\033[0m\]\[\033[32m\]@\[\033[1;34m\]donRehan\[\033[0m\]\[\033[31m\] \[\033[35m\]\w\[\033[0m\]\[\033[31m\]]\$\[\033[0m\] '
export CLICOLOR=1
export PATH=$HOME/.local/bin:$PATH
export MAVEN_HOME=/opt/apache-maven-3.8.4
export PATH=$PATH:~/jdk/

# vi mode
set -o vi

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
. "$HOME/.cargo/env"

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
