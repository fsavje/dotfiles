# If not running interactively, return
[ -z "$PS1" ] && return

# Run only once
[ -n "$BASH_CONFIG_DONE" ] && return
BASH_CONFIG_DONE=true


# Load config files

[ -e "~/.bash_aliases" ] && source ${HOME}/.bash_aliases
[ -e "~/.bash_prompt" ] && source ${HOME}/.bash_prompt


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Recursive globbing, e.g. `echo **/*.txt`
shopt -s globstar
