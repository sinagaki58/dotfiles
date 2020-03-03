setup:
	make homebrew
	make link
	make install

homebrew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash

link:
	ln -sf ~/dotfiles/.vimrc ~/.vimrc
	ln -sf ~/dotfiles/.zshrc ~/.zshrc
	ln -sf ~/dotfiles/.tigrc ~/.tigrc

install:
	brew bundle --file=~/dotfiles/Brewfile

cp-gitconfig:
	cp ~/dotfiles/.gitconfig ~/.gitconfig

rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

