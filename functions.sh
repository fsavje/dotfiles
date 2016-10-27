#!/usr/bin/env bash

backup_file() {
  # Delete if symlink
  if readlink $1 >/dev/null 2>&1; then
    unlink $1
  fi

  # Otherwise, make backup
  if [ -e "$1" ]; then
    mv $1 $1.bak$(date +%s)
  fi
}

section() {
	echo ""
	echo "$(tput setaf 64)*************************************************************$(tput sgr0)"
	echo "$(tput setaf 64)$(tput bold)$1$(tput sgr0)"
	echo "$(tput setaf 64)*************************************************************$(tput sgr0)"
}

step() {
	echo ""
	echo "$(tput bold)● $1$(tput sgr0)"
}

substep() {
	echo "  ◦ $1"
}

action() {
	echo ""
	echo "$(tput setaf 166)▶ $1$(tput sgr0)"
}

subaction() {
	echo "$(tput setaf 166)  ▶ $1$(tput sgr0)"
}

subsubaction() {
	echo "$(tput setaf 166)    ▸ $1$(tput sgr0)"
}

waitforenter() {
	echo "$(tput setaf 166)    ▸ Press <enter> when done$(tput sgr0)"
	read
}

warning() {
	echo "$(tput setaf 124)$(tput bold)✘ $1$(tput sgr0)"
}
