# ==============================
# UBUNTU CONFIG AUTOMATION
# ==============================

# Run this script after a fresh Linux install to install all the required tools
# e.g node, git, aliases, text editor, we browsers, etc...

#!/bin/bash -e
generateSshKey() {
	ssh-keygen -t rsa -b 4096
	echo "A new SSH key pair has been added to ${HOME}/.ssh/id_rsa. Add it to your github profile."
	echo "Enter 'y' when it's done:"
	while [ $answer -ne 'y' ]
	do
		read answer
	done
}

addCustomConfig() {
	git clone git@github.com:theFreedomBanana/config.git
	mv .gitconfig ~/
	mv .commands_and_aliases.sh ~/
	mv .zshrc ~/
}

installMatchaThemes() {
	apt-get install gtk2-engines-murrine gtk2-engines-pixbuf -y
	git clone https://github.com/vinceliuice/matcha.git
	./install.sh
}

installFzf() {
	git clone --depth 1 https://github.com/junegunn/fzf.git
	cd ~/.fzf/
	./install
}

installNvm() {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
	nvm install --lts
}

installNgrok() {
	tar xvzf ~/Downloads/ngrok-stable-linux-amd64.tgz -C /usr/local/bin
	curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install ngrok
}

installVscode() {
	apt install -y software-properties-common apt-transport-https wget
	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
	add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
	apt install code -y
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
	mv ./VSCode/* ~/.config/Code/User
}

installTerminator() {
	apt install terminator -y
	mv terminator/config ~/.config/terminator/config
}

installChrome() {
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	dpkg -i google-chrome-stable_current_amd64.deb
}

installZoom() {
	wget https://zoom.us/client/latest/zoom_amd64.deb
	apt install ./zoom_amd64.deb -y
}

installDiscord() {
	apt install gdebi-core wget
	wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
	gdebi ./discord.deb
}

updateGnomeDock() {
	gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'firefox.desktop', 'thunderbird.desktop', 'slack.desktop', 'code.desktop', 'terminator.desktop', 'org.gnome.Nautilus.desktop', 'gnome-system-monitor_gnome-system-monitor.desktop', 'htop.desktop', 'org.gnome.tweaks.desktop', 'vokoscreen.desktop', 'org.gnome.Software.desktop', 'yelp.desktop']"
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-position RIGHT
}

cd $(echo $(mktemp -d))
apt update
apt upgrade
apt install curl -y
apt install wget -y
apt install fetch -y
generateSshKey
apt install git -y
apt install zsh -y
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
apt-get install slack -y
apt install vlc -y
apt-get install -y vokoscreen
apt install virtualbox virtualbox-ext-pack -y
addCustomConfig
installMatchaThemes
installFzf
installNvm
installNgrok
installChrome
installZoom
installDiscord
installVscode
installVirtualBox
updateGnomeDock
