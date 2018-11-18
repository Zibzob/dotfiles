#!/bin/bash
dir=~/dotfiles                    # dotfiles directory
dir_old=~/dotfiles_old             # old dotfiles directory

# Loads default bashrc config
#source $dir_old/.bashrc

# Allow local customizations in the ~/.bashrc_local_before file
#if [ -f ~/.bashrc_local_before ]; then
#    source ~/.bashrc_local_before
#fi

# Settings
source $dir/settings.bash

# Bootstrap
#source $dir/bootstrap.sh

# External settings
#source $dir/external.sh

# Aliases
source $dir/aliases

# Custom prompt
source $dir/prompt.bash

# Plugins
#source $dir/plugins.bash

# Set vi mode for bash 
set editing-mode vi

