export ZSH=$HOME/.oh-my-zsh
export VISUAL=code
export EDITOR=code

ZSH_THEME="zhann"
plugins=(bundler rails ruby osx git cp themes npm)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
[ -s /usr/share/doc/pkgfile ] && source /usr/share/doc/pkgfile/command-not-found.zsh
[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

export GOPATH="$HOME/dev/Go"
export PATH="$PATH:$GOPATH/bin:$HOME/.rvm/bin:/usr/local/sbin" # Add RVM to PATH for scripting
