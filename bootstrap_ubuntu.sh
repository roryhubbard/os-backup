#!/bin/fish

# Copy configs
sudo cp montana.jpg /usr/share/backgrounds/sway/
cp -r .config/* ~/.config

# update packages
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y

# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update -y
sudo apt install neovim -y

# cargo
curl https://sh.rustup.rs -sSf | sh

# cmake 
sudo apt install cmake

# fontconfig
sudo apt install libfontconfig1-dev

# alacritty
cargo install alacritty

# julia
cargo install juliaup

# tmux
sudo apt install tmux -y

# venv
sudo apt install python3-venv

# fzf
sudo apt install fzf
mkdir -p ~/.config/fish/functions/
echo fzf_key_bindings > ~/.config/fish/functions/fish_user_key_bindings.fish

# oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# miniconda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init fish
. ~/.config/fish/config.fish

# autojump (python)
git clone https://github.com/wting/autojump.git --single-branch --depth=1 ~/autojump
pushd ~/autojump/
./install.py
popd
rm -rf ~/autojump/

# replace python autojump with rust autojump
mkdir ~/autojump-rs/
wget https://github.com/xen0n/autojump-rs/releases/download/0.5.1/autojump-x86_64-unknown-linux-musl.tar.gz -O ~/autojump-rs/autojump-x86_64-unknown-linux-musl.tar.gz
tar xzvf ~/autojump-rs/autojump-x86_64-unknown-linux-musl.tar.gz -C ~/autojump-rs/
mv ~/autojump-rs/autojump /home/chub/.autojump/bin
rm -rf ~/autojump-rs/

# tpm
git clone --single-branch --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux new-session -d -s source-conf-session 'tmux source ~/.config/tmux/.tmux.conf'

# omf
omf install nvm
# nvm, node, npm
nvm install node

# source fish config
. ~/.config/fish/config.fish

# dont acivate base conda environment on startup
conda config --set auto_activate_base false

# create python environment that has github cli
conda create -n gh -c conda-forge gh -y