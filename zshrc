export ZSH=$HOME/.oh-my-zsh
export VISUAL=code
export EDITOR=code
export GOPATH="$HOME/dev/Go"

[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local

# Setup NVM/RVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Activate conda base (sourced in ~/.zshenv)
conda activate
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
antigen bundle osx
antigen bundle git
antigen bundle cp
antigen bundle npm
antigen bundle nvm
antigen bundle docker
antigen bundle docker-compose
antigen bundle zsh-autosuggestions
antigen bundle autoswitch_conda
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme denysdovhan/spaceship-prompt

# Tell Antigen that you're done.
antigen apply
