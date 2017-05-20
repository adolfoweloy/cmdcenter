#!/bin/sh
# that will be the log file for all setup
export CMDCENTER_LOG=~/setup.log
touch $CMDCENTER_LOG

for file in `find * -maxdepth 1 | egrep -v "README.md|setup.sh"`; do
  CURRENT_FILE="$(pwd)/$file"

  if ! [ -d $CURRENT_FILE ]; then
    LINK_NAME=~/.$(basename $CURRENT_FILE)
    echo "linking $LINK_NAME to $CURRENT_FILE"
    # ln -fhs $CURRENT_FILE $LINK_NAME
  fi

done
