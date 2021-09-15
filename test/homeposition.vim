let s:suite = themis#suite('Test for homeposition.vim')
let s:assert = themis#helper('assert')

" The function name(my_test_1) will be a test name.
function! s:suite.execute()
  const l:source = 'jjjjjjjjjdljjjjjjjjljjjjjjjjjjj
        \  ljjjjjhhhkflsljjsjjjjjjjssjj
        \  jslkskkkkkkkkkkkkshjjjjjjjj
        \  skkkkkkkksjjjskkkkkkskkkkkkkksljs'
  const l:res = homeposition#execute(l:source)
  call s:assert.equals(l:res, [0, 72, 100, 33])
endfunction

function s:suite.stack_init()
  let s:stack = stack#Stack()
  call s:assert.equals(s:stack.vals, [])
  call s:stack.push(1)
  call s:assert.equals(s:stack.vals, [1])
endfunction

function s:suite.stack_push()
  let s:stack = stack#Stack()
  call s:stack.push(1)
  call s:assert.equals(s:stack.vals, [1])
endfunction

function s:suite.stack_pop()
  let s:stack = stack#Stack()
  call s:stack.push(1)
  call s:stack.pop()
  call s:assert.equals(s:stack.vals, [])
endfunction

