#!/bin/bash

# This project's current location.
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=false

# List of dotfiles to manage
DOTFILES=(
  ".zshrc"
  ".zshenv"
  ".zprofile"
  ".zlogin"
  ".zsh_aliases"
  ".zsh_fzf"
  ".gitignore_global"
  ".fzf.zsh"
  ".tmux.conf"
  ".npmrc"
)

# Function to create symlinks
create_symlinks() {
  local cmd="ln -sf"
  if [ "$DRY_RUN" = true ]; then
    cmd="echo Would create symlink:"
  fi

  for file in "${DOTFILES[@]}"; do
    $cmd "$DOTFILES_DIR/$file" "$HOME/$file"
  done
}

# Function to revert changes
revert_changes() {
  echo "Reverting changes..."
  for file in "${DOTFILES[@]}"; do
    if [ -f "$HOME/$file" ] || [ -L "$HOME/$file" ]; then
      if [ ! -f "$HOME/$file.bak" ]; then
        mv "$HOME/$file" "$HOME/$file.bak"
      else
        rm "$HOME/$file"
      fi
    fi
    ln -s "$DOTFILES_DIR/$file" "$HOME/$file"
  done
  echo "Changes reverted."
}

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
  --dry-run) DRY_RUN=true ;;
  --revert)
    revert_changes
    exit 0
    ;;
  *)
    echo "Unknown parameter: $1"
    exit 1
    ;;
  esac
  shift
done

# Backup existing files
for file in "${DOTFILES[@]}"; do
  if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
    cp "$HOME/$file" "$HOME/$file.bak"
  fi
done

# Create symlinks
create_symlinks

# Create .zsh_local if it doesn't exist
if [ "$DRY_RUN" = false ]; then
  touch "$HOME/.zsh_local"
fi

# Install Homebrew if not installed
if ! command -v brew &>/dev/null; then
  if [ "$DRY_RUN" = true ]; then
    echo "Would install Homebrew"
  else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

# Install zplug if not installed
if [ ! -d "$ZPLUG_HOME" ]; then
  if [ "$DRY_RUN" = true ]; then
    echo "Would install zplug"
  else
    echo "Installing zplug..."
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  fi
fi

BREW_PACKAGES=(zsh asdf fzf zoxide starship)
if [ "$DRY_RUN" = true ]; then
  echo "Would install: ${BREW_PACKAGES[*]}"
  brew install --dry-run "${BREW_PACKAGES[@]}"
else
  brew install -q "${BREW_PACKAGES[@]}"
fi

echo "Dotfiles setup complete!"
