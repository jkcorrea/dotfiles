export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="zhann"
plugins=(git cp ruby rvm rake themes node)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local

[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

export PATH="$PATH:$HOME/.rvm/bin:/etc/android-studio/bin" # Add RVM to PATH for scripting
