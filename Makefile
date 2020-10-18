setup:
	make homebrew
	make link
	make install

homebrew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash

link:
	ln -sf ~/dotfiles ~/projects/dotfiles
	ln -sf ~/dotfiles/.vimrc ~/.vimrc
	ln -sf ~/dotfiles/.zshrc ~/.zshrc
	ln -sf ~/dotfiles/.tigrc ~/.tigrc
	ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -sf ~/.ssh/config ~/projects/ssh

install:
	brew bundle --file=~/dotfiles/Brewfile

cp-gitconfig:
	cp ~/dotfiles/.gitconfig ~/.gitconfig
