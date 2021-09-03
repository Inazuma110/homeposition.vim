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

