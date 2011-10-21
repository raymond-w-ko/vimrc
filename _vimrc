set nocompatible    " newer more awesome options
set shortmess+=I    " no intro message

" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has("unix")
  set directory=~/tmp
  source ~/Dropbox/vim/_projects.vim
elseif has("win32")
  set directory=C:\tmp\\\\
  source C:/Users/root/Desktop/Dropbox/vim/_projects.vim
  let s:ruby_path='C:\Ruby192\bin'
endif

set wildignore+=*Debug,Release,.o,*.obj,.git,.svn,*.dep,*.idb,*.pdf,*.dll,*.dll.*,*.ncb,*.suo,*.user,*.vcproj,*.out,*.sln,Debug.bat,Release.bat,*.ccv,*.nif,*.kf,*.fls,*.pat,*.gsl,*.flt,*.asi,*.lnk,*.bmp,*.tga,*.mp3,*.manifest,*.ico,*.wav,*.ini,*.bik,*.NSB,*.pdb,*.vcxproj

" ctags
"set tags+=$HOME\vimfiles\tags\stl\tags
"set tags+=C:\SVN\Syandus_ALIVE3\Platform\SDK\Include\boost\tags
set tags+=C:\SVN\Syandus_ALIVE3\Platform\SDK\Include\tags
set tags+=C:\SVN\Syandus_ALIVE3\Frameworks\Carbon\Source\Scripts\tags
"set tags+=C:\SVN\Syandus_Cores\C_Demo_Marketing_01\Source\Scripts\Content\tags
"set tags+=C:\SVN\Syandus_Cores\C_Spv_COPD_01\Source\Scripts\Content\tags
set tags+=./tags
set tags+=../tags
set tags+=../../tags
"map <C-F12> :!ctags -R .<CR>
" }

" Mouse & Selection Behavior {
behave xterm                " of course xterm is better
set selectmode=""           " never want SELECT mode
set mousemodel=popup
set keymodel=""
set selection=inclusive
"}

" File Options {
"set bomb              " as a programmer, want plain ASCII files
"set encoding=utf-8
"set nobomb
syntax on               " syntax is good
filetype on             " detect filetype
filetype plugin on      " load filetype plugin
filetype indent off     " as a control freak, want to manually indent
set ffs=dos,unix,mac    " order of support
set autoread
" }

" General {
set ruler
set number
"set rnu
set report=0
set backspace=2
set showtabline=2

set cmdheight=1
set laststatus=2        " always show the status line
"set statusline=%F%m%r%h%w\ [format=%{&ff}]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v][%p%%]\ [lines=%L]
set statusline=%F%m%r%h%w\ [%{&ff}]%y\ [%p%%][%04l/%L,%04v]

set lazyredraw

set wrap
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
set novb

set autowriteall      " write buffer when switching
set splitright        " vsplit splits right
"set autochdir
set timeoutlen=200
"}

" Text Formatting (Indents and Tabs) {
set ai
set nocindent
set nosmartindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set nosmarttab
set expandtab           " tabs -> spaces
set textwidth=0         " no automatic text wrapping

function! TabsAre2()
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
endfunction

function! TabsAre3() 
  set tabstop=3
  set shiftwidth=3
  set softtabstop=3
endfunction

function! TabsAre4() 
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
endfunction

nnoremap ,2 :call TabsAre2()<CR>
nnoremap ,3 :call TabsAre3()<CR>
nnoremap ,4 :call TabsAre4()<CR>

" }

" Persistent Undo {
set undodir=~/vimundo
set undofile
set undolevels=4096 "maximum number of changes that can be undone
set undoreload=16384 "maximum number lines to save for undo on a buffer reload
" }

" Custom Keybindings {
" using leader creates awful visual distraction which I can't stand!
"let mapleader = ","
"let g:mapleader = ","

" The holy ESC key
imap jk <ESC>
imap kj <ESC>

if has("unix")
  nnoremap ,v :e ~/Dropbox/_vimrc<CR>
  nnoremap ,s :source ~/.vimrc<CR>
  nnoremap ,c :e ~/.vim/colors/kokonut.vim<CR>
elseif has("win32")
  nnoremap ,v :e $HOME/Desktop/Dropbox/vim/_vimrc<CR>
  nnoremap ,s :source $HOME/_vimrc<CR>
  nnoremap ,c :e C:/Users/root/vimfiles/colors/kokonut.vim<CR>
endif

" Hex
nnoremap ,h :%!xxd<CR>
nnoremap ,H :%!xxd -r<CR>

"nnoremap ,t :ToggleWord<CR>
nnoremap ,t :CommandT<CR>
nnoremap ,b :FufBuffer<CR>


" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
"nnoremap <silent> <Space> :nohlsearch<CR>:NeoComplCacheCachingBuffer<CR>:echo "Caching done."<CR>
"nnoremap <C-Space> viw"zy<C-w><C-W>:Scratch<CR>ggVGD"zp:FufTagWithCursorWord<CR>
nnoremap <C-Space> mzviw"zy<C-w><C-W>:Scratch<CR>ggVGD"zp/<C-r>z<CR><C-]><C-w><C-w>`z

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
" CTRL-V and SHIFT-Insert are Paste
inoremap <C-V> <ESC>"+pa

"map <C-s> <ESC>:w<CR>
"imap <C-s> <ESC>:w<CR>a

"map <C-S-b> <ESC>:w<CR><ESC>:make<CR>
"imap <C-S-b> <ESC>:w<CR><ESC>:make<CR>

" Buffer Navigation
nnoremap <silent> <C-N> :bnext<CR>
nnoremap <silent> <C-P> :bprevious<CR>
"nnoremap <silent> <C-X> :bdelete!<CR>

" Split
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap ,wv :vsplit<CR>
nnoremap ,wn :split<CR>
nnoremap ,wc :close<CR>

" Windows Resizing
nnoremap <C-Up> :resize +1<CR>
nnoremap <C-Down> :resize -1<CR>
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>

"toggle .{c|cpp}/.{h|hpp}
"nnoremap <leader>a :A<CR>
nnoremap <C-a> :A<CR>

" find and replace visually selected
vnoremap <C-h> "hy:%s/<C-r>h//g<left><left>

" Fuzzy Finder
nnoremap ,fl :FufLine<CR>

" Tab Mappings {
nmap <A-1> 1gt
nmap <A-2> 2gt
nmap <A-3> 3gt
nmap <A-4> 4gt
nmap <A-5> 5gt
nmap <A-6> 6gt
nmap <A-7> 7gt
nmap <A-8> 8gt
nmap <A-9> 9gt
nmap <A-t> <ESC>:tabnew<CR>
nmap <A-w> <ESC>:tabclose<CR>

imap <A-1> <ESC>1gt
imap <A-2> <ESC>2gt
imap <A-3> <ESC>3gt
imap <A-4> <ESC>4gt
imap <A-5> <ESC>5gt
imap <A-6> <ESC>6gt
imap <A-7> <ESC>7gt
imap <A-8> <ESC>8gt
imap <A-9> <ESC>9gt
imap <A-t> <ESC>:tabnew<CR>
imap <A-w> <ESC>:tabclose<CR>
" }

" }

" Folding {
set foldenable        " Turn on folding
set foldmarker={,}    " Fold C style code (only use this as default if you use a high foldlevel)
set foldmethod=marker " Fold on the marker
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

  colorscheme kokonut
  "colorscheme Tomorrow
  colorscheme xoria256

  "syntax enable
  "set background=dark
  "colorscheme solarized

  " Font
  "set guifont=Consolas:h11
  set guifont=Dina:h8
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

" NetRW
let g:netrw_silent=1
let g:netrw_mousemaps=0   " apparently enabling this hijacks the mouse completely so you can't use it to select stuff (WTF!)

" Syandus PHP files on server
nmap <F1> :e ftp://rko@syandus.com/ALIVEMed/Www_root/reports/<CR>

" AutoComplPop {
let g:acp_ignorecaseOption = 0
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-e>\<CR>" : "\<CR>"
"}

" Command-T {
let g:CommandTMatchWindowAtTop=1
" }
" vim: fdl=0
