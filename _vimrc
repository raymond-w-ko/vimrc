" when re-sourcing with this set, syntax highlighting changes!
"set nocompatible
" don't customize anything if we are running in evim mode
if v:progname =~? "evim"
    finish
endif

" paths so that the VIM Ruby interpreter can find its files
if has("win32")
    let g:ruby_path='C:/Ruby193/bin'
endif

" pathogen {{{
let g:pathogen_disabled = []
call add(g:pathogen_disabled, "ctrlp")
call add(g:pathogen_disabled, "tagbar")
call add(g:pathogen_disabled, "cocoa")
call add(g:pathogen_disabled, "neocomplcache")
call add(g:pathogen_disabled, "camelcasemotion")
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
" }}}

" File Options {{{
filetype on                         " detect and set filetype
filetype plugin on                  " load filetype plugin
filetype indent off                 " as a control freak, don't enable automatic indenting
" without a guard, re-sourcing this file breaks vim-easymotion
" re-sourcing also breaks vim-powerline
if !exists("g:already_syntax_on")
    syntax on
    let g:already_syntax_on=1
endif
set fileformats=unix,dos,mac        " order of support
set shellslash                      " unfortunately shellslash breaks netrw
" }}}

" General {{{
set encoding=utf-8
set shortmess+=aI    " no intro message
set showmode
set showcmd
set hidden
set novisualbell
set noerrorbells
set nocursorcolumn
set ruler
set backspace=indent,eol,start
set nonumber
set norelativenumber
set laststatus=2
set history=1024
set lazyredraw
set ttyfast
set showmatch
set matchtime=0
set splitbelow
set splitright
set notimeout
set nottimeout
set autoread
set autowriteall
set title
set showtabline=2
set cmdheight=2
set complete=.,w,b,u,t
set completeopt=menu,menuone,preview
set pumheight=16
set autochdir
set nolist
set listchars=tab:▸\ ,eol:¬
set viewoptions=cursor,folds,options,slash,unix
set winwidth=80
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" }}}
" Automatic Commands {{{
augroup SaveAllBuffersWhenLosingFocus
    au!
    au FocusLost * silent! wall
augroup END

"set cursorline
" wow this whole thing is necessary because there is a bug in Command-T of VIM
" which doesn't restore cursorline properly and if I always set cursorlines,
" then it loses it nice hightling color when I open Command-T again

" apparently setting cursorline also clears current cursor column
" when you move between lines, so we need more hacks
"function! CursorMovedDecideCursorline()
    "let current_buffer = bufname('%') 
    "let result = match(current_buffer, '\(GoToFile\)\@!')
    "if (result == 0)
        "if exists("g:last_buffer_set_cursorline")
            "if g:last_buffer_set_cursorline == current_buffer
                "return
            "endif
        "endif

        "let g:last_buffer_set_cursorline = current_buffer
        "set cursorline
    "else
        "if exists('g:last_buffer_set_cursorline')
            "unlet g:last_buffer_set_cursorline
        "endif
    "endif
"endfunction
"augroup CursorLineOnlyOnCurrentSplit
    "au!
    "au WinLeave * set nocursorline
    "au WinEnter * set cursorline
    "au InsertEnter * set nocursorline
    "au InsertLeave * set cursorline
    "au CursorMoved * call CursorMovedDecideCursorline()
"augroup END

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup ReturnToSameLineWhenReopeningFile
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

function! StripTrailingWhitespace()
    let l:my_saved_winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:my_saved_winview)
endfunction
augroup StripTrailingWhitespaceOnSave
    au!
    au BufWritePre C:\SVN\* call StripTrailingWhitespace()
    au BufWritePre *.h,*.hpp,*.c,*.cc,*.cpp call StripTrailingWhitespace()
    au BufWritePre *.py call StripTrailingWhitespace()
augroup END
" }}}
" wildmenu completion {{{
set wildmenu
set wildmode=longest,list
set wildchar=<Tab>

" binaries with a 99.9% chance of not being edited
set wildignore+=*.exe,*.dll

" media files in a binary format
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.tga,*.mp3,*.ico,*.wav
set wildignore+=*.bik,*.ani,*.mask

" version control directories
set wildignore+=.hg,.git,.svn

" Visual Studio files
set wildignore+=*.ncb,*.suo,*.user,*.vcproj,*.vcxproj,*.out,*.sln,*.pdb,*.manifest,*.dep,*.idb,*.ipch,*.o,*.obj
set wildignore+=Debug,Release

" Gamebryo Binaries
set wildignore+=*.nif,*.kf,*.kfm,*.NSB

" compiled cached bytecodes
set wildignore+=*.pyc,*.luac

" binary document formats
set wildignore+=*.pdf,*.doc,*.docx,*.xls,*.xlsx

" Mac OS X metadata files
set wildignore+=.DS_Store

" Windows OS metadata files
set wildignore+=*.lnk

" Syandus Files
set wildignore+=*.ID
set wildignore+=*.ccv,*.fls,*.pat,*.gsl,*.flt,*.asi
" }}}
" Tabs, indents, spaces, wrapping {{{
set autoindent
set nocindent
set nosmartindent

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set nosmarttab
set textwidth=0           " no automatic text wrapping
set colorcolumn=""
set formatoptions=qn1
function! ApplyMyFormatOptions()
    set fo=
    set fo+=t   " auto-wrap text using textwidth
    set fo+=c   " auto-wrap comments using textwidth, insert comment leader
    set fo+=q   " allow formatting comments with 'gq'
    set fo+=l   " long lines are not broken in insert mode
    set fo+=j   " remove comment leader when joining lines.
endfunction
call ApplyMyFormatOptions()
set wrap
set wrapscan
if exists("&breakindent")
    set breakindent showbreak=....
elseif has("gui_running")
    set showbreak=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ ...
endif
" }}}
" swap, undo, backup {{{
set undodir=~/vimundo//
set directory=~/vimtmp//
set viewdir=~/vimview//
set backupdir=~/vimbackup//

set undofile
set undolevels=8192     " maximum number of changes that can be undone
set undoreload=65535    " maximum number lines to save for undo on a buffer reload

set backup              " might as well, it doesn't really hurt

set noswapfile          " computers are pretty reliable nowadays
" }}}

" Leader
let mapleader = ","
let maplocalleader = "\\"

" Mouse & selection Behavior
behave xterm                " of course xterm is better
set selectmode=""           " never want SELECT mode
set mousemodel=popup
set keymodel=""
set selection=inclusive
set mouse=a
set mousehide
set nomousefocus

" Searching and movement {{{
" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

nnoremap ? ?\v
vnoremap ? ?\v

set noignorecase
set smartcase
set hlsearch
set incsearch
set gdefault            " inverts the meaning of the g-flag in s///g

"set scrolloff=9001      " always try to center current line
set scrolloff=0
set sidescroll=0
set sidescrolloff=0

set virtualedit+=block

nnoremap <leader><Space> :nohlsearch<CR>:call clearmatches()<CR>

" use aesthetic middle of screen for "zz"
nnoremap <silent> zz :exec "normal! zz" . float2nr(winheight(0)*0.1) . "\<Lt>C-E>"<CR>

"I copied the default one to Dropbox vim plugin/ folder to make changes
"runtime macros/matchit.vim
"nmap <Tab> %
"vmap <Tab> %

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
"nnoremap n nzzzv:call PulseCursorLine()<cr>
"nnoremap N Nzzzv:call PulseCursorLine()<cr>
nmap n nzzzv
nmap N Nzzzv

" Don't move on *
"nnoremap * *<c-o>
nmap * *N

" Same when jumping around
"nnoremap g; g;zz
"nnoremap g, g,zz

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

" It's 2011.
nnoremap <silent> j gj
nnoremap <silent> k gk

" Easy buffer navigation
nnoremap <C-h>  <C-w>h
nnoremap <C-j>  <C-w>j
nnoremap <C-k>  <C-w>k
nnoremap <C-l>  <C-w>l

" Highlight word {{{
"nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
"nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
"nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
"nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>
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
    let remaining = &columns - len(sub)
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
"nnoremap <leader>z zMzvzz

" enable syntax folding for XML (caution, this can be slow)
let g:xml_syntax_folding=1

nnoremap zM a<ESC>:setlocal foldmethod=<C-R>=b:orig_foldmethod<CR><CR>zM:setlocal foldmethod=manual<CR>
" }}}
" Text objects {{{

" Shortcut for []
onoremap id i[
onoremap ad a[
vnoremap id i[
vnoremap ad a[

" Next and Last

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
" Utils {{{

" Synstack {{{

" Show the stack of syntax hilighting classes affecting whatever is under the
" cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunction
nnoremap <leader>S :call SynStack()<CR>

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
endfunction "

nnoremap <leader>dw :call ToggleDiffWhitespace()<CR>

" }}}

" }}}

" source all other files in the vimfiles/config directory
runtime! config/**/*.vim

set previewheight=1

function! ResizeFixer()
    if &previewwindow
        resize 1
        return
    endif

    if bufname("%") == '__Scratch__'
        resize 1
        return
    endif
endfunction
augroup ScratchWindowResizer
    au!
    "au WinEnter * call ResizeFixer()
augroup END

nmap <F2> :e C:\SVN\Syandus_ALIVE3\Hub\Source\Win32\Window.cpp<CR>

" vim:fdm=marker:foldlevel=0
