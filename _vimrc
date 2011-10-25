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

"set tags+=C:\SVN\Syandus_ALIVE3\Platform\SDK\Source\Code\tags

set tags+=C:\SVN\Syandus_ALIVE3\Platform\SDK\Include\tags
"set tags+=C:\SVN\Syandus_ALIVE3\Frameworks\Carbon\Source\Scripts\tags

"set tags+=C:\SVN\Syandus_Cores\C_Demo_Marketing_01\Source\Scripts\Content\tags
"set tags+=C:\SVN\Syandus_Cores\C_Spv_COPD_01\Source\Scripts\Content\tags

"map <C-F12> :!ctags -R .<CR>

" Directories {
if has("unix")
  set directory=~/tmp//
  source ~/Dropbox/vim/projects.vim
  source ~/Dropbox/vim/keybindings.vim
elseif has("win32")
  set directory=C:\tmp\\\\
  source C:/Users/root/Desktop/Dropbox/vim/projects.vim
  source C:/Users/root/Desktop/Dropbox/vim/keybindings.vim
  let s:ruby_path='C:\Ruby192\bin'
endif
" }

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
set ffs=dos,unix,mac    " order of support
set autoread            " automatically reload file if it was changed outside of VIM
set wildignore+=Debug,Release,.o,*.obj,.git,.svn,*.dep,*.idb,*.pdf,*.dll,*.dll.*,*.ncb,*.suo,*.user,*.vcproj,*.out,*.sln,Debug.bat,Release.bat,*.ccv,*.nif,*.kf,*.fls,*.pat,*.gsl,*.flt,*.asi,*.lnk,*.bmp,*.tga,*.mp3,*.manifest,*.ico,*.wav,*.ini,*.bik,*.NSB,*.pdb,*.vcxproj
" }

" General {
set ruler
set number
"set rnu
set report=0
set backspace=2
set showtabline=2

set cmdheight=2
set laststatus=2        " always show the status line
"set statusline=%F%m%r%h%w\ [format=%{&ff}]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v][%p%%]\ [lines=%L]
set statusline=%F%m%r%h%w\ [%{&ff}]%y\ [%p%%][%04l/%L,%04v]

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

set completeopt-=preview            "disable annoying window
set completeopt+=menu
set completeopt+=menuone

set wildmenu
set wildmode=list:longest

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

" Multi-Platform Support {
if has("unix")
    let find="find . -name "
else
    let find="dir /b /s "
endif
" }

" GUI Options {
if (has("gui_running"))
  " Colorscheme
  " Molokai
  "let g:molokai_original = 1
  "colorscheme molokai

  "colorscheme kokonut
  "colorscheme Tomorrow
  colorscheme xoria256
  "colorscheme peaksea

  "syntax enable
  "set background=dark
  "colorscheme solarized

  " Font
  set guifont=Dina:h8
  "set guifont=Consolas:h11
  "set guifont=DejaVu\ Sans\ Mono:h11
  "set guifont=ProggyClean:h8
  "set guifont=ProggySquare:h8
  "set guifont=Sheldon:h9
  "set guifont=ter-114n:h11
  "set guifont=peep:h11
  "set guifont=Envy\ Code\ R:h10
  "set guifont=Lucida\ Console:h8

  " GUI Configuration
  " No toolbars and menus
  set guioptions-=T
  set guioptions-=m
  set guioptions-=L
  set guioptions-=r

  " Maximize in Windows automatically
  autocmd GUIEnter * simalt ~X
  "autocmd GUIEnter * set lines=55 columns=177

  " Remove cursor blink
  let &guicursor = &guicursor . ",a:blinkon0"
endif
" }

" NetRW {
let g:netrw_silent=1
let g:netrw_mousemaps=0   " apparently enabling this hijacks the mouse completely so you can't use it to select stuff (WTF!)
" }

" Syandus PHP files on server
nmap <F1> :e ftp://rko@syandus.com/ALIVEMed/Www_root/reports/<CR>

" AutoComplPop {
let g:acp_ignorecaseOption = 0
let g:acp_completeOption = '.,w,b,u,k'
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-e>\<CR>" : "\<CR>"
"}

" Command-T {
let g:CommandTMatchWindowAtTop=1
" }

" taglist {
let Tlist_Auto_Highlight_Tag = 0
let Tlist_Use_Right_Window = 1
let Tlist_Ctags_Cmd = 'ctags --c++-kinds=-p --extra=-q'
let Tlist_WinWidth = 40
"}

" CtrlP
let g:loaded_ctrlp = 1  " true actually disables this!!!
" }
" vim: fdl=0
