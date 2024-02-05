if status is-interactive
    # Commands to run in interactive sessions can go here
end

source /home/chub/.autojump/share/autojump/autojump.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/chub/miniconda3/bin/conda
    eval /home/chub/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/chub/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/chub/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/chub/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

fish_add_path "$HOME/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path $HOME/.cargo/bin

set -x NVM_DIR "$HOME/.nvm"
set -x VISUAL "nvim"
set -x EDITOR "$VISUAL"
#export QT_QPA_PLATFORM=wayland
#export BEMENU_BACKEND=wayland
#export XDG_CURRENT_DESKTOP=sway
#export MOZ_ENABLE_WAYLAND=1
#export OMP_NUM_THREADS=8

alias vi="nvim"
alias gls="git -P branch --list '*rhubbard*'"

set -g fish_greeting

pyenv init - | source

starship init fish | source
direnv hook fish | source
