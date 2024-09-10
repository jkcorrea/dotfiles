unsetopt nomatch # allow for HEAD^ in git commands
setopt HIST_IGNORE_ALL_DUPS

# Load some other configs
[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local
[ -s ${HOME}/.zsh_aliases ] && source ~/.zsh_aliases
[ -s ${HOME}/.zsh_fzf ] && source ~/.zsh_fzf

# Load Antigen
source $(brew --prefix)/share/antigen/antigen.zsh
antigen bundle ohmyzsh/ohmyzsh path:plugins/git
antigen bundle ohmyzsh/ohmyzsh path:plugins/httpie
# antigen bundle hadenlabs/zsh-starship
# antigen bundle docker # TODO wasnt working.
antigen bundle docker-compose
antigen bundle zpm-zsh/ls
antigen bundle Aloxaf/fzf-tab
antigen bundle woefe/wbase.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv
antigen bundle zdharma-continuum/fast-syntax-highlighting
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
