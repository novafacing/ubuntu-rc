########################
# Settings and Exports #
########################

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi
export UPDATE_ZSH_DAYS=13
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export NVM_DIR="/home/$USER/.nvm"
export WINEPATH="/usr/x86_64-w64-mingw32/lib;/usr/lib/gcc/x86_64-w64-mingw32/9.3-posix"
export ZSH="$HOME/.oh-my-zsh/"
export DOCKER_BUILDKIT=1
export GPG_TTY=$(tty)

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
    git 
    #cabal 
    rust 
    command-not-found 
    docker 
    docker-compose 
    extract 
    nvm
    sudo
    #tmux
)

#########
# Paths #
#########
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PATH:$HOME/install/ghidra/"
export PATH="$PATH:$HOME/install/binaryninja/"
export PATH="$PATH:$HOME/install/wally/"
export PATH="$PATH:/opt/gradle/gradle-7.4.2/bin"

###########
# Aliases #
###########
alias gdb="gdb -q"
alias df="duf"
alias du="dust"
alias ls="lsd"
alias copy="xclip -selection clipboard"
alias paste="xclip -selection clipboard -o"
alias pm="python3 -m"
alias pip="python3 -m pip"
alias ptpython="python3 -m ptpython"
alias fetchall='git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done && git fetch --all && git pull --all'
alias pip_reinstall="python3 -m pip install --upgrade --force-reinstall --no-deps"

#############
# Functions #
#############
function hex() {
    python3 -c "print(hex($1))"
}

#######################
# Imports and Scripts #
#######################
source $ZSH/oh-my-zsh.sh
source ~/.local/bin/z.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /home/novafacing/.local/bin/virtualenvwrapper.sh
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(starship init zsh)"
eval "$(atuin init zsh)"

########################
# Standalone Settings  #
########################
export PATH="$PATH:./node_modules/.bin"
