# WSL2 Optimizations
export NODE_OPTIONS="--max-old-space-size=4096"

# Context specific aliases for Claude Code
alias claude-debug="claude --append-system-prompt 'Focus on debugging. Add extensive logging.'"
alias claude-secure="claude --append-system-prompt 'Prioritize security. Review for vulnerabilities.'"
alias claude-perf="claude --append-system-prompt 'Optimize for performance. Profile critical paths.'"

# Switch to zsh only if interactive and not running inside Warp
if [[ -t 1 && "$TERM_PROGRAM" != "WarpTerminal" ]]; then
  exec zsh
fi