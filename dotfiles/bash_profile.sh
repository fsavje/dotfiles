#!/usr/bin/env bash

# If not running interactively, return
[ -z "$PS1" ] && return


# Run only once
[ -n "$BASH_CONFIG_DONE" ] && return
BASH_CONFIG_DONE=true


# Load config files
[ -r "${HOME}/.dotfiles/dotfiles/bash_path.sh" ] && source ${HOME}/.dotfiles/dotfiles/bash_path.sh
#[ -e "~/.bash_exports" ] && source ${HOME}/.bash_exports
[ -r "${HOME}/.dotfiles/dotfiles/bash_functions.sh" ] && source ${HOME}/.dotfiles/dotfiles/bash_functions.sh
[ -r "${HOME}/.dotfiles/dotfiles/bash_aliases.sh" ] && source ${HOME}/.dotfiles/dotfiles/bash_aliases.sh
[ -r "${HOME}/.dotfiles/dotfiles/bash_completions.sh" ] && source ${HOME}/.dotfiles/dotfiles/bash_completions.sh
[ -r "${HOME}/.dotfiles/dotfiles/bash_prompt.sh" ] && source ${HOME}/.dotfiles/dotfiles/bash_prompt.sh


# Bash options

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Recursive globbing, e.g. `echo **/*.txt`
shopt -s globstar
