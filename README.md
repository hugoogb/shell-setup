# Shell setup

## Required software

In order to get this config installed properly we need to have previously installed some stuff: `curl`, `git`, `zsh`, `fzf` and optionals like `tree` and `nvim`.

```sh
sudo apt install curl git zsh fzf tree nvim
```

## Clone and execute script

You can clone and execute the bootstrap script or just use the curl command below

### Clone repo

```sh
git clone https://github.com/hugoogb/shell-setup.git ~/shell-setup
```

### Bootstrap script

```sh
chmod u+x ~/shell-setup/shell-setup.sh
. ~/shell-setup/shell-setup.sh
```
