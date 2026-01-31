# Exit immediately if non-interactive
[[ -o interactive ]] || return

[[ -f ~/.zsh/config.zsh ]] && source ~/.zsh/config.zsh
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
