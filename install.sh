# ==============================
# UBUNTU CONFIG AUTOMATION
# ==============================

# Run this script after a fresh Linux install to install all the required tools
# e.g node, git, aliases, text editor, we browsers, etc...

#!/bin/bash -e
generateSshKey() {
	echo "About to generate SSH key"
	ssh-keygen -t rsa -b 4096
	echo "A new SSH key pair has been added to ${HOME}/.ssh/id_rsa. Add it to your github profile."
	echo "Enter 'y' when it's done:"
	while [ $answer -ne 'y' ]
	do
		read answer
	done
}

addCustomConfig() {
	echo "About to fetch custom config from github repo"
	git clone git@github.com:theFreedomBanana/config.git
	mv .gitconfig ~/
	mv .commands_and_aliases.sh ~/
	mv .zshrc ~/
}

installMatchaThemes() {
	echo "About to install Matcha theme"
	apt-get install gtk2-engines-murrine gtk2-engines-pixbuf -y
	git clone https://github.com/vinceliuice/matcha.git
	./install.sh
}

installFzf() {
	echo "About to install FZF"
	git clone --depth 1 https://github.com/junegunn/fzf.git
	cd ~/.fzf/
	./install
}

installNvm() {
	echo "About to install NVM"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
	nvm install --lts
}

installNgrok() {
	echo "About to install Ngrok"
	tar xvzf ~/Downloads/ngrok-stable-linux-amd64.tgz -C /usr/local/bin
	curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list && apt update && apt install ngrok
}

installVscode() {
	echo "About to install VSCode and extensions"
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
	echo "About to install Terminator"
	apt install terminator -y
	mv terminator/config ~/.config/terminator/config
}

installChrome() {
	echo "About to install Chrome"
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	dpkg -i google-chrome-stable_current_amd64.deb
}

installZoom() {
	echo "About to install Zoom"
	wget https://zoom.us/client/latest/zoom_amd64.deb
	apt install ./zoom_amd64.deb -y
}

installDiscord() {
	echo "About to install Discord"
	apt install gdebi-core wget
	wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
	gdebi ./discord.deb
}

installCurl() {
	echo "About to install curl"
	apt install curl -y
}

installWget() {
	echo "About to install wget"
	apt install wget -y
}

installFetch() {
	echo "About to install fetch"
	apt install fetch -y
}

installSlack() {
	echo "About to install Slack"
	apt-get install slack -y
}

installVlc() {
	echo "About to install VLC"
	apt install vlc -y
}

updateGnomeDock() {
	echo "About to add favorite in Gnome Dock"
	gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'firefox.desktop', 'thunderbird.desktop', 'slack.desktop', 'code.desktop', 'terminator.desktop', 'org.gnome.Nautilus.desktop', 'gnome-system-monitor_gnome-system-monitor.desktop', 'htop.desktop', 'org.gnome.tweaks.desktop', 'vokoscreen.desktop', 'org.gnome.Software.desktop', 'yelp.desktop']"
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-position RIGHT
}

cd $(echo $(mktemp -d))
apt update
apt upgrade
installCurl
installWget
installFetch
generateSshKey
apt install git -y
apt install zsh -y
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
installSlack
installVlc
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
