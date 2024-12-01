#!/bin/bash

# make sure vim is installed
which vim > /dev/null
if [[ $? != 0 ]]; then
  echo "Installing vim"
  sudo apt-get -ys install vim
fi

which wget > /dev/null
if [[ $? != 0 ]]; then
  echo "Installing wget"
  sudo apt-get -ys install wget
fi

which curl > /dev/null
if [[ $? != 0 ]]; then
  echo "Installing curl"
  sudo apt-get -ys install curl
fi

# install Plug plugin manager for vim
if [[ ! -f $HOME/.vim/autoload/plugin.vim ]]; then 
  echo "Installing Plug vim plugin"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# copying files
if [[ ! -f $HOME/.bash_aliases ]]; then
  cp resources/.bash_aliases $HOME/.bash_aliases
fi

if [[ ! -f $HOME/.gitconfig ]]; then
  cp resources/.gitconfig $HOME/.gitconfig
fi

if [[ ! -f $HOME/.vimrc ]]; then
  cp resources/.vimrc $HOME/.vimrc
fi

# installing sdkman
which sdk > /dev/null
if [[ $? != 0 ]]; then
  echo "Installing sdkman"
  curl -s "https://get.sdkman.io" | bash
fi

echo "Don't forget to download your IDE keymap file and copy it to the following dir once IDEA is installed"
echo "$HOME/.config/JetBrains/<version>/keymaps/"

