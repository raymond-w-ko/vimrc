#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

if [ -d "./command-t" ]; then
    cd command-t
    pwd
    git remote set-url origin git://github.com/wincent/Command-T.git
    cd ..
fi

if [ -d "./bufkill" ]; then
    cd bufkill
    pwd
    git remote set-url origin git://github.com/vim-scripts/bufkill.vim.git
    cd ..
fi

if [ -d "./camelcasemotion" ]; then
    cd camelcasemotion
    pwd
    git remote set-url origin git://github.com/vim-scripts/camelcasemotion.git
    cd ..
fi

if [ -d "./vim-surround" ]; then
    cd vim-surround
    pwd
    git remote set-url origin git://github.com/tpope/vim-surround.git
    cd ..
fi

if [ -d "./vim-powerline" ]; then
    cd vim-powerline
    pwd
    git remote set-url origin git://github.com/Lokaltog/vim-powerline.git
    git remote set-url --push origin git@github.com:raymond-w-ko/vim-powerline.git
    cd ..
fi

if [ -d "./Lucius" ]; then
    cd Lucius
    pwd
    git remote set-url origin git://github.com/vim-scripts/Lucius.git
    git remote set-url --push origin git@github.com:raymond-w-ko/Lucius.git
    cd ..
fi

if [ -d "./vim-hybrid" ]; then
    cd vim-hybrid
    pwd
    git remote set-url origin git://github.com/w0ng/vim-hybrid.git
    git remote set-url --push origin git@github.com:raymond-w-ko/vim-hybrid.git
    cd ..
fi
