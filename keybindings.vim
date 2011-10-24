" using leader creates awful visual distraction which I can't stand!
"let mapleader = ","
"let g:mapleader = ","

" The holy ESC key
imap jk <ESC>
imap kj <ESC>

" Platform specific keybinds
if has("unix")
  nnoremap ,v :e ~/Dropbox/_vimrc<CR>
  nnoremap ,s :source ~/.vimrc<CR>
  nnoremap ,c :e ~/.vim/colors/kokonut.vim<CR>
elseif has("win32")
  nnoremap ,v :e $HOME/Desktop/Dropbox/vim/_vimrc<CR>
  nnoremap ,s :source $HOME/_vimrc<CR>
  nnoremap ,c :e C:/Users/root/vimfiles/colors/kokonut.vim<CR>
endif

" Almost always skip whitespace when hitting 0
nmap 0 ^

" Hex Editing
nnoremap ,h :%!xxd<CR>
nnoremap ,H :%!xxd -r<CR>

"nnoremap ,t :ToggleWord<CR>
nnoremap ,t :CommandT<CR>
nnoremap ,b :CommandTBuffer<CR>

" press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :let @/ = ""<CR>

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
" CTRL-V and SHIFT-Insert are Paste
inoremap <C-V> <ESC>"+pa

" make command
"nnoremap <silent> <C-S-B> <ESC>:update<CR><ESC>:!start cmd /c "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\Users\root\Desktop\Dropbox\make.ahk<CR>
"inoremap <silent> <C-S-B> <ESC>:update<CR><ESC>:!start cmd /c "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\Users\root\Desktop\Dropbox\make.ahk<CR>a
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

" Fuzzy Finder
nnoremap ,fl :FufLine<CR>

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

" CTRL-hjkl movement while in omap mode
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
nnoremap <C-Space> mzviw"zy<C-w><C-W>:Scratch<CR>ggVGD"zp/<C-r>z<CR><C-]><C-w><C-w>`z

" find and replace visually selected
vnoremap <C-h> "hy:%s/<C-r>h//g<left><left>

function! FindAllKeywordInBuffer()
  normal mz
  normal "xyiw
  execute ":silent %y+"
  wincmd l
  execute ":Scratch"
  normal ggVGD
  normal "+P
  execute "%s/^/\\=printf('%4d | ', line('.'))/"
  execute "v/\\<" . @x . "\\>/d"
  let @/ = @/
  wincmd h
  normal `z
endfunction

nnoremap <silent> <A-F> :call FindAllKeywordInBuffer()<CR>
nnoremap <A-r> :echom "Test"<CR>
