ZSH_THEME="zhann"
plugins=(bundler python pip django rails ruby osx git cp themes npm)

export ZSH=$HOME/.oh-my-zsh
export VISUAL=code
export EDITOR=code
export GOPATH="$HOME/dev/Go"

source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
[ -s /usr/share/doc/pkgfile ] && source /usr/share/doc/pkgfile/command-not-found.zsh
[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export SALTSTACK_PATH="/Users/jkcorrea/dev/Edge/saltstack"
export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$GOPATH/bin:$HOME/.rvm/bin:/usr/local/sbin:/usr/local/bin"

eval "$(pyenv init -)"
