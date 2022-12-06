# Shell setup

## Required software

In order to get this config installed properly we need to have previously installed some stuff: `curl`, `git`, `zsh` and optionals (but used in my setup files) like `neofetch`, `tree` and `neovim`.

```sh
sudo apt install curl git zsh tree neovim neofetch
```

## Clone and execute script

You can clone and execute the bootstrap script or just use the curl command below

### Clone repo

```sh
git clone https://github.com/hugoogb/shell-setup.git ~/shell-setup
```

### Bootstrap script

```sh
. ~/shell-setup/bootstrap.sh
```

If it does not execute you may need to give permissions to the script: `chmod u+x ~/shell-setup/bootstrap.sh`
