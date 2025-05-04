#!/bin/bash

colors() {
  # if present first arg sets the number of columns
  # otherwise, the default number of columns will be 2
  columns=${1:-"5"}

  # print out the color palette
  for i in `seq 255`; do
    printf "\033[1;%dm\u2588\u2588 %03d\t" $i $i
    if (( $i % $columns == 0 )); then
      echo;
    fi;
  done

  # print new line for better formatting
  echo
}

colors
