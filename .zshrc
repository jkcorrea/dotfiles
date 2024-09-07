unsetopt nomatch # allow for HEAD^ in git commands
setopt HIST_IGNORE_ALL_DUPS

# Load some other configs
[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local
[ -s ${HOME}/.zsh_aliases ] && source ~/.zsh_aliases
[ -s ${HOME}/.zsh_fzf ] && source ~/.zsh_fzf

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

# Keybindings for substring search plugin. Maps up and down arrows.
bindkey -M main '^[OA' history-substring-search-up
bindkey -M main '^[OB' history-substring-search-down
bindkey -M main '^[[A' history-substring-search-up
bindkey -M main '^[[B' history-substring-search-down

# Keybindings for autosuggestions plugin
bindkey '^ ' autosuggest-accept
bindkey '^f' autosuggest-accept

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# TODO - which can we lazy load?
# Plugins!
source $ZPLUG_HOME/init.zsh
zplug "zpm-zsh/ls"
zplug "woefe/wbase.zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2
zplug "plugins/git", from:oh-my-zsh, lazy:true
zplug "plugins/httpie", from:oh-my-zsh, lazy:true
zplug "plugins/docker", from:oh-my-zsh, lazy:true
zplug "plugins/docker-compose", from:oh-my-zsh, lazy:true
# zplug "woefe/git-prompt.zsh", use:"{git-prompt.zsh,examples/wprompt.zsh}"
# zplug "b4b4r07/enhancd"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
  printf "Install? [y/N]: "
  if read -q; then
    echo
    zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# bun completions
[ -s "/Users/jkcorrea/.bun/_bun" ] && source "/Users/jkcorrea/.bun/_bun"

# PUT THESE LAST
eval "$(zoxide init zsh)"
# # Enable Starship prompt https://starship.rs/guide/#🚀-installation
eval "$(starship init zsh)"
