# Command Center (dotfiles)

This is my modularised dotfiles setup.
Simply put, modules here are just bash scripts with a single purpose that can be added within `modules` directory. They should be bash scripts that will be automaticaly picked up by setup.sh.

⚠️  _This works fine for my purposes. If you want to use it, use it at your own risk_ ⚠️

## Prerequisites

This dotfiles works just for MacOS at the moment.
It also works with bash. I want to migrate/support zsh later.

## What will be installed/modified

1. Homebrew
2. Sdkman (useful for Java developers)
3. Creates a symbolic link for `.bash_profile` to `bash_profile` available in this project

## Installing

After downloading this project, go to the root directory and run `setup.sh`
After running setup, run `source $HOME/.bash_profile`