function! GetProjectDirectory()
  let directory = getcwd()
  let depth_max = 10
  let counter = 0
  let failed = 0

  while (filereadable(directory . "/_vimproject") == 0)
    let directory .= "/.."

    let counter += 1
    if counter >= depth_max
      let failed = 1
      break
    endif
  endwhile

  if failed == 0
    return directory
  else
    return getcwd()
  endif 
endfunction

function! DeleteEmptyBuffers()
    let empty = []
    let [i, nbuf] = [1, bufnr('$')]
    while i <= nbuf
        if bufexists(i) && bufname(i) == ''
            let empty += [i]
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        execute 'bdelete ' . join(empty, ' ')
    endif
endfunction
command! DeleteEmptyBuffers call DeleteEmptyBuffers()
