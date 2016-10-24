#!/usr/bin/env bash

backup_dot() {
	# Delete if symlink
	if readlink $1 >/dev/null 2>&1; then
		unlink $1
	fi

	# Otherwise, make backup
	if [ -e "$1" ]; then
		mv $1 $1_bak$(date +%s)
	fi
}

symlink_dot() {
	backup_dot $2
	ln -s $1 $2
}

copy_dot() {
	backup_dot $2
	cp -n $1 $2
}

SCRIPT_DIR="$(dirname $0)"

[ -e "${HOME}/.hushlogin" ] || touch ${HOME}/.hushlogin

symlink_dot ${SCRIPT_DIR}/dots/l_bash_profile  ${HOME}/.bash_profile
symlink_dot ${SCRIPT_DIR}/dots/l_bashrc        ${HOME}/.bashrc
symlink_dot ${SCRIPT_DIR}/dots/l_editorconfig  ${HOME}/.editorconfig
symlink_dot ${SCRIPT_DIR}/dots/l_gitignore     ${HOME}/.gitignore
symlink_dot ${SCRIPT_DIR}/dots/l_inputrc       ${HOME}/.inputrc
symlink_dot ${SCRIPT_DIR}/dots/l_Rprofile      ${HOME}/.Rprofile

copy_dot    ${SCRIPT_DIR}/dots/c_gitconfig     ${HOME}/.gitconfig
