# ==============================
# UBUNTU CONFIG AUTOMATION
# ==============================

# After a fresh Linux install unzip the project archive somewhere in your computer
# and run this script to install all the required tools (e.g node, git, aliases, text editor, we browsers, etc...)

#!/bin/bash -e
generateSshKey() {
	echo "##########################################
GENERATING SSH KEY
##########################################"
	ssh-keygen -t rsa -b 4096
	echo "A new SSH key pair has been added to ${HOME}/.ssh/id_rsa. Add it to your github profile."
	echo "Enter 'y' when it's done:"
	while [ $answer -ne 'y' ]
	do
		read answer
	done
}

addCustomConfig() {
	echo "##########################################
COPYING CONFIG FILES IN USER HOME FOLDER
##########################################"
	cp ./home/.gitconfig ~/
	cp ./home/.commands_and_aliases.sh ~/
	cp ./home/.zshrc ~/
	cp ./VSCode/* ~/.config/Code/User
	cp ./terminator/config ~/.config/terminator/config
}

installGnomeTweaks() {
	echo "##########################################
INSTALLING GNOME TWEAKS
##########################################"
	sudo apt install gnome-tweaks
}

installMatchaThemes() {
	echo "##########################################
INSTALLING MATCHA THEME
##########################################"
	sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf -y
	git clone https://github.com/vinceliuice/matcha.git
	./matcha/install.sh
}

installFzf() {
	echo "##########################################
INSTALLING FZF
##########################################"
	sudo apt install fzf
}

installNvm() {
	echo "##########################################
INSTALLING NVM
##########################################"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
}

installNgrok() {
	echo "##########################################
INSTALLING NGROK
##########################################"
	tar xvzf ~/Downloads/ngrok-stable-linux-amd64.tgz -C /usr/local/bin
	curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && sudo apt install ngrok
}

installVscode() {
	echo "##########################################
INSTALLING VSCODE AND EXTENSIONS
##########################################"
	sudo apt install software-properties-common apt-transport-https wget
	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
	sudo apt install code
	code --install-extension zhuangtongfa.material-theme
	code --install-extension atlassian.atlascode
	code --install-extension byCedric.vscode-expo
	code --install-extension dbaeumer.vscode-eslint
	code --install-extension eamodio.gitlens
	code --install-extension GitHub.copilot
	code --install-extension ms-vscode.sublime-keybindings
	code --install-extension ms-vsliveshare.vsliveshare
	code --install-extension ms-vsliveshare.vsliveshare-audio
	code --install-extension ms-vsliveshare.vsliveshare-pack
	code --install-extension msjsdiag.vscode-react-native
	code --install-extension Silvenga.positions
	code --install-extension YoshinoriN.current-file-path
}

installTerminator() {
	echo "##########################################
INSTALLING TERMINATOR
##########################################"
	sudo apt install terminator -y
	if [ ! -d "/home/$USER/.config/terminator" ]; then
		mkdir /home/$USER/.config/terminator
	fi
}

installChrome() {
	echo "##########################################
INSTALLING CHROME
##########################################"
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
}

installZoom() {
	echo "##########################################
INSTALLING ZOOM
##########################################"
	wget https://zoom.us/client/latest/zoom_amd64.deb
	sudo apt install ./zoom_amd64.deb -y
}

installDiscord() {
	echo "##########################################
INSTALLING DISCORD
##########################################"
	sudo apt install gdebi-core wget
	wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
	sudo gdebi ./discord.deb
}

installCurl() {
	echo "##########################################
INSTALLING CURL
##########################################"
	sudo apt install curl -y
}

installWget() {
	echo "##########################################
INSTALLING WGET
##########################################"
	sudo apt install wget -y
}

installVlc() {
	echo "##########################################
INSTALLING VLC
##########################################"
	sudo apt install vlc -y
}

installVokoscreen() {
	echo "##########################################
INSTALLING VOKOSCREEN
##########################################"
	sudo apt-get install -y vokoscreen
}

installVirtualbox() {
	echo "##########################################
INSTALLING VIRTUALBOX
##########################################"
	sudo apt install virtualbox virtualbox-ext-pack -y
}

installGit() {
	echo "##########################################
INSTALLING GIT
##########################################"
	sudo apt install git -y
}

installZsh() {
	echo "##########################################
INSTALLING ZSH
##########################################"
	sudo apt install zsh -y
}

installOhMyZsh() {
	echo "##########################################
INSTALLING OH MY ZSH
##########################################"
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
}

installThunderbird() {
	echo "##########################################
INSTALLING THUNDERBIRD
##########################################"
	sudo add-apt-repository ppa:Ubuntu-mozilla-daily/ppa
	sudo apt install thunderbird
}

installNordVPN() {
	echo "##########################################
INSTALLING NORD VPN
##########################################"
sudo apt install nordvpn
}

installPythonPygment() {
	echo "##########################################
INSTALLING PYTHON PYGMENTS
##########################################"
	sudo apt install python3-pygments
}

installNpm() {
	echo "##########################################
INSTALLING NODE
##########################################"
	nvm install --lts
}

installFirefox() {
	echo "##########################################
INSTALLING FIREFOX
##########################################"
	sudo snap remove firefox
	sudo add-apt-repository ppa:mozillateam/ppa
	echo 'Package: firefox Pin: release o=LP-PPA-mozillateam Pin-Priority: 1001' | sudo tee /etc/apt/preferences.d/mozilla-firefox
	echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
	sudo apt install firefox
}

updateGnomeDock() {
	echo "##########################################
ADDING FAVORITE IN GNOME DOCK
##########################################"
	gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'firefox.desktop', 'thunderbird.desktop', 'code.desktop', 'terminator.desktop', 'Zoom.desktop', 'discord.desktop', 'vokoscreenNG.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.tweaks.desktop', 'gnome-system-monitor.desktop', 'yelp.desktop']"
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-position RIGHT
}

updateTheme() {
	echo "##########################################
UPDATING THEME
##########################################"
	gsettings set org.gnome.desktop.interface gtk-theme "Matcha-dark-sea"
	gsettings set org.gnome.desktop.interface icon-theme 'Yaru-dark'
}

makeZshDefaultShell() {
	chsh -s $(which zsh)
}

TEMP_FOLDER=$(mktemp -d -p ./)
cd $TEMP_FOLDER
sudo apt update
sudo apt upgrade
installCurl
installWget
generateSshKey
installGit
installZsh
installOhMyZsh
installTerminator
installVlc
installVokoscreen
installVirtualbox
installGnomeTweaks
installMatchaThemes
installFzf
installNvm
installNgrok
installFirefox
installChrome
installZoom
installDiscord
installVscode
installVirtualBox
installThunderbird
installNordVPN
installPythonPygment
cd ../
addCustomConfig
installNpm
updateGnomeDock
updateTheme
makeZshDefaultShell
rm -R $TEMP_FOLDER
