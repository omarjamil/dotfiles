#!/bin/bash

cd 
# Backup existing configs
mkdir config_backup
mv .bashrc .bash_profile .vimrc .vim .bash config_backup

# create softlinks 
ln -s ~/dotfiles/bash ~/.bash
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/bash_prfile ~/.bash_profile
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/shell ~/.shell
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

