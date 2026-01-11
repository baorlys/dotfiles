# =============================================================================
# 1. POWERLEVEL10K INSTANT PROMPT (MUST BE AT THE TOP)
# =============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# 2. CORE CONFIGURATION
# =============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins (Note: zsh-syntax-highlighting MUST be the last one)
plugins=(
  git
  docker
  docker-compose
  zsh-autosuggestions
  zsh-tab-title
  zsh-syntax-highlighting 
)

source $ZSH/oh-my-zsh.sh

# =============================================================================
# 3. ENVIRONMENT VARIABLES & PATH
# =============================================================================
# Java & GUI Fixes for Sway/Wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export IBUS_ENABLE_SYNC_MODE=1

# Default Editor
export EDITOR='nvim'
export VISUAL='nvim'

# Go Lang
export GOPATH=$HOME/go

# Path Management
typeset -U path
path=(
  "$HOME/.local/bin"
  "$HOME/.sdkman/candidates/java/current/bin"
  "$HOME/.sdkman/candidates/maven/current/bin"
  "$HOME/.sdkman/candidates/gradle/current/bin"
  "/usr/local/go/bin"
  "$GOPATH/bin"
  "$HOME/.nvm"
  "$HOME/.cargo/bin"
  "$HOME/.local/share/bob/nvim-bin"
  $path
)

export PATH

# =============================================================================
# 4. ALIASES & FUNCTIONS
# =============================================================================

# --- System & Navigation ---
alias c="clear"
alias h="history"
alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -alF"
alias la="ls -A"
alias grep='grep --color=auto'
alias reload="source ~/.zshrc && echo '✅ Zsh config reloaded!'"
alias zshconfig="nvim ~/.zshrc"
alias hosts="sudo nvim /etc/hosts"

# --- Networking ---
alias myip="hostname -I | cut -d' ' -f1"
# Check port usage: `port 8080`
alias port="sudo lsof -i -P -n | grep LISTEN | grep"
# SSH Tunnel alias (Keep your specific business logic)
alias tunnel-db="ssh -L 15432:rds-postgresql-apse5-dev-vikki-portal-cluster.chi6ueogwqda.ap-southeast-5.rds.amazonaws.com:5432 bao.ly@bastion-01.nonprod.galaxyfinx.in"
alias network-control="kitty -e nmtui"

# --- Git (Workflow Optimized) ---
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gco="git checkout"
alias gb="git branch"
alias gpu="git push -u origin HEAD"
alias gts="git stash push -m"
alias gstp="git stash pop"
alias gstl="git stash list"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# --- Docker & Microservices ---
alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcl="docker compose logs -f"
alias ld="lazydocker" # Use Lazydocker TUI
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dprune="docker system prune -a --volumes" # Cleanup
alias dstop="docker stop \$(docker ps -a -q)"   # Stop all

alias vim="nvim"
alias vi="nvim"
# --- Modern CLI Tools (Rust replacements) ---
# Bat (Better cat)
if command -v bat > /dev/null; then
  alias cat='bat --style=plain'
  alias preview='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'
fi

# Chrome Wayland Fix
alias chrome="google-chrome-stable --ozone-platform=x11"

# =============================================================================
# 5. TOOL INITIALIZATION (SDKs, NVM, Rust)
# =============================================================================

# Zoxide (Smart cd)
if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi

# FZF (Fuzzy Finder) Configuration
if command -v fzf > /dev/null; then
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
  export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob \"!.git/*\""
fi

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# SDKMAN (Java/Maven/Gradle Manager)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# =============================================================================
# 6. POWERLEVEL10K CONFIG (MUST BE AT THE END)
# =============================================================================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
