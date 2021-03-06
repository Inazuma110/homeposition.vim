" =============================================================================
" FILE: homeposition.vim
" Maintainer: Shuta Ito <c011703534@edu.teu.ac.jp>
" LICENCE: MIT licence
" =============================================================================

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

function! homeposition#execute(source_code) abort
  call homeposition#init()
  while s:now != strlen(a:source_code)
    call homeposition#judge_order(a:source_code[s:now])
    let s:now = s:now + 1
  endwhile
  return s:homeposition_array
endfunction

function! homeposition#judge_order(char) abort
  if a:char == 'j'
    let s:homeposition_array[s:idx] = s:homeposition_array[s:idx] + 1
  elseif a:char == 'k'
    let s:homeposition_array[s:idx] = s:homeposition_array[s:idx] - 1
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
  elseif a:char == 'f'
    if s:homeposition_array[s:idx] > 0
      let s:now = s:brackets_stack.top()
    else
      call s:brackets_stack.pop()
    endif
  end
endfunction

function! homeposition#bf2hp() abort
  %s/+/j/ge
  %s/-/k/ge
  %s/>/l/ge
  %s/</h/ge
  %s/\[/d/ge
  %s/\]/f/ge
  %s/\./s/ge
  %s/,/a/ge
endfunction

function! homeposition#hp2bf() abort
  %s/j/+/ge
  %s/k/-/ge
  %s/l/>/ge
  %s/h/</ge
  %s/d/\[/ge
  %s/f/\]/ge
  %s/s/\./ge
  %s/a/,/ge
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
