# PATH
export PATH="$HOME/.local/bin:$PATH"

# oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="robbyrussell"
  plugins=(git)
  source "$ZSH/oh-my-zsh.sh"
fi

# zsh autosuggestions & syntax highlighting
_brew_share="${HOMEBREW_PREFIX:-/opt/homebrew}/share"
[ -f "$_brew_share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] &&
  source "$_brew_share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -f "$_brew_share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] &&
  source "$_brew_share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
unset _brew_share

# zoxide
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# mise
command -v mise >/dev/null && eval "$(mise activate zsh)"

# herdr
alias hd='herdr'

# fabric ai
alias fabric='fabric-ai'

# tmux session with worktree
wt() {
  local label=$1 branch=$2 base=main root
  [ -z "$label" ] && { echo "usage: wt <label> [existing-branch]"; return 1; }
  case $label in */*) echo "label must not contain /"; return 1 ;; esac
  root=$(git rev-parse --show-toplevel) || return 1
  local dir="$root/../$(basename $root)-$label"

  if [ ! -d "$dir" ]; then
    if [ -n "$branch" ]; then
      git worktree add "$dir" "$branch" || return 1
    else
      git fetch origin "$base" --quiet || return 1
      git worktree add --detach "$dir" "origin/$base" || return 1
    fi
    for f in .env .dev.vars; do [ -f "$root/$f" ] && cp "$root/$f" "$dir/$f"; done
  fi

  tmux select-window -t "=$label" 2>/dev/null && return
  tmux new-window -n "$label" -c "$dir" nvim
  tmux split-window -h -c "$dir" "pnpm i --frozen-lockfile && claude; exec $SHELL"
  tmux select-pane -L
}

wtrm() {
  local force=""
  [ "$1" = "-f" ] && { force="--force"; shift; }
  local label=$1 root
  [ -z "$label" ] && { echo "usage: wtrm [-f] <label>"; return 1; }
  root=$(git rev-parse --show-toplevel) || return 1
  local dir="$root/../$(basename $root)-$label"
  [ -d "$dir" ] || { echo "no worktree for label: $label"; return 1; }

  local branch=$(git -C "$dir" symbolic-ref --short -q HEAD)
  git worktree remove $force "$dir" || return 1
  [ -n "$branch" ] && echo "removed. branch $branch kept (delete: git branch -d $branch)"
  tmux kill-window -t "=$label" 2>/dev/null
}

