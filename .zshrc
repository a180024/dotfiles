# Aliases
alias brewpermission="sudo chown -R $(whoami) $(brew --prefix)/*"

# Shortcuts
function dudir() {
    du -k -s * | sort -k1 -g -r
}

function mkdircd () {
    mkdir -p "$@" && eval cd "\"\$$#\"";  
}

function multitail () {
    # When this exits, exit all background processes too.
    trap 'kill $(jobs -p)' EXIT
    for file in "$@"
    do
        tail -f $file &
    done
    wait #until CTRL+C
}

function psgrep () {
    ps aux | grep "$1" | grep -v 'grep'
}

function psterm() {
    [ ${#} -eq 0 ] && echo "usage: $FUNCNAME STRING" && return 0
    local pid
    pid=$(ps ax | grep "$1" | grep -v grep | awk '{ print $1 }')
    echo -e "terminating '$1' / process(es):\n$pid"
    kill -SIGTERM $PID
}

function gd() {
    preview="git diff $@ --color=always -- {-1}"
    git diff $@ --name-only | fzf -m --ansi --preview $preview
}

# VIM for bash
set -o vi

# Paths
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/mongodb/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Pipenv 
export WORKON_HOME=$HOME/Desktop/DEV/.virtualenvs

# GIT Auto-Completion
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
# `compinit` scans $fpath, so do this before calling it.
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Z
# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
	#Load rupa's z if installed
 	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# Powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Path to your oh-my-zsh installation.
export ZSH="/Users/davin/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
zsh-autosuggestions
fzf
)

# fzf plugin
export FZF_BASE=$HOME/.fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

source $ZSH/oh-my-zsh.sh
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
GITSTATUS_LOG_LEVEL=DEBUG

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

