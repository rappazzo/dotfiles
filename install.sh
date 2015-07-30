#!/bin/sh

here=$(dirname $0)

ln -s ${here}/.profile ~/.profile
ln -s ${here}/.vimrc ~/.vimrc
ln -s ${here}/.vim ~/.vim
ln -s ${here}/.profile ~/.bashrc
ln -s ${here}/.profile ~/.bash_login
ln -s ${here}/.profile ~/.bash_profile
ln -s ${here}/.zshrc_antigen ~/.zshrc
ln -s ${here}/config ~/.config
