#!/usr/bin/env bash

echo "> Starting setting.sh"
echo "> Loading helper files"

caffeinate &

if ![ -e "functions.sh" ]; then
	echo "'./functions.sh' doesn't exists"
	exit 1
fi
source "functions.sh"

if ![ -e "secrets.sh" ]; then
	warning "'./secrets.sh' doesn't exists"
	exit 1
fi
source "secrets.sh"

DOTFILES_DIR="${HOME}/.dotfiles"
if ![ -d "$DOTFILES_DIR" ]; then
	warning "'~/.dotfiles' doesn't exists"
	exit 1
fi


###############################################################################
section "Prerequisites"
###############################################################################

step "Close open System Preferences panes"
osascript -e 'tell application "System Preferences" to quit'

step "Sudo password"
subaction "Please enter your sudo password"
until sudo -n true 2> /dev/null; do # if password is wrong, keep asking
	read -s -p 'Password: ' sudo_password; echo
	sudo -S -v <<< "${sudo_password}" 2> /dev/null
done


###############################################################################
section "macOS settings"
###############################################################################

step "System" #################################################################

substep "Disable the sound effects on boot"
sudo -S -v <<< "${sudo_password}" 2> /dev/null
sudo nvram SystemAudioVolume=" "

substep "Enable tap to click"
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

substep "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

substep "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

substep "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

substep "Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

substep "Disable automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

substep "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

substep "Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

substep "Set login message"
sudo -S -v <<< "${sudo_password}" 2> /dev/null
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "I belong to ${login_name}.\n He'll pay a finder's fee if you return me to him.\n${login_phone}      ${login_email}"

substep "Stop iTunes from responding to keyboard media keys"
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

substep "Remove Display Icon from Menu Bar"
defaults write com.apple.airplay showInMenuBarIfPresent -bool false
defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/Clock.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
	"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
	"/System/Library/CoreServices/Menu Extras/TextInput.menu"

substep "User settings"
subsubaction "Turn off Guest User account"
subsubaction "Drag photo to user image"
osascript -e "tell application \"System Preferences\"
                activate
                reveal pane \"com.apple.preferences.users\"
              end tell" &> /dev/null
waitforenter


step "Locale" #################################################################

substep "Languages: English and Swedish"
defaults write NSGlobalDomain AppleLanguages -array "en-US" "sv-US"

substep "Default language: English"
defaults write NSGlobalDomain AppleLocale -string "en_US"

substep "Week start on Monday"
defaults write NSGlobalDomain AppleFirstWeekday '{ gregorian = 2; }'

substep "Date format: YYYY-MM-DD"
defaults write NSGlobalDomain AppleICUDateFormatStrings '{ 1 = "y-M-d"; }'

substep "24H clock"
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

substep "Metric system (seriously US...)"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"


step "Keyboard" ###############################################################

substep "Keyboard Layouts"
defaults write com.apple.HIToolbox AppleEnabledInputSources '( { InputSourceKind = "Keyboard Layout";
                                                                 "KeyboardLayout ID" = 0;
                                                                 "KeyboardLayout Name" = "U.S."; },
                                                               { InputSourceKind = "Keyboard Layout";
                                                                 "KeyboardLayout ID" = 224;
                                                                 "KeyboardLayout Name" = Swedish;
                                                               } )'

# Find values for System Preferences by opening the desired pane and running the following AppleScript:
#osascript -e "tell application \"System Preferences\" to return anchors of current pane"

substep "Keyboard Shortcuts"
subsubaction "Input Sources > alt+cmd+space @ 'Select next source in Input menu'"
subsubaction "Spotlight > Uncheck 'Show Spotlight search'"
subsubaction "Spotlight > Uncheck 'Show Finder search window'"
osascript -e "tell application \"System Preferences\"
                activate
                reveal anchor \"shortcutsTab\" of pane \"com.apple.preference.keyboard\"
              end tell" &> /dev/null
waitforenter


step "Finder" #################################################################

substep "Unhide '~/Library' and '/Volumes'"
chflags nohidden "${HOME}/Library"
sudo -S -v <<< "${sudo_password}" 2> /dev/null
sudo chflags nohidden /Volumes

substep "Hide '~/Applications', '~/Documents', '~/Movies', '~/Music' and '~/Pictures'"
chflags hidden "${HOME}/Applications"
chflags hidden "${HOME}/Documents"
chflags hidden "${HOME}/Movies"
chflags hidden "${HOME}/Music"
chflags hidden "${HOME}/Pictures"

substep "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

substep "Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: 'icnv', 'clmv', 'Flwv'
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'

substep "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

substep "Search the current folder by default in Finder"
defaults write com.apple.finder FXDefaultSearchScope -string “SCcf”

substep "Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

substep "Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

substep "Open ~ in new Finder windows"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

substep "Show file extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

substep "Organize Finder's left panel"
subsubaction "Remove unwanted folders and tags in Finder's settings"
subsubaction "Organize left panel folders as"
open -a "Finder"
waitforenter

substep "Remove duplicates in the 'Open With' menu"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

substep "Restart Finder"
killall Finder


step "Dock" ###################################################################

substep "Set Dock to left orientation"
defaults write com.apple.dock orientation -string left

substep "Enable Dock autohide"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.Dock autohide-delay -float 0

substep "Set the icon size of Dock items"
defaults write com.apple.dock tilesize -int 36

substep  "Minimize windows into their application's icon"
defaults write com.apple.dock minimize-to-application -bool true

substep  "Organize Dock icons"
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Opera.app"
dockutil --no-restart --add "/Applications/Todoist.app"
dockutil --no-restart --add "/Applications/Fantastical 2.app"
dockutil --no-restart --add "/Applications/Fastmail.app"
dockutil --no-restart --add "/Applications/Gmail.app"
dockutil --no-restart --add "/Applications/bMail.app"
dockutil --no-restart --add "/Applications/Messenger.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/1Password 6.app"
dockutil --no-restart --add "/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/Sublime Text.app"
dockutil --no-restart --add "/Applications/iA Writer.app"
dockutil --no-restart --add "/Applications/GitHub Desktop.app"
dockutil --no-restart --add "/Applications/RStudio.app"
dockutil --no-restart --add "/Applications/Mendeley Desktop.app"
dockutil --no-restart --add "/Applications/Notes.app"
dockutil --no-restart --add "/Applications/Pocket.app"

substep "Restart Dock"
killall Dock


step "Terminal" ###############################################################

substep "Install Terminal.app theme and set to default"
osascript <<EOD

tell application "Terminal"

	local allOpenedWindows
	local initialOpenedWindows
	local windowID
	set themeName to "Solarized Dark Mod"

	(* Store the IDs of all the open terminal windows. *)
	set initialOpenedWindows to id of every window

	(* Open the custom theme so that it gets added to the list
	   of available terminal themes (note: this will open two
	   additional terminal windows). *)
	do shell script "open '${DOTFILES_DIR}/dots/terminal/" & themeName & ".terminal'"

	(* Wait a little bit to ensure that the custom theme is added. *)
	delay 1

	(* Set the custom theme as the default terminal theme. *)
	set default settings to settings set themeName

	(* Get the IDs of all the currently opened terminal windows. *)
	set allOpenedWindows to id of every window

	repeat with windowID in allOpenedWindows

		(* Close the additional windows that were opened in order
		   to add the custom theme to the list of terminal themes. *)
		if initialOpenedWindows does not contain windowID then
			close (every window whose id is windowID)

		(* Change the theme for the initial opened terminal windows
		   to remove the need to close them in order for the custom
		   theme to be applied. *)
		else
			set current settings of tabs of (every window whose id is windowID) to settings set themeName
		end if

	end repeat

end tell

EOD

substep "Disable line marks"
defaults write com.apple.Terminal ShowLineMarks -int 0

substep "Enable Secure Keyboard Entry"
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true


###############################################################################
section "Bash"
###############################################################################

step "Add /usr/local/bin/bash to /etc/shells"
sudo -S -v <<< "${sudo_password}" 2> /dev/null
echo '/usr/local/bin/bash' | sudo tee -a /etc/shells

step "Change shell for user"
subaction "Enter sudo password"
chsh -s /usr/local/bin/bash

step "Link Bash config files"
backup_file ${HOME}/.bash_profile
backup_file ${HOME}/.bashrc
backup_file ${HOME}/.inputrc
ln -s ${DOTFILES_DIR}/dots/bash/l_bash_profile ${HOME}/.bash_profile
ln -s ${DOTFILES_DIR}/dots/bash/l_bashrc ${HOME}/.bashrc
ln -s ${DOTFILES_DIR}/dots/bash/l_inputrc ${HOME}/.inputrc

step "Make hush login file"
[ -e "${HOME}/.hushlogin" ] || touch ${HOME}/.hushlogin


###############################################################################
section "Git"
###############################################################################

step "Copy gitconfig"
backup_file ${HOME}/.gitconfig
cp -n ${DOTFILES_DIR}/dots/git/c_gitconfig ${HOME}/.gitconfig

step "Write git username and email"
git config --global user.name "${git_username}"
git config --global user.email "${git_email}"


###############################################################################
section "EditorConfig"
###############################################################################

# http://editorconfig.org
step "Make .editorconfig file"
backup_file ${HOME}/.editorconfig
ln -s ${DOTFILES_DIR}/dots/editorconfig/editorconfig ${HOME}/.editorconfig


###############################################################################
section "LaTeX"
###############################################################################

step "Update tlmgr and packages"
sudo -S -v <<< "${sudo_password}" 2> /dev/null
sudo tlmgr update --self
sudo -S -v <<< "${sudo_password}" 2> /dev/null
sudo tlmgr update --all

step "Install packages"
sudo -S -v <<< "${sudo_password}" 2> /dev/null
sudo tlmgr install latexmk
# ...


###############################################################################
section "Dropbox"
###############################################################################

action "Start Dropbox and make initial configuration"
open -a "Dropbox"
waitforenter


###############################################################################
section "1Password"
###############################################################################

action "Download 1Password vault from Dropbox"
waitforenter

action "Start 1Password and make initial configuration"
open -Wa "1Password 6"

step "Additional 1Password settings"
defaults write 2BUA8C4S2C.com.agilebits.onepassword4-helper ShowStatusItem -bool false
defaults write 2BUA8C4S2C.com.agilebits.onepassword4-helper watchtowerService -bool true
defaults write 2BUA8C4S2C.com.agilebits.onepassword4-helper autosave -bool false
defaults write com.agilebits.onepassword4 ShowStatusItem -bool false


###############################################################################
section "Alfred"
###############################################################################

step "Settings"
defaults write com.runningwithcrayons.Alfred-Preferences-3 syncfolder -string "~/Dropbox/Privat"

action "Enter license (stored in 1Password)"
open -a "Alfred 3"
waitforenter


###############################################################################
section "Spectacle"
###############################################################################

SPECTACLE_DIR="${HOME}/Library/Application Support/Spectacle"

step "Copy Spectacle shortcuts"
mkdir -p "${SPECTACLE_DIR}"
cp -f "${DOTFILES_DIR}/dots/spectacle/Shortcuts.json" \
      "${SPECTACLE_DIR}/Shortcuts.json"

step "Make Spectacle start on login"
osascript -e "tell application \"System Events\"
                 if (login item \"Spectacle\" exists) is false then
                    make login item at end with properties {name:\"Spectacle\", path:\"/Applications/Spectacle.app\", hidden:false}
                 end if
              end tell" &> /dev/null

step "Start Spectacle"
subaction "Ensure starting at login"
open -a Spectacle
waitforenter


###############################################################################
section "Sublime Text"
###############################################################################

action "Enter license (stored in 1Password)"
open -Wa "Sublime Text"

SUBLIME_LIB="${HOME}/Library/Application Support/Sublime Text 3"

step "Download Package Control"
wget -O "${SUBLIME_LIB}/Installed Packages/Package Control.sublime-package" \
	"https://packagecontrol.io/Package Control.sublime-package"

step "Package Control settings"
rm -f "${SUBLIME_LIB}/Packages/User/Package Control.sublime-settings"
ln -s "${DOTFILES_DIR}/dots/sublime/Package Control.sublime-settings" \
      "${SUBLIME_LIB}/Packages/User/Package Control.sublime-settings"

action "Wait until packages are installed"
open -Wa "Sublime Text"

step "Link preference files"
rm -f "${SUBLIME_LIB}/Packages/User/ccompile.sublime-build"
ln -s "${DOTFILES_DIR}/dots/sublime/ccompile.sublime-build" \
      "${SUBLIME_LIB}/Packages/User/ccompile.sublime-build"

rm -f "${SUBLIME_LIB}/Packages/User/ctest.sublime-build"
ln -s "${DOTFILES_DIR}/dots/sublime/ctest.sublime-build" \
      "${SUBLIME_LIB}/Packages/User/ctest.sublime-build"

rm -f "${SUBLIME_LIB}/Packages/User/Preferences.sublime-settings"
ln -s "${DOTFILES_DIR}/dots/sublime/Preferences.sublime-settings" \
      "${SUBLIME_LIB}/Packages/User/Preferences.sublime-settings"


###############################################################################
section "R"
###############################################################################

step "Install R packages"
R -e 'dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)'
R -e 'install.packages("devtools", repos = "http://cloud.r-project.org")'
R -e 'install.packages("testthat", repos = "http://cloud.r-project.org")'
R -e 'install.packages("roxygen2", repos = "http://cloud.r-project.org")'

step "Link R settings"
backup_file ${HOME}/.Rprofile
ln -s ${DOTFILES_DIR}/dots/R/Rprofile ${HOME}/.Rprofile


###############################################################################
section "Opera"
###############################################################################

action "Configure Opera"
subaction "Setting: Block Ads"
subaction "Setting: Browser > Click 'Make Opera my default browser'"
subaction "Setting: Browser > Check 'Hold Command-Q (or press it twice) to quit Opera'"
subaction "Setting: Privacy & security > Uncheck 'Offer to save passwords I enter on the web'"
subaction "Pin and sign in to Facebook"
subaction "Pin and sign in to Github"
subaction "Sign in to Google"
subaction "Install 1Password plugin"
subaction "Install Pocket plugin"
open -a "Opera" "https://www.facebook.com"
open -a "Opera" "https://github.com"
open -a "Opera" "https://accounts.google.com"
open -a "Opera" "https://agilebits.com/onepassword/extensions"
open -a "Opera" "https://addons.opera.com/en/extensions/details/pocket-formerly-read-it-later/"
waitforenter


###############################################################################
section "Fantastical"
###############################################################################

action "Configure Fantastical"
subaction "Add Google Calendar"
subaction "Enter license (stored in 1Password)"
open -a "Fantastical 2"
waitforenter

step "Additional Fantastical settings"
defaults write com.flexibits.fantastical2.mac DayStarts -int 9
defaults write com.flexibits.fantastical2.mac DayEnds -int 20
defaults write com.flexibits.fantastical2.mac FirstWeekday -int 2
defaults write com.flexibits.fantastical2.mac OpenMapsIn -string "google"


###############################################################################
section "Remaining apps"
###############################################################################

step "Arq Backup"
subaction "Update"
subaction "Enter license (stored in 1Password)"
subaction "Connect to AWS (credentials in 1Password)"
subaction "New Bucket marked with today's date"
subaction "Encryption password in 1Password"
subaction "Backup daily at 16:00"
subaction "Preferences > Network > Use specific wireless networks"
open -a "Arq"
waitforenter

step "Carbon Copy Cloner"
subaction "Enter license (stored in 1Password)"
open -a "Carbon Copy Cloner"
waitforenter

step "Flux"
subaction "Config"
open -a Flux
waitforenter

step "Github Desktop"
subaction "Log in to Github"
open -Wa "Github Desktop"

step "Google Chrome"
subaction "Log in"
open -Wa "Google Chrome"

step "Fastmail"
subaction "Setting: If a link doesn't match any rule, open it with default browser"
subaction "Log in"
open -Wa "Fastmail"

step "Facebook Messenger"
subaction "Setting: If a link doesn't match any rule, open it with default browser"
subaction "Log in"
open -Wa "Messenger"

step "Gmail"
subaction "Setting: If a link doesn't match any rule, open it with default browser"
subaction "Log in"
open -Wa "Gmail"

step "bMail"
subaction "Setting: If a link doesn't match any rule, open it with default browser"
subaction "Log in to private gmail first, then bMail"
open -Wa "bMail"

step "Mendeley Desktop"
subaction "Login"
subaction "Setting: Organize my files '~/Dropbox/Papers/Mendeley'"
subaction "Setting: Watch folder '~/Dropbox/Papers/Read'"
open -Wa "Mendeley Desktop"

step "Marked 2"
subaction "Enter license (stored in 1Password)"
open -Wa "Marked 2"

step "Pocket"
subaction "Log in"
open -Wa "Pocket"

step "Pomodoro Done"
substep "Update settings"
defaults write rinik.PomodoroDone autostart -bool true
defaults write rinik.PomodoroDone hideDockIcon -bool true
defaults write rinik.PomodoroDone tickingSoundEnabled -bool false
subaction "Close main window"
open -a "Pomodoro Done"
waitforenter

step "Skype"
subaction "Log in"
open -Wa "Skype"

step "SourceTree"
subaction "Login"
subaction "Skip setup"
open -Wa "SourceTree"

step "Spotify"
subaction "Log in"
open -Wa "Spotify"

step "Todoist"
subaction "Log in"
open -Wa "Todoist"

step "Steam"
subaction "Update"
subaction "Login"
subaction "Setting: Disable open on start"
open -Wa "Steam"


###############################################################################
section "Extensions"
###############################################################################

# Find bundle ID for an app
#osascript -e "id of app \"Sublime Text\""

# See current extensions binding
#duti -x sh

step "Sublime Text Extensions"
for ext in {c,cpp,css,h,js,json,md,py,sh,txt}; do
	duti -s com.sublimetext.3 "${ext}" all
done

step "RStudio"
for ext in {R}; do
	duti -s org.rstudio.RStudio "${ext}" all
done


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

step "Prevent mounting"
subaction "Prevent Mirror and Install from mounting at start-up"
subaction "See: https://discussions.apple.com/docs/DOC-7942"

waitforenter


###############################################################################
section "Clean up"
###############################################################################

killall caffeinate

echo ""
echo "$(tput bold)● All done ✅$(tput sgr0)"
action "Restart to finish"
echo ""
