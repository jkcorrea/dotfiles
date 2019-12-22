#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

### TODO
### - look into setting up python env (conda, pypsi, etc)
###

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="gemrc gitconfig gitignore_global vimrc vim zshenv zshrc zsh_aliases irbrc config chunkwmrc"    # list of files/folders to symlink in homedir

########## Special cases

echo -n "Force copying $dir/git-stash-staging to /usr/local/bin/git-stash-staging"
cp -f $dir/git-stash-staging /usr/local/bin/
chmod +x /usr/local/bin/git-stash-staging

########## The good stuff.

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    if [ -s ~/.$file ]; then
        echo "Moving existing file $file from ~ to $olddir"
        rm -rf $olddir/.$file
        mv ~/.$file $olddir/
        rm -rf ~/.$file
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
    # Try to install zsh if it isn't
    if [ ! $(grep /zsh$ /etc/shells | wc -l) -ge 1 ]; then
        # Get machine platform
        platform=$(uname);
        # If the platform is Linux, try an apt-get to install zsh and then recurse
        if [[ $platform == 'Linux' ]]; then
            if [[ -f /etc/redhat-release ]]; then
                sudo yum install zsh
                install_zsh
            fi
            if [[ -f /etc/debian_version ]]; then
                sudo apt-get install zsh
                install_zsh
            fi
        # If the platform is OS X, tell the user to install zsh :)
        elif [[ $platform == 'Darwin' ]]; then
            if [ -s /usr/local/bin/brew ]; then
                brew install zsh
                install_zsh
            else
                echo "Please install Homebrew or zsh and re-run this script."
                exit
            fi
        fi
    fi

    # Install oh-my-zsh
    if [[ ! -d $dir/.oh-my-zsh/ ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        brew install antigen
    fi

    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi

}

install_zsh
