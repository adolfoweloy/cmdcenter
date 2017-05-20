#!/bin/bash

# import .bashrc
[ -r ~/.bashrc ] && source ~/.bashrc

# git autocomplete
if [ -f ~/.git-options.bash ]; then
  source ~/.git-options.bash
fi

# bash aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

## just for macbook
if ! [ -z $(uname -a | grep -i macbook) ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
  fi
fi

## mysql binary files
export PATH=$PATH:/usr/local/mysql/bin

## rabbitmq binary files
PATH=$PATH:/usr/local/sbin

# MacPorts Installer addition on 2015-01-01_at_12:09:11: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

## gradle binary path settings
GRADLE_HOME=~/Develop/java_tools/gradle-2.6
[[ -e $GRADLE_HOME ]] && export PATH="$GRADLE_HOME/bin:$PATH"

## Spring boot profile
export SPRING_PROFILES_ACTIVE=development

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "~/.gvm/bin/gvm-init.sh" ]] && source "~/.gvm/bin/gvm-init.sh"

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
JENV_INIT=~/.jenv/bin/jenv-init.sh
[[ -s $JENV_INIT ]] && source $JENV_INIT && source "~/.jenv/commands/completion.sh"

# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
# ghc is the haskell interpreter
export GHC_DOT_APP="/Applications/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# ruby version management
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

set -o vi
