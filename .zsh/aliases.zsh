# Reload .zshrc with an alias
alias reload="source $HOME/.zshrc"

# System aliases
alias distro="cat /etc/*-release | head -1 | tail -1 | cut -d= -f2"

alias python="python3"

# Custom aliases
alias show="tree ."
alias path="echo -e ${PATH//:/\\::}"


# Network aliases
alias myip="curl http://ipecho.net/plain; echo"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"

alias :q="exit"

# alias
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
 
#alias ls='ls -lh --color=auto'
#alias l='ls -la'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
 
alias cat='bat'
alias catn='/bin/cat'
alias catnl='bat --paging=never'
 
alias ..='cd ..'
 
alias reload='source $HOME/.zshrc'

alias :q='exit'
alias :wq='exit'

alias ghk='cat ~/.github-Pat'
alias ghkc='catn ~/.github-Pat | head -3  | tail -1 | tr -d "\n" | clip.exe'
alias ghkc2='catn ~/.github-Pat | head -8  | tail -1 | tr -d "\n" | clip.exe'

alias uni='cd /mnt/d/uni'
alias unil='cd /mnt/c/uni'

alias dev='cd /mnt/d/dev'