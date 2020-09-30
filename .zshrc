# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="/home/flynn/.oh-my-zsh"
export EDITOR=vim

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="agnoster"

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
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display r.e.d. dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git zsh-autosuggestions docker)

source $ZSH/oh-my-zsh.sh

unsetopt share_history # disable history shared between open terminals

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

bindkey '[3^' kill-word
bindkey '[33~' backward-kill-word

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$PATH:/home/$USER/.local/bin:/home/flynn/.gem/ruby/2.7.0/bin"

# R.O.S.
export LC_NUMERIC="en_GB.UTF-8"

# source /opt/ros/melodic/setup.zsh

# # current_ros_ws="/home/flynn/sources/ros_workspaces/aragog_ws"
# current_ros_ws="/home/flynn/sources/ros_workspaces/ur5_ws"
# # current_ros_ws="/home/flynn/sources/ros_workspaces/driverless_ws"
# # current_ros_ws="/home/flynn/sources/ros_workspaces/experis_ws"

# source ${current_ros_ws}/devel/setup.zsh
# alias cat-make="cd ${current_ros_ws} && catkin build && cd - > /dev/null"
# alias ros-cd="cd ${current_ros_ws}/src"

# alias rqt-gui='rosrun rqt_gui rqt_gui'
# alias rqt-graph='rosrun rqt_graph rqt_graph &' # show links between published and subscribed topics
# alias rqt-plot='rosrun rqt_plot rqt_plot &' # plot published topics
# alias rqt-console='rosrun rqt_console rqt_console &' # debug GUI
# # alias ros-logger-level='rosrun rqt_logger_level rqt_logger_level &' # let change log level shown in ros-console
# alias ros-topic-list='rostopic list -v'
# # alias ros-topic-echo='rostopic echo'
# alias ros-call='rosservice call'
# alias ros-bag-all='cd ~/bags_ros && rosbag record -a'
# ros-service-type() { rosservice type $1 | rossrv show; }
# ros-topic-type() { rostopic type $1 | rosmsg show; }
# alias ros-tf-tree='rosrun rqt_tf_tree rqt_tf_tree' # GUI tree of transformations
# alias ros-tf-echo='rosrun tf tf_echo' # echo transform between arg_1 and arg_2
# alias xacro2urdf='rosrun xacro xacro'
# alias urdf2pdf='urdf_to_graphiz'
# alias ros-connect-to-vm='export ROS_HOSTNAME=192.168.56.1 && export ROS_MASTER_URI=http://192.168.56.101:11311'

# systemctl autocompletition patch
_systemctl_unit_state() {
  typeset -gA _sys_unit_state
  _sys_unit_state=( $(__systemctl list-unit-files "$PREFIX*" | awk '{print $1, $2}') ) }

# general purpose aliases
alias install='sudo pacman -S'
#alias search='sudo pacman -Ss'
alias yinstall='yay -S'
alias search='yay -Ss'
alias remove='sudo pacman -Rs'
alias clean='conda clean -a && sudo pacman -Scc && yay -Sc --aur'
alias d2u='dos2unix'
alias cat='pygmentize -g'
alias svim='sudoedit'
alias up='sudo pacman -Syu && yay -Syu'
alias off='poweroff'
# alias sens='s-tui'
alias suggest-pass='apg -s -a 1 -m 15 -M SNCL'
alias du='du -hs'
alias df='df -h | grep -v snap'
alias lsblk='lsblk | grep -v snap'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# git aliases
alias gadd='git add'
alias gcom='git commit'
alias gcomall='git commit -a'
alias glog='git log --oneline --graph --decorate --all'
alias gpush='git push'
alias gpull='git pull'
alias gstat='git status'
alias gfetch='git fetch --all -p -P'

# GPU integration
alias nv-processes='optirun nvidia-smi'
alias gpu='optirun' # to use Nvidia for the subsequent task (e.g. "gpu glxgears")
alias gpu-hidden='optirun -b none env DISPLAY=:8' # to run something headless with Nvidia (no screen output, faster than anything)
# alias check-gpu='cat /proc/acpi/bbswitch'
alias check-gpu='optirun --status'
# complete -cf gpu # auto-completition

# # Install Ruby Gems to ~/gems
# export GEM_HOME=$HOME/gems
# export PATH=$HOME/gems/bin:$PATH

# Docker
# alias docker-remove-all-containers='docker container rm $(docker container ls -a -q)'
alias docker-remove-all-containers='docker rm $(docker container ls -a | grep -v "ros-melodic" | awk "NR>1 {print $1}")'
alias docker-remove-none-images='docker rmi $(docker images -qa -f 'dangling=true')'
# alias go-realsense="cd ~/docks/ros_kinetic_realsense/ros_ws_src/realsense/realsense_camera && rm launch/r200_handler.launch && ln ~/aragog_ws/src/hexapod_ros_project/launch/r200_handler.launch ./launch/r200_handler.launch && optirun ~/docks/ros_kinetic_realsense/go.sh"
# alias kali-dock="cd docks/kali/ && ./go.sh"
alias ros-docker='~/docks/ros_melodic/go.sh'

# # CUDA (currently 10.2, you can check with 'cat /usr/lib/cuda/version.txt')
# export PATH="/usr/local/cuda/bin:$PATH"
# export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# # MSI perkey-RGB
# alias perkey-off="msi-perkeyrgb --model GS63 -c /home/flynn/sources/compiled_from_source/msi-perkeyrgb/colors/off"
# alias perkey-on="msi-perkeyrgb --model GS63 -c /home/flynn/sources/compiled_from_source/msi-perkeyrgb/colors/light_blue"
# alias perkey-magic="msi-perkeyrgb --model GS63 -p default"
# alias perkey-aqua="msi-perkeyrgb --model GS63 -p aqua"

# other useful aliases
alias jup-casadi='conda activate casadi && cd ~/sources/jupyter_projects && jupyter lab && cd - > /dev/null && conda deactivate'
# alias apktool="docker run --rm -v `pwd`:/app theanam/apktool"
alias transen='trans -brief -shell en:it'
alias transit='trans -brief -shell it:en'

alias screeps='optirun /home/flynn/.local/share/Steam/steamapps/common/Screeps/nw &'

alias eteam-server='ssh -p 430 mmugnai@131.114.72.123'
alias lab-server='ssh michael.mugnai@10.30.5.226'
