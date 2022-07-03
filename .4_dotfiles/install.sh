#!/bin/sh

# link
basename -a "$PWD"/.4_dotfiles/.??* | xargs -I{} ln -sfv "$PWD"/.4_dotfiles/{} ~/{}

# Zinit (Zsh plugin manager)
grep .plugins.zsh ~/.zshrc > /dev/null
if [ ! $? ]; then
	sh -c "$(curl -fsSL https://git.io/zinit-install)"
	cp -f $PWD/.4_dotfiles/.zshrc ~/.zshrc
	echo ". $PWD/.4_dotfiles/.plugins.zsh" >> ~/.zshrc
fi


echo "👍 dotfiles link is done!"
