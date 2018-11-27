#!/bin/bash

############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc zshrc"          # list of files/folders to symlink in homedir

##########
# Things to install
sudo apt-get install vim-gtk3
sudo apt-get install zsh
sudo apt-get install git-core
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo apt-get install fonts-powerline
sudo apt-get install autojump
sudo apt-get install exuberant-ctags

# Upgrade things
upgrade_oh_my_zsh

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# Set git config settings
git config --global user.email "aurelien.febvre@gmail.com"
git config --global user.name "Zibzob"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Create symbolic link to the 1To hard drive
ln -s /media/aurelf/Data ~/Data
# Create symbolic link to the .ipython_config.py file
ln -s $dir/ipython_config.py ~/.ipython/profile_default/ipython_config.py
