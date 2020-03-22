#!/bin/bash
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

CURRENT_DIR=$(pwd)
MODULES_DIR=$CURRENT_DIR/modules

# loads all additional modular settings
for n in `ls $MODULES_DIR`; do
  source $MODULES_DIR/$n
done

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
