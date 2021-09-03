scriptencoding utf-8

if exists('g:loaded_homeposition')
  finish
end
let g:loaded_homeposition = 1

let s:save_cpo = &cpo
set cpo&vim

" script
command! HomePosition call homeposition#execute()

let &cpo = s:save_cpo
unlet s:save_cpo
