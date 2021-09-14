" =============================================================================
" FILE: stack.vim
" Maintainer: Shuta Ito <c011703534@edu.teu.ac.jp>
" LICENCE: MIT licence
" =============================================================================

scriptencoding utf-8

if !exists('g:loaded_homeposition')
  finish
end

let s:save_cpo = &cpo
set cpo&vim

let s:Stack = {'vals': [1]}
function! stack#Stack() abort
  return deepcopy(s:Stack)
endfunction

function! s:Stack.push(val) abort
  call add(self.vals, a:val)
endfunction

function! s:Stack.pop() abort
  call remove(self.vals, len(self.vals)-1)
endfunction

function! s:Stack.top() abort
  return self.vals[len(self.vals)-1]
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
