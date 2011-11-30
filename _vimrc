" Preamble ---------------------------------------------------------------- {{{
set nocompatible
 
let g:pathogen_disabled = []
call add(g:pathogen_disabled, "cocoa")
call add(g:pathogen_disabled, "tagbar")
call add(g:pathogen_disabled, "taglist")
call add(g:pathogen_disabled, "ctrlp")
call add(g:pathogen_disabled, "toggle_words")
call pathogen#infect()
call pathogen#helptags()
" }}}
" File options {{{
syntax on               " syntax is good
filetype on             " detect and set filetype
filetype plugin on      " load filetype plugin
filetype indent off     " as a control freak, don't enable automatic indenting
set ffs=unix,dos        " order of support
set shellslash          " '/' is so much easier to type
" }}}
" Basic options ----------------------------------------------------------- {{{
set shortmess+=aI    " no intro message
"set bomb
set encoding=utf-8
set showmode
set showcmd
set hidden
set novisualbell
set noerrorbells
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set norelativenumber
set laststatus=2
set history=1024
set lazyredraw
set showmatch
set matchtime=0
set splitbelow
set splitright
set timeoutlen=300
set autoread
set autowriteall
set title
set showtabline=2
set cmdheight=2
set complete=.,w,b,u,t
set completeopt=menu,menuone
set pumheight=16
set autochdir
" My own version of autochdir
"augroup AutoChdirSubstitute
"  autocmd!
"  autocmd BufEnter * call CdToProjectDirectory()
"augroup END

" Save when losing focus
augroup SaveWhenLosingFocus
  au!
  au FocusLost * :wa
augroup END

" Wildmenu completion {{{
set wildmenu
set wildmode=longest,list

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

set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set nosmarttab
set textwidth=0           " no automatic text wrapping
set colorcolumn=80
set nowrap
set formatoptions=qrn1
" }}}
" Persistent Undo {{{
set undodir=~/vimundo
set undofile
set undolevels=8192 "maximum number of changes that can be undone
set undoreload=32768 "maximum number lines to save for undo on a buffer reload
" }}}
" Backups {{{
if has("unix")
  set directory=~/tmp//
elseif has("win32")
  set directory=C:/tmp//
endif
" }}}
" Leader {{{

let mapleader = ","
let maplocalleader = "\\"

" }}}

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
" Status line ------------------------------------------------------------- {{{
"set statusline=%F%m%r%h%w\ [format=%{&ff}]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%02.2B]\ [pos=%04l,%04v][%p%%]\ [lines=%L]

set statusline=%f     " file path relative to current directory
set statusline+=%m    " modified flag
set statusline+=%r    " readonly flag
set statusline+=%w    " preview window flag

set statusline+=\ \ \ \                 " space

set statusline+=[%{&ff}]                " line ending type
 
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]    " Encoding

set statusline+=%y                      " file type
set statusline+=[%{&fdm}]               " foldmethod

set statusline+=\                       " space

set statusline+=[%p%%][%04l/%L,%04v]    " location
set statusline+=\ %=\                   " right indent
set statusline+=[ascii=\%03.3b]\ [hex=\%02.2B]    " ASCII & Hexadecimal
" }}}
" Searching and movement -------------------------------------------------- {{{
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

runtime macros/matchit.vim
nmap <tab> %

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
"nnoremap n nzzzv:call PulseCursorLine()<cr>
"nnoremap N Nzzzv:call PulseCursorLine()<cr>
nnoremap n nzzzv
nnoremap N Nzzzv

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
"nnoremap VV V
"nnoremap Vit vitVkoj
"nnoremap Vat vatV
"nnoremap Vab vabV
"nnoremap VaB vaBV

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
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>
" }}}

" }}}
" Folding ----------------------------------------------------------------- {{{
function! SetFoldSettings()
  if exists("g:my_fold_settings_applied")
    return
  endif

  set foldenable
  set foldmethod=syntax
  set foldopen=block,hor,mark,percent,quickfix,tag    " what movements open folds 
  set foldlevel=0
  set foldnestmax=20
  set foldlevelstart=9001
  function! MyFoldText() " {{{
      return getline(v:foldstart)
  endfunction " }}}
  "set foldtext=MyFoldText()

  let g:my_fold_settings_applied=1
endfunction
call SetFoldSettings()

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

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
" }}}
" Destroy infuriating keys ------------------------------------------------ {{{

" Fuck you too, manual key.
nnoremap K <nop>

" }}}
" Text objects ------------------------------------------------------------ {{{

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
" Environments (GUI/Console) ---------------------------------------------- {{{
if (has("gui_running"))
  "colorscheme xoria256
  let g:molokai_original=0
  "colorscheme molokai
  set background=dark
  colorscheme solarized

  " Font
  if has("win32")
    set guifont=Dina:h8
  elseif has("gui_macvim")
    set noantialias
    set guifont=DinaTTF:h11
  endif

  " GUI Configuration
  set guioptions=a          " disable everything except synced clipboard

  " Maximize in Windows automatically
  if has("win32")
    autocmd GUIEnter * simalt ~X
  elseif has("gui_macvim")
    " Full screen means FULL screen
    set fuoptions=maxvert,maxhorz
  endif

  " Remove cursor blink
  set guicursor+=a:blinkon0
endif
" }}}
" Pulse ------------------------------------------------------------------- {{{

function! PulseCursorLine()
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#444444 ctermbg=239
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction

" }}}
" Utils ------------------------------------------------------------------- {{{

function! g:echodammit(msg)
    exec 'echom "----------> ' . a:msg . '"'
endfunction

" Synstack {{{

" Show the stack of syntax hilighting classes affecting whatever is under the
" cursor.
function! SynStack() "{{{
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc "}}}

"nnoremap <leader>ss :call SynStack()<CR>

" }}}
" Toggle whitespace in diffs {{{

set diffopt-=iwhite
let g:diffwhitespaceon = 1
function! ToggleDiffWhitespace() "{{{
    if g:diffwhitespaceon
        set diffopt-=iwhite
        let g:diffwhitespaceon = 0
    else
        set diffopt+=iwhite
        let g:diffwhitespaceon = 1
    endif
    diffupdate
endfunc "}}}

nnoremap <leader>dw :call ToggleDiffWhitespace()<CR>

" }}}

function! AutoHotkeyMake(makefile)
  execute ':!start cmd /c "C:\Program Files\AutoHotkey\AutoHotkey.exe" ' . a:makefile
endfunction

" }}}

" Various filetype-specific stuff ----------------------------------------- {{{

" C {{{
" }}}
" C++ {{{
augroup ft_cpp
  autocmd!
  autocmd BufNewFile,BufRead *.c,*.cpp setlocal foldlevel=0
  autocmd BufNewFile,BufRead *.c,*.cpp setlocal foldnestmax=1
augroup END
" }}}
" Objective-C {{{
augroup ft_objc
  autocmd!
  autocmd BufNewFile,BufRead *.m setlocal foldlevel=0
  autocmd BufNewFile,BufRead *.m setlocal foldnestmax=1
augroup END
" }}}
" C, C++, Obj-C Header {{{
augroup ft_h
  autocmd!
  autocmd BufNewFile,BufRead *.h setlocal foldlevel=1
  autocmd BufNewFile,BufRead *.h setlocal foldnestmax=20
augroup END
" }}}
" Syandus Spec File {{{
augroup ft_ssf
  autocmd!
  autocmd BufNewFile,BufRead *.ssf setlocal foldlevel=9001
  autocmd BufNewFile,BufRead *.ssf setlocal foldnestmax=0
augroup END
" }}}
" SyML {{{
augroup ft_sml
  autocmd!
  autocmd BufNewFile,BufRead *.sml setlocal foldlevel=9001
  autocmd BufNewFile,BufRead *.sml setlocal foldnestmax=0
augroup END
" }}}
" Java {{{

augroup ft_java
    au!

    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
augroup END

" }}}
" vimrc {{{
augroup vimrc
  au!
  au BufWritePost _vimrc source $MYVIMRC
augroup END
" }}}

" Hex Editing {{{
" vim -b : edit binary using xxd-format!
augroup Binary
  au!

  " set binary option for all binary files before reading them
  au BufReadPre *.bin,*.hex,*.exe setlocal binary

  " if on a fresh read the buffer variable is already set, it's wrong
  au BufReadPost *
  \ if exists('b:editHex') && b:editHex |
  \   let b:editHex = 0 |
  \ endif

  " convert to hex on startup for binary files automatically
  au BufReadPost *
  \ if &binary | Hexmode | endif

  " When the text is freed, the next time the buffer is made active it will
  " re-read the text and thus not match the correct mode, we will need to
  " convert it again if the buffer is again loaded.
  au BufUnload *
  \ if getbufvar(expand("<afile>"), 'editHex') == 1 |
  \   call setbufvar(expand("<afile>"), 'editHex', 0) |
  \ endif

  " before writing a file when editing in hex mode, convert back to non-hex
  au BufWritePre *
  \ if exists("b:editHex") && b:editHex && &binary |
  \  let oldro=&ro | let &ro=0 |
  \  let oldma=&ma | let &ma=1 |
  \  silent exe "%!xxd -r" |
  \  let &ma=oldma | let &ro=oldro |
  \  unlet oldma | unlet oldro |
  \ endif

  " after writing a binary file, if we're in hex mode, restore hex mode
  au BufWritePost *
  \ if exists("b:editHex") && b:editHex && &binary |
  \  let oldro=&ro | let &ro=0 |
  \  let oldma=&ma | let &ma=1 |
  \  silent exe "%!xxd" |
  \  silent exe "%:s/$//g" |
  \  exe "set nomod" |
  \  let &ma=oldma | let &ro=oldro |
  \  unlet oldma | unlet oldro |
  \ endif
augroup END
" }}}

" }}}
" Tags -------------------------------------------------------------------- {{{
set tags=

" Current Directory
set tags+=tags

" Base
set tags+=C:/SVN/Syandus_ALIVE3/Platform/Source/Code/tags
set tags+=C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/Source/Scripts/tags

" Cores
"set tags+=C:\SVN\Syandus_Cores\C_Demo_Marketing_01\Source\Scripts\Content\tags
"set tags+=C:\SVN\Syandus_Cores\C_Spv_COPD_01\Source\Scripts\Content\tags
" }}}
" Plugin setting ---------------------------------------------------------- {{{

" NetRW {{{
let g:netrw_silent=1
" apparently enabling this hijacks the mouse completely
" so you can't use it to select stuff (WTF!)
let g:netrw_mousemaps=0   
" }}}
" AutoComplPop {{{
let g:acp_enableAtStartup = 1
let g:acp_ignorecaseOption = 1
let g:acp_completeOption = '.,w,b,u,t'
let g:acp_behaviorKeywordLength = 4
let g:acp_completeoptPreview = 0
let g:acp_behaviorKeywordIgnores = ['Sy', 'sy', 'get', 'set', 'Get', 'Set']

function! MySuperTabUserCompletion(findstart, base)
  if a:findstart
    if (!exists("b:possible_function_signatures"))
      return -1;
    else
      let start = col('.') - 1
      return start
    endif
  else
    return { 'words' : b:possible_function_signatures, 'refresh' : 'always' }
  endif
endfunction

function! MySuperTab()
  " if popup menu is open accept selected entry
  if pumvisible() 
    return "\<C-y>"
  " do fancy tab
  else
    let line = getline(".")
    let line = strpart(line, 0, col('.') - 1)
    let words = split(line, '\W\+')
    " if we are just TAB-ing to get more leading whitespace
    if (len(words) < 1)
      return "\<TAB>"
    endif

    let last_word = words[-1]

    let results = taglist("^" . last_word . "$")
    let b:possible_function_signatures = []
    for item in results
      if (has_key(item, 'signature'))
        let entry = {}
        let signature = item['signature']
        let entry.word = signature

        let class = '-'
        if (has_key(item, 'class'))
          let class = item['class']
        endif

        let kind = '-'
        if (has_key(item, 'kind'))
          let kind = item['kind']
        endif

        let abbr = class . '::' . last_word . signature
        let entry.abbr = abbr
        call add(b:possible_function_signatures, entry)
      endif
    endfor

    if (len(b:possible_function_signatures) > 0)
      setlocal completefunc=MySuperTabUserCompletion
      return "\<C-X>\<C-U>"
    endif

    unlet b:possible_function_signatures

    return ""
  endif
endfunction

function! MySuperEnter()
  if pumvisible()
    if (exists("b:possible_function_signatures"))
      return "\<C-y>\<ESC>F(la"
    else
      return "\<C-e>\<CR>"
    endif
  else
    return "\<CR>"
  endif
endfunction

inoremap <expr> <TAB> MySuperTab()
inoremap <expr> <CR>  MySuperEnter()

function! MyChangeNextArg()
  " always start out with an ESC to get out of insert mode
  let change_command = "\<ESC>"
  " yay for zero indexing
  let current_pos = col('.') - 2
  let line = getline('.')
  let char0 = strpart(line, current_pos, 1)
  let char1 = strpart(line, current_pos + 1, 1)
  let char2 = strpart(line, current_pos + 2, 1)

  if (char1 ==# ',')
    let change_command .= "lll"
  else
    let change_command .= "l"
  endif

  let change_command .= "vt"

  "determine if we even have a ',' to move to
  let ii = 0
  let found_comma = 0
  for ii in range(current_pos + 2, len(line))
    let cur_char = strpart(line, ii, 1)
    if (cur_char ==# ',')
      let found_comma = 1
    endif
  endfor

  if (found_comma)
    let change_command .= ','
  else
    let change_command .= ')'
  endif

  let change_command .= "\<C-G>"
  return change_command
endfunction
inoremap <expr> <S-A-l> MyChangeNextArg()
"}}}
" Command-T {{{
let g:CommandTMaxHeight=32
let g:CommandTMatchWindowAtTop=1
let g:CommandTMatchWindowReverse=0
" }}}
" ack.vim {{{
let g:ackprg="C:/Perl/site/bin/ack.bat -H --nocolor --nogroup --column"
" }}}

" tagbar {{{
let g:tagbar_width = 40
let g:tagbar_sort = 0
" }}}
" CtrlP " {{{
let g:loaded_ctrlp = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 25
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_working_path_mode = 2
" }}}
" indent-guides {{{
let g:indent_guides_enable_on_vim_startup=0
" }}}
" }}}
" Projects ---------------------------------------------------------------- {{{
command! Dropbox cd C:/Users/root/Desktop/Dropbox
command! Platform cd C:/SVN/Syandus_ALIVE3/Platform/Source

command! Carbon cd C:/SVN/Syandus_ALIVE3/Frameworks/Carbon
command! Oxygen cd C:/SVN/Syandus_ALIVE3/Frameworks/Oxygen

command! Hub cd C:/SVN/Syandus_ALIVE3/Hub
command! Metrics cd C:/SVN/Syandus_ALIVE3/Metrics

command! Symlin cd C:/SVN/Syandus_Cores/C_Sym_DM_01
command! Spiriva cd C:/SVN/Syandus_Cores/C_Spv_COPD_01
command! Immunobiology cd C:/SVN/Syandus_Cores/C_ImmunoSim_01

command! Mac cd S:/trunk/ALIVE Med/

augroup SyandusIndents
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/* setlocal tabstop=3 shiftwidth=3 softtabstop=3
  autocmd BufNewFile,BufRead,BufEnter C:/SVN/Syandus_ALIVE3/Frameworks/Oxygen/* setlocal tabstop=3 shiftwidth=3 softtabstop=3
  autocmd BufNewFile,BufRead,BufEnter C:/SVN/Syandus_ALIVE3/Hub/* setlocal tabstop=3 shiftwidth=3 softtabstop=3
augroup END

function! SetSettingsForPlatform()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  nnoremap <buffer> <leader>m :call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_platform.ahk')<CR>
endfunction
augroup Platform
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_ALIVE3/Platform/Source/Code/*
  \ call SetSettingsForPlatform()
augroup END

function! SetSettingsForImmunoSim()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  nnoremap <buffer> <leader>m :call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_immunosim.ahk')<CR>
endfunction
augroup ImmunoSim
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_Cores/C_ImmunoSim_01/*
  \ call SetSettingsForImmunoSim()
augroup END

function! SetSettingsForSymlin()
  setlocal tabstop=2 shiftwidth=2 softtabstop=2
  nnoremap <buffer> <leader>m :call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_symlin.ahk')<CR>
endfunction
augroup Symlin
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter 
  \ C:/SVN/Syandus_Cores/C_Sym_DM_01/*
  \ call SetSettingsForSymlin()
augroup END
" }}}

" Function Library -------------------------------------------------------- {{{
function! GetProjectDirectory()
  let directory = getcwd()
  let depth_max = 10
  let counter = 0
  let failed = 0

  while (filereadable(directory . "/root.dir") == 0)
    let directory .= "/.."

    let counter += 1
    if counter >= depth_max
      let failed = 1
      break
    endif
  endwhile

  if failed == 0
    return directory
  else
    return getcwd()
  endif 
endfunction

function! CdToProjectDirectory()
  silent! lcd %:p:h
  silent! execute ":chdir " . GetProjectDirectory()
endfunction

function! DeleteEmptyBuffers()
  let empty = []
  let [i, nbuf] = [1, bufnr('$')]
  while i <= nbuf
      if bufexists(i) && bufname(i) == ''
          let empty += [i]
      endif
      let i += 1
  endwhile
  if len(empty) > 0
      execute 'bdelete ' . join(empty, ' ')
  endif
endfunction
command! DeleteEmptyBuffers call DeleteEmptyBuffers()

command! CurrentDirectory call CurrentDirectory()
function! CurrentDirectory()
  execute ":lcd %:p:h"
endfunction

" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
    %:s/$//g
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
" }}}
" Keybindings {{{

" using leader creates awful visual distraction which I can't stand!
"let mapleader = ","
"let g:mapleader = ","

" The holy ESC key
imap jk <ESC>
imap kj <ESC>

" Less chording
"nnoremap ; :

" Substitute
nnoremap <leader>s :%s//<left>

" CTRL-V and SHIFT-Insert are Paste
inoremap <C-V> <ESC>"+pa

" CTRL-hjkl movement while in : command mode
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" Platform specific keybinds
if has("unix")
  nnoremap <leader>v :e ~/Dropbox/vim/_vimrc<CR>
  " Sudo to write
  cmap w!! w !sudo tee % >/dev/null
elseif has("win32")
  nnoremap <leader>v :e $HOME/Desktop/Dropbox/vim/_vimrc<CR>
endif

function! CtrlPProject()
  let directory = GetProjectDirectory()
  execute ":chdir " . directory
  let directory = getcwd()
  execute ":CtrlP " . directory
endfunction
function! CommandTProject()
  let directory = GetProjectDirectory()
  execute ":CommandT " . directory
endfunction
nnoremap <leader>t :call CommandTProject()<CR>
nnoremap <leader>b :FufBuffer<CR>
silent! nunmap <leader>lj
nnoremap <leader>l :LustyJuggler<CR>
nnoremap <leader>a :A<CR>

nnoremap <leader>c :botright cwindow<CR>
nnoremap <leader>cc :cclose<CR>

" Splits {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wn :split<CR>
nnoremap <leader>wc :close<CR>

nnoremap <C-Up> :resize +1<CR>
nnoremap <C-Down> :resize -1<CR>
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>
" }}}
" Tabs {{{
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-t> <ESC>:tabnew<CR>
nnoremap <A-w> <ESC>:tabclose<CR>

inoremap <A-1> <ESC>1gt
inoremap <A-2> <ESC>2gt
inoremap <A-3> <ESC>3gt
inoremap <A-4> <ESC>4gt
inoremap <A-5> <ESC>5gt
inoremap <A-6> <ESC>6gt
inoremap <A-7> <ESC>7gt
inoremap <A-8> <ESC>8gt
inoremap <A-9> <ESC>9gt
inoremap <A-t> <ESC>:tabnew<CR>
inoremap <A-w> <ESC>:tabclose<CR>

nnoremap <M-h> :tabprev<CR>
nnoremap <M-l> :tabnext<CR>
" }}}
" Finding stuff {{{
function! GetRelevantExtensions()
  let extensions = ""
  let extensions .= "./**/*.vim "
  let extensions .= "./**/*.ssf "
  let extensions .= "./**/*.h "
  let extensions .= "./**/*.cpp "
  let extensions .= "./**/*.m "

  return extensions
endfunction

function! FindCursorWordInBuffer()
  let filename = substitute(expand('%:p'), "\\ ", "\\\\ ", "g")
  execute "lvimgrep /\\<" . expand("<cword>") . "\\>/j " . filename
  lopen
endfunction

function! FindCursorWordInProject()
  execute "vimgrep /\\<" . expand("<cword>") . "\\>/j " . GetRelevantExtensions()
endfunction

function! FindThisKeywordInProject(keyword)
  execute "vimgrep /" . a:keyword . "\\c/j " . GetRelevantExtensions()
endfunction

nnoremap <leader>fw :call FindCursorWordInBuffer()<CR>
nnoremap <leader>fp :call FindCursorWordInProject()<CR>
nnoremap <leader>fk :call FindThisKeywordInProject("")<left><left>
nnoremap <leader>fl :FufLine<CR>

nnoremap <C-Space> :FufTagWithCursorWord!<CR>

" }}}

" Handle URL {{{
" Stolen from https://github.com/askedrelic/homedir/blob/master/.vimrc
" OSX only: Open a web-browser with the URL in the current line
function! HandleURI()
    let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
    echo s:uri
    if s:uri != ""
        exec "!open \"" . s:uri . "\""
    else
        echo "No URI found in line."
    endif
endfunction
map <leader>u :call HandleURI()<CR>
" }}}
" Split/Join {{{
"
" Basically this splits the current line into two new ones at the cursor position,
" then joins the second one with whatever comes next.
"
" Example:                      Cursor Here
"                                    |
"                                    V
" foo = ('hello', 'world', 'a', 'b', 'c',
"        'd', 'e')
"
"            becomes
"
" foo = ('hello', 'world', 'a', 'b',
"        'c', 'd', 'e')
"
" Especially useful for adding items in the middle of long lists/tuples in Python
" while maintaining a sane text width.
nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^
" }}}
" }}}

" vim:fdm=marker:foldlevelstart=0
