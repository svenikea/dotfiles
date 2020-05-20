#! /usr/bin/sh

# Initial package before this can work
install python-pip
pip install jedi pynvim yarn
yarn global add neovim


cp .config/nvim $HOME/.config
cp .bash_aliases .bash_profile .bashrc .xinitrc $HOME/
