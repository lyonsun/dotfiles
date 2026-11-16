# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/), macOS oriented.

## Tools

| Area               | Tool                                                                        | Notes                                                                 |
| ------------------ | --------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| Editor             | [Neovim](https://neovim.io) + [LazyVim](https://github.com/LazyVim/LazyVim) | Primary editor since late 2024; previously Sublime Text and VS Code.  |
| Terminal           | [WezTerm](https://github.com/wez/wezterm/)                                  | Current go-to; previously iTerm and Warp.                             |
| Terminal           | [Ghostty](https://ghostty.org/)                                             | Fast, feature-rich terminal emulator.                                 |
| Terminal           | [kitty](https://sw.kovidgoyal.net/kitty/)                                   | GPU-accelerated terminal emulator.                                    |
| Window manager     | [AeroSpace](https://github.com/nikitabobko/AeroSpace)                       | i3-like macOS tiling; replaced Rectangle.                             |
| Multiplexer        | [tmux](https://github.com/tmux/tmux)                                        | Manages multiple sessions.                                            |
| File manager       | [Yazi](https://github.com/sxyazi/yazi)                                      | Fast terminal file manager.                                           |
| AI coding          | [Aider](https://aider.chat)                                                 | Claude Sonnet 4 via Vertex AI.                                        |
| Shell              | Zsh                                                                         | Oh My Zsh, `zoxide`, `mise`, Homebrew autosuggestions + highlighting. |
| Developer workflow | Herdr / Fabric                                                              | `hd` and `fabric` aliases.                                            |
| Developer workflow | Git worktrees                                                               | `wt` and `wtrm` pair worktrees with tmux windows.                     |

## Usage

On a new machine, install [chezmoi](https://www.chezmoi.io/install/), then clone and apply this repo:

```bash
chezmoi init --apply lyonsun
```

`~/.zshrc` is not managed by chezmoi, so load the personal profile from it:

```bash
echo '[ -f "${HOME}/.lyonsun/profile.zsh" ] && source "${HOME}/.lyonsun/profile.zsh"' >> ~/.zshrc
```

To pull in later changes, preview and then apply:

```bash
chezmoi diff
chezmoi apply
```

## Worktree helpers

After applying the Zsh profile and starting tmux, create a worktree and its paired tmux window from within a Git repository:

```bash
wt <label> [existing-branch]
```

Worktrees are created next to the repo as `<repo>-<label>`. Without a branch argument, `wt` creates a detached worktree from `origin/main`; it copies `.env` and `.dev.vars` when present, opens Neovim in one pane, and starts `pnpm i --frozen-lockfile` followed by Claude in the other. Remove the worktree and its tmux window with:

```bash
wtrm [-f] <label>
```

`-f` passes `--force` to `git worktree remove`. The branch, if any, is kept; `wtrm` prints the `git branch -d` command to delete it.
