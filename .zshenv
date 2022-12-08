# useful paths
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH

# go lang
export PATH=/usr/local/go/bin:$PATH

# gui apps in wsl2
export DISPLAY=:0

# nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# chrome
export CHROME_EXECUTABLE="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"

# starship config file path
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

