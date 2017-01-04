# Fredrik's dotfiles

This repo automates a fresh installation of a macOS exactly how Fredrik wants it.


### Install everything
```bash
softwareupdate --install --all
xcode-select --install
# Possibly full xcode
sudo xcodebuild -license
mkdir -m 700 ~/.dotfiles && cd ~/.dotfiles
git clone https://github.com/fsavje/dotfiles.git .
# Copy Dropbox/Privat/dot_secrets.sh to ~/.dotfiles/dot_secrets.sh
./software.sh 2> >(tee "~\software.log")
./settings.sh 2> >(tee "~\settings.log")
```


### Inspiration

* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Vítor’s dotfiles](https://github.com/vitorgalvao/dotfiles)
* [bash-it](https://github.com/Bash-it/bash-it)
