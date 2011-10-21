command! Symlin cd C:\SVN\Syandus_Cores\C_Sym_DM_01
command! Spiriva cd C:\SVN\Syandus_Cores\C_Spv_COPD_01
command! Dropbox cd C:\Users\root\Desktop\Dropbox
command! Platform cd C:\SVN\Syandus_ALIVE3\Platform\Source
command! Carbon cd C:\SVN\Syandus_ALIVE3\Frameworks\Carbon

function! LoadIntellisenseBuffer()
  :r C:\SVN\Syandus_ALIVE3\Platform\Source\Code\SyCore\SyDllFuncs.h
  :normal G
  :r C:\SVN\Syandus_ALIVE3\Platform\Source\Code\SyCore\SyCoreTypes.h
  :normal G
endfunction

function! IntellisenseSearch(keyword)
  execute ':set hlsearch'
  let regexp = '/\(^.*\/\/.*$\n\)*.\{-}'
  let regexp .= a:keyword
  let regexp .= '.\{-}(\_.\{-})'
  execute regexp
endfunction

nnoremap ? /\(^.*\/\/.*$\n\)*.\{-}.\{-}(\_.\{-})<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap ? :g/\(^.*\/\/.*$\n\)*.\{-}.\{-}(\_.\{-})/y A<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

