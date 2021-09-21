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
TEMP_DIR=$HOME/temp
CONFIG_DIR=$HOME/.config

if [ ! -d $TEMP_DIR ]; then
  mkdir $TEMP_DIR
fi

if [ ! -d $CONFIG_DIR ]; then
  mkdir $CONFIG_DIR
fi

ok "Welcome to @hugoogb $REPO!!!"
info "Starting process..."

sleep 1

if ! program_exists "git"; then
  error "ERROR: git is not installed"
fi

# Dotfiles update
update_repo() {
  cd $REPO_DIR
  info "Updating $REPO..."
  git config --global pull.rebase false
  git pull origin master
  cd $REPO_DIR
}

clone_repo() {
  if [ -d $REPO_DIR]; then
    warn "WARNING: $REPO directory already exists"
  else
    info "Cloning $REPO..."
    git clone https://github.com/hugoogb/$REPO.git $REPO_DIR
  fi

  update_repo

  ok "$REPO cloned and updated"
}

clone_update_repo() {
  clone_repo
}

# Installing oh-my-zsh
ohmyzsh_install() {
  info "Installing oh-my-zsh..."

  OH_MY_ZSH_DIR=$HOME/.oh-my-zsh

  if [ ! -d $OH_MY_ZSH_DIR ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    warn "WARNING: oh-my-zsh already installed"
  fi

  info "Installing zsh plugins..."

  ZSH_SYNTAX_HIGHLIGHTING_PLUGIN=$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

  if [ ! -d $ZSH_SYNTAX_HIGHLIGHTING_PLUGIN ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  else
    warn "WARNING: oh-my-zsh plugin: zsh-syntax-highlighting already installed"
  fi

  ZSH_K_PLUGIN=$HOME/.oh-my-zsh/custom/plugins/k

  if [ ! -d $ZSH_K_PLUGIN ]; then
    git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k
  else
    warn "WARNING: oh-my-zsh plugin: k already installed"
  fi

  ZSH_AUTOSUGGESTIONS_PLUGIN=$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

  if [ ! -d $ZSH_AUTOSUGGESTIONS_PLUGIN ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  else
    warn "WARNING: oh-my-zsh plugin: zsh-autosuggestions already installed"
  fi

  info "Installing starship..."

  if ! program_exists "starship"; then
    curl -fsSL https://starship.rs/install.sh | bash
  else
    warn "WARNING: starship already installed"
  fi
}

# Linking dotfiles
shell_config() {
  info "Setting up $REPO (bash,zsh,starship,etc)..."

  # Link .bashrc
  cp -fv $HOME/$REPO/.bashrc $HOME/

  # Link the zsh and starship prompt
  cp -fv $HOME/$REPO/.zshrc $HOME/
  cp -rfv $HOME/$REPO/starship.toml $HOME/.config/starship/
}

shell_setup() {
  ohmyzsh_install
  shell_config
}

main() {
  clone_update_repo
  shell_setup
}

main

rm -rf $TEMP_DIR

ok "$REPO done!!!"
warn "WARNING: don't forget to reboot in order to get everything working properly"