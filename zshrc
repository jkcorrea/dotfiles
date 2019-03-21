export ZSH=$HOME/.oh-my-zsh
export VISUAL=code
export EDITOR=code
export GOPATH="$HOME/dev/Go"

#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="geometry/geometry"
plugins=(bundler python pip pyenv django rails ruby osx git cp themes npm nvm docker docker-compose zsh-autosuggestions autoswitch_conda)


source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
[ -s /usr/share/doc/pkgfile ] && source /usr/share/doc/pkgfile/command-not-found.zsh
[ -s ${HOME}/.zsh_local ] && source ~/.zsh_local

# Setup NVM
export NVM_DIR="$HOME/.nvm"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Reload the plugin to highlight the commands each time Iterm2 starts
source ${ZSH}/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Activate conda base (sourced in ~/.zshenv)
conda activate
export AUTOSWITCH_DEFAULT_CONDAENV=base # Autoswitch plugin default to base env

export SALTSTACK_PATH="/Users/jkcorrea/dev/Edge/saltstack"
export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$GOPATH/bin:$HOME/.rvm/bin:/usr/local/sbin:/usr/local/bin:$HOME/.local/bin"

export LANG=en_US.UTF-8


### PL9K VISUAL CUSTOMISATION ###
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# # Elements options of left prompt (remove the @username context)
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
# # Elements options of right prompt
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
# # Add a second prompt line for the command
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# # Add a space in the first prompt
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# # Visual customisation of the second prompt line
# local user_symbol="$"
# if [[ $(print -P "%#") =~ "#" ]]; then
#     user_symbol = "#"
# fi
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"
# # Change the git status to red when something isn't committed and pushed
# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'
# # Add a new line after the global prompt
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true


# Colorise the top Tabs of Iterm2 with the same color as background
# Just change the 18/26/33 wich are the rgb values
echo -e "\033]6;1;bg;red;brightness;18\a"
echo -e "\033]6;1;bg;green;brightness;26\a"
echo -e "\033]6;1;bg;blue;brightness;33\a"
