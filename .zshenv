# Environment variables
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"
export VISUAL=code
export EDITOR=code
export GPG_TTY=$(tty) # For GPG to work on Mac
export LANG=en_US.UTF-8
export HOMEBREW_NO_AUTO_UPDATE=1 # faster brew install

# Gray color for autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'

# PATH extensions
# go
export PATH="$PATH:$HOME/go/bin"
# pnpm
export PNPM_HOME="/Users/jkcorrea/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# sst
export PATH="$PATH:$HOME/.sst/bin"

# zplug
export ZPLUG_HOME=/opt/homebrew/opt/zplug

# Ensure Homebrew is in PATH (for M1 Macs)
if [[ -d "/opt/homebrew/bin" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi
