#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

cd command-t
git remote set-url origin git://github.com/wincent/Command-T.git
cd ..

cd bufkill
git remote set-url origin git://github.com/vim-scripts/bufkill.vim.git
cd ..

cd camelcasemotion
git remote set-url origin git://github.com/vim-scripts/camelcasemotion.git
cd ..

cd vim-surround
git remote set-url origin git://github.com/tpope/vim-surround.git
cd ..

cd vim-powerline
git remote set-url origin git://github.com/Lokaltog/vim-powerline.git
git remote set-url --push origin git@github.com:raymond-w-ko/vim-powerline.git
cd ..

cd Lucius
git remote set-url --push origin git@github.com:raymond-w-ko/Lucius.git
cd ..
