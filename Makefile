setup:
	make homebrew
	make link

homebrew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash
	brew bundle --file=~/dotfiles/Brewfile

link:
	ln -sf ~/dotfiles/.vimrc ~/.vimrc
	ln -sf ~/dotfiles/.zshrc ~/.zshrc
	ln -sf ~/dotfiles/.tigrc ~/.tigrc
	ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
	ln -sf ~/dotfiles ~/ghq/github.com/shinagak/dotfiles
	ln -sf ~/.ssh/config ~/projects/ssh

cp-gitconfig:
	cp ~/dotfiles/.gitconfig ~/.gitconfig
