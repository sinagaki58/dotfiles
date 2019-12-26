setup:
	make init
	make link-vim
	make link-zsh
	make link-git
	make link-tig
	make install

init:
	xcode-select --install
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

link:
	ln -sf ~/dotfiles/.vimrc ~/.vimrc
	ln -sf ~/dotfiles/.zshrc ~/.zshrc
	ln -sf ~/dotfiles/.tigrc ~/.tigrc

link-git:
	ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

install:
	brew bundle --file=~/dotfiles/Brewfile

