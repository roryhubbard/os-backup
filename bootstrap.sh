#!/bin/bash

# Exit on any command failure
set -e

#apt update -y && apt upgrade -y && apt autoremove -y
#
## miniconda
#mkdir -p ~/miniconda3
#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
#bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
#rm -rf ~/miniconda3/miniconda.sh
#~/miniconda3/bin/conda init bash
#
## neovim
#add-apt-repository ppa:neovim-ppa/stable
#apt update
#apt install neovim -y
#
## cargo
#curl https://sh.rustup.rs -sSf | sh
#
## alacritty
#cargo install alacritty
#
## julia
#cargo install juliaup
#
## tmux
#apt install tmux
#

## autojump
git clone https://github.com/wting/autojump.git --single-branch --depth=1 ~/autojump
pushd ~/autojump/
./install.py
popd
rm -rf ~/autojump/

mkdir ~/autojump-rs/
wget https://github.com/xen0n/autojump-rs/releases/download/0.5.1/autojump-x86_64-unknown-linux-musl.tar.gz -O ~/autojump-rs/autojump-x86_64-unknown-linux-musl.tar.gz
tar xzvf ~/autojump-rs/autojump-x86_64-unknown-linux-musl.tar.gz -C ~/autojump-rs/
mv ~/autojump-rs/autojump /home/chub/.autojump/bin
rm -rf ~/autojump-rs/
