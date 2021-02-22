#! /usr/bin/sh

# Detecting username
username=$(whoami)

# Change the file permission 
sudo chown ${username}:${username} $HOME/.config
sudo chown ${username}:${username} $HOME/.fonts

# Moving files 
# list backup 
backup = ( 
'.bash_aliases' 'bash_profile' \
	'.bashrc' '.xinitrc' \
	'.config'
)

# Package before it can work
# List required packages
required_package_non_git = (
'xorg-server' 'xorg-twm' 'xterm' \
	'xorg-xinit' 'xorg-xlock' 'lightdm' \
	'tlp' 'kitty' 'xorg-xbacklight'
)
required_package_git = (
'awesomewm-git' 'picom-git'
)

# List optional packages
opt_package_non_git = (
'vicious' 'acpi' 'acpi_call' 'acpid' \
	'xautolock' 'xclip' 'alsa-utils' \
	'pulseaudio' 'pulseaudio-alsa' 'pulseaudio-bluetooth' \
	'lightdm-gtk-greeter' 'neofetch' 'htop' \
	'python-pip' 'yarn' 'nodejs' 
)
opt_package_git = (
'redshift-git' 'ranger-git' 'xfce4-power-manager-git' \
	'dmenu-git' 'awesome-freedesktop-git'
)

pip_package = (
'jedi' 'pynvim'
)
backup_config() {
	for item in ${backup[$]}
	bak="bak"
	do
		mv $item ${item}_bak 
	done
}
installing_required_git_deps(){
	for package in ${required_package_non_git[@]}
	do 
		git clone https://aur.archlinux.org/$package.git
		cd $package
		makepkg -sri
		cd ..
		sudo rm -r $package
	done
}
installing_required_non_git_deps(){
	for package in ${required_package_git[@]}
	do
		install --needed $package --noconfirm
	done
}

installing_opt_git_deps(){
	for package in ${opt_package_git[@]}
	do
		git clone https://aur.archlinux.org/$package.git
		cd $package
		makepgk -sri
		cd ..
		sudo rm -r $package
	done
}

installing_opt_non_git_deps(){
	for package in ${opt_package_non_git[@]}
	do
		install --needed $package --noconfirm
	done
}

installing_pip_package(){
	for package in ${pip_package[@]}
	do
		pip install $package
	done
}
############################################## Installing process ############################################

echo "Hi "${username} 

read -p "do you want to install required dependencies? [yes/no] " req
if [ $req == "yes"  ]
then
	installing_required_git_deps
	installing_required_non_git_deps
	echo "all done"
else 
	echo "very well"
fi

read -p "do you want to install optional dependencies? [yes/no] " opt
if [ $opt == "yes" ]
then
	installing_opt_git_deps
	installing_opt_non_git_deps
	installing_pip_package
	# Installing vim plug currently using neovim
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	echo "all done"
else 
	echo "very well"
fi

cp .config $HOME/
cp .fonts $HOME/
cp .bash_aliases .bash_profile .bashrc .xinitrc $HOME/

# Add neovim to yarn at global env
yarn global add neovim

# Enable tap to click on touchpad
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lrm"
EndSection

EOF
echo "Remember to reload AwesomeWM with the combo press Ctrl+Windows_keys+r after all of this is completed"
