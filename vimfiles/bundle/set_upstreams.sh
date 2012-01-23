#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

cd inkpot
git remote set-url origin git://github.com/ciaranm/inkpot.git
cd ..

cd command-t
git remote set-url origin git://github.com/wincent/Command-T.git
cd ..

cd vim-colors-solarized
git remote set-url origin git://github.com/altercation/vim-colors-solarized.git
cd ..

cd bufkill
git remote set-url origin git://github.com/vim-scripts/bufkill.vim.git
cd ..

cd camelcasemotion
git remote set-url origin git://github.com/vim-scripts/camelcasemotion.git
cd ..

cd lusty
git remote set-url origin git://github.com/sjbach/lusty.git
cd ..

cd vim-surround
git remote set-url origin git://github.com/tpope/vim-surround.git
cd ..

cd snipmate
git remote set-url origin git://github.com/msanders/snipmate.vim.git
cd ..
