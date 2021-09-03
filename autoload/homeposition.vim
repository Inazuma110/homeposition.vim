scriptencoding utf-8

if !exists('g:loaded_homeposition')
  finish
end

let s:save_cpo = &cpo
set cpo&vim

" script

function! homeposition#init() abort
  let s:homeposition_array = [0]
  let s:idx = 0
  let s:now = 0
  let s:brackets_stack = stack#Stack()
endfunction

function! homeposition#execute() abort
  call homeposition#init()
  const source_code = join(getline(0, '$'), '')
  while s:now != strlen(source_code)
    call homeposition#judge_order(source_code[s:now])
    let s:now = s:now + 1
  endwhile
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
    const converted_char = nr2char(s:homeposition_array[s:idx])
    echon converted_char
  elseif a:char == 'a'
    let s:homeposition_array[s:idx] = getchar()
  elseif a:char == 'd'
    call s:brackets_stack.push(s:now)
  end
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
