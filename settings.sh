






###############################################################################
section "GPG"
###############################################################################

step "Link GPG config files"
mkdir -p ${HOME}/.gnupg
backup_file ${HOME}/.gnupg/gpg-agent.conf
backup_file ${HOME}/.gnupg/gpg.conf
ln -s ${DOTFILES_DIR}/dots/gpg/l_gpg-agent.conf ${HOME}/.gnupg/gpg-agent.conf
ln -s ${DOTFILES_DIR}/dots/gpg/l_gpg.conf ${HOME}/.gnupg/gpg.conf


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
git config --global user.signingkey "${git_gpgkey}"


###############################################################################
section "EditorConfig"
###############################################################################

# http://editorconfig.org
step "Make .editorconfig file"
backup_file ${HOME}/.editorconfig
ln -s ${DOTFILES_DIR}/dots/editorconfig/editorconfig ${HOME}/.editorconfig


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
cp -f "${DOTFILES_DIR}/dots/spectacle/Shortcuts.json" "${SPECTACLE_DIR}/Shortcuts.json"


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
section "Macvim"
###############################################################################

ln -s "${DOTFILES_DIR}/dots/vim/vimrc" "${HOME}/.vimrc"

# Package manager
mkdir -p "${HOME}/.local/share/dein"
wget https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
sh ./installer.sh "${HOME}/.local/share/dein"
rm installer.sh



###############################################################################
#section "Neovim"
###############################################################################

# Install neovim plugins
#pip2 install neovim
#pip3 install neovim
#sudo gem install neovim

# Neovim config
#mkdir -p "${HOME}/.config"
#ln -s "${DOTFILES_DIR}/dots/nvim" "${HOME}/.config/nvim"

# Package manager
#mkdir -p "${HOME}/.local/share/dein"
#wget https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
#sh ./installer.sh "${HOME}/.local/share/dein"
#rm installer.sh


###############################################################################
section "MailMate"
###############################################################################

mkdir -p "${HOME}/Library/Application Support/MailMate/Resources/KeyBindings"
ln -s "${DOTFILES_DIR}/dots/MailMate/CustomKey.plist" "${HOME}/Library/Application Support/MailMate/Resources/KeyBindings/CustomKey.plist"


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
subaction "Pin and sign in to Github"
subaction "Sign in to Facebook"
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
subaction "Enter license (stored in 1Password)"
subaction "Update"
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
for ext in {c,cpp,css,h,js,json,md,py,pyx,pxd,rs,sh,toml,txt,xml}; do
  duti -s com.sublimetext.3 "${ext}" all
done

step "RStudio"
for ext in {R}; do
  duti -s org.rstudio.RStudio "${ext}" all
done

step "VLC"
for ext in {mp4}; do
  duti -s org.videolan.vlc "${ext}" all
done


###############################################################################
section "GPG and SSH keys"
###############################################################################

step "Export keys from 1Password"
subaction "Export '01735455.public.gpg-key' to ~"
subaction "Export '01735455.subkeys.gpg-key' to ~"
subaction "Export 'fredriksavje.pub' to ~"
subaction "Export 'fredriksavje.ssh' to ~"
waitforenter

step "Importing keys"

substep "Importing '~/01735455.public.gpg-key'"
if [ -e "~/01735455.public.gpg-key" ]; then
  gpg --import ~/01735455.public.gpg-key
  rm ~/01735455.public.gpg-key
else
  warning "'~/01735455.public.gpg-key' doesn't exists"
fi

substep "Importing '~/01735455.subkeys.gpg-key'"
if [ -e "~/01735455.subkeys.gpg-key" ]; then
  gpg --import ~/01735455.subkeys.gpg-key
  rm ~/01735455.subkeys.gpg-key
else
  warning "'~/01735455.subkeys.gpg-key' doesn't exists"
fi

substep "Creating '~/.ssh'"
mkdir -p "~/.ssh"

substep "Importing '~/fredriksavje.pub'"
if [ -e "~/fredriksavje.pub" ]; then
  cp ~/fredriksavje.pub ~/.ssh/id_rsa.pub
  rm ~/fredriksavje.pub
else
  warning "'~/fredriksavje.pub' doesn't exists"
fi

substep "Importing '~/fredriksavje.ssh'"
if [ -e "~/fredriksavje.ssh" ]; then
  cp ~/fredriksavje.ssh ~/.ssh/id_rsa
  chmod 600 ~/.ssh/id_rsa
  rm ~/fredriksavje.ssh
else
  warning "'~/fredriksavje.ssh' doesn't exists"
fi

step "Check so keys are deleted:"
subaction "~/01735455.public.gpg-key"
subaction "~/01735455.subkeys.gpg-key"
subaction "~/fredriksavje.pub"
subaction "~/fredriksavje.ssh"
waitforenter

substep "Use keychain for SSH passphrase"
CHECK HOW TO

step "Sign file to store passphrase in keychain"
echo "test" > ~/tmpsign
gpg --output ~/tmpsign.sig --sign ~/tmpsign
rm ~/tmpsign ~/tmpsign.sig


###############################################################################
section "Backup hard drives"
###############################################################################


Not "No-backup"


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


###############################################################################
section "Clean up"
###############################################################################

killall caffeinate

echo ""
echo "$(tput bold)● All done ✅$(tput sgr0)"
action "Restart to finish"
echo ""
