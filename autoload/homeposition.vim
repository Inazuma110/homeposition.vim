scriptencoding utf-8

if exists('g:loaded_homeposition')
  finish
end

let s:save_cpp = &cpo
set cpo&vim

" script

let &cpo = s:save_cpo
unlet s:save_cpo
