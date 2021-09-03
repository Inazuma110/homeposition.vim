scriptencoding utf-8

if !exists('g:loaded_homeposition')
  finish
end

let s:save_cpo = &cpo
set cpo&vim

let s:homeposition_array = [0]
let s:idx = 0

" script
function! homeposition#execute() abort
  let source_code = getline(0, '$')
  for line in source_code
    for i in range(strlen(line))
      call homeposition#judge_order(line[i])
    endfor
  endfor
endfunction

function! homeposition#judge_order(char) abort
  if a:char == 'j'
    let s:homeposition_array[s:idx] = s:homeposition_array[s:idx] + 1
  elseif a:char == 'k'
    let s:homeposition_array[s:idx] = s:homeposition_array[s:idx] + 1
  elseif a:char == 'h'
    let s:idx = s:idx - 1
  elseif a:char == 'l'
    if len(s:homeposition_array) - 1 == s:idx
      call add(s:homeposition_array, 0)
    endif
    let s:idx = s:idx + 1
  elseif a:char == 's'
    echo s:homeposition_array[s:idx]
  end
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
