" disable crazy keys
nnoremap K <nop>

" General {{{
" Substitute
nnoremap <leader>s :%s//<left>

" CTRL-V and are Paste
inoremap <C-V> <C-r>=@+<CR>

" CTRL-hjkl movement while in : command mode
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

" Platform specific keybinds
if has("unix")
  nnoremap <leader>ev :e ~/Dropbox/vim/_vimrc<CR>
  cmap w!! w !sudo tee % >/dev/null
elseif has("win32")
  nnoremap <leader>ev :e $HOME/Desktop/Dropbox/vim/_vimrc<CR>
endif

function! CommandTProject()
  execute ":CommandT " . EscapePathname(GetProjectDirectory())
endfunction
nnoremap <leader>t :call CommandTProject()<CR>
nnoremap <leader>b :FufBuffer<CR>
"nnoremap <leader>l :LustyJuggler<CR>
nnoremap <leader>a :A<CR>
nnoremap <leader>o :ToggleWord<CR>

"nnoremap <leader>C<space> :botright cwindow<CR>
"nnoremap <leader>Cc :cclose<CR>
"nnoremap <leader>CC :cclose<CR>
"nnoremap <leader>L<space> :lopen<CR>
"nnoremap <leader>LL :lclose<CR>
function! MyPasteToggle()
    if (&paste)
        echom "paste mode TRUE"
        set nopaste
    else
        echom "paste mode FALSE"
        set paste
    endif
endfunction
nnoremap <leader>p :call MyPasteToggle()<CR>

" lazy braces
function! MyLazyBraces()
    let cur_ft = &filetype
    if (cur_ft == 'c' || cur_ft == 'cpp' || cur_ft == 'objc' ||
      \ cur_ft == 'php' || cur_ft == 'fx' || cur_ft == 'cs')
        call feedkeys("{\<CR>\<TAB>⣿\<CR>", 'n')
        for ii in range(1)
          call feedkeys("\<BS>", 'n')
        endfor
        call feedkeys("}\<Up>", 'n')
        for ii in range(&tabstop)
          call feedkeys("\<Right>", 'n')
        endfor
        call feedkeys("\<BS>", 'n')
    else
        call feedkeys('{', 'n')
    endif
    return ""
endfunction
inoremap <expr> { MyLazyBraces()

" lazy .. to ->
autocmd CursorMovedI * call MyLazyDotDotToArrow()
function! MyLazyDotDotToArrow()
    let line = strpart(getline('.'), 0, col('.') - 1)
    let line_len = strlen(line)
    if (line_len < 2)
        return
    endif

    if (line[line_len - 3] != '.' &&
      \ line[line_len - 3] != '/' &&
      \ line[line_len - 3] != '\' &&
      \ line[line_len - 2] == '.' &&
      \ line[line_len - 1] == '.')
        call feedkeys("\<BS>\<BS>->", 't')
    endif

    if (line[line_len - 3] == '-' &&
      \ line[line_len - 2] == '>' &&
      \ line[line_len - 1] == '.')
        call feedkeys("\<BS>\<BS>\<BS>...", 't')
    endif
endfunction
" lazy parentheses
"inoremap ( ()<Left>
" lazy brackets
"inoremap [ []<Left>
" lazy quotes
"inoremap ' ''<Left>
"inoremap " ""<Left>

" these are sort of necessary since you usually have
" to move right of the surrounds
"inoremap <A-h> <Left>
"inoremap <A-l> <Right>
"inoremap <A-k> <Up>
"inoremap <A-j> <Down>
"}}}
" Splits {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wn :split<CR>
nnoremap <leader>wc :close<CR>
nnoremap <leader>wo :wincmd o<CR>

nnoremap <C-Up> :resize +1<CR>
nnoremap <C-Down> :resize -1<CR>
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nnoremap <silent> <leader>wm :call MarkWindowSwap()<CR>
nnoremap <silent> <leader>wp :call DoWindowSwap()<CR>
" }}}
" Tabs {{{
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
function! CreateAndSetupVsplits(num_vsplits)
    if !exists("g:num_tabs")
        let g:num_tabs = 1
    endif

    if g:num_tabs > 1
        tabnew
    endif

    let current_directory = expand("%:p:h")

    5split
    set winfixheight
    Scratch

    wincmd k
    for ii in range(a:num_vsplits)
        vsplit
        exe "chdir " . current_directory
    endfor

    wincmd =

    for ii in range(a:num_vsplits)
        wincmd h
    endfor

    let g:num_tabs = g:num_tabs + 1

    return
endfunction
nnoremap <A-t> :call CreateAndSetupVsplits(1)<CR>
nnoremap <A-w> <ESC>:tabclose<CR>

" }}}
" Finding stuff {{{
function! ExtensionHelper(ext, dir)
    let partial = a:dir . '/**/*.' . a:ext
    let partial = EscapePathname(partial) . ' '
    return partial
endfunction
function! GetRelevantExtensions()
  let directory = GetProjectDirectory()

  let extensions = ""
  let extensions .= ExtensionHelper('vim', directory)
  let extensions .= ExtensionHelper('ssf', directory)
  let extensions .= ExtensionHelper('sml', directory)
  let extensions .= ExtensionHelper('h', directory)
  let extensions .= ExtensionHelper('c', directory)
  let extensions .= ExtensionHelper('cpp', directory)
  let extensions .= ExtensionHelper('m', directory)

  return extensions
endfunction

function! FindCursorWordInBuffer()
  let filename = EscapePathname(expand('%:p'))
  execute 'LAck! ' . expand("<cword>") . ' ' . EscapePathname(filename)
  lopen
endfunction

function! FindCursorWordInProject()
  execute ':Ack! ' . expand("<cword>") . ' ' . GetProjectDirectory()
endfunction

function! FindThisKeywordInProject(keyword)
  execute ':Ack! ' . a:keyword . ' ' . GetProjectDirectory()
endfunction

nnoremap <leader>fwib :call FindCursorWordInBuffer()<CR>
nnoremap <leader>fwip :call FindCursorWordInProject()<CR>
nnoremap <leader>fkip :call FindThisKeywordInProject("")<left><left>
nnoremap <leader>fl :FufLine<CR>

"nnoremap <C-Space> :FufTagWithCursorWord!<CR>

" }}}
" Fancy Tag Completion {{{

function! MySuperCtrlSpaceUserCompletion(findstart, base)
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

function! GetFunctionSignatures(keyword)
    let results = taglist("^" . a:keyword . "$")
    let possible_function_signatures = []
    for item in results
      if (has_key(item, 'signature'))
        let signature = item['signature']
        let signature = substitute(signature, '\((\s*\)\|\(\s*)\)', "", "g")
        let arg_list = split(signature, '\s*,')

        let class = '-'
        if (has_key(item, 'class'))
          let class = item['class']
        endif

        let entry = class . '::' . a:keyword . '('
        for arg in arg_list
            let arg = substitute(arg, '^\s*\|\s*$', "", 'g')
            let entry .= "\n  " . arg
        endfor
        let entry .= " )"

        call add(possible_function_signatures, entry)
      endif
    endfor

    return possible_function_signatures
endfunction

function! GetFunctionSignatures2(keyword)
    let results = taglist("^" . a:keyword . "$")
    let possible_function_signatures = []
    for item in results
      if (has_key(item, 'signature'))
        let signature = item['signature']

        let class = '-'
        if (has_key(item, 'class'))
          let class = item['class']
        endif

        let entry = class . '::' . a:keyword . signature

        call add(possible_function_signatures, entry)
      endif
    endfor

    return possible_function_signatures
endfunction

function! WriteArgListToScratch()
    " get current line up to where cursor is located
    let line = strpart(getline('.'), 0, col('.'))

    if (line[strlen(line) - 1] == ' ')
        return ""
    endif

    let words = split(line, '\W\+')
    if (len(words) < 1)
        return ""
    endif

    let last_word = words[-1]
    let possible_function_signatures = GetFunctionSignatures2(last_word)
    let num_sig = len(possible_function_signatures)

    if (num_sig == 0)
        return ""
    endif

    let output = ""

    for item in possible_function_signatures
        let output .= item
        let output .= "\n"
    endfor

    let cur_win_nr = winnr()
    let scratch_win_nr = bufwinnr('__Scratch__')

    execute scratch_win_nr . "wincmd w"
    normal ggVGD
    :$put=output
    normal gg
    normal dd
    execute cur_win_nr . "wincmd w"
    return
endfunction

function! MySuperLeftParen()
    return "\<ESC>:call WriteArgListToScratch()\<CR>a("
endfunction

" <CR> should not autoaccept what the popup menu has selected
inoremap <expr> <CR>        " \<C-R>=acp#lock()\<CR>\<BS>\<BS>\<CR>\<C-R>=acp#unlock()\<CR>\<BS>"
inoremap <expr> <C-Space>   pumvisible() ? "\<C-y>" : ""
inoremap <expr> (           MySuperLeftParen()

function! MyChangeNextArg()
  " always start out with an ESC to get out of insert mode
  let change_command = "\<ESC>"
  " yay for zero indexing
  let current_pos = col('.') - 2
  let line = getline('.')

  let char0 = line[current_pos]
  let char1 = line[current_pos + 1]

  " first case ( arg1, or (arg1,
  if ((char0 ==# '(') && (char1 !=# ','))
    let change_command .= 'l'
  elseif (char1 ==# ')')
    return ""
  elseif (char1 ==# ',')
    let change_command .= 'lll'
  endif

  let change_command .= "vt"

  "determine if we even have a ',' to move to
  let ii = 0
  let found_comma = 0
  for ii in range(current_pos + 2, len(line))
    if (line[ii] ==# ',')
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
" vim:fdm=marker:foldlevel=0
