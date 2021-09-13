# homeposition.vim
[HomePosition](https://github.com/Inazuma110/home_position) support for vim.

## Features
- ✨ Syntax highlighting!
- 🏃 Run HomePosition by only Vimscript!
- ✡️ Interconversion between HomePosition and Brainfuck!

## Requirements
Vim or Neovim.
These have to be able to use `const`.

## Install
Using [dein.vim](https://github.com/Shougo/dein.vim)
```vim
call dein#add('Inazuma110/homeposition.vim')
```

Using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'Inazuma110/homeposition.vim'
```

## Usage
The file extension must be `hp`.
### Run HomePosition
```vim
:HomePosition
```
### Convert from Brainfuck to HomePosition
```vim
:BF2HP
```
### Convert from HomePosition to Brainfuck
```vim
:HP2BF
```


## Contribution
Welcome!!
You can fork and send PR.
