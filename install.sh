#! /usr/bin/sh

<<<<<<< HEAD

=======
>>>>>>> d8c88dcfc17331c721dcebbd621754b01fa5fab5
# Moving files 
cp .config/nvim $HOME/.config
cp .bash_aliases .bash_profile .bashrc .xinitrc $HOME/

# Installing vim plug currently using neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Installing NodeJs
sudo curl -sL install-node.now.sh/lts | bash

# Package before this can work
install python-pip yarn xclip
pip install jedi pynvim

# Add neovim to yarn at global env
yarn global add neovim

<<<<<<< HEAD
=======

>>>>>>> d8c88dcfc17331c721dcebbd621754b01fa5fab5
