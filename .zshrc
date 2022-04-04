if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export TERM=xterm-kitty
#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_AUTOCONNECT=false
#ZSH_TMUX_FIXTERM=true
#ZSH_TMUX_UNICODE=true

export ZSH="/home/novafacing/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=13

COMPLETION_WAITING_DOTS="true"

plugins=(
    zsh-autosuggestions
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

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

PATH=$PATH:/home/novafacing/.local/bin
PATH=$PATH:/home/novafacing/.local/bin/nu
PATH=$PATH:/opt/hopper-v4/bin/
PATH="$PATH:$HOME/hub/AFLplusplus"
PYTHONPATH=$PYTHONPATH:~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/etc
PATH=$PATH:/home/novafacing/.local/share/yabridge/
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
alias pm="\python3 -m"
alias pip="\python3 -m pip"
alias ptpython="python3 -m ptpython"
alias fetchall='git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done && git fetch --all && git pull --all'
alias pip_reinstall="python3 -m pip install --upgrade --force-reinstall --no-deps"
# alias docker="podman"
source ~/.local/bin/z.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export WINEPATH="/usr/x86_64-w64-mingw32/lib;/usr/lib/gcc/x86_64-w64-mingw32/9.3-posix"


export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/hub/codeql-home/codeql:$PATH"
export PATH="$HOME/hub/depot_tools:$PATH"
export NVM_DIR="/home/$USER/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export DOCKER_BUILDKIT=1
alias gm=/home/novafacing/hub/v8/v8/tools/dev/gm.py

function hex() {
    python3 -c "print(hex($1))"
}

############################################
function chess_reset_volumes() {
   volumes="chess_challenge_broker chess_chess_asu chess_minio_volume chess_mosquitto_data_volume chess_mosquitto_log_volume chess_postgres_db_volume"
   for v in $volumes; do
      docker volume rm $v
      docker volume create $v
   done
}

function chess_update() {
   docker stack rm chess
   sleep 20s # https://github.com/docker/cli/issues/373
   chess_reset_volumes
   docker compose build $@
   docker compose pull challenge-broker
   docker stack deploy chess -c docker-compose.yml
}

PATH="/home/novafacing/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/novafacing/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/novafacing/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/novafacing/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/novafacing/perl5"; export PERL_MM_OPT;
