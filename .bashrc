[[ -f ~/.zshenv ]] && source ~/.zshenv

# Switch to zsh only if interactive and not running inside Warp
if [[ -t 1 && "$TERM_PROGRAM" != "WarpTerminal" ]]; then
  exec zsh
fi

# pnpm
export PNPM_HOME="/home/hugoogb/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
