" VIM defaults
set nocompatible
set termguicolors                                             " True Color Support
let g:gruvbox_italic=1                                        " enable italic for gruvbox
set background=dark
syntax on
set encoding=utf-8
set number relativenumber
set ignorecase                                                " Case-insensitive searching.
set smartcase                                                 " But case-sensitive if expression contains a capital letter.
set incsearch                                                 " Highlight matches as you type.
set hlsearch                                                  " Highlight matches.
set wildmode=longest,list,full                                " Enable autocompletion
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/* " Set ignored files and paths
set path+=**
let mapleader =                                               ","
set cursorline                                                " highlight the current line

" ## Shared clipboard
set clipboard+=unnamed

" 1 tab = 2 spaces

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

" Syntax highlighting for hamlc
au BufRead,BufNewFile *.hamlc set ft=haml

" Autogenerate a pdf version of a md file on save
autocmd BufWritePost *.md !pandoc % -t beamer -o %:r.pdf

" Jump to the last edited line when opening a file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
