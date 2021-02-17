# Fredrik's dotfiles

## Prepare install

* Change to Bash
```bash
chsh -s /bin/bash
```

* Install updates and Xcode
```bash
softwareupdate --install --all
xcode-select --install
```

* Make dotfile folder and clone git repo
```bash
mkdir -m 700 ${HOME}/dotfiles && cd ${HOME}/dotfiles
git clone https://github.com/fsavje/dotfiles.git . && cd ${HOME}
```

* Make folders
```bash
mkdir ${HOME}/No-backup
```

# Install Software

* Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

* Update Homebrew
```bash
brew update
brew upgrade
```

* Install software from Homebrew
```bash
brew install \
    bash \
    bash-completion@2 \
    binutils \
    cmake \
    coreutils \
    djvu2pdf \
    dockutil \
    dos2unix \
    duti \
    findutils \
    gawk \
    git \
    gnu-sed \
    gnupg \
    grep \
    htop \
    hugo \
    md5deep \
    p7zip \
    pandoc \
    pcre \
    pinentry-mac \
    python \
    python3 \
    rename \
    trash \
    tree \
    watch \
    wget \
    xz

# Extra: cmocka doxygen mas
```

* Dropbox: https://www.dropbox.com

* 1password v6: https://1password.com

* Arq v5: https://www.arqbackup.com/downloadarq5/

* BasicTeX: http://www.tug.org/mactex/morepackages.html

* R: https://cran.r-project.org/index.html

* Julia: https://julialang.org
```bash
ln -s /Applications/Julia-1.5.app/Contents/Resources/julia/bin/julia /usr/local/bin/julia
```

* Macvim: https://macvim-dev.github.io/macvim/

* DisplayLink drivers: https://www.displaylink.com/downloads

* Install apps from Cask
```bash
brew install --cask \
    adobe-acrobat-pro \
    alfred \
    atom \
    carbon-copy-cloner \
    epichrome \
    fantastical \
    firefox \
    github \
    google-chrome \
    jabref \
    kaleidoscope \
    keepingyouawake \
    mailmate \
    marked \
    messenger \
    opera \
    presentation \
    rstudio \
    skim \
    skype \
    slack \
    spectacle \
    spotify \
    steam \
    sublime-text \
    tex-live-utility \
    transmission \
    typora \
    vlc \
    zoom

# Extra: cyberduck tripmode
```

* Install Quick look plugins (https://github.com/sindresorhus/quick-look-plugins)
```bash
brew install --cask \
    apparency \
    suspicious-package \
    qlcolorcode \
    qlimagesize \
    qlmarkdown \
    qlstephen \
    qlvideo \
    quicklook-json
```

* Install apps from Mac App Store:
   - Bitdefender Virus Scanner
   - Clocker
   - Deliveries
   - Finances 2
   - Paprika
   - Tadam
   - Trello

* Other Software
    - Cisco VPN Anyconnect
        - https://software.yale.edu
    - Microsoft Office
        - https://software.yale.edu
        - Only Word, Excel and Powerpoint
    - Sony Digital Paper App
        - https://www.sony.com/electronics/support/articles/S1F1667
    - PaperCut Client Software
        - https://ypps.yale.edu/blueprint/papercut/client-downloads

* Make SMS app
```bash
open -Wa "Epichrome"
#  - Save as: SMS
#  - Where: Applications
#  - Name: SMS
#  - Url: https://messages.google.com/web
#  - Icon: install/icons/android-messages.icns
```

* Install LaTeX packages
```bash
# Update tlmgr and existing packages
# Restart bash if `tlmgr` isn't found
sudo tlmgr update --self
sudo tlmgr update --all

# Install new packages
sudo tlmgr install \
    adjustbox \
    bbm \
    bbm-macros \
    cabin \
    chktex \
    collectbox \
    collection-fontsextra \
    collection-fontsrecommended \
    contour \
    dvipng \
    enumitem \
    eulerpx \
    eulervm \
    fontaxes \
    framed \
    inconsolata \
    latexmk \
    latexpand \
    ly1 \
    mathdesign \
    multirow \
    mweights \
    newpx \
    newtx \
    pgfplots \
    preprint \
    preview \
    sectsty \
    soul \
    tabu \
    textpos \
    titlesec \
    titling \
    tocloft \
    varwidth \
    xpatch
```

* Install non-free fonts
```bash
wget https://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
sudo texlua install-getnonfreefonts
rm install-getnonfreefonts
sudo getnonfreefonts --sys --all
```

* Install R packages
```bash
R -e 'dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)'
R -e 'install.packages(c("devtools", "ggplot2", "testthat", "roxygen2"), repos = "http://cloud.r-project.org")'
```


# Settings

## macOS settings

* General: Default web browser: "Opera"

* Desktop & Screen Saver: Start after > Never

* Dock:
    - Position on screen: "Right"
    - Enable "Automatically hide and show dock"

* Language & Region
    - Update English
        - First day of the week: "Monday"
        - Time format: "24-hour time"
        - Temperature: "Celsius"
        - "Advanced...", Measurement units: "Metric"
    - Add Swedish

* Users & Groups
    - Update photo
    - Disable guest account

* Security & Privacy
    - Require password after: "15 minutes"
    - Enable firewall

* Bluetooth
	- Show Bluetooth in menu bar

* Keyboard
    - Add Swedish Keyboard
    - Remap Caps Lock to Ctrl, "Modifier Keys... > Caps Lock Key"
    - Keyboard Shortcuts:
        - Input Sources > control+option+space @ 'Select next source in Input menu'
        - Spotlight > Uncheck 'Show Spotlight search'
        - Spotlight > Uncheck 'Show Finder search window'

* Track Pad: Enable "Tap to click"


* Other
```bash
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable automatic periods
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Set login message
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "I belong to ***LOGIN_NAME***.\n He'll pay a finder's fee if you return me to him.\n***LOGIN_PHONE***      ***LOGIN_EMAIL***"

# Stop iTunes from responding to keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Enable Dock autohide
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.Dock autohide-delay -float 0

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 36

# Organize Dock icons
dockutil --no-restart --remove all && \
dockutil --no-restart --add "/Applications/Opera.app" && \
dockutil --no-restart --add "/Applications/Fantastical.app" && \
dockutil --no-restart --add "/Applications/MailMate.app" && \
dockutil --no-restart --add "/Applications/Trello.app" && \
dockutil --no-restart --add "/Applications/Messenger.app" && \
dockutil --no-restart --add "/Applications/SMS.app" && \
dockutil --no-restart --add "/Applications/Slack.app" && \
dockutil --no-restart --add "/Applications/1Password 6.app" && \
dockutil --no-restart --add "/Applications/Spotify.app" && \
dockutil --no-restart --add "/Applications/Utilities/Terminal.app" && \
dockutil --no-restart --add "/Applications/MacVim.app" && \
dockutil --no-restart --add "/Applications/Sublime Text.app" && \
dockutil --no-restart --add "/Applications/GitHub Desktop.app" && \
dockutil --no-restart --add "/Applications/Typora.app" && \
dockutil --no-restart --add "/Applications/JabRef.app" && \
dockutil --no-restart --add "/Applications/Digital Paper App.app" && \
dockutil --no-restart --add "/Applications/RStudio.app" && \
dockutil --no-restart --add "/Applications/Finances.app" && \
dockutil --no-restart --add "/Applications/Deliveries.app"

# Restart Dock
killall Dock
```


## Finder

* Preferences:
	- General:
		- Only show external disks on desktop
		- New Finder windows show: "HOME"
	- Sidebar:
		- Applications, Desktop, Downloads, HOME, All locations
	- Advanced:
		- Show all filename extensions
		- Disable "Show warning before changing an extension"
		- Enable "Keep folders on top"
		- When performing a search: "Search the current folder"

* Organize Favorite folders as:
    - Applications
    - HOME
    - Dropbox
    - Projects
    - Papers
    - Digital Paper
    - Desktop
    - Downloads

* Enable: "View > Show Path Bar"

* In HOME folder:
	- "View > Show View Options"
	- Show Library Folder

* Other settings:
```bash
# Unhide '/Volumes'
sudo chflags nohidden /Volumes

# Hide '~/Applications', '~/Documents', '~/Movies', '~/Music' and '~/Pictures'
chflags hidden "${HOME}/Documents"
chflags hidden "${HOME}/Movies"
chflags hidden "${HOME}/Music"
chflags hidden "${HOME}/Pictures"
chflags hidden "${HOME}/Public"

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: 'icnv', 'clmv', 'Flwv'
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Restart Finder"
killall Finder
```


## Terminal

* Preferences:
    - Import profiles "install/terminal/Solarized Dark Mod.terminal"
    - On startup, open, with profile: "Solarized Dark Mod"

* Enable Secure Keyboard Entry (toggle menu item under preferences)

* Disenble line marks:
```bash
defaults write com.apple.Terminal ShowLineMarks -int 0
```


## Bash

```bash
# Add /usr/local/bin/bash to /etc/shells
echo '/usr/local/bin/bash' | sudo tee -a /etc/shells

# Change shell for user
chsh -s /usr/local/bin/bash

# Link Bash config files
ln -s ${HOME}/dotfiles/dots/bash/l_bash_profile ${HOME}/.bash_profile
ln -s ${HOME}/dotfiles/dots/bash/l_bashrc ${HOME}/.bashrc
ln -s ${HOME}/dotfiles/dots/bash/l_inputrc ${HOME}/.inputrc

# Make hush login file
touch ${HOME}/.hushlogin
```


## Dropbox

* Open and login

* Download "1Password.opvault" manually

* Preferences:
    - Disable photo upload
    - Disable share screenshots

* Notifications
	- Uncheck New files and edits


## 1Password

* General > Enable "Always keep 1password mini running"
* General > Disable "Show mini app icon in menu bar"
* Browsers > Disable "Automatically sign in after filling usernames and passwords"
* Browsers > Disable "Detect new username"


## GPG

* Link config files
```bash
mkdir  -m 700 -p ${HOME}/.gnupg
ln -s ${HOME}/dotfiles/dots/gpg/l_gpg-agent.conf ${HOME}/.gnupg/gpg-agent.conf
ln -s ${HOME}/dotfiles/dots/gpg/l_gpg.conf ${HOME}/.gnupg/gpg.conf
```

* Export keys from 1password
    - Export '01735455.public.gpg-key' to ~
    - Export '01735455.subkeys.gpg-key' to ~

* Import keys to GPG
```bash
gpg --import ${HOME}/01735455.public.gpg-key
gpg --import ${HOME}/01735455.subkeys.gpg-key

sudo rm ${HOME}/01735455.public.gpg-key ${HOME}/01735455.subkeys.gpg-key
```

* Ensure keys are deleted

* Sign file to store passphrase in keychain
```bash
echo "test" > ${HOME}/tmpsign
gpg --output ${HOME}/tmpsign.sig --sign ${HOME}/tmpsign
rm ${HOME}/tmpsign ${HOME}/tmpsign.sig
```

* References:
    - https://github.com/pstadler/keybase-gpg-github
    - https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b
    - https://gist.github.com/troyfontaine/18c9146295168ee9ca2b30c00bd1b41e


## SSH

* Config
```bash
# Make .editorconfig file
mkdir -p ${HOME}/.ssh
ln -s ${HOME}/dotfiles/dots/ssh/config ${HOME}/.ssh/config
```

* Export keys from 1password
    - Export 'fredriksavje.pub' to ~
    - Export 'fredriksavje.ssh' to ~

* Import keys
```bash
cp ${HOME}/fredriksavje.pub ${HOME}/.ssh/id_rsa.pub
cp ${HOME}/fredriksavje.ssh ${HOME}/.ssh/id_rsa
chmod 600 ${HOME}/.ssh/id_rsa

sudo rm ${HOME}/fredriksavje.pub ${HOME}/fredriksavje.ssh
```

* Ensure keys are deleted

* Add key to keychain
```bash
ssh-add -K ${HOME}/.ssh/id_rsa
```


## Link dotfiles

* EditorConfig
```bash
# Make .editorconfig file
ln -s ${HOME}/dotfiles/dots/editorconfig/editorconfig ${HOME}/.editorconfig
```

* Tex Live
```bash
# Link chktexrc config
ln -s ${HOME}/dotfiles/dots/texlive/chktexrc ${HOME}/.chktexrc
```

* Git
```bash
# Link gitconfig
ln -s ${HOME}/dotfiles/dots/git/c_gitconfig ${HOME}/.gitconfig
```

* R
```bash
ln -s ${HOME}/dotfiles/dots/R/Rprofile ${HOME}/.Rprofile
```


## MacVim

```bash
# Install python neovim (for deoplete)
pip3 install --user pynvim

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link config file
ln -s "${HOME}/dotfiles/dots/vim/vimrc" "${HOME}/.vimrc"

# Install packages
/Applications/MacVim.app/Contents/bin/mvim -c PlugInstall
```

## Skim

* Preferences:
    - PDF-TeX Sync support, preset: "MacVim"


## Spectacle

* Copy config
```bash
mkdir -p "${HOME}/Library/Application Support/Spectacle"
cp -f "${HOME}/dotfiles/install/spectacle/Shortcuts.json" "${HOME}/Library/Application Support/Spectacle/Shortcuts.json"
```

* Open Spectacle app
    - Enable "Launch Spectacle at login"
    - Run ... "as a background application"


## Alfred

* Activate Powerpack (stored in 1Password)

* Set Sync Folder to "Dropbox/Privat"

* Set Hotkey to Cmd + Space

* Appearance > Options
    - Hide hat on Alfred window
    - Hide menu bar icon


## MailMate

* Enter license (stored in 1Password)

* Preferences:
    - Default email client: Mailmate.app
    - Enable "Bond font for unread messages"
    - Double click "opens a message in a new window"


## Sublime Text

* Enter license (stored in 1Password)

* Skip: Download Package Control and make config
```bash
#SUBLIME_LIB="${HOME}/Library/Application Support/Sublime Text 3"

#cd "${SUBLIME_LIB}/Packages"
#git clone https://github.com/sindresorhus/editorconfig-sublime

#rm -f "${SUBLIME_LIB}/Packages/User/Preferences.sublime-settings"
#ln -s "${HOME}/dotfiles/dots/sublime/Preferences.sublime-settings" \
#            "${SUBLIME_LIB}/Packages/User/Preferences.sublime-settings"
```


## Opera

* Preferences:
    - Enable "Block Ads"
    - Enable "Block Trackers"
    - Disable "Wallpapers"
    - Don't show sidebar
    - Disable "Offer to save passwords"
    - Disable "Save and fill payment methods"
    - Disable "Save and fill addresses"
    - Hide search bar
    - Hide Speed Dial
    - Show full URL in address bar
    - Ask where to save each file before downloading
    - Enable "Hold command-q"

* Sign in to websites:
    - Github: https://github.com
    - Facebook: https://www.facebook.com
    - Google: https://accounts.google.com

* Install plugins:
    - 1Password: https://agilebits.com/onepassword/extensions


## Fantastical

* Add license (stored in 1Password)

* Preferences:
    - Start week on: "Monday"
    - Day starts at: "09:00"
    - Day ends at: "20:00"
    - Remove "Mini window keyboard shortcut"
    - Enable "Hide Fantastical in menu bar"
    - Add Google calendar
    - Select "Fredrik" as default cal
    - Open maps in "Google"


## Arq Backup

* Add license (stored in 1Password)

* Update

* Preferences:
    - Network > Use specific wireless networks
    - Disable "Show notification after each successful backup"


## Sony Digital Paper App

* Connect to Reader

* Set Sync Folders
    - Books
    - Incoming / Digital Paper
    - Papers
    - To read


## Other apps

* Adobe Acrobat
    - Log in with yale email

* Carbon Copy Cloner
    - Enter license (stored in 1Password)

* Chrome

* Clocker
    - Add Stockholm, New York, San Francisco

* Cyberduck
    - Enter license (open file stored in 1Password)

* Finances
    - Enable cloud sync

* Firefox

* Github Desktop
    - Log in

* JabRef
    - Open papers.bib
    - Import preferences

* Kaleidoscope
    - Enter license (stored in 1Password)

* KeepingYouAwake
    - Start at Login

* Macvim

* Marked 2
    - Enter license (stored in 1Password)

* Messenger
    - Configure and log in

* Microsoft Office
    - Log in with yale email

* Paprika
    - Log in

* RStudio
    - Update packages

* Slack

* SMS
    - Configure and log in

* Steam
    - Log in
    - Disable start on login

* Spotify
    - Log in

* Skype
    - Log in

* Tadam
    - Open when log in

* TeX Live Utility

* Trello
    - Log in

* System Preferences > Users & Groups > Login Items
    - Add MailMate
    - Remove Steam
    - Remove Adobe Resource Synchronizer


## Extensions

```bash
# Sublime Text Extensions
#for ext in {c,cpp,css,h,js,json,md,py,pyx,pxd,rs,sh,toml,txt,xml}; do
#   duti -s com.sublimetext.3 "${ext}" all
#done

# Macvim
for ext in {md,tex,txt}; do
    duti -s org.vim.MacVim "${ext}" all
done

# RStudio
for ext in {R}; do
    duti -s org.rstudio.RStudio "${ext}" all
done

# VLC
for ext in {mp4}; do
    duti -s org.videolan.vlc "${ext}" all
done
```

* Misc
    - Find bundle ID for an app: `osascript -e "id of app \"Sublime Text\""`
    - See current extensions binding: `duti -x sh`


## Clean up

* Restart


### Inspiration

* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Vítor’s dotfiles](https://github.com/vitorgalvao/dotfiles)
* [bash-it](https://github.com/Bash-it/bash-it)
