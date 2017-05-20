#!/bin/bash

# git autocomplete
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# bash aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# import .bashrc
[ -r ~/.bashrc ] && source ~/.bashrc

export PATH=$PATH:/usr/local/mysql/bin

## rabbitmq config
PATH=$PATH:/usr/local/sbin

# MacPorts Installer addition on 2015-01-01_at_12:09:11: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

## configuraçoes para exibição da branch no git
function git_nome_branch () {
  git branch 2>/dev/null | grep -e '^*' | sed -E 's/^\* (.+)$/(\1) /'
}

PS1="\[\033[01;32m\]\u@\h:\[\033[01;34m\]\w\[\033[1;35m\]\$(git_nome_branch)\[\033[m\]$ "

## Gradle config
GRADLE_HOME=~/Develop/java_tools/gradle-2.6
if [ -e $GRADLE_HOME ]; then
  export PATH="$GRADLE_HOME/bin:$PATH"
else
  echo "- gradle 2.6 does not exists in ~/Develop/java_tools/gradle-2.6"
fi

## Spring boot profile
export SPRING_PROFILES_ACTIVE=development

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/hastronauta/.gvm/bin/gvm-init.sh" ]] && source "/Users/hastronauta/.gvm/bin/gvm-init.sh"

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
JENV_INIT=~/.jenv/bin/jenv-init.sh
if [ -s $JENV_INIT ]; then
  source $JENV_INIT && source "~/.jenv/commands/completion.sh"
else
  echo "- you have to install jenv"
fi

# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.2.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

set -o vi
