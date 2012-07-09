set tags=

command! Dropbox cd C:/Users/root/Desktop/Dropbox
command! Omegacomplete cd C:\Users\root\Desktop\Dropbox\vim\vimfiles\bundle\omegacomplete

command! Platform cd C:/SVN/Syandus_ALIVE3/Platform/Source
command! Platform4 cd C:/SVN/Syandus_ALIVE4/Platform/Source

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
command! Groundhog cd C:/SVN/Syandus_ALIVE3/Groundhog
command! GroundhogClient cd C:/SVN/Syandus_ALIVE3/Groundhog/Client
command! GroundhogServer cd C:/SVN/Syandus_ALIVE3/Groundhog/Server
command! GroundhogShared cd C:/SVN/Syandus_ALIVE3/Groundhog/Shared
command! ConnectionTester cd C:/SVN/Syandus_ALIVE3/Groundhog/ConnectionTester
command! SyRefresh cd C:/SVN/Syandus_ALIVE3/Tools/Source/SyRefresh

command! Mac cd S:/trunk/ALIVE Med/

" Shaders
function! SetSettingsForShaders()
    setlocal tabstop=4 shiftwidth=4 softtabstop=4
    nnoremap <buffer> <leader>m :update<CR>:!start .\install.bat<CR>
    setlocal tags=
endfunction
augroup Shaders
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter *.fx call SetSettingsForShaders()
augroup END

function! SetSettingsForProject(size_of_tab, autohotkey_file, tags)
	execute 'setlocal tabstop=' . a:size_of_tab
	execute 'setlocal shiftwidth=' . a:size_of_tab 
	execute 'setlocal softtabstop=' . a:size_of_tab
    if (len(a:autohotkey_file) == 0)
        execute "nnoremap <buffer> <leader>m <nop>"
    else
        execute "nnoremap <buffer> <leader>m :call AutoHotkeyMake('" . a:autohotkey_file . "')\<CR>"
    endif
	execute 'setlocal tags=' . a:tags
endfunction

" personal projects
" OmegacompleteServer {{{
augroup OmegacompleteServer
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/Users/root/Desktop/Dropbox/vim/vimfiles/bundle/omegacomplete/*
    \ call SetSettingsForProject(
        \ 4,
        \ 'C:/Users/root/Desktop/Dropbox/make_omegacomplete_server.ahk',
        \ '')
augroup END
" }}}

" platform level
" OGRE {{{
augroup OgreSDK
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/OgreSDK/*
    \ call SetSettingsForProject(
        \ 4,
        \ '',
        \ 'C:/OgreSDK/OgreSDK_vc9_v1-8-0/include/tags')
augroup END

augroup Ogre
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE4/Evaluations/OGRE/*
    \ call SetSettingsForProject(
        \ 4,
        \ '',
        \ 'C:/OgreSDK/OgreSDK_vc9_v1-8-0/include/tags')
augroup END
"}}}
" Groundhog {{{
augroup Groundhog
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Groundhog/*
    \ call SetSettingsForProject(
        \ 3,
        \ 'C:/Users/root/Desktop/Dropbox/make_groundhog.ahk',
        \ '')
augroup END
augroup ConnectionTester
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Groundhog/ConnectionTester/*
    \ call SetSettingsForProject(
        \ 3,
        \ 'C:/Users/root/Desktop/Dropbox/make_connection_tester.ahk',
        \ '')
augroup END
" }}}
" Platform {{{
augroup Platform3
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Platform/Source/Code/*
    \ call SetSettingsForProject(
        \ 3,
        \ 'C:/Users/root/Desktop/Dropbox/make_platform3.ahk',
        \ 'C:/SVN/Syandus_ALIVE3/Platform/Source/Code/tags')
augroup END
augroup Platform4
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE4/Platform/Source/Code/*
    \ call SetSettingsForProject(
        \ 3,
        \ 'C:/Users/root/Desktop/Dropbox/make_platform4.ahk',
        \ 'C:/SVN/Syandus_ALIVE4/Platform/ThirdParty/OGRE/Include/tags'
        \ )
augroup END
" }}}

" backend, metrics, launcher, misc
" Hub {{{
augroup Hub
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Hub/*
    \ call SetSettingsForProject(
        \ 3,
        \ 'C:/Users/root/Desktop/Dropbox/make_hub.ahk',
        \ 'C:/SVN/Syandus_ALIVE3/Hub/Source/tags')
augroup END
" }}}
" HubWeb {{{
augroup HubWeb
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Hub/Web/*
    \ call SetSettingsForProject(
        \ 4,
        \ '',
        \ '')
augroup END
" }}}
" SyMetrics {{{
augroup SyMetrics
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Metrics/SyMetrics/*
    \ call SetSettingsForProject(
        \ 2,
        \ 'C:/Users/root/Desktop/Dropbox/make_symetrics.ahk',
        \ '')
augroup END
" }}}
" SyMetricsWeb {{{
augroup WebMetrics
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Metrics/web/*
    \ call SetSettingsForProject(
        \ 4,
        \ 'C:/Users/root/Desktop/Dropbox/winscp_sync.ahk',
        \ '')
augroup END
" }}}
" SyLogParser {{{
augroup SyLoginParser
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Metrics/SyLoginParser/*
    \ call SetSettingsForProject(
        \ 2,
        \ 'C:/Users/root/Desktop/Dropbox/make_sylogparser.ahk',
        \ '')
augroup END
"}}}
" SyHandleGen {{{
augroup SyHandleGen
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Tools/Source/SyHandleGen/*
    \ call SetSettingsForProject(
        \ 2,
        \ 'C:/Users/root/Desktop/Dropbox/make_syhandlegen.ahk',
        \ '')
augroup END
"}}}
" SyRefresh {{{
augroup SyRefresh
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Tools/Source/SyRefresh/*
    \ call SetSettingsForProject(
        \ 4,
        \ 'C:/Users/root/Desktop/Dropbox/make_syrefresh.ahk',
        \ '')
augroup END
"}}}
" Mac {{{
augroup Mac
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ S:/*
    \ call SetSettingsForProject(
        \ 2,
        \ '',
        \ '')
augroup END
" }}}

" framework level
" Carbon {{{
augroup Carbon
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/*
    \ call SetSettingsForProject(
        \ 3,
        \ 'C:/Users/root/Desktop/Dropbox/make_carbon.ahk',
        \ 'C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/Source/Scripts/tags,' .
        \ 'C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags')
augroup END
" }}}
" Oxygen {{{
augroup Oxygen
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_ALIVE3/Frameworks/Oxygen/*
    \ call SetSettingsForProject(
        \ 3,
        \ 'C:/Users/root/Desktop/Dropbox/make_carbon.ahk',
        \ 'C:/SVN/Syandus_ALIVE3/Frameworks/Oxygen/Source/Scripts/tags,' .
        \ 'C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags')
augroup END
" }}}

" simulation cores
" UnbrandedSpiriva {{{
augroup UnbrandedSpiriva
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_Cores/C_Unb_COPD_01/*
    \ call SetSettingsForProject(
        \ 3,
        \ 'C:/Users/root/Desktop/Dropbox/make_unbrandedcopd.ahk',
        \ 'C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/Source/Scripts/tags,' .
        \ 'C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags'
        \ )
augroup END
" }}}
" Symlin {{{
augroup Symlin
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_Cores/C_Sym_DM_01/*
    \ call SetSettingsForProject(
        \ 2,
        \ 'C:/Users/root/Desktop/Dropbox/make_symlin.ahk',
        \ 'C:/SVN/Syandus_Cores/C_Sym_DM_01/Source/Scripts/Content/tags,' .
        \ 'C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/Source/Scripts/tags,' .
        \ 'C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags'
        \ )
augroup END
" }}}
" Sutent {{{
augroup Sutent
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_Cores/C_Sut_AE_01/*
    \ call SetSettingsForProject(
        \ 3,
        \ 'C:/Users/root/Desktop/Dropbox/make_sutent.ahk',
        \ 'C:/SVN/Syandus_Cores/C_Sut_AE_01/Source/Scripts/Content/tags,' .
        \ 'C:/SVN/Syandus_ALIVE3/Frameworks/Carbon/Source/Scripts/tags,' .
        \ 'C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags'
        \ )
augroup END
" }}}

" immunobiology
" ImmunoSim {{{
augroup ImmunoSim
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter
    \ C:/SVN/Syandus_Cores/C_ImmunoSim_01/*
    \ call SetSettingsForProject(
        \ 3,
        \ 'C:/Users/root/Desktop/Dropbox/make_immunosim.ahk',
        \ 'C:/SVN/Syandus_Cores/C_ImmunoSim_01/Source/Scripts/Content/tags,' .
        \ 'C:/SVN/Syandus_ALIVE3/Frameworks/Oxygen/Source/Scripts/tags,' .
        \ 'C:/SVN/Syandus_ALIVE3/Platform/SDK/Include/tags'
        \ )
augroup END
" }}}
" vim:fdm=marker:foldlevel=0
