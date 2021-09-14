" =============================================================================
" Vim syntax file
" Language: HomePosition
" Maintainer: Shuta Ito <c011703534@edu.teu.ac.jp>
" LICENCE: MIT licence
" =============================================================================

if exists('b:current_syntax')
  finish
end

" TODO comment
syn keyword hp_todo
  \ TODO
  \ FIXME
  \ NOTE

" []
syntax match hp_brackets /[df]/
" +-
syntax match hp_byte /[jk]/
" .,
syntax match hp_io /[as]/
" <>
syntax match hp_cell /[hl]/
" comment
syntax match hp_comment /[^dfjkashl]/ contains=hp_todo

highlight def link hp_brackets Conditional
highlight def link hp_byte Operator
highlight def link hp_io String
highlight def link hp_cell Delimiter
highlight def link hp_comment Comment
highlight def link hp_todo Conditional

let b:current_syntax = 'homeposition'
