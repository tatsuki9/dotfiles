#!/bin/sh

# シンボリックリンク ~/.vimrcの存在確認
if [ ! -L ~/.vimrc ]; then
    ln -Fis ~/dotfiles/.vimrc ~/.vimrc
else
    echo '既にシンボリックリンク ~/.vimrcは存在します'
fi

# シンボリックリンク ~/.vimの存在確認
if [ ! -L ~/.vim ]; then
    ln -Fis ~/dotfiles/vimfiles ~/.vim
else
    echo '既にシンボリックリンク ~/.vimは存在します'
fi

# シンボリックリンク ~/.dir_colorsの存在確認
if [ ! -L ~/.dir_colors ]; then
    ln -Fis ~/dotfiles/.dir_colors ~/.dir_colors
else
    echo '既にシンボリックリンク ~/.dir_colorsは存在します'
fi

# ディレクトリ ~/.vim/bundleの存在確認
if [ ! -e ~/.vim/bundle ]; then
    mkdir ~/.vim/bundle
else
    echo '既にディレクトリ ~/.vim/bundleは存在します'
fi
