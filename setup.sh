#!/bin/bash
set -e

LACKING=0

function check_path {
  path=$1
  msg=$2

  if ! [ -d $path ]; then
    echo "[ ] $msg"
    LACKING=1
  else
    echo "[X] $msg"
  fi
}


## checking for installations before configuring all the environment
echo "################################################################"
echo "###           checking for installations                     ###"
echo "################################################################"

RES=0

check_path ~/Develop "Develop dir"
check_path /usr/local/mysql "mysql"
check_path /usr/local/sbin "sbin dir for rabbitmq"
check_path /Applications/ghc-7.10.2.app "glasgow haskell compiler (ghc)"
check_path ~/.jenv "jenv (java environment)"
check_path ~/.rvm "ruby version manager (rvm)"
check_path ~/.nvm "node version manager (nvm)"
check_path ~/.gvm "gvm (go version manager)"

echo ""

if [ $LACKING -eq 1 ]; then
  echo ">>>> It seems you don't have all the applications installed <<<<" && echo

  echo -n "     Type y to continue or n to skip setup your dotfiles [y/n]: "
  read keep_going
fi

[[ $keep_going = "n" ]] && exit 1

echo

## start configuring the environment
for file in `find * -maxdepth 1 | egrep -v "README.md|setup.sh"`; do
  CURRENT_FILE="$(pwd)/$file"

  if ! [ -d $CURRENT_FILE ]; then
    LINK_NAME=~/.$(basename $CURRENT_FILE)
    echo "linking $LINK_NAME to $CURRENT_FILE"
    # ln -fhs $CURRENT_FILE $LINK_NAME
  fi

done

echo
echo "YOUR ENVIRONMENT IS READY!"
