# dotfiles

My macOS dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/) —
one symlinked package per tool, one `install.sh` to set up a new machine.

My Neovim config lives in its own repo: [Fallrod2/mvim](https://github.com/Fallrod2/mvim)
(cloned automatically by the install script).

## What's inside

| Package | Contents |
|---|---|
| `zsh` | `.zshrc` (Powerlevel10k, autosuggestions, syntax highlighting, zoxide, eza) + `.p10k.zsh` |
| `tmux` | `~/.config/tmux/tmux.conf` — `C-a` prefix, vi copy-mode, TPM plugins (vim-tmux-navigator, resurrect, continuum, tokyo-night theme) |

## Install (new machine)

```sh
# 1. Homebrew first, if missing: https://brew.sh
git clone https://github.com/Fallrod2/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```

The script installs the required Homebrew packages, TPM, clones
[mvim](https://github.com/Fallrod2/mvim), and symlinks everything with stow.

Then:

1. Open a new terminal (zsh config loads).
2. Start tmux and press `C-a I` to install the tmux plugins.
3. Run `mvim` once — lazy.nvim bootstraps and installs everything from its lockfile.

## Managing packages

```sh
cd ~/dotfiles
stow zsh          # symlink a package
stow -D zsh       # remove its symlinks
stow -R zsh       # re-link (after moving files around)
```

Adding a new tool: recreate its path **relative to `$HOME`** inside a new
package folder, move the real config there, then stow it:

```sh
mkdir -p ~/dotfiles/sketchybar/.config
mv ~/.config/sketchybar ~/dotfiles/sketchybar/.config/
cd ~/dotfiles && stow sketchybar
```

## Daily workflow

Configs are symlinks into this repo — just edit them where they live
(`~/.zshrc`, `~/.config/tmux/tmux.conf`, …), then:

```sh
cd ~/dotfiles && git add -A && git commit -m "..." && git push
```

## tmux quick reference

| Action | Keys |
|---|---|
| Prefix | `C-a` |
| Split vertical / horizontal | `C-a |` / `C-a -` (opens in current dir) |
| New window | `C-a c` |
| Move between panes (and nvim splits) | `C-h/j/k/l` — no prefix |
| Resize pane (repeatable) | `C-a h/j/k/l` |
| Zoom pane | `C-a m` |
| Detach | `C-a d` |
| Reload config | `C-a r` |
| Install / update plugins | `C-a I` / `C-a U` |

Shell helpers (defined in `.zshrc`):

| Command | Effect |
|---|---|
| `ts <name>` | attach session `<name>`, create it if missing (default: `main`) |
| `tl` | list sessions |
| `mini [name]` | ssh to the Mac mini and attach a tmux session there (default: `claw`) |

Sessions survive detaching, SSH drops, and (via resurrect/continuum) even reboots.
