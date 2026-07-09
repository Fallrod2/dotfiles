#!/usr/bin/env bash
set -euo pipefail

# Packages homebrew requis
brew install stow tmux neovim ripgrep fd node zoxide eza \
    zsh-autosuggestions zsh-syntax-highlighting powerlevel10k

# TPM (plugin manager tmux)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Config nvim (repo séparé)
if [ ! -d "$HOME/.config/mvim" ]; then
    git clone https://github.com/Fallrod2/mvim "$HOME/.config/mvim"
fi

# Symlinks
cd "$(dirname "$0")"
stow zsh tmux
claude:
	stow --no-folding -R claude

echo "Done. Ouvre un nouveau terminal, puis dans tmux : prefix + I pour les plugins."
