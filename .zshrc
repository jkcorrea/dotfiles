unsetopt nomatch # allow for HEAD^ in git commands
setopt HIST_IGNORE_ALL_DUPS

# Load some other configs
[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local
[ -s ${HOME}/.zsh_aliases ] && source ~/.zsh_aliases
[ -s ${HOME}/.zsh_fzf ] && source ~/.zsh_fzf

# Load Antigen
source $(brew --prefix)/share/antigen/antigen.zsh
antigen bundles <<EOBUNDLES
  robbyrussell/oh-my-zsh plugins/git
  robbyrussell/oh-my-zsh plugins/httpie
  # docker # TODO wasnt working.
  docker-compose
  zpm-zsh/ls
  Aloxaf/fzf-tab
  woefe/wbase.zsh
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-history-substring-search
  MichaelAquilina/zsh-autoswitch-virtualenv
  zdharma-continuum/fast-syntax-highlighting
EOBUNDLES
# Tell Antigen that you're done
antigen apply

# Keybindings for substring search plugin. Maps up and down arrows.
bindkey -M main '^[OA' history-substring-search-up
bindkey -M main '^[OB' history-substring-search-down
bindkey -M main '^[[A' history-substring-search-up
bindkey -M main '^[[B' history-substring-search-down

# Keybindings for autosuggestions plugin
bindkey '^ ' autosuggest-accept
bindkey '^f' autosuggest-accept

# Load asdf (cache for perf)
if [ -f ~/.asdf_brew_cache ]; then
  source ~/.asdf_brew_cache
else
  if brew --prefix --installed asdf &>/dev/null; then
    echo "source $(brew --prefix asdf)/libexec/asdf.sh" >~/.asdf_brew_cache
    source ~/.asdf_brew_cache
  else
    echo "[WARN] asdf not found, skipping..."
  fi
fi

# bun completions
[ -s "/Users/jkcorrea/.bun/_bun" ] && source "/Users/jkcorrea/.bun/_bun"

# PUT THESE LAST
eval "$(zoxide init zsh)"
# Enable Starship prompt https://starship.rs/guide/#🚀-installation
eval "$(starship init zsh)"
