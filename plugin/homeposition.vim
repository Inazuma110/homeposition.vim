" =============================================================================
" FILE: homeposition.vim
" Maintainer: Shuta Ito <c011703534@edu.teu.ac.jp>
" LICENCE: MIT licence
" =============================================================================

scriptencoding utf-8

if exists('g:loaded_homeposition')
  finish
end
let g:loaded_homeposition = 1

let s:save_cpo = &cpo
set cpo&vim

" script
command! HomePosition call homeposition#execute(join(getline(0, '$'), ''))
command! HP2BF call homeposition#hp2bf()
command! BF2HP call homeposition#bf2hp()

let &cpo = s:save_cpo
unlet s:save_cpo
