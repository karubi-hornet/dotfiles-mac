#!/bin/sh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# Set bash
if ! (echo "$SHELL" | grep "zsh" > /dev/null 2>&1 ) ; then
	chsh -s /bin/zsh
        # install oh-my-zsh
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install xcode
if ! (xcode-select --version > /dev/null 2>&1) ; then
	xcode-select --install > /dev/null
fi

