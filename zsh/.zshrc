# -------------------- Platform Detection --------------------
IS_LINUX=false
IS_MACOS=false

case "$(uname)" in
  Linux*)  IS_LINUX=true ;;
  Darwin*) IS_MACOS=true ;;
esac

# -------------------- Powerlevel10k Instant Prompt --------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------- Zinit Bootstrap --------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# -------------------- Plugins --------------------
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -Uz compinit && compinit
zinit cdreplay -q

# -------------------- Powerlevel10k Config --------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -------------------- General Options --------------------
export TERMINAL=kitty
export EDITOR="nvim"

setopt interactivecomments
setopt GLOB_DOTS

# -------------------- History --------------------
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups

# -------------------- Completion Styling --------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# -------------------- Keybindings --------------------
bindkey "${terminfo[kcuu1]}" history-beginning-search-backward
bindkey "${terminfo[kcud1]}" history-beginning-search-forward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# -------------------- Aliases --------------------
unalias zi 2>/dev/null
alias cd='z'
alias v='nvim'
alias ls='eza --icons'
alias tree='eza -T --icons'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias cat="batcat"
alias c='clear'
alias clearall='printf "\033c"'

# -------------------- y() Wrapper for Yazi --------------------
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# -------------------- Shell Integrations --------------------

# ---- FZF (required) ----
if ! command -v fzf &>/dev/null; then
  echo "❌ ERROR: fzf not found." >&2
  return 1
fi

if $IS_LINUX; then
  # Typical path for fzf keybindings installed via apt/pacman
  if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
  else
    echo "⚠️ WARNING: fzf key bindings not found at /usr/share/doc/fzf/examples/key-bindings.zsh" >&2
  fi
elif $IS_MACOS; then
  source <(fzf --zsh)
fi

# ---- Zoxide (required) ----
if ! command -v zoxide &>/dev/null; then
  echo "❌ ERROR: zoxide not found" >&2
  return 1
fi
eval "$(zoxide init zsh)"

# -------------------- Platform-Specific Config --------------------
if $IS_LINUX; then
  if [[ -f /opt/ros/humble/setup.zsh ]]; then
    source /opt/ros/humble/setup.zsh
  else
    echo "⚠️ WARNING: /opt/ros/humble/setup.zsh not found. Is ROS 2 Humble installed?" >&2
  fi
  export PATH="/snap/node/current/bin:$PATH"
elif $IS_MACOS; then
  export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
fi

# -------------------- Final PATH Setup --------------------
export PATH="$HOME/Applications:$HOME/.local/bin:$HOME/bin:$PATH"
