setup:
	make init
	make linkg
	make install

init:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

link:
	ln -sf ~/dotfiles/.vimrc ~/.vimrc
	ln -sf ~/dotfiles/.zshrc ~/.zshrc
	ln -sf ~/dotfiles/.tigrc ~/.tigrc

cp-gitconfig:
	cp ~/dotfiles/.gitconfig ~/.gitconfig

install:
	brew bundle --file=~/dotfiles/Brewfile

