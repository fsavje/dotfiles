#!/usr/bin/env bash

if [ -d "/usr/local/opt/findutils/libexec/gnubin" ]; then
	PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
	MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
fi

if [ -d "/usr/local/opt/gnu-sed/libexec/gnubin" ]; then
	PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
	MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
fi

[ -d "$HOME/.bin" ] && PATH="$HOME/.bin:$PATH"

export PATH
