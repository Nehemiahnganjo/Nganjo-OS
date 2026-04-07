# Ng'anjo OS — Default Zsh Configuration
# Creator: Nehemiah Ng'anjo

# ── History ────────────────────────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# ── Options ────────────────────────────────────────────────────────────────────
setopt AUTO_CD
setopt EXTENDED_GLOB

# ── Plugins ────────────────────────────────────────────────────────────────────
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ── Completion ─────────────────────────────────────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ── Prompt ─────────────────────────────────────────────────────────────────────
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{#00D2B4}%n%f%F{#888}@%f%F{#FFD166}nganjo-os%f %F{#E6EDF5}%~%f%F{#00D2B4}${vcs_info_msg_0_}%f
%F{#00D2B4}❯%f '

# ── Aliases ────────────────────────────────────────────────────────────────────
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -ch'
alias free='free -h'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -p'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# ls — use eza (guaranteed installed)
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias la='eza -a --icons'
alias lt='eza --tree --icons --level=2'

# cat — use bat (guaranteed installed)
alias cat='bat --style=plain'
alias less='bat --paging=always'

# Package management
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'
command -v yay &>/dev/null && alias aur='yay -S'

# Ng'anjo shortcuts
alias nganjo-update='sudo pacman -Syu'
alias nganjo-clean='sudo pacman -Scc --noconfirm'
alias nganjo-info='fastfetch'
alias nganjo-mirrors='sudo reflector --country "United States,Germany,France" --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Sy'

# ── fzf integration ────────────────────────────────────────────────────────────
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]]   && source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --color=bg+:#141926,fg:#E6EDF5,hl:#00D2B4,hl+:#FFD166,border:#00D2B4'

# ── Functions ──────────────────────────────────────────────────────────────────
mkcd() { mkdir -p "$1" && cd "$1"; }

extract() {
    [[ -z "$1" ]] && { echo "Usage: extract <file>"; return 1; }
    [[ ! -f "$1" ]] && { echo "File not found: $1"; return 1; }
    case "$1" in
        *.tar.bz2)  tar xjf "$1"  ;;
        *.tar.gz)   tar xzf "$1"  ;;
        *.tar.xz)   tar xJf "$1"  ;;
        *.tar.zst)  tar --zstd -xf "$1" ;;
        *.tar)      tar xf "$1"   ;;
        *.zip)      unzip "$1"    ;;
        *.7z)       command -v 7z &>/dev/null && 7z x "$1" || echo "7z not installed" ;;
        *.gz)       gunzip "$1"   ;;
        *.xz)       unxz "$1"     ;;
        *.bz2)      bunzip2 "$1"  ;;
        *)          echo "Cannot extract '$1' — unknown format" ;;
    esac
}

# ── Welcome message ────────────────────────────────────────────────────────────
if [[ $- == *i* ]]; then
    echo ""
    echo "  \033[38;2;0;210;180m Ng'anjo OS 1.0 Lite\033[0m  |  \033[38;2;255;209;102mCreator: Nehemiah Ng'anjo\033[0m"
    echo "  \033[38;2;136;136;136m$(uname -sr) | $(date '+%A, %d %B %Y')\033[0m"
    echo ""
fi
