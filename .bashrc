# Switch to zsh only if interactive and not running inside Warp
if [[ -t 1 && "$TERM_PROGRAM" != "WarpTerminal" ]]; then
  exec zsh
fi
