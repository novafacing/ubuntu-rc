if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/novafacing/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=13

COMPLETION_WAITING_DOTS="true"

plugins=(
	git 
	cabal 
	cargo 
	command-not-found 
	docker 
	docker-compose 
	extract 
	nvm
	sudo
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

PATH=$PATH:/home/novafacing/.local/bin
PATH=$PATH:/opt/hopper-v4/bin/
# export PYTHONSTARTUP=$HOME/.pythonrc.py
export PATH=$PATH:/usr/local/go/bin
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /home/novafacing/.local/bin/virtualenvwrapper.sh

##################
# Aliases        #
##################
alias gdb="gdb -q"
alias df="duf"
alias du="dust"
alias ls="exa"
alias copy="xclip -selection clipboard"
alias paste="xclip -selection clipboard -o"
alias python3="bpython"
alias python="bpython"
# alias docker="podman"
source ~/.local/bin/z.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
