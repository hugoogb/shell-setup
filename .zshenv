# useful paths
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:/home/hugoogb/.local/bin:/usr/local/texlive/2023/bin/x86_64-linux:$PATH

# starship config file path
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

export PNPM_HOME="/home/hugoogb/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
