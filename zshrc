unsetopt nomatch # allow for HEAD^ in git commands
export ZSH=$HOME/.oh-my-zsh
export VISUAL=code
export EDITOR=code
export GOPATH="$HOME/dev/Go"

[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local
[ -s ${HOME}/.zsh_aliases ] && source ~/.zsh_aliases

# For GPG to work on Mac
export GPG_TTY=$(tty)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Activate conda base (sourced in ~/.zshenv)
# conda activate
export AUTOSWITCH_DEFAULT_CONDAENV=base # Autoswitch plugin default to base env

export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$GOPATH/bin:$HOME/.rvm/bin:/usr/local/sbin:/usr/local/bin:$HOME/.local/bin"

export LANG=en_US.UTF-8


source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle python
antigen bundle pip
antigen bundle pyenv
antigen bundle heroku
antigen bundle django
antigen bundle rails
antigen bundle ruby
antigen bundle gem
antigen bundle rake
antigen bundle osx
antigen bundle git
antigen bundle ls
antigen bundle cp
antigen bundle npm
antigen bundle nvm
antigen bundle node
antigen bundle docker
antigen bundle docker-compose
antigen bundle zsh-autosuggestions
antigen bundle autoswitch_conda
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions


# Load the theme.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export PATH="/Users/jkcorrea/bin/Sencha/Cmd:$PATH"
