# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[32m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$ '

#alias vi="nvim"

export QT_QPA_PLATFORM=wayland
export BEMENU_BACKEND=wayland
export XDG_CURRENT_DESKTOP=sway
export VISUAL=nvim
export EDITOR="$VISUAL"
export MOZ_ENABLE_WAYLAND=1
#export PATH=$PATH:/opt/julia-1.7.1/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
#export OMP_NUM_THREADS=8

test -f ~/.git-completion.bash && . $_

# compiler
export CC=clang
export CXX=clang++

#if [ "$(tty)" = "/dev/tty1" ]; then
#  exec sway
#fi
