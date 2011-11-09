" NetRW {
let g:netrw_silent=1
let g:netrw_mousemaps=0   " apparently enabling this hijacks the mouse completely so you can't use it to select stuff (WTF!)
" }

" AutoComplPop {
let g:acp_ignorecaseOption = 0
let g:acp_completeOption = '.,w,b,u'
let g:acp_behaviorKeywordIgnores = ["Sy"]
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-e>\<CR>" : "\<CR>"
"}

" Command-T {
let g:CommandTMaxHeight=16
let g:CommandTMatchWindowAtTop=0
let g:CommandTMatchWindowReverse=0
" }

" tagbar {
let g:tagbar_width = 40
let g:tagbar_sort = 0
" }

" CtrlP " {
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 10
let g:ctrlp_match_window_bottom = 0
" }

" indent-guides {
let g:indent_guides_enable_on_vim_startup=0
" }

" minibufexpl {
let g:miniBufExplorerMoreThanOne=0
"let g:miniBufExplSplitBelow=1
" }

