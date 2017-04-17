#!/bin/sh
mkdir ~/.config
mkdir ~/.config/nvim

ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.snippets.json ~/.snippets.json
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.scss-lint.yml ~/.scss-lint.yml
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc
ln -sf ~/dotfiles/.tmux.d ~/.tmux.d
ln -sf ~/dotfiles/.tmuxinator ~/.tmuxinator

