# Fredrik's dotfiles

# Prepare install

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





# Settings

* Log into Dropbox, make initial configuration and start download
```bash
open -a "Dropbox"
```

# macOS settings

* System

```bash
# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

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

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Set login message
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "I belong to ${LOGIN_NAME}.\n He'll pay a finder's fee if you return me to him.\n${LOGIN_PHONE}      ${LOGIN_EMAIL}"

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

# User settings
subsubaction "Turn off Guest User account"
subsubaction "Drag photo to user image"
osascript -e "tell application \"System Preferences\"
                activate
                reveal pane \"com.apple.preferences.users\"
              end tell" &> /dev/null
waitforenter
```


* Locale

```bash
# Languages: English and Swedish
defaults write NSGlobalDomain AppleLanguages -array "en-US" "sv-US"

# Default language: English
defaults write NSGlobalDomain AppleLocale -string "en_US"

# Week start on Monday
defaults write NSGlobalDomain AppleFirstWeekday '{ gregorian = 2; }'

# Date format: YYYY-MM-DD
defaults write NSGlobalDomain AppleICUDateFormatStrings '{ 1 = "y-M-d"; }'

# 24H clock
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

# Metric system (seriously US...)
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"
```


* Keyboard

```bash
# Keyboard Settings
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Find values for System Preferences by opening the desired pane and running the following AppleScript:
#osascript -e "tell application \"System Preferences\" to return anchors of current pane"

# Remap Caps Lock to Ctrl
subsubaction "Modifier Keys... > Caps Lock Key"
osascript -e "tell application \"System Preferences\"
                activate
                reveal anchor \"keyboardTab\" of pane \"com.apple.preference.keyboard\"
              end tell" &> /dev/null
waitforenter

# Input Sources
subsubaction "Add Swedish"
osascript -e "tell application \"System Preferences\"
                activate
                reveal anchor \"InputSources\" of pane \"com.apple.preference.keyboard\"
              end tell" &> /dev/null
waitforenter

# Keyboard Shortcuts
subsubaction "Input Sources > alt+cmd+space @ 'Select next source in Input menu'"
subsubaction "Spotlight > Uncheck 'Show Spotlight search'"
subsubaction "Spotlight > Uncheck 'Show Finder search window'"
osascript -e "tell application \"System Preferences\"
                activate
                reveal anchor \"shortcutsTab\" of pane \"com.apple.preference.keyboard\"
              end tell" &> /dev/null
waitforenter
```bash


* Finder

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

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: 'icnv', 'clmv', 'Flwv'
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Search the current folder by default in Finder
defaults write com.apple.finder FXDefaultSearchScope -string “SCcf”

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Open ~ in new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Organize Finder's left panel
subsubaction "Remove unwanted folders and tags from 'Favorites' in Finder's settings"
subsubaction "Organize Favorite folders as:"
subsubaction "Applications"
subsubaction "HOME"
subsubaction "Dropbox"
subsubaction "Dropbox/Projects"
subsubaction "Downloads"
subsubaction "Desktop"
open -a "Finder"
waitforenter

# Remove duplicates in the 'Open With' menu
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Restart Finder"
killall Finder
```




* Dock

```bash
# Set Dock to right orientation
defaults write com.apple.dock orientation -string right

# Enable Dock autohide
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.Dock autohide-delay -float 0

# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 36

# Minimize windows into their application's icon
defaults write com.apple.dock minimize-to-application -bool true

# Organize Dock icons
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Opera.app"
dockutil --no-restart --add "/Applications/Todoist.app"
dockutil --no-restart --add "/Applications/Fantastical 2.app"
dockutil --no-restart --add "/Applications/Fastmail.app"
dockutil --no-restart --add "/Applications/Gmail.app"
dockutil --no-restart --add "/Applications/MailMate.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Messenger.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/1Password 6.app"
dockutil --no-restart --add "/Applications/Numi.app"
dockutil --no-restart --add "/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/VimR.app"
dockutil --no-restart --add "/Applications/Sublime Text.app"
dockutil --no-restart --add "/Applications/iA Writer.app"
dockutil --no-restart --add "/Applications/GitHub Desktop.app"
dockutil --no-restart --add "/Applications/RStudio.app"
dockutil --no-restart --add "/Applications/Notes.app"
dockutil --no-restart --add "/Applications/Pocket.app"
dockutil --no-restart --add "/Applications/Deliveries.app"

# Restart Dock
killall Dock
```


* Terminal

```bash
# Install Terminal.app theme and set to default
osascript terminal-fix.scpt

# Disable line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# Enable Secure Keyboard Entry
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true
```


# Clean up

```bash
brew cleanup
killall caffeinate
```














