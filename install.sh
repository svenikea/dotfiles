#! /usr/bin/sh

# Initial package before this can work
sudo pacman -S python-pip
pip install jedi pynvvm yarn
yarn global add neovim


cp .config/nvim $HOME/.config
cp .bash_aliases .bash_profile .bashrc .xinitrc $HOME/