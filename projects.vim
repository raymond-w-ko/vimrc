command! Symlin cd C:\SVN\Syandus_Cores\C_Sym_DM_01
command! Spiriva cd C:\SVN\Syandus_Cores\C_Spv_COPD_01
command! Immunobiology cd C:\SVN\Syandus_Cores\C_ImmunoSim_01
command! Dropbox cd C:\Users\root\Desktop\Dropbox
command! Platform cd C:\SVN\Syandus_ALIVE3\Platform\Source
command! Carbon cd C:\SVN\Syandus_ALIVE3\Frameworks\Carbon
command! Oxygen cd C:\SVN\Syandus_ALIVE3\Frameworks\Oxygen

function! IntellisenseSearch(keyword)
  execute ':set hlsearch'
  let regexp = '/\(^.*\/\/.*$\n\)*.\{-}'
  let regexp .= a:keyword
  let regexp .= '.\{-}(\_.\{-})'
  execute regexp
endfunction

" what does this do?
"nnoremap ? :g/\(^.*\/\/.*$\n\)*.\{-}.\{-}(\_.\{-})/y A<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
