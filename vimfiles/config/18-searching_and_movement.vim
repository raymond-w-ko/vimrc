" use aesthetic middle of screen for "zz"
function! AestheticCenterCursor()
    normal! zz

    let center = round(winheight(0) / 2.0)
    let offset = winheight(0) * 0.1
    let final = center - offset
    let rounded_final = float2nr(final)
    let rounded_offset = float2nr(offset)

    " obviously don't need the offset
    if (line('.') <= (winheight(0) / 2))
        return
    else
        exe 'normal ' . rounded_offset . "\<C-e>"

        " handle the case of folded lines which
        " move it above the aesthetic center
        if (winline() < rounded_final)
            normal! zz
        endif
    endif
endfunction
nnoremap <silent> zz :call AestheticCenterCursor()<CR>

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

set scrolloff=0
set sidescroll=0
set sidescrolloff=0

set virtualedit+=block

nnoremap <leader><Space> :nohlsearch<CR>:call clearmatches()<CR>

nmap n nzzzv
nmap N Nzzzv

nmap G Gzz

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
