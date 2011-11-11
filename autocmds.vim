augroup indents
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/* setlocal tabstop=3 shiftwidth=3 softtabstop=3
  autocmd BufNewFile,BufRead,BufEnter C:/SVN/Syandus_ALIVE3/Frameworks/Oxygen/* setlocal tabstop=3 shiftwidth=3 softtabstop=3
  autocmd BufNewFile,BufRead,BufEnter C:/SVN/Syandus_ALIVE3/Hub/* setlocal tabstop=3 shiftwidth=3 softtabstop=3
  autocmd BufNewFile,BufRead,BufEnter C:/SVN/Syandus_Cores/C_ImmunoSim_01/* setlocal tabstop=3 shiftwidth=3 softtabstop=3
augroup END

augroup plugins
  autocmd!
  autocmd BufEnter * call SetWorkingDirectory()
augroup END

augroup platform
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter C:/SVN/Syandus_ALIVE3/Platform/Source/Code/* nnoremap ,m :call MakePlatform()<CR>
augroup END
function! MakePlatform()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  execute ':!start cmd /c "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\Users\root\Desktop\Dropbox\make_platform.ahk'
endfunction

augroup immunosim
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter C:/SVN/Syandus_Cores/C_ImmunoSim_01/* nnoremap ,m :call MakeImmunoSim()<CR>
augroup END
function! MakeImmunoSim()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  execute ':!start cmd /c "C:\Program Files\AutoHotkey\AutoHotkey.exe" C:\Users\root\Desktop\Dropbox\make_immunosim.ahk'
endfunction

" vim -b : edit binary using xxd-format!
augroup Binary
  au!

  " set binary option for all binary files before reading them
  au BufReadPre *.bin,*.hex,*.exe setlocal binary

  " if on a fresh read the buffer variable is already set, it's wrong
  au BufReadPost *
  \ if exists('b:editHex') && b:editHex |
  \   let b:editHex = 0 |
  \ endif

  " convert to hex on startup for binary files automatically
  au BufReadPost *
  \ if &binary | Hexmode | endif

  " When the text is freed, the next time the buffer is made active it will
  " re-read the text and thus not match the correct mode, we will need to
  " convert it again if the buffer is again loaded.
  au BufUnload *
  \ if getbufvar(expand("<afile>"), 'editHex') == 1 |
  \   call setbufvar(expand("<afile>"), 'editHex', 0) |
  \ endif

  " before writing a file when editing in hex mode, convert back to non-hex
  au BufWritePre *
  \ if exists("b:editHex") && b:editHex && &binary |
  \  let oldro=&ro | let &ro=0 |
  \  let oldma=&ma | let &ma=1 |
  \  silent exe "%!xxd -r" |
  \  let &ma=oldma | let &ro=oldro |
  \  unlet oldma | unlet oldro |
  \ endif

  " after writing a binary file, if we're in hex mode, restore hex mode
  au BufWritePost *
  \ if exists("b:editHex") && b:editHex && &binary |
  \  let oldro=&ro | let &ro=0 |
  \  let oldma=&ma | let &ma=1 |
  \  silent exe "%!xxd" |
  \  silent exe "%:s/$//g" |
  \  exe "set nomod" |
  \  let &ma=oldma | let &ro=oldro |
  \  unlet oldma | unlet oldro |
  \ endif
augroup END
