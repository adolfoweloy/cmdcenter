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
if [[ -L $HOME/.bash_profile || -f $HOME/.bash_profile ]]; then
  read -p 'Do you want to override your .bash_profile? [y|n]:' ALLOW_OVERRIDE
fi

if [[ $ALLOW_OVERRIDE != 'y' ]]; then
  echo "backup your bash_profile and try next time"
  exit 0
fi

# creates an sh file within modules dir to load secret environment variables
# this file is ignored by git so it wont be published to git when you commit and publish your code (unless you change the default configurations)
touch $CURRENT_DIR/modules/_env.sh
echo "#!/bin/bash" > $CURRENT_DIR/modules/_env.sh

ln -sf $CURRENT_DIR/bash_profile $HOME/.bash_profile

echo "run the following command:"
echo "source $HOME/.bash_profile"
