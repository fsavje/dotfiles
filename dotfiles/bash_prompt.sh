#!/usr/bin/env bash

bashc_bold=$(tput bold)
bashc_reset=$(tput sgr0)
bashc_black=$(tput setaf 0)
bashc_blue=$(tput setaf 33)
bashc_cyan=$(tput setaf 37)
bashc_green=$(tput setaf 64)
bashc_orange=$(tput setaf 166)
bashc_purple=$(tput setaf 125)
bashc_red=$(tput setaf 124)
bashc_violet=$(tput setaf 61)
bashc_white=$(tput setaf 15)
bashc_yellow=$(tput setaf 136)

prompt_git() {
	local s=''
	local branchName=''

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+'
			fi

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!'
			fi

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?'
			fi

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$'
			fi

		fi

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')"

		[ -n "${s}" ] && s=" ${s}"
		echo -e " ${1}[${branchName}${s}]${2}"
	else
		return
	fi
}

prompt_errorcode() {
	if [ "${?}" == "0" ]; then
		return
	else
		echo -e "${1}[Exit Status: ${?}]\n${2}"
	fi
}

PS1="\$(prompt_errorcode \"\[${bashc_red}\]\" \"\[${bashc_reset}\]\")"
if [[ "${USER}" == "root" ]]; then
	PS1+="\[${bashc_orange}\]\u\[${bashc_blue}\]"
else
	PS1+="\[${bashc_blue}\]\u"
fi
if [[ "${SSH_TTY}" ]]; then
	PS1+="@\[${bashc_orange}\]\h\[${bashc_blue}\]"
fi;
PS1+=":\W"
PS1+="\$(prompt_git \"\[${bashc_orange}\]\" \"\[${bashc_blue}\]\")"
PS1+="\\\$\[${bashc_reset}\] "

export PS1
