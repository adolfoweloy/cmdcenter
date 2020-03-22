#!/bin/bash
set -e  # exit immediately if a command exists with a non-zero status

CURRENT_DIR=$(pwd)

# installing brew
which -s brew
if [[ $? != 0 ]]; then
  echo "*** installing brew ***"
  BREWINSTALLER=$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install) &&
  ruby -e "$BREWINSTALLER" || echo "Failed to install brew :("
else
  echo "*** updating brew ***"
  brew update
fi

# installing wget
which -s wget
if [[ $? != 0 ]]; then
  echo "*** installing wget ***"
  brew install wget 
else
  echo "*** wget already installed ***"
fi

# creates bash_profile as a link to dotfiles
ALLOW_OVERRIDE="n"
if [ -f $HOME/.bash_profile ]; then
  read -p 'Do you want to override your .bash_profile? [y|n]:' ALLOW_OVERRIDE
fi

if [[ $ALLOW_OVERRIDE != 'y' ]]; then
  echo "backup you bash_profile and try next time"
  exit 0
fi

ln -sf $CURRENT_DIR/bash_profile $HOME/.bash_profile

# creates add ons links to files on add ons dir
for n in `ls $CURRENT_DIR/addons`; do
  cp $CURRENT_DIR/addons/$n $HOME/.$n
done

echo "run the following command:"
echo "source $HOME/.bash_profile"
