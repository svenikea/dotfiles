#! /usr/bin/sh

# Detecting username
username=$(whoaimi)
# Moving files 
cp .config $HOME/
cp .fonts $HOME/
cp .bash_aliases .bash_profile .bashrc .xinitrc $HOME/

# Installing vim plug currently using neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Package before this can work
install python-pip yarn xclip nodejs  
pip install jedi pynvim

# Add neovim to yarn at global env
yarn global add neovim

# Lastly change the permission 
sudo chown ${username} $HOME/.config
sudo chown ${username} $HOME/.fonts
