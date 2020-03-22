#!/bin/bash
function create-react-app() {
	if [[ ! -z "$1" ]]; then
	  npx --ignore-existing create-react-app $1
	else
	  echo "usage: create-react-app directory-name"
	fi
}
