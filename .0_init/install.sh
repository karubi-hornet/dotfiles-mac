#!/bin/sh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# Set bash
if ! (echo $SHELL | grep "zsh" > /dev/null 2>&1 ) ; then
	chsh -s /bin/zsh
fi

# Install xcode
if ! (xcode-select --version > /dev/null 2>&1) ; then
	xcode-select --install > /dev/null
fi