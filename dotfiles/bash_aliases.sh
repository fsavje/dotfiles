#!/usr/bin/env bash

# Easier navigation: .., ..., ...., ..... and --
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- --="cd - > /dev/null"

# Shortcuts
alias cddb="cd ~/Documents/Dropbox"
alias cddl="cd ~/Downloads"
alias cddt="cd ~/Desktop"

# List all files colorized in long format
alias lsl="ls -lhGF"

# List all files colorized in long format, including dot files
alias lsa="ls -lahGF"

# List only directories
alias lsd="ls -lGF | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls -G"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update_everything='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup'

# Show/hide hidden files in Finder
alias showhidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias alert="tput bel"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Load R quietly
alias Rq='R --quiet'
