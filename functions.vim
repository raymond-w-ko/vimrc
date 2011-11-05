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
