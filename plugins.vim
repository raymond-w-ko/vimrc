" NetRW {
let g:netrw_silent=1
let g:netrw_mousemaps=0   " apparently enabling this hijacks the mouse completely so you can't use it to select stuff (WTF!)
" }

" AutoComplPop {
let g:acp_ignorecaseOption = 0
let g:acp_completeOption = '.,w,b,u,t'
let g:acp_behaviorKeywordLength = 3
let g:acp_completeoptPreview = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-e>\<CR>" : "\<CR>"
"}

" Command-T {
let g:CommandTMaxHeight=32
let g:CommandTMatchWindowAtTop=1
let g:CommandTMatchWindowReverse=0
" }

" tagbar {
let g:tagbar_width = 40
let g:tagbar_sort = 0
" }

" CtrlP " {
let g:loaded_ctrlp = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 25
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_working_path_mode = 2
" }

" indent-guides {
let g:indent_guides_enable_on_vim_startup=0
" }
