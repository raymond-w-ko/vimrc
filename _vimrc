" Preamble {{{
set nocompatible

" paths
if has("win32")
    let g:ruby_path='C:/Ruby193/bin'
endif
filetype off

let g:pathogen_disabled = []
call add(g:pathogen_disabled, "cocoa")
call add(g:pathogen_disabled, "tagbar")
call add(g:pathogen_disabled, "taglist")
call add(g:pathogen_disabled, "ctrlp")
call add(g:pathogen_disabled, "neocomplcache")
"call add(g:pathogen_disabled, "command-t")
call add(g:pathogen_disabled, "lusty")
call pathogen#infect()
call pathogen#helptags()
" }}}

" File options {{{
filetype on                         " detect and set filetype
filetype plugin on                  " load filetype plugin
filetype indent off                 " as a control freak, don't enable automatic indenting
" without a guard, re-sourcing this file breaks vim-easymotion
if !exists("g:already_syntax_on")
    syntax on
    let g:already_syntax_on=1
endif
set fileformats=unix,dos,mac        " order of support
set shellslash                      " '/' is so much easier to type
" }}}

" General {{{
set shortmess+=aI    " no intro message
set encoding=utf-8
set showmode
set showcmd
set hidden
set novisualbell
set noerrorbells
set cursorline
set nocursorcolumn
set ruler
set backspace=indent,eol,start
set nonumber
set norelativenumber
set laststatus=2
set history=8192
set lazyredraw
set ttyfast
set showmatch
set matchtime=0
set splitbelow
set splitright
"set timeoutlen=300
set notimeout
set nottimeout
set autoread
set autowriteall
set title
set showtabline=2
set cmdheight=2
set complete=.,w,b,u,t
set completeopt=menu,menuone
set pumheight=16
set autochdir
set nolist
set listchars=tab:▸\ ,eol:¬
set fillchars=diff:⣿
set viewoptions=cursor,folds,options,slash,unix

" Save when losing focus
augroup SaveWhenLosingFocus
    au!
    au FocusLost * :silent! wall
augroup END

function! StripTrailingWhitespace()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction
augroup StripTrailingWhitespaceOnSave
    au!
autocmd BufWritePre * call StripTrailingWhitespace()
augroup END
" }}}
" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest
set wildchar=<Tab>

set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.tga
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.dep,*.idb,*.ipch
set wildignore+=*.ncb,*.suo,*.user,*.vcproj,*.vcxproj,*.out,*.sln
set wildignore+=Debug,Release,Debug.bat,Release.bat
set wildignore+=*.ccv,*.nif,*.kf,*.fls,*.pat,*.gsl,*.flt
set wildignore+=*.asi,*.lnk,*.mp3,*.ico,*.wav
set wildignore+=*.bik,*.NSB,*.pdb,*.ani,*.ID,*.mask
set wildignore+=*.pdf
set wildignore+=*.pyc,*.luac
set wildignore+=.DS_Store
" }}}
" Tabs, indents, spaces, wrapping {{{
set autoindent
set nocindent
set nosmartindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set nosmarttab
set textwidth=0           " no automatic text wrapping
set colorcolumn=""
set formatoptions=qn1
set wrap
set wrapscan
if exists("&breakindent")
    set breakindent showbreak=...
elseif has("gui_running")
    set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ...
endif
" }}}
" swap, undo, backup {{{
set undodir=~/vimundo
set undofile
set undolevels=8192   "maximum number of changes that can be undone
set undoreload=65536  "maximum number lines to save for undo on a buffer reload

set directory=~/vimtmp//

set viewdir=~/vimview
" }}}
" Leader {{{

let mapleader = ","
let maplocalleader = "\\"

" }}}

" Mouse & selection Behavior {{{
behave xterm                " of course xterm is better
set selectmode=""           " never want SELECT mode
set mousemodel=popup
set keymodel=""
set selection=inclusive
set mouse=a
set mousehide
"}}}
" Environments (GUI/Console) {{{
if (has("gui_running"))
    if !exists("g:already_set_color_scheme")
        colorscheme luciusmod

        let g:already_set_color_scheme=1
    endif

    " Font
    if has("win32")
        if !exists("g:already_set_font")
            set guifont=Dina_TTF:h8
            "set guifont=Consolas:h10
            set linespace=0
            let g:already_set_font=1
        endif
    elseif has("gui_macvim")
        set noantialias
        set guifont=Dina_TTF:h11
    endif

    " GUI Configuration
    set guioptions=a          " disable everything except synced clipboard

    " Maximize in Windows automatically
    if has("win32")
        nnoremap <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 1)<CR>
        function! FullScreenVim()
            if !exists("g:already_fullscreen_vim")
                call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 1)
                call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 1)
                call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 1)
                let g:already_fullscreen_vim=1
            endif
        endfunction
        augroup FullScreenOnStartup
            autocmd!
            autocmd BufEnter * call FullScreenVim()
        augroup END
        "au GUIEnter * simalt ~x
    elseif has("gui_macvim")
        " Full screen means FULL screen
        set fuoptions=maxvert,maxhorz
    endif

    " Remove cursor blink
    set guicursor+=a:blinkon0

    " pretty vertical Splits
    set fillchars+=vert:│
endif
" }}}
" Status line {{{
function! MyStatusLineHelper()
    if exists("b:orig_foldmethod")
        return b:orig_foldmethod
    endif

    return "???"
endfunction
" buffer number and filename
set statusline=\(%n\)\ %f
" read-only, error highlighting, modified tag, restore highlighting
set statusline+=\ %r%#Error#%m%*
" current line number and column count
set statusline+=\ (%l/%L,\ %c)
" percentage through current file
set statusline+=\ %P
" left-right separator
set statusline+=%=
" [help] and [preview] flags
set statusline+=%h%w
" file type, foldmethod, and encoding, and fileformat
set statusline+=\ %y\ [%{MyStatusLineHelper()}]\ [%{&encoding}:%{&fileformat}]
set statusline+=\ \ "two spaces so it doesn't crowd the vsplit
" }}}
" Searching and movement {{{
" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault    " inverts the meaning of the g-flag in s///g

set scrolloff=9001        " always try to center current line
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

nnoremap <leader><space> :noh<cr>:call clearmatches()<cr>

"I copied the default one to Dropbox vim plugin/ folder to make changes
"runtime macros/matchit.vim
nmap <tab> %
vmap <tab> %

" make D behave
nnoremap D d$

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
"nnoremap n nzzzv:call PulseCursorLine()<cr>
"nnoremap N Nzzzv:call PulseCursorLine()<cr>
"nnoremap n nzzzv
"nnoremap N Nzzzv
nnoremap n nzv
nnoremap N Nzv

" Don't move on *
nnoremap * *<c-o>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Easier to type, and I never use the default behavior.
nnoremap H ^
nnoremap L g_

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'lvimgrep /'.@/.'/g %'<CR>:lopen<CR>

" Ack for the last search.
"nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" Directional keys -------------------------------------------------------- {{{

" It's 2011.
nnoremap j gj
nnoremap k gk

" Easy buffer navigation
nnoremap <C-h>  <C-w>h
nnoremap <C-j>  <C-w>j
nnoremap <C-k>  <C-w>k
nnoremap <C-l>  <C-w>l

" }}}

" Highlight word {{{
nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>
" }}}

" Visual Mode */# from Scrooloose {{{
function! s:VisualModeSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VisualModeSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VisualModeSetSearch()<CR>??<CR><c-o>
" }}}

" }}}
" Folding {{{
function! MyFoldText()
    let line = getline(v:foldstart)
    let sub = substitute(line, '^"\s\=\|/\*\|\*/\|{{{\d\=', '', 'g') "}}}
    let remaining = 80 - len(sub)
    return sub . repeat(' ', remaining)
endfunction
function! SetFoldSettings()
    if exists("g:my_fold_settings_applied")
        return
    endif

    set foldenable
    set foldmethod=syntax
    set foldopen=block,hor,mark,percent,quickfix,tag,search
    set foldlevelstart=9001
    set foldnestmax=20

    let g:my_fold_settings_applied=1
endfunction
set foldtext=MyFoldText()
call SetFoldSettings()

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
function! MySaveOrigFoldmethod()
    if exists("b:orig_foldmethod")
        return
    endif

    let b:orig_foldmethod=&foldmethod
    setlocal foldmethod=manual
endfunction
autocmd InsertEnter * call MySaveOrigFoldmethod()
"autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use <leader>z to "focus" the current fold.
nnoremap <leader>z zMzvzz

" enable syntax folding for XML (caution, this can be slow)
let g:xml_syntax_folding=1

nnoremap zM a<ESC>:setlocal foldmethod=<C-R>=b:orig_foldmethod<CR><CR>zM:setlocal foldmethod=manual<CR>
" }}}
" Text objects {{{

" Shortcut for [] {{{

onoremap id i[
onoremap ad a[
vnoremap id i[
vnoremap ad a[

" }}}
" Next and Last {{{

" Motion for "next/last object". For example, "din(" would go to the next "()" pair
" and delete its contents.

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "d"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" }}}

" }}}
" Utils {{{

" Synstack {{{

" Show the stack of syntax hilighting classes affecting whatever is under the
" cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc
"nnoremap <leader>ss :call SynStack()<CR>

" }}}
" Toggle whitespace in diffs {{{

set diffopt-=iwhite
let g:diffwhitespaceon = 1
function! ToggleDiffWhitespace() "
    if g:diffwhitespaceon
        set diffopt-=iwhite
        let g:diffwhitespaceon = 0
    else
        set diffopt+=iwhite
        let g:diffwhitespaceon = 1
    endif
    diffupdate
endfunc "

nnoremap <leader>dw :call ToggleDiffWhitespace()<CR>

" }}}

" }}}

source ~/vimfiles/config/library.vim

source ~/vimfiles/config/keybindings.vim
source ~/vimfiles/config/ft_settings.vim
source ~/vimfiles/config/projects.vim
source ~/vimfiles/config/plugin_settings.vim

augroup ScratchWindowResizer
    au!
    au BufEnter __Scratch__ resize 5
augroup END

" vim:fdm=marker:foldlevel=0
