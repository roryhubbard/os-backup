# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\e[32m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$ '

alias vi="nvim"
alias julia="~/julia-1.7.0/bin/julia"

#export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORM=xcb # gazebo doesn't work on wayland
export BEMENU_BACKEND=wayland
export XDG_CURRENT_DESKTOP=sway
export VISUAL=nvim
export EDITOR="$VISUAL"
export GRB_LICENSE_FILE=/opt/gurobi950/gurobi.lic
export MOZ_ENABLE_WAYLAND=1
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/chub/.mujoco/mujoco200/bin

if [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chub/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chub/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chub/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chub/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ROS
#export ROS_VERSION=2
#export ROS_PYTHON_VERSION=3
#export ROS_DISTRO=galactic
export ROS_DOMAIN_ID=42
source /opt/ros2/galactic/setup.bash

