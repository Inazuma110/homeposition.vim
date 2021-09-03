scriptencoding utf-8

if exists('g:loaded_homeposition')
  finish
end
let g:loaded_homeposition = 1

" script
command HomePosition call homeposition#run()

let &cpo = s:save_cpo
unlet s:save_cpo
