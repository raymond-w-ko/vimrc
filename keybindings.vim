" using leader creates awful visual distraction which I can't stand!
"let mapleader = ","
"let g:mapleader = ","

" The holy ESC key
imap jk <ESC>
imap kj <ESC>

" Platform specific keybinds
if has("unix")
  nnoremap ,v :e ~/Dropbox/vim/_vimrc<CR>
  nnoremap ,s :source ~/.vimrc<CR>
elseif has("win32")
  nnoremap ,v :e $HOME/Desktop/Dropbox/vim/_vimrc<CR>
  nnoremap ,s :source $HOME/_vimrc<CR>
endif

" always skip whitespace when hitting 0
nmap 0 ^

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
nnoremap ,t :call CommandTProject()<CR>
nnoremap ,b :FufBuffer<CR>
nnoremap ,l :LustyJuggler<CR>
nnoremap ,a :A<CR>

nnoremap ,c :botright cwindow<CR>
nnoremap ,cc :cclose<CR>

nnoremap <silent> <Space> :call HighlightNearCursor()<CR>
let g:quickfix_is_open = 0
function! HighlightNearCursor()
  if !exists("s:highlightcursor")
    let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    let s:highlightcursor=1
  else
    match None
    let @/ = ''
    unlet s:highlightcursor
  endif
endfunction

" CTRL-V and SHIFT-Insert are Paste
inoremap <C-V> <ESC>"+pa

" Splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap ,wv :vsplit<CR>
nnoremap ,wn :split<CR>
nnoremap ,wc :close<CR>

nnoremap <C-Up> :resize +1<CR>
nnoremap <C-Down> :resize -1<CR>
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>

" CTRL-hjkl movement while in : command mode
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" Tab Mappings 
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" complicated keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <silent> <Space> :nohlsearch<CR>:NeoComplCacheCachingBuffer<CR>:echo "Caching done."<CR>
"nnoremap <C-Space> viw"zy<C-w><C-W>:Scratch<CR>ggVGD"zp:FufTagWithCursorWord<CR>
"nnoremap <C-Space> mzviw"zy<C-w><C-W>:Scratch<CR>ggVGD"zp/<C-r>z<CR><C-]><C-w><C-w>`z
nnoremap <C-Space> :FufTagWithCursorWord!<CR>

" find and replace visually selected
vnoremap <C-h> "hy:%s/<C-r>h//g<left><left>

function! GetRelevantExtensions(directory)
  let extensions = ""
  let extensions .= a:directory . "/**/*.vim "
  let extensions .= a:directory . "/**/*.cpp "
  let extensions .= a:directory . "/**/*.h "
  let extensions .= a:directory . "/**/*.ssf "

  return extensions
endfunction

function! FindCursorWordInBuffer()
  execute "lvimgrep /\\<" . expand("<cword>") . "\\>/j " . expand('%:p')
  lopen
endfunction

function! FindCursorWordInProject()
  execute "vimgrep /\\<" . expand("<cword>") . "\\>/j " . GetRelevantExtensions(GetProjectDirectory())
endfunction

function! FindThisKeywordInProject(keyword)
  execute "vimgrep /" . a:keyword . "\\c/j " . GetRelevantExtensions(GetProjectDirectory())
endfunction

nnoremap ,ff :call FindCursorWordInBuffer()<CR>
nnoremap ,fp :call FindCursorWordInProject()<CR>
nnoremap ,fk :call FindThisKeywordInProject("")<left><left>
nnoremap ,fl :FufLine<CR>

"noremap <C-g> ^yw<C-w>h:<C-r>"<CR>zz<C-w>l
"nnoremap <C-/> /\(^.*\/\/.*$\n\)*.\{-}.\{-}(\_.\{-})<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
