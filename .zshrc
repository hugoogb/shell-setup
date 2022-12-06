[[ -f ~/.zsh/config.zsh ]] && source ~/.zsh/config.zsh
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
[[ -f ~/.zsh/wsl2fix.zsh ]] && source ~/.zsh/wsl2fix.zsh

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Load Starship
eval "$(starship init zsh)"
