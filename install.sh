#!/bin/sh

here=$(dirname $0)
if [[ $here == "." ]]; then
   here=$(pwd)
fi

rm ~/.profile
rm ~/.vimrc
rm ~/.vim
rm ~/.bashrc
rm ~/.bash_login
rm ~/.bash_profile
rm ~/.zshrc
rm ~/.gitconfig
rm -rf ~/.config

ln -s ${here}/.profile ~/.profile
ln -s ${here}/.vimrc ~/.vimrc
ln -s ${here}/vim ~/.vim
ln -s ${here}/.profile ~/.bashrc
ln -s ${here}/.profile ~/.bash_login
ln -s ${here}/.profile ~/.bash_profile
ln -s ${here}/.zshrc ~/.zshrc
ln -s ${here}/config/git/git ~/.gitconfig
ln -s ${here}/config ~/.config
