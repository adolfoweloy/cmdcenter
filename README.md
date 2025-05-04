# cmdcenter

This is my dot files setup which I created for bash. Not sure how it will work with zsh or other shell.
I am using it for my own purposes but if someone reading this is interested to fork I would be keen to have a look and maybe improve cmdcenter.

# setup

Before running `./setup.sh` please check what is inside first so that you know what will be installed and configured.

```
git clone git@github.com:adolfoweloy/cmdcenter.git
cd cmdcenter
./setup.sh
```

## Future work

I still don't know how to automatically configure my prompt color and formatting but here is what I am currently using from my `.bashrc`:

```
PS1='${debian_chroot:+($debian_chroot)}'
PS1=$PS1'\[\033[38;5;227m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[38;5;122m\]'
PS1=$PS1'$(__git_ps1 " (%s)")\[\033[00m\] \$ '
```

In some places I am using 256 colors scheme where I am specifying what follows:
- 38 to define foreground color
- 5 to define that I am using 256 colors
- 227 is the color I am using here

