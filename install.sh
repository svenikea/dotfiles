#! /usr/bin/sh

# Detecting username
username=$(whoami)

# Moving files 
# list backup 
backup = ( 
'.bash_aliases' 'bash_profile' \
	'.bashrc' '.xinitrc' \
	'.config' '.exportrc'
)

# Package before it can work
# List required packages
required_package_non_git = (
'xorg-server' 'xorg-twm' \
	'xorg-xinit' 'xorg-xlock' \
	'tlp' 'xorg-xbacklight' 'xf86-video-intel' \
	'mesa' 'libva-intel-driver'
)
required_package_git = (
'awesomewm-git'
)

# List optional packages
opt_package_non_git = (
'acpi' 'acpi_call' 'acpid' \
	'xclip' 'alsa-utils' \
	'pulseaudio' 'pulseaudio-alsa' 'pulseaudio-bluetooth' \
	'lightdm-gtk-greeter' 'neofetch' 'htop' \
	'nodejs' 'lxsession' 'lxterminal' 'lightdm' \
	'feh' 'maim' 'lightdm-gtk-greeter-settings' 'lxappearance'\
	'mpd' 'mpc' 'breeze-gtk'
)
opt_package_git = (
'ranger-git' 'rofi-git' 'light-locker-settings' 'pamac-aur' \
	'papirus-icon-theme-git' 'plymouth-git' \
	'grub-theme-poly-dark-git' 'plymouth-themes-adi1090x-pack2-git'
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
		 sudo pacman -Sy --needed $package --noconfirm
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
		sudo pacman -Sy --needed $package --noconfirm
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

cp -rf .config .fonts .vimrc .bash_aliases .bash_profile .bashrc .xinitrc $HOME/


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
# Enable and start some services
sudo systemctl enable lightdm-plymouth
sudo systemctl enable tlp
sudo systemctl start tlp
sudo systemctl start ligthdm-plymouth

# Grub configuration 
sudo sed -i 's/loglevel=3\squiet/loglevel=3\ quiet\ rd.udev.log_priority=3\ vt.gloable_cursor-default=0/g' /etc/default/grub
sudo echo 'GRUB_THEME="/usr/share/grub/themes/poly-dark/theme.txt"' >> /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Plymouth theme configuration
sudo plymouth-set-default-theme -R deus_ex
sudo mkinitcpio -P
echo "Remember to reload AwesomeWM with the combo press Ctrl+Windows_keys+r after all of this is completed"
