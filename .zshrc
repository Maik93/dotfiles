# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX=true

export ZSH="$HOME/.oh-my-zsh"
export LC_NUMERIC="en_GB.UTF-8"

# local (user) bin folder and Rust (cargo bin folder)
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# Go path
export GOPATH=$HOME/.local/go
export PATH="$PATH:$GOPATH/bin"

if [[ $TERM = 'xterm-kitty' || $TERM = 'xterm-256color' || $TERM = 'screen-256color' ]]; then
    export EDITOR=nvim
    alias vim='nvim'
else
    export EDITOR=vim
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
#ZSH_THEME="af-magic"
ZSH_THEME="afowler"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display r.e.d. dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions docker colored-man-pages elapsed-time)

# zoxide integration
eval "$(zoxide init zsh)"

# regenerate .zcompdump only if older than a day
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

source $ZSH/oh-my-zsh.sh

# Set window title as the hostname
title $HOST

setopt hist_ignore_space # do not record commands that start with spaces
# now if you write ' unset HISTFILE' both this command and the history of the current terminal from now on will not be stored
alias incognito=' unset HISTFILE'

unsetopt share_history # disable history shared between open terminals

ZSH_ELAPSED_TIME_EXCLUDE=(cd vim bat less man htop btop ranger yazi tmux ssh)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

bindkey '[3^' kill-word
bindkey '[33~' backward-kill-word

# systemctl autocompletition patch
_systemctl_unit_state() {
  typeset -gA _sys_unit_state
  _sys_unit_state=( $(__systemctl list-unit-files "$PREFIX*" | awk '{print $1, $2}') ) }

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

[ -f /home/$USER/.config/zsh_sources/aliases ] && source /home/$USER/.config/zsh_sources/aliases
[ -f /home/$USER/.config/zsh_sources/private_aliases ] && source /home/$USER/.config/zsh_sources/private_aliases

# Git aliases
alias gadd='git add'
alias gcom='git commit'
alias gcomall='git commit -a'
alias glog='git log --oneline --graph --decorate --all'
alias gpush='git push && git push --tags'
alias gpull='git pull'
alias gstat='git status'
alias gfetch='git fetch --all -p -P'

# Docker utilities
alias docker-remove-none-images='docker rmi $(docker images -qa -f 'dangling=true')'
docker-all-containers() {
  [ $# -ne 1 ] && echo "Usage: docker-all-containers [start|stop|rm]" && return 1
  docker $1 $(docker container ls -a | awk "NR>1 {print $ 1}")
}

# Other useful aliases
alias qrencode='qrencode -t ANSIUTF8'
alias update-completion='rm -f ~/.zcompdump* && compinit'

# General purpose aliases
mkcd() { mkdir -p $1 && cd $1; }
cdtmp() { d=$(mktemp -d -t XXXX); cd $d }
alias svim='sudoedit'
alias reboot='sudo reboot'
alias off='sudo poweroff'
#alias sens='s-tui'
alias suggest-pass='apg -s -a 1 -m 15 -M SNCL'
alias du='du -hs'
alias df='df -h | grep -v snap'
alias lsblk='lsblk | grep -v snap'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias chmox='chmod +x'
alias ip='ip --color=auto'

# General purpose functions
ranger() {
  if [ -n "$TMUX" ]; then
	/usr/bin/ranger
  else
	tmux new-session /usr/bin/ranger
  fi
}
7zc() {
  echo "==> Compressing '$1' in '$1.7z'"
  7z a -mmt=10 -mx=9 $1.7z $1
}
# Yazi
function y() {
  if [ -n "$TMUX" ]; then
	# Run yazi and keep the pwd on exit (remaining in tmux)
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
  else
	# Run yazi in tmux and exit
	tmux new-session yazi
  fi
}
tarzst() {
  num_files=`find $1 | wc -w`
  echo "==> Compressing '$1' in '$1.tar.zst'"
  tar cv -I zstdmt -f $1.tar.zst $1 | pv -lep -s $num_files >/dev/null
}
paste-file() {
  echo "==> Pasting '$1' content over ix.io..."
  noglob cat $1 |& curl -F 'f:1=<-' ix.io
}

# Tmux: kill pane
killp () {
    if [ $# -eq 0 ]; then
        echo "The command killp() needs an argument, but none was provided!";
        return;
    else
        pes=$1;
    fi;
    for child in $(ps -o pid,ppid -ax | awk "{ if ( \$2 == $pes ) { print \$1 }}");
    do
        killp $child;
    done;
    kill -9 "$1" > /dev/null 2> /dev/null
}

# Admin utility functions
mount-as-user() {
  sudo mount -o rw,nosuid,nodev,relatime,uid=$(id -u),gid=$(id -g),fmask=0022,dmask=0022 $1 $2
}

