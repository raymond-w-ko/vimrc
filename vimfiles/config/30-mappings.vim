" disable crazy keys
nnoremap K <nop>
vnoremap K <nop>

inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>

" nobody uses EX mode, use Q for formatting instead
map Q gq

" in case I make this typo
command! W :w

" General {{{
" Substitute
nnoremap <leader>s :%s//c<left><left>

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
nnoremap <leader>b :CommandTBuffer<CR>
"nnoremap <leader>l :LustyJuggler<CR>
nnoremap <leader>a :A<CR>
nnoremap <leader>o :ToggleWord<CR>

nnoremap <leader>gc :CommandT C:/SVN/Syandus_ALIVE3/Frameworks/Carbon<CR>
nnoremap <leader>gp :CommandT C:/SVN/Syandus_ALIVE3/Platform/Source<CR>

"nnoremap <leader>C<space> :botright cwindow<CR>
"nnoremap <leader>Cc :cclose<CR>
"nnoremap <leader>CC :cclose<CR>
"nnoremap <leader>L<space> :lopen<CR>
"nnoremap <leader>LL :lclose<CR>
function! MyPasteToggle()
    if (&paste)
        set nopaste
    else
        set paste
    endif
endfunction
nnoremap <leader>p :call MyPasteToggle()<CR>

" This allows for change paste motion cp{motion}
" http://stackoverflow.com/questions/2471175/vim-replace-word-with-contents-of-paste-buffer
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

" lazy braces
function! MyDoubleBracesExpander()
    let line = strpart(getline('.'), 0, col('.') - 1)
    let line_len = strlen(line)
    if (line_len < 2)
        return
    endif

	echom '#' . line[line_len - 2] . '#' . line[line_len - 1] . '#'
    if ( line[line_len - 2] != '{' ||
       \ line[line_len - 1] != '{' )
		echom "miss"
        return
    endif
	echom "hit"

	call feedkeys("\<BS>\<BS>{\<CR>\<TAB>X\<CR>", 'n')
	call feedkeys("\<BS>", 'n')
	call feedkeys("}\<Up>", 'n')
	for ii in range(&tabstop)
	  call feedkeys("\<Right>", 'n')
	endfor
	call feedkeys("\<BS>", 'n')
endfunction
augroup ExpandDoubleBraces
	au!
	au CursorMovedI * call MyDoubleBracesExpander()
augroup END

function! CreateCppMethodImplementation()
    " determine the complete function definition
    let line_num = line('.')
    
    " find the line with '(', this marks the beginning
    while (1)
        let cur_line = getline(line_num)
        if (match(cur_line, '\v\(') != -1)
            break
        endif

        let line_num = line_num - 1
    endwhile
    
    let begin_line_num = line_num
    
    " find the line with ')', this marks the end
    while (1)
        let cur_line = getline(line_num)
        if (match(cur_line, '\v\)') != -1)
            break
        endif

        let line_num = line_num + 1
    endwhile

    let end_line_num = line_num
    
    if (exists('g:RefactorCppFunctionDefinition'))
        unlet g:RefactorCppFunctionDefinition
    endif
    let g:RefactorCppFunctionDefinition = getline(begin_line_num, end_line_num)
    
    " determine the class name
    " we will just go up until we see a line begin with 'class'
    let line_num = begin_line_num - 1
    while (1)
        let cur_line = getline(line_num)
        let words = split(cur_line, '\W\+')
        
        if (len(words) >= 2)
            if (words[0] == 'class')
                if (exists('g:RefactorCppClassName'))
                    unlet g:RefactorCppClassName
                endif
                let g:RefactorCppClassName = words[1]
                break
            endif
        endif
        
        let line_num = line_num - 1
    endwhile

    normal ,a
    execute "normal Go\<ESC>G"
    call append('$', g:RefactorCppFunctionDefinition)
    normal j
    normal VVG<
    
    
    "check if have virtual keyword, if so delete it since function declarations 
    "don't have that, only in the function definition
    if (expand('<cword>') == "virtual")
        normal dw
    endif

    " TODO check if we have a constructor or destructor, which has no return type
    
    "insert class name
    if (expand('<cword>') != g:RefactorCppClassName)
        normal W
    endif

    execute "normal i\<C-r>=g:RefactorCppClassName\<CR>::\<ESC>G$s\<CR>\<ESC>xxxxxxxx"
endfunction

nmap <leader>rci :call CreateCppMethodImplementation()<CR>G$s<CR><BS>{
nmap <leader>rci :call CreateCppMethodImplementation()<CR>i{

" lazy .. to ->
function! MyLazyDotDotToArrow()
    if (empty(matchstr(&filetype, '\vc|cpp|objc|php|fx|cs|css|javascript')))
        return
    endif

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
augroup ConvertTwoDotsToArrow
	au!
	au CursorMovedI * call MyLazyDotDotToArrow()
augroup END

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
nnoremap <leader>w} :wincmd }<CR>
nnoremap <leader>wg} :wincmd g}<CR>

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

nnoremap <silent> <Left> :call MarkWindowSwap()<CR><C-w>h:call DoWindowSwap()<CR>
nnoremap <silent> <Right> :call MarkWindowSwap()<CR><C-w>l:call DoWindowSwap()<CR>
" }}}
" Tabs {{{
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
function! CreateScratchAndPreview()
    1split

    " create preview window
    set winfixheight
    silent! vertical pedit!
    silent! exe "chdir " . current_directory

    wincmd h
    set winfixheight
    Scratch
    setlocal nowrap
    silent! exe "chdir " . current_directory
    
    wincmd l
    vertical resize 80
    set winfixwidth
    wincmd h

    wincmd k
endfunction
function! CreateAndSetupVsplits()
    let num_vsplits = (&columns / 80) - 1

    if !exists("g:num_tabs")
        let g:num_tabs = 1
    endif

    " get the current directory because we want to replicate this
    " in the new tab
    let current_directory = expand("%:p:h")

    " set up our initial tab if this is our first time
    if g:num_tabs > 1
        tabnew
        silent! exe "chdir " . current_directory
    endif
    
    call CreateScratchAndPreview()

    " create number of vsplits based off of argument passwd
    for ii in range(num_vsplits)
        vsplit
        silent! exe "chdir " . current_directory
    endfor

    " move back to left vsplit
    for ii in range(num_vsplits)
        wincmd h
    endfor

    wincmd =

    let g:num_tabs = g:num_tabs + 1
    return
endfunction
nnoremap <A-t> :call CreateAndSetupVsplits()<CR>
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

function! MyCppCompleteFunc(findstart, base)
    " get current line up to where cursor is located
    let line = strpart(getline('.'), 0, col('.'))
    let words = split(line, '\W\+')

    if a:findstart
        " start after the '(' of course
        return col('.') - 1
    else
        let matches = GetFunctionSignatures3(words[-1])
        return { 'words' : matches, 'refresh' : 'always' }
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
        let signature = iconv(item['signature'], 'latin1', &encoding)

        let class = '-'
        if (has_key(item, 'class'))
          let class = item['class']
        endif

        let entry = class . '::' . signature
        if (match(signature, '(\s*)') == -1)
            call add(possible_function_signatures, entry)
        endif
      endif
    endfor

    return possible_function_signatures
endfunction

function! GetFunctionSignatures3(keyword)
    let results = taglist("^" . a:keyword . "$")
    let possible_function_signatures = []
    for item in results
      if (has_key(item, 'signature'))
        let entry = {}

        let signature = item['signature']

        let class = '-'
        if (has_key(item, 'class'))
          let class = item['class']
        endif

        let entry['word'] = signature
        let entry['abbr'] = class
        call add(possible_function_signatures, entry)
      endif
    endfor

    return possible_function_signatures
endfunction

function! WritePossibleFunctionCompletionsToScratch()
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

    let output = []

    for item in possible_function_signatures
        call add(output, item)
    endfor

    let new_scratch_window_size = len(possible_function_signatures)
    if (new_scratch_window_size > 10)
        let new_scratch_window_size = 10
    endif

    let cur_win_nr = winnr()
    let scratch_win_nr = bufwinnr('__Scratch__')

    execute scratch_win_nr . "wincmd w"
    normal ggVGD
    call setline(line('.'), output)
    execute "resize " . new_scratch_window_size
    execute cur_win_nr . "wincmd w"
    execute "silent! ptag ". last_word
    return
endfunction

function! MySuperLeftParenScratchAndPreview()
    return ";\<ESC>:silent! call WritePossibleFunctionCompletionsToScratch()\<CR>s("
endfunction

function! MySuperLeftParenPopupCompletion()
    if (!empty( matchstr(&filetype, '\vc|cpp') ))
        setlocal completefunc=MyCppCompleteFunc
    else
        setlocal completefunc=
    endif
    
    let result = '('
    if (!empty(&completefunc))
        let result .= "\<C-X>\<C-U>"
    endif

    return result
endfunction

function! CollapseScratchAndPreview()
    let cur_win_nr = winnr()
    let scratch_win_nr = bufwinnr('__Scratch__')
    if (scratch_win_nr == -1)
        return
    endif
 
    execute scratch_win_nr . "wincmd w"
    resize 1
    execute cur_win_nr . "wincmd w"
endfunction

function! MySuperRightParen()
    return ";\<ESC>:silent! call CollapseScratchAndPreview()\<CR>s)"
endfunction

" <CR> should not autoaccept what the popup menu has selected
inoremap <expr> <CR>        " \<C-R>=acp#lock()\<CR>\<BS>\<BS>\<CR>\<C-R>=acp#unlock()\<CR>\<BS>"
inoremap <expr> <F13>       pumvisible() ? "\<C-y>" : ""
inoremap <expr> <C-Space>   pumvisible() ? "\<C-y>" : " "
inoremap <expr> (           MySuperLeftParenScratchAndPreview()
inoremap <expr> )           MySuperRightParen()

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

" Handle URL
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

" Split/Join
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
"nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^
"
" vim:fdm=marker:foldlevel=0
