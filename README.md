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

💣 Warning!!!! make sure you have a backup of your `.bash_profile` 💣

## Installing

1. Download this repo to your `$HOME` directory (this is a convention and wont work if pulled into a different directory.
2. Go to the root directory and run `setup.sh`
3. After running setup, run `source $HOME/.bash_profile`

There are lots of things to improve on my dotfiles and I want it to be more dynamic (considering migrating it from bash to python or js+nodejs). At this time, conventions used are in place because I don't want to waste too much of my time creating a robust project with bash.