# Dotfiles

My personal dotfiles, managed with [chezmoi](https://github.com/twpayne/chezmoi).

## Tools

### Editor

- **[Neovim](https://neovim.io)** with [LazyVim](https://github.com/LazyVim/LazyVim) — my primary editor since late 2024. Previously used Sublime Text and VS Code.

### Terminal Emulators

- **[Wezterm](https://github.com/wez/wezterm)** — my current go-to terminal. Previously used iTerm (since 2013) and Warp (since 2022).
- **[Ghostty](https://ghostty.org)** — fast, feature-rich terminal emulator.
- **[Kitty](https://sw.kovidgoyal.net/kitty)** — GPU-accelerated terminal emulator.

### Window Manager

- **[AeroSpace](https://github.com/nikitabobko/AeroSpace)** — i3-like tiling window manager for macOS. Replaced [Rectangle](https://github.com/rxhanson/Rectangle).

### Terminal Multiplexer

- **[tmux](https://github.com/tmux/tmux)** — terminal multiplexer for managing multiple sessions.

### File Manager

- **[Yazi](https://github.com/sxyazi/yazi)** — blazing fast terminal file manager.

### AI Coding

- **[Aider](https://aider.chat)** — AI pair programming tool. Configured with Claude Sonnet 4 via Vertex AI.

## Usage

Apply the dotfiles with chezmoi:

```bash
chezmoi apply
```

Or interactively:

```bash
chezmoi apply -v
```
