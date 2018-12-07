# Fredrik's dotfiles

## Prepare install

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


# Install Software

* Install Homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
    cmocka \
    coreutils \
    dockutil \
    dos2unix \
    doxygen \
    duti \
    findutils \
    gawk \
    git \
    gnu-sed \
    gnupg \
    grep \
    htop \
    mas \
    p7zip \
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
```

* Install BasicTeX from http://www.tug.org/mactex/morepackages.html

* Install R from https://cran.r-project.org/index.html

* Install 1password v6 from https://1password.com

* Install apps from Cask
```bash
brew cask install \
    adobe-acrobat-pro \
    alfred \
    arq \
    carbon-copy-cloner \
    cyberduck \
    dropbox \
    epichrome \
    fantastical \
    firefox \
    github \
    google-chrome \
    jabref \
    kaleidoscope \
    keepingyouawake \
    macvim \
    mailmate \
    marked \
    opera \
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
    tripmode \
    vlc
```

* Install Quick look plugins (https://github.com/sindresorhus/quick-look-plugins)
```bash
brew cask install \
    qlcolorcode \
    qlstephen \
    qlmarkdown \
    quicklook-json \
    quicklook-csv \
    qlimagesize \
    qlvideo
```

* Install apps from Mac App Store
```bash
# Sign into MAS
mas signin "MAS_EMAIL" "MAS_PASSWORD"

# Install MAS apps
mas install 392408028   # Paprika
mas install 461504587   # Trello
mas install 500154009   # Bitdefender Virus Scanner
mas install 531349534   # Tadam
mas install 568494494   # Pocket
mas install 924726344   # Deliveries
mas install 1056643111  # Clocker
mas install 1218241304  # Finances 2
```

* Other Software
    - Cisco VPN Anyconnect
        - https://software.yale.edu
    - Microsoft Office
        - https://software.yale.edu
        - Only Word, Excel and Powerpoint
    - PaperCut Client Software
        - https://ypps.yale.edu/blueprint/papercut/client-downloads

* Make SMS app
```bash
open -Wa "Epichrome"
#  - Save as: SMS
#  - Where: Applications
#  - Name: SMS
#  - Url: https://messages.android.com
#  - Icon: install/icons/android-messages.icns
```

* Make Messenger app
```bash
open -Wa "Epichrome"
#  - Save as: Messenger
#  - Where: Applications
#  - Name: Messenger
#  - Url: https://www.messenger.com
#  - Icon: install/icons/messenger.icns
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
    ly1 \
    mathalfa \
    mathdesign \
    multirow \
    mweights \
    newpx \
    newtx \
    preprint \
    preview \
    sectsty \
    soul \
    tabu \
    textpos \
    titling \
    tocloft \
    varwidth
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

* Dock:
        - Position on screen: "Right"
        - Enable "Automatically hide and show dock"
        - Enable "Minimize windows into application icon"

* Language & Region
        - Update English
            - First day of the week: "Monday"
            - Time format: "24-hour time"
            - Temperature: "Celsius"
            - "Advanced...", Measurement units: "Metric"
        - Add Swedish

* Security & Privacy
        - Require password after: "15 minutes"
        - Enable firewall

* Keyboard
        - Add Swedish Keyboard
        - Remap Caps Lock to Ctrl, "Modifier Keys... > Caps Lock Key"
        - Keyboard Shortcuts:
            - Input Sources > alt+cmd+space @ 'Select next source in Input menu'
            - Spotlight > Uncheck 'Show Spotlight search'
            - Spotlight > Uncheck 'Show Finder search window'

* Track Pad: Enable "Tap to click"

* Users & Groups
        - Update photo
        - Disable guest account

* Date & Time
        - Enable "Use a 24-hour clock"

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

# Remove Display Icon from Menu Bar
defaults write com.apple.airplay showInMenuBarIfPresent -bool false
defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/Clock.menu" \
    "/System/Library/CoreServices/Menu Extras/Battery.menu" \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/TextInput.menu"

# Reload UI
killall SystemUIServer

# Enable Dock autohide
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.Dock autohide-delay -float 0

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 36

# Organize Dock icons
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Opera.app"
dockutil --no-restart --add "/Applications/Fantastical 2.app"
dockutil --no-restart --add "/Applications/MailMate.app"
dockutil --no-restart --add "/Applications/Messenger.app"
dockutil --no-restart --add "/Applications/SMS.app"
dockutil --no-restart --add "/Applications/Trello.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/1Password 6.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/MacVim.app"
dockutil --no-restart --add "/Applications/Sublime Text.app"
dockutil --no-restart --add "/Applications/GitHub Desktop.app"
dockutil --no-restart --add "/Applications/JabRef.app"
dockutil --no-restart --add "/Applications/RStudio.app"
dockutil --no-restart --add "/Applications/Finances.app"
dockutil --no-restart --add "/Applications/Deliveries.app"

# Restart Dock
killall Dock
```


## Finder

* Preferences:
    - New Finder windows show: "HOME"
    - Update Sidebar
    - Enable "Show all filename extensions"
    - Disable "Show warning before changing an extension"
    - Enable "Keep folders on top"
    - When performing a search: "Search the current folder"

* Organize Favorite folders as:
    - Applications
    - HOME
    - Dropbox
    - Dropbox/Projects
    - Dropbox/Papers
    - Downloads
    - Desktop

* Enable: "View > Show Path Bar"

* Other settings:
```bash
# Unhide '~/Library' and '/Volumes'
chflags nohidden "${HOME}/Library"
sudo chflags nohidden /Volumes

# Hide '~/Applications', '~/Documents', '~/Movies', '~/Music' and '~/Pictures'
chflags hidden "${HOME}/Applications"
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


## 1Password

* General > Enable "Always keep 1password mini running"
* General > Disable "Show mini app icon in menu bar"
* Browsers > Disable "Automatically sign in after filling usernames and passwords"
* Browsers > Disable "Autosave"


## GPG

* Link config files
```bash
mkdir -p ${HOME}/.gnupg
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

* Export keys from 1password
    - Export 'fredriksavje.pub' to ~
    - Export 'fredriksavje.ssh' to ~

* Import keys
```bash
mkdir -p ${HOME}/.ssh
cp ${HOME}/fredriksavje.pub ${HOME}/.ssh/id_rsa.pub
cp ${HOME}/fredriksavje.ssh ${HOME}/.ssh/id_rsa
chmod 600 ${HOME}/.ssh/id_rsa

sudo rm ${HOME}/fredriksavje.pub ${HOME}/fredriksavje.ssh
```

* Ensure keys are deleted

* TO ADD: Use keychain for SSH passphrase


## Link dotfiles

* EditorConfig
```bash
# Make .editorconfig file
ln -s ${HOME}/dotfiles/dots/editorconfig/editorconfig ${HOME}/.editorconfig
```

* Git
```bash
# Copy gitconfig
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
mvim -c PlugInstall
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


## MailMate

* Enter license (stored in 1Password)

* Preferences:
    - Enable "Bond font for unread messages"
    - Double click "opens a message in a new window"


## Sublime Text

* Enter license (stored in 1Password)

* Download Package Control and make config
```bash
SUBLIME_LIB="${HOME}/Library/Application Support/Sublime Text 3"
wget -O "${SUBLIME_LIB}/Installed Packages/Package Control.sublime-package" \
    "https://packagecontrol.io/Package Control.sublime-package"

rm -f "${SUBLIME_LIB}/Packages/User/Package Control.sublime-settings"
ln -s "${HOME}/dotfiles/dots/sublime/Package Control.sublime-settings" \
            "${SUBLIME_LIB}/Packages/User/Package Control.sublime-settings"

rm -f "${SUBLIME_LIB}/Packages/User/Preferences.sublime-settings"
ln -s "${HOME}/dotfiles/dots/sublime/Preferences.sublime-settings" \
            "${SUBLIME_LIB}/Packages/User/Preferences.sublime-settings"
```


## Opera

* Preferences:
    - Enable "Block Ads"
    - Disable "Wallpapers"
    - Disable "Show bookmarks bar"
    - Disable start tab ads
    - Disable "Offer to save passwords"
    - Enable "Hold command-q"

* Sign in to websites:
    - Github: https://github.com
    - Facebook: https://www.facebook.com
    - Google: https://accounts.google.com

* Install plugins:
    - 1Password: https://agilebits.com/onepassword/extensions
    - Pocket: https://addons.opera.com/en/extensions/details/pocket-formerly-read-it-later/


## Fantastical

* Add license (stored in 1Password)

* Preferences:
    - Start week on: "Monday"
    - Day starts at: "09:00"
    - Day ends at: "20:00"
    - Enable "Hide Fantastical in menu bar"
    - Add Google calendar
    - Open maps in "Google"


## Arq Backup

* Add license (stored in 1Password)

* Update

* Preferences:
    - Network > Use specific wireless networks
    - Disable "Show notification after each successful backup"


## Other apps

* Finances
    - Enable cloud sync

* Carbon Copy Cloner
    - Enter license (stored in 1Password)

* Cyberduck
    - Enter license (open file stored in 1Password)

* Github Desktop
    - Log in

* Google Chrome
    - Log in

* Kaleidoscope
    - Enter license (stored in 1Password)

* Marked 2
    - Enter license (stored in 1Password)

* Messenger
    - Configure and log in

* SMS
    - Configure and log in

* Pocket
    - Log in

* Paprika
    - Log in

* Steam
    - Log in

* Spotify
    - Log in

* Skype
    - Log in

* Clocker

* Tadam

* Microsoft Office


## Extensions

```bash
# Sublime Text Extensions
#for ext in {c,cpp,css,h,js,json,md,py,pyx,pxd,rs,sh,toml,txt,xml}; do
#   duti -s com.sublimetext.3 "${ext}" all
#done

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


# Backup

## AWS through Arq

* Connect to AWS (credentials in 1Password)

* New Bucket marked with today's date
    - Backup dir: Home
    - Exclude "No-backup" folder
    - Encryption password in 1Password
    - Backup daily at 16:00




###############################################################################
section "Backup hard drives"
###############################################################################


step "Partitions"
subaction "Backup 500GB"
subaction "Mirror 400GB"
subaction "Install 10GB"

step "Backup - Time Machine"
subaction "Select Backup partition"

step "Mirror - Carbon Copy Cloner"
subaction "Source: Whole disk"
subaction "Destination: Mirror partition"
subaction "Run a daily basis"
subaction "Run task when system next wakes"
subaction "Advanced > Destination Volume > Unmount when done"

step "Make bootable image on Install partition"
subaction "Only do if macOS has been updated"
subaction "Download latest macOS from Mac App Store"
subaction "Make bootable image: https://support.apple.com/en-us/HT201372"
subaction "E.g., \"sudo /Applications/Install\ macOS\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/XXXX --applicationpath /Applications/Install\ macOS\ Sierra.app --nointeraction\""
subaction "Copy 1Password opvault to disk"

step "Prevent mounting"
subaction "Prevent Mirror and Install from mounting at start-up"
subaction "See: https://discussions.apple.com/docs/DOC-7942"

waitforenter









### Inspiration

* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Vítor’s dotfiles](https://github.com/vitorgalvao/dotfiles)
* [bash-it](https://github.com/Bash-it/bash-it)




