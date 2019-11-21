#!/bin/bash
# Install zsh
yum install zsh -y
cd $HOME
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh plugins
./.momorc/install_zsh_plugins.sh

# Make softlink
cd $HOME
rm .zshrc
ln -s $HOME/.momorc/.zshrc .zshrc

rm .vimrc
ln -s $HOME/.momorc/.vimrc .vimrc

rm .bashrc
ln -s $HOME/.momorc/.bashrc .bashrc

rm .tmux.conf
ln -s $HOME/.momorc/.tmux.conf .tmux.conf

rm .gitconfig
ln -s $HOME/.momorc/.gitconfig .gitconfig

rm .gitignore
ln -s $HOME/.momorc/.gitignore .gitignore

ln -s $HOME/.momorc/pichuang.zsh-theme $HOME/.oh-my-zsh/themes/pichuang.zsh-theme

