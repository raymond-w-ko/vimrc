set nocompatible    " newer more awesome options
set shortmess+=atI    " no intro message
" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ctags
set tags=tags
set tags+=./tags
set tags+=../tags
set tags+=../../tags
set tags+=../../../tags

" Base
set tags+=C:/SVN/Syandus_ALIVE3/Platform/Source/Code/tags
set tags+=C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/Source/Scripts/tags

" Cores
"set tags+=C:\SVN\Syandus_Cores\C_Demo_Marketing_01\Source\Scripts\Content\tags
"set tags+=C:\SVN\Syandus_Cores\C_Spv_COPD_01\Source\Scripts\Content\tags

"map <C-F12> :!ctags -R<CR>

" multi-platform forks
if has("unix")
  set directory=~/tmp//
  source ~/Dropbox/vim/projects.vim
  source ~/Dropbox/vim/keybindings.vim
  source ~/Dropbox/vim/plugins.vim
  source ~/Dropbox/vim/functions.vim
  source ~/Dropbox/vim/autocmds.vim

  let find="find . -name "
elseif has("win32")
  set directory=C:\tmp\\\\
  source C:/Users/root/Desktop/Dropbox/vim/projects.vim
  source C:/Users/root/Desktop/Dropbox/vim/keybindings.vim
  source C:/Users/root/Desktop/Dropbox/vim/plugins.vim
  source C:/Users/root/Desktop/Dropbox/vim/functions.vim
  source C:/Users/root/Desktop/Dropbox/vim/autocmds.vim
  let s:ruby_path='C:\Ruby192\bin'

  let find="dir /b /s "
endif

" Mouse & Selection Behavior {
behave xterm                " of course xterm is better
set selectmode=""           " never want SELECT mode
set mousemodel=popup
set keymodel=""
set selection=inclusive
set mouse=a
set mousehide
"}

" File Options {
"set bomb              " as a programmer, want plain ASCII files
"set encoding=utf-8
set nobomb
syntax on               " syntax is good
filetype on             " detect filetype
filetype plugin on      " load filetype plugin
filetype indent off     " as a control freak, want to manually indent
set ffs=unix,dos        " order of support
set autoread            " automatically reload file if it was changed outside of VIM
set shellslash          " '/' is so much easier to type, also autocomplpop will use this instead
set wildignore+=Debug,Release,*.o,*.obj,.git,.svn,*.dep,*.idb,*.pdf,*.dll
set wildignore+=*.dll.*,*.ncb,*.suo,*.user,*.vcproj,*.out,*.sln
set wildignore+=Debug.bat,Release.bat,*.ccv,*.nif,*.kf,*.fls,*.pat,*.gsl,*.flt
set wildignore+=*.asi,*.lnk,*.bmp,*.tga,*.mp3,*.manifest,*.ico,*.wav,*.ini
set wildignore+=*.bik,*.NSB,*.pdb,*.vcxproj,*.ani,*.ID,*.exe,*.mask
set wildignore+=*.jpg,*.png,*.gif
" }

" General {
set ruler
set number
set report=0
set backspace=2
set showtabline=2

set cmdheight=2
set laststatus=2        " always show the status line
"set statusline=%F%m%r%h%w\ [format=%{&ff}]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v][%p%%]\ [lines=%L]
set statusline=%F%m%r%h%w\ [%{&ff}]%y\ [%p%%][%04l/%L,%04v]\ %=\ [ascii=\%03.3b]\ [hex=\%02.2B]

set lazyredraw

set nowrap
set hlsearch
set incsearch
set ignorecase
set smartcase
" don't want VIM to jump to matching braces, so commented
"set showmatch
"set mat=0
set nocursorline

set completeopt=menu,menuone

set wildmenu
set wildmode=longest,list

" no audio or visual bell
set noerrorbells
set novisualbell

set autowriteall      " write buffer when switching
set splitright        " vsplit splits right
"set autochdir
set timeoutlen=200

set hidden

set splitright
set splitbelow
"}

" Text Formatting (Indents and Tabs) {
set ai
set nocindent
set nosmartindent

set tabstop=2
set shiftwidth=2
set shiftround
set softtabstop=2
set nosmarttab
set expandtab           " tabs -> spaces
set textwidth=0         " no automatic text wrapping
set colorcolumn=80
" }

" Persistent Undo {
set undodir=~/vimundo
set undofile
set undolevels=4096 "maximum number of changes that can be undone
set undoreload=16384 "maximum number lines to save for undo on a buffer reload
" }

" Folding {
set foldenable        " Turn on folding
set foldmethod=marker " Fold on the marker
set foldmarker={,}    " Fold C style code (only use this as default if you use a high foldlevel)
set foldlevel=9001    " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag    " what movements open folds 
function! SimpleFoldText() " {
  return getline(v:foldstart).' '
endfunction " }
set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)
" }

" GUI Options {
if (has("gui_running"))
  " Colorscheme
  colorscheme xoria256

  " Font
  if has("win32")
    set guifont=Dina:h8
  else
    set guifont=DinaTTF:h11
    set noantialias
  endif

  " GUI Configuration
  " No toolbars and menus
  set guioptions-=T       " no toolbar
  set guioptions-=m       " no menubar
  set guioptions-=e       " no GUI tab bar
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  set guioptions+=a       " sync with system clipboard

  " Maximize in Windows automatically
  if has("win32")
    autocmd GUIEnter * simalt ~X
  endif

  " Remove cursor blink
  let &guicursor = &guicursor . ",a:blinkon0"
endif
" }
