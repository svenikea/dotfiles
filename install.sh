#! /usr/bin/sh

# Initial package before this can work
install python-pip yarn
pip install jedi pynvim 
yarn global add neovim


cp .config/nvim $HOME/.config
cp .bash_aliases .bash_profile .bashrc .xinitrc $HOME/
