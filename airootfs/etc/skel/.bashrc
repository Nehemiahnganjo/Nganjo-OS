# Ng'anjo OS — Bash fallback config
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias df='df -h'
alias free='free -h'
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias cls='clear'
PS1='\[\033[38;2;0;210;180m\]\u\[\033[0m\]@\[\033[38;2;255;209;102m\]nganjo-os\[\033[0m\] \[\033[38;2;230;237;245m\]\w\[\033[0m\]\n❯ '
