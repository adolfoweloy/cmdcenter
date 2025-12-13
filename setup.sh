#!/bin/bash

echo "================================"
echo "Starting cmdcenter setup..."
echo "================================"
echo ""

ERRORS=0

# Helper function to check and install a package
check_and_install() {
  local cmd=$1
  local package=${2:-$1}

  echo "[*] Checking $cmd installation..."
  if ! which "$cmd" > /dev/null; then
    echo "    Installing $package..."
    if sudo apt-get -ys install "$package"; then
      echo "    [OK] $package installed"
    else
      echo "    [ERROR] Failed to install $package"
      ((ERRORS++))
    fi
  else
    echo "    [OK] $cmd already installed"
  fi
}

# Helper function to copy config file
copy_config() {
  local src=$1
  local dest=$2

  if [[ ! -f $dest ]]; then
    if cp "$src" "$dest"; then
      echo "    [OK] Copied $(basename "$dest")"
    else
      echo "    [ERROR] Failed to copy $(basename "$dest")"
      ((ERRORS++))
    fi
  else
    echo "    [SKIP] $(basename "$dest") already exists"
  fi
}

# Helper function to add line to .bashrc if not present
add_to_bashrc() {
  local content=$1
  local description=$2

  if ! grep -qF "$content" ~/.bashrc 2>/dev/null; then
    if echo "$content" >> ~/.bashrc; then
      echo "    [OK] $description"
    else
      echo "    [ERROR] Failed to add $description"
      ((ERRORS++))
    fi
  else
    echo "    [SKIP] $description already in .bashrc"
  fi
}

# Install required packages
check_and_install vim
check_and_install wget
check_and_install curl

# Install vim-plug
echo "[*] Checking vim-plug installation..."
if [[ ! -f $HOME/.vim/autoload/plug.vim ]]; then
  echo "    Installing vim-plug..."
  if curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; then
    echo "    [OK] vim-plug installed"
  else
    echo "    [ERROR] Failed to install vim-plug"
    ((ERRORS++))
  fi
else
  echo "    [OK] vim-plug already installed"
fi

# Copy configuration files
echo "[*] Copying configuration files..."
copy_config resources/.bash_aliases $HOME/.bash_aliases
copy_config resources/.gitconfig $HOME/.gitconfig
copy_config resources/.vimrc $HOME/.vimrc

# Install and configure tmux
check_and_install tmux
copy_config resources/.tmux.conf $HOME/.tmux.conf

# Set up cmdcenter scripts
echo "[*] Setting up cmdcenter scripts..."
if mkdir -p $HOME/.cmdcenter/scripts && cp scripts/colors.sh $HOME/.cmdcenter/scripts; then
  echo "    [OK] Copied colors.sh to ~/.cmdcenter/scripts"
else
  echo "    [ERROR] Failed to set up scripts"
  ((ERRORS++))
fi

# Configure .bashrc
echo "[*] Configuring bashrc..."
add_to_bashrc "source $HOME/.cmdcenter/scripts/colors.sh" "colors.sh sourcing"

if ! grep -qF "$(cat resources/ps1.sh)" ~/.bashrc 2>/dev/null; then
  if cat resources/ps1.sh >> ~/.bashrc; then
    echo "    [OK] Added PS1 customisation"
  else
    echo "    [ERROR] Failed to add PS1"
    ((ERRORS++))
  fi
else
  echo "    [SKIP] PS1 customisation already in .bashrc"
fi

# Install sdkman
echo "[*] Checking sdkman installation..."
if [[ ! -d $HOME/.sdkman ]]; then
  echo "    Installing sdkman..."
  if curl -s "https://get.sdkman.io" | bash; then
    echo "    [OK] sdkman installed"
  else
    echo "    [ERROR] Failed to install sdkman"
    ((ERRORS++))
  fi
else
  echo "    [OK] sdkman already installed"
fi

# Summary
echo ""
echo "================================"
if [[ $ERRORS -eq 0 ]]; then
  echo "Setup completed successfully!"
  echo "================================"
  exit 0
else
  echo "Setup completed with $ERRORS error(s)"
  echo "Please review the errors above"
  echo "================================"
  exit 1
fi
