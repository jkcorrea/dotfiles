export ZSH=$HOME/.oh-my-zsh
export VISUAL=subl

ZSH_THEME="zhann"
plugins=(osx git cp themes)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
[ -s /usr/share/doc/pkgfile ] && source /usr/share/doc/pkgfile/command-not-found.zsh
[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local

