#!/bin/sh

ln -s vimrc ~/.vimrc
ln -s zshrc ~/.zshrc
ln -s gitconfig ~/.gitconfig

xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
