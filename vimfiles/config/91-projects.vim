set tags=./tags

command! Dropbox cd C:/Users/root/Desktop/Dropbox
command! Omegacomplete cd C:\Users\root\Desktop\Dropbox\vim\vimfiles\bundle\omegacomplete

command! Platform cd C:/SVN/Syandus_ALIVE3/Platform/Source

command! Carbon cd C:/SVN/Syandus_ALIVE3/Frameworks/Carbon
command! Oxygen cd C:/SVN/Syandus_ALIVE3/Frameworks/Oxygen

command! Hub cd C:/SVN/Syandus_ALIVE3/Hub/Source
command! Metrics cd C:/SVN/Syandus_ALIVE3/Metrics

command! Symlin cd C:/SVN/Syandus_Cores/C_Sym_DM_01
command! Spiriva cd C:/SVN/Syandus_Cores/C_Spv_COPD_01
command! Copd cd C:/SVN/Syandus_Cores/C_Unb_COPD_01
command! Immunobiology cd C:/SVN/Syandus_Cores/C_ImmunoSim_01
command! Sutent cd C:/SVN/Syandus_Cores/C_Sut_AE_01
command! SyLogParser cd C:/SVN/Syandus_ALIVE3/Metrics/SyLoginParser
command! SyHandleGen cd C:/SVN/Syandus_ALIVE3/Tools/Source/SyHandleGen
command! Groundhog cd C:\SVN\Syandus_ALIVE3\Groundhog
command! GroundhogClient cd C:\SVN\Syandus_ALIVE3\Groundhog\Client
command! GroundhogServer cd C:\SVN\Syandus_ALIVE3\Groundhog\Server
command! GroundhogShared cd C:\SVN\Syandus_ALIVE3\Groundhog\Shared

command! Mac cd S:/trunk/ALIVE Med/

augroup SyandusIndents
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_ALIVE3/Metrics/*
  \ setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" Platform {{{
function! SetSettingsForPlatform()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  nnoremap <buffer> <leader>m :call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_platform.ahk')<CR>
  setlocal tags=
  \C:/SVN/Syandus_ALIVE3/Platform/Source/Code/tags
endfunction
augroup Platform
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_ALIVE3/Platform/Source/Code/*
  \ call SetSettingsForPlatform()
augroup END
" }}}
" Hub {{{
function! SetSettingsForHub()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  nnoremap <buffer> <leader>m :call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_hub.ahk')<CR>
  setlocal tags=
  \C:/SVN/Syandus_ALIVE3/Hub/Source/tags
endfunction
augroup Hub
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_ALIVE3/Hub/*
  \ call SetSettingsForHub()
augroup END
" }}}
" Carbon {{{
function! SetSettingsForCarbon()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  nnoremap <buffer> <leader>m :call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_carbon.ahk')<CR>
  setlocal tags=
  \C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/Source/Scripts/tags,
  \C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags
endfunction
augroup Carbon
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/*
  \ call SetSettingsForCarbon()
augroup END
" }}}
" Oxygen {{{
function! SetSettingsForOxygen()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  nnoremap <buffer> <leader>m :call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_carbon.ahk')<CR>
  setlocal tags=
  \C:/SVN/Syandus_ALIVE3/Frameworks/Oxygen/Source/Scripts/tags,
  \C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags
endfunction
augroup Oxygen
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_ALIVE3/Frameworks/Oxygen/*
  \ call SetSettingsForOxygen()
augroup END
" }}}
" ImmunoSim {{{
function! SetSettingsForImmunoSim()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  nnoremap <buffer> <leader>m :update<CR>:call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_immunosim.ahk')<CR>
  setlocal tags=
  \C:/SVN/Syandus_Cores/C_ImmunoSim_01/Source/Scripts/Content/tags,
  \C:/SVN/Syandus_ALIVE3/Frameworks/Oxygen/Source/Scripts/tags,
  \C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags
endfunction
augroup ImmunoSim
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_Cores/C_ImmunoSim_01/*
  \ call SetSettingsForImmunoSim()
augroup END
" }}}
" UnbrandedSpiriva {{{
function! SetSettingsForUnbrandedSpiriva()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  nnoremap <buffer> <leader>m :call AutoHotkeyMake('C:/Users/root/Desktop/Dropbox/make_unbrandedcopd.ahk')<CR>
  setlocal tags=
  \C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/Source/Scripts/tags,
  \C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags
endfunction
augroup UnbrandedSpiriva
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_Cores/C_Unb_COPD_01/*
  \ call SetSettingsForUnbrandedSpiriva()

  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_Cores/C_Spv_COPD_01/*
  \ call SetSettingsForUnbrandedSpiriva()
augroup END
" }}}
" Symlin {{{
function! SetSettingsForSymlin()
  setlocal tabstop=2 shiftwidth=2 softtabstop=2
  nnoremap <buffer> <leader>m :call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_symlin.ahk')<CR>
  setlocal tags=
  \C:/SVN/Syandus_Cores/C_Sym_DM_01/Source/Scripts/Content/tags,
  \C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/Source/Scripts/tags,
  \C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags
endfunction
augroup Symlin
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_Cores/C_Sym_DM_01/*
  \ call SetSettingsForSymlin()
augroup END
" }}}
" Mac {{{
function! SetSettingsForMac()
  setlocal tabstop=2 shiftwidth=2 softtabstop=2
  nnoremap <buffer> <leader>m <nop>
  setlocal tags=
endfunction
augroup Mac
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ S:/*
  \ call SetSettingsForMac()
augroup END
" }}}
" Sutent {{{
function! SetSettingsForSutent()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  nnoremap <buffer> <leader>m :update<CR>:call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_sutent.ahk')<CR>
  setlocal tags=
  \C:/SVN/Syandus_Cores/C_Sut_AE_01/Source/Scripts/Content/tags,
  \C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/Source/Scripts/tags,
  \C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags
endfunction
augroup Sutent
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_Cores/C_Sut_AE_01/*
  \ call SetSettingsForSutent()
augroup END
" }}}
" Shaders {{{
function! SetSettingsForShaders()
  setlocal tabstop=4 shiftwidth=4 softtabstop=4
  nnoremap <buffer> <leader>m :update<CR>:!start .\install.bat<CR>
  setlocal tags=
endfunction
augroup Shaders
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter *.fx call SetSettingsForShaders()
augroup END
"}}}
" SyLogParser {{{
function! SetSettingsForSyLogParser()
  setlocal tabstop=2 shiftwidth=2 softtabstop=2
  nnoremap <buffer> <leader>m :update<CR>:call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_sylogparser.ahk')<CR>
  setlocal tags=
endfunction
augroup SyLogParser
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Metrics/SyLoginParser/*
    \ call SetSettingsForSyLogParser()
augroup END
"}}}
" SyHandleGen {{{
function! SetSettingsForSyHandleGen()
  setlocal tabstop=2 shiftwidth=2 softtabstop=2
  nnoremap <buffer> <leader>m :update<CR>:call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_syhandlegen.ahk')<CR>
  setlocal tags=
endfunction
augroup SyLogParser
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Tools/Source/SyHandleGen/*
    \ call SetSettingsForSyHandleGen()
augroup END
"}}}
" Groundhog {{{
function! SetSettingsForGroundhog()
  setlocal tabstop=3 shiftwidth=3 softtabstop=3
  nnoremap <buffer> <leader>m :update<CR>:call AutoHotkeyMake('C:\Users\root\Desktop\Dropbox\make_groundhog.ahk')<CR>
  "setlocal tags=
  "\C:/SVN/Syandus_Cores/C_Sut_AE_01/Source/Scripts/Content/tags,
  "\C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/Source/Scripts/tags,
  "\C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags
endfunction
augroup Groundhog
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter
  \ C:/SVN/Syandus_ALIVE3/Groundhog/*
  \ call SetSettingsForGroundhog()
augroup END
" }}}
" vim:fdm=marker:foldlevel=0
