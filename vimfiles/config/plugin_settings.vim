"let g:loaded_matchparen = 1
" a.vim {{{
let g:alternateNoDefaultAlternate=1
"}}}
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
let g:acp_behaviorKeywordLength = 3
let g:acp_completeoptPreview = 0
let g:acp_behaviorKeywordIgnores = ['Sy', 'sy', 'get', 'set', 'Get', 'Set']
let g:acp_mappingDriven = 0
"}}}
" Command-T {{{
let g:CommandTMaxHeight=16
let g:CommandTMatchWindowAtTop=1
let g:CommandTMatchWindowReverse=0
" }}}
" ack.vim {{{
let g:ackprg="C:/Perl/site/bin/ack.bat -H --nocolor --nogroup --column"
" }}}
" LustyJuggler {{{
let g:LustyJugglerDefaultMappings=0
" }}}
" yankring {{{
let g:yankring_min_element_length = 1
" }}}k

" tagbar {{{
let g:tagbar_width = 40
let g:tagbar_sort = 0
" }}}
" CtrlP {{{
let g:loaded_ctrlp = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 16
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_working_path_mode = 2
" }}}
" indent-guides {{{
let g:indent_guides_enable_on_vim_startup=0
" }}}


" vim-powerline {{{
let g:Powerline_symbols='fancy'
" }}}

" vim:fdm=marker:foldlevel=9001
