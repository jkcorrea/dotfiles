export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="zhann"
plugins=(git cp ruby bundler capistrano gem rvm rake themes node)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local

export PATH="$PATH:$HOME/.rvm/bin:$GEM_HOME/bin"
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
