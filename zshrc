export ZSH=$HOME/.oh-my-zsh
export VISUAL=code
export EDITOR=code
export GOPATH="$HOME/dev/Go"

ZSH_THEME="zhann"
plugins=(bundler python pip pyenv django rails ruby osx git cp themes npm nvm zsh-autosuggestions autoswitch_conda)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
[ -s /usr/share/doc/pkgfile ] && source /usr/share/doc/pkgfile/command-not-found.zsh
[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local

# Setup NVM
export NVM_DIR="$HOME/.nvm"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Activate conda base (sourced in ~/.zshenv)
conda activate
export AUTOSWITCH_DEFAULT_CONDAENV=base # Autoswitch plugin default to base env

export SALTSTACK_PATH="/Users/jkcorrea/dev/Edge/saltstack"
export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$GOPATH/bin:$HOME/.rvm/bin:/usr/local/sbin:/usr/local/bin:$HOME/.local/bin"
