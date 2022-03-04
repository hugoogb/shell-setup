#!/bin/bash

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'

BOLD='\033[1m'
ITALIC='\033[3m'
NORMAL="\033[0m"

color_print() {
  if [ -t 1 ]; then
    echo -e "$@$NORMAL"
  else
    echo "$@" | sed "s/\\\033\[[0-9;]*m//g"
  fi
}

stderr_print() {
  color_print "$@" >&2
}

warn() {
  stderr_print "$YELLOW$1"
}

error() {
  stderr_print "$RED$1"
  exit 1
}

info() {
  color_print "$CYAN$1"
}

ok() {
  color_print "$GREEN$1"
}

program_exists() {
  command -v $1 &> /dev/null
}

# modify
REPO=shell-setup

ACTUAL_DIR=`pwd`
REPO_DIR=$HOME/$REPO
CONFIG_DIR=$HOME/.config


# Installing oh-my-zsh
ohmyzsh_install() {
  info "Installing oh-my-zsh..."

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  info "Installing zsh plugins..."

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

# Linking dotfiles
shell_config() {
  info "Installing starship..."

  sh -c "$(curl -fsSL https://starship.rs/install.sh)"

  info "Setting up $REPO (bash,zsh,starship,etc)..."

  # Link .bashrc
  rm -rf $HOME/.bashrc # Remove the old config
  cp -fv $HOME/$REPO/.bashrc $HOME/

  # Link the zsh and starship prompt
  rm -rf $HOME/.zshrc # Remove the old config
  cp -fv $HOME/$REPO/.zshrc $HOME/

  STARSHIP_DIR=$HOME/.config/starship
  if [ ! -d $STARSHIP_DIR ]; then
    mkdir -p $STARSHIP_DIR
  fi

  rm -rf $STARSHIP_DIR/config.toml # Remove the old config
  cp -rfv $HOME/$REPO/starship.toml $HOME/.config/starship/
}

shell_setup() {
  #ohmyzsh_install
  shell_config
}

main() {
  if [ ! -d $TEMP_DIR ]; then
    mkdir $TEMP_DIR
  fi

  if [ ! -d $CONFIG_DIR ]; then
    mkdir $CONFIG_DIR
  fi

  ok "Welcome to @hugoogb $REPO!!!"
  info "Starting process..."

  sleep 0.8

  shell_setup
}

main

cd $ACTUAL_DIR

ok "$REPO done!!!"
warn "WARNING: don't forget to reboot in order to get everything working properly"