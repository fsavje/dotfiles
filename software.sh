#!/usr/bin/env bash

echo "> Starting software.sh"
echo "> Loading helper files"

caffeinate &

if ![ -e "functions.sh" ]; then
	echo "'./functions.sh' doesn't exists"
	exit 1
fi
source "functions.sh"

DOTFILES_DIR="${HOME}/.dotfiles"
if ![ -d "$DOTFILES_DIR" ]; then
	warning "'~/.dotfiles' doesn't exists"
	exit 1
fi


###############################################################################
section "Prerequisites"
###############################################################################

step "Sudo password"
subaction "Please enter your sudo password"
until sudo -n true 2> /dev/null; do # if password is wrong, keep asking
	read -s -p 'Password: ' sudo_password; echo
	sudo -S -v <<< "${sudo_password}" 2> /dev/null
done

step "Sign in to Mac App Store"
subaction "Please MAS email and password"
read -p 'MAS email: ' mas_email
read -s -p 'MAS password: ' mas_password; echo

step "Installing command line tools"
xcode-select --install

step "Accept Xcode license"
sudo -S -v <<< "${sudo_password}" 2> /dev/null
sudo -S xcodebuild -license


###############################################################################
section "Installing command line tools from brew"
###############################################################################

step "Installing Homebrew"
sudo -S -v <<< "${sudo_password}" 2> /dev/null
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

step "Updating Homebrew"
brew tap caskroom/cask
brew update
brew upgrade

step "Installing software"
brew install ack
brew install bash
brew install homebrew/versions/bash-completion2
brew install binutils
brew install cmake
brew install cmocka
brew install coreutils
brew install dockutil
brew install dos2unix
brew install doxygen
brew install duti
brew install findutils
brew install gawk
brew install git
brew install gnu-sed
brew install htop
brew install mas
brew install p7zip
brew install pcre
brew install rename
brew install ruby
brew install trash
brew install tree
brew install watch
brew install wget
brew install xz
brew install --with-default-names homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/science/r


###############################################################################
section "Installing apps from Cask"
###############################################################################

brew cask install 1password
brew cask install alfred
brew cask install arq
sudo -S -v <<< "${sudo_password}" 2> /dev/null
brew cask install basictex
brew cask install tex-live-utility
brew cask install carbon-copy-cloner
brew cask install dropbox
brew cask install epichrome
brew cask install fantastical
brew cask install firefox
brew cask install flux
brew cask install github-desktop
brew cask install google-chrome
brew cask install keepingyouawake
brew cask install marked
brew cask install mendeley-desktop
#brew cask install mountain-duck
brew cask install opera
brew cask install rstudio
brew cask install skype
brew cask install sourcetree
brew cask install spectacle
brew cask install spotify
brew cask install steam
brew cask install sublime-text
#brew cask install texstudio
brew cask install transmission
brew cask install vlc

# Quick look plugins
# https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install qlimagesize
brew cask install webpquicklook


###############################################################################
section "Installing apps from Mac App Store"
###############################################################################

step "Signing into MAS"
mas signin "${mas_email}" "${mas_password}"

step "Installing MAS apps"
mas install 568494494  # Pocket
mas install 585829637  # Todoist
mas install 500154009  # Bitdefender Virus Scanner
mas install 775737590  # iA Writer
mas install 1071518638 # Pomodoro Done


###############################################################################
section "Ruby Gems"
###############################################################################

step "Installing gems"
gem install bundler


###############################################################################
section "LaTeX Packages"
###############################################################################

step "Updating tlmgr and packages"
sudo -S -v <<< "${sudo_password}" 2> /dev/null
sudo tlmgr update --self
sudo -S -v <<< "${sudo_password}" 2> /dev/null
sudo tlmgr update --all

step "Installing packages"
sudo -S -v <<< "${sudo_password}" 2> /dev/null
sudo tlmgr install bbm-macros
sudo tlmgr install enumitem
sudo tlmgr install latexmk
sudo tlmgr install ly1
sudo tlmgr install mathdesign
sudo tlmgr install sectsty

step "Installing non-free (as in speech) fonts"
wget https://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
sudo -S -v <<< "${sudo_password}" 2> /dev/null
sudo texlua install-getnonfreefonts
rm install-getnonfreefonts
getnonfreefonts --all


###############################################################################
section "R Packages"
###############################################################################

step "Installing packages"
R -e 'dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)'
R -e 'install.packages("devtools", repos = "http://cloud.r-project.org")'
R -e 'install.packages("testthat", repos = "http://cloud.r-project.org")'
R -e 'install.packages("roxygen2", repos = "http://cloud.r-project.org")'


###############################################################################
section "Make Epichrome apps"
###############################################################################

cp ${DOTFILES_DIR}/misc/{berkeley,fastmail,gmail,messenger}.icns ${HOME}/Downloads/

step "Make bMail app"
	subaction "Save as: bMail"
	subaction "Where: Applications"
	subaction "Name: bMail"
	subaction "Url: https://mail.google.com/mail/u/1/"
	subaction "Icon: ~/Downloads/berkeley.icns"
	open -Wa "Epichrome"

step "Make Fastmail app"
	subaction "Save as: Fastmail"
	subaction "Where: Applications"
	subaction "Name: Fastmail"
	subaction "Url: https://www.fastmail.com/mail/Inbox/?u=3ccb4100"
	subaction "Icon: ~/Downloads/fastmail.icns"
	open -Wa "Epichrome"

step "Make Gmail app"
	subaction "Save as: Gmail"
	subaction "Where: Applications"
	subaction "Name: Gmail"
	subaction "Url: https://mail.google.com/mail/u/0/"
	subaction "Icon: ~/Downloads/gmail.icns"
	open -Wa "Epichrome"

step "Make Messenger app"
	subaction "Save as: Messenger"
	subaction "Where: Applications"
	subaction "Name: Messenger"
	subaction "Url: https://www.messenger.com"
	subaction "Icon: ~/Downloads/messenger.icns"
	open -Wa "Epichrome"

rm ${HOME}/Downloads/{berkeley,fastmail,gmail,messenger}.icns


###############################################################################
section "Clean up"
###############################################################################

brew cleanup

killall caffeinate

echo ""
echo "$(tput bold)● All done ✅$(tput sgr0)"
echo ""
