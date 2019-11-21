#!/bin/bash
# Install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh plugins
./install_zsh_plugins.sh

# Make softlink
cd $HOME
ln -s $HOME/.momorc/.zshrc .zshrc
ln -s $HOME/.momorc/.vimrc .vimrc
ln -s $HOME/.momorc/.bashrc .bashrc
ln -s $HOME/.momorc/.tmux.conf .tmux.conf
ln -s $HOME/.momorc/.gitconfig .gitconfig
ln -s $HOME/.momorc/.gitignore .gitignore
ln -s ~/.momorc/pichuang.zsh-theme $HOME/.oh-my-zsh/themes/pichuang.zsh-theme

