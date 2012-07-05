" Searching and movement
" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

nnoremap ? ?\v
vnoremap ? ?\v

set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault            " inverts the meaning of the g-flag in s///g

set scrolloff=999
set sidescroll=0
set sidescrolloff=0

set virtualedit+=block

nnoremap <leader><Space> :nohlsearch<CR>:call clearmatches()<CR>

" use aesthetic middle of screen for "zz"
function! AestheticCenterCursor()
    let cursor_line_no = line('.')
    let split_height = winheight(0)
    let delta = float2nr(winheight(0)*0.1)
    if ((cursor_line_no) <= (split_height / 2))
        normal! zz
        return
    else
        normal! zz
        let command = delta . "\<C-E>"
        exe 'normal ' . command
        return
    endif
endfunction

"nnoremap <silent> zz :call AestheticCenterCursor()<CR>

"I copied the default one to Dropbox vim plugin/ folder to make changes
"runtime macros/matchit.vim
"nmap <Tab> %
"vmap <Tab> %

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
"nnoremap n nzzzv:call PulseCursorLine()<cr>
"nnoremap N Nzzzv:call PulseCursorLine()<cr>
"nmap n nzzzv
"nmap N Nzzzv
nnoremap n nzv
nnoremap N Nzv

"nmap gg ggzz
"nmap G Gzz

" Don't move on *
nnoremap * *<c-o>

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

" treat leading whitespace as though it was not there
function! MyLeftBrace()
    let orig_wrapscan=&wrapscan
    let temp=@/
    set nohls
    set nowrapscan
    ?^\s*$
    let @/=temp
    set hls
    if (orig_wrapscan)
        set wrapscan
    endif
endfunction
nnoremap <silent> { :silent! call MyLeftBrace()<CR>

function! MyRightBrace()
    let orig_wrapscan=&wrapscan
    let temp=@/
    set nohls
    set nowrapscan
    /^\s*$
    let @/=temp
    set hls
    if (orig_wrapscan)
        set wrapscan
    endif
endfunction
nnoremap <silent> } :silent! call MyRightBrace()<CR>

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
