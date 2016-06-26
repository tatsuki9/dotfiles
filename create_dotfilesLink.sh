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

# Git設定ファイルの存在確認
if [ ! -e ~/.gitconfig ]; then
	ln -Fis ~/dotfiles/.gitconfig ~/.gitconfig
else
	echo '~/.gitconfigは存在します'
fi

# bash_rcの設定ファイルの存在確認
if [ ! -e ~/.bash_rc ]; then
    ln -Fis ~/dotfiles/.bash_rc ~/.bash_rc
    echo "bash_rcがホームディレクトリに無かったので作成しました";
else
    echo '~/.bash_rcは存在します'
fi

# bash_profileの設定ファイル存在確認
if [ -f $HOME/.bash_profile ]; then
    # bash_profileにbash_rcの読み込み設定が記載されているかどうか
    IS_BASH_RC=$(cat $HOME/.bash_profile | grep "bash_rc\|bashrc");
    if [ -n "$IS_BASH_RC" ]; then
        echo "既にbash_profileにbash_rcの読み込みが記載されています";
    else
        echo ". $HOME/.bash_rc" >> "$HOME/.bash_profile";
        echo "bash_profileにbash_rc読み込みを追記しました";
        source $HOME/.bash_profile
    fi
else
    touch $HOME/.bash_profile
    echo "bash_profileがホームディレクトリに無かったので作成しました";
    echo ". $HOME/.bash_rc" >> "$HOME/.bash_profile";
    echo "bash_profileにbash_rc読み込みを追記しました";
    source $HOME/.bash_profile
fi
