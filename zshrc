export ZSH=$HOME/.oh-my-zsh
export VISUAL=subl
export ANDROID_HOME=/opt/android-sdk
export TERM="xterm-256color"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

ZSH_THEME="bullet-train"
ZSH_COLOR_SCHEME="monokai"
BULLETTRAIN_HG_SHOW=false
BULLETTRAIN_TIME_12HR=true
BULLETTRAIN_PROMPT_CHAR=">"
plugins=(archlinux git cp ruby rvm rake themes node)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
[ -s /usr/share/doc/pkgfile ] && source /usr/share/doc/pkgfile/command-not-found.zsh
[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

export PATH="$PATH:$HOME/.rvm/bin:/opt/android-sdk/tools:/etc/android-studio/bin:$HOME/local/bin" 
