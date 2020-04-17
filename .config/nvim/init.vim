" # Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox' " the gruvbox colorscheme
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax colors
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'sirtaj/vim-openscad'

" Snippets
Plug 'honza/vim-snippets'

" Utils
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline' " status bar
Plug 'vim-airline/vim-airline-themes' " status bar
Plug 'oblitum/rainbow'
Plug 'paulkass/jira-vim'
Plug 'tpope/vim-rails'
Plug 'rorymckinley/vim-rubyhash' "convert ruby hash via rs rt and rs
Plug 'pbrisbin/vim-mkdir' " self explanatory
" Plug 'stefanoverna/vim-i18n'
Plug '~/code/vim-i18n'

let g:jiraVimDomainName = "https://apptweak.atlassian.net"
let g:jiraVimEmail = "cedric@bousmanne.com"
let g:jiraVimToken = "u6YgZfiAKnMC5TxDj3L78C56"

call plug#end()

" let g:rainbow_active = 1 " activate rainbow

" # Mapping
"
" map Ctrl[hjkl] to move between splits
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Always center the screen when looking for previous (N) / next (n) match
nnoremap n nzz
nnoremap N Nzz

" move line up and down 
" ref.: https://vim.fandom.com/wiki/Moving_lines_up_or_down
" source.: tuffc00ki3

" nnoremap <C-J> :m .+1<CR>==
" inoremap <C-J> <Esc>:m .+1<CR>==gi
" inoremap <C-K> <Esc>:m .-2<CR>==gi
" vnoremap <C-J> :m '>+1<CR>gv=gv
" nnoremap <C-K> :m .-2<CR>==
" vnoremap <C-K> :m '<-2<CR>gv=gv

" Use fzf-preview for `ff` and `ls`
" map ff :ProjectFilesPreview<cr>
map ff :FzfPreviewProjectFiles<cr>
" map ls :BuffersPreview<cr>
map ls :FzfPreviewBuffers<cr>
map gs :FzfPreviewGitStatus<cr>

" # Misc config
"
" VIM defaults
set nocompatible
set termguicolors " True Color Support
let g:gruvbox_italic=1 " enable italic for gruvbox
colorscheme gruvbox
set background=dark
syntax on
set encoding=utf-8
set number relativenumber
set ignorecase          " Case-insensitive searching.
set smartcase           " But case-sensitive if expression contains a capital letter.
set incsearch           " Highlight matches as you type.
set hlsearch            " Highlight matches.
set wildmode=longest,list,full " Enable autocompletion
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/* " Set ignored files and paths
set path+=**
let mapleader =","

" ## Shared clipboard
" makes y and p copy and paste to the “global” buffer that is used by other apps
set clipboard+=unnamed
" Ctrl+c Ctrl+v
vmap <C-c> "+yi
imap <C-v> <esc>"+gpi
" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P

" Use <leader>ag to search for current word under cursor
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>

" 1 tab = 2 spaces

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

" # coc config - shamelessly copypasted from awesomevim.com

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" # Coc-Snippet

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Coc config

let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-solargraph',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

""""""""""

" Syntax highlighting for hamlc
au BufRead,BufNewFile *.hamlc set ft=haml

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" Requires vim-fugitive to work:
" ignore whitespace changes
" command Gslap Gblame -w

" Move visual selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Autogenerate a pdf version of a md file on save
autocmd BufWritePost *.md !pandoc % -t beamer -o %:r.pdf

" Jump to the last edited line when opening a file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" i18n-rails mapping
vmap <Leader>z :call I18nTranslateString()<CR>
vmap <Leader>dt :call I18nDisplayTranslation()<CR>
nmap <Leader>tl ^v$h,z<CR>

" Compile openscad image on save
autocmd BufWritePost *.scad :silent !openscad -o %:r.png %
" Automatically open png version of a scad file with feh on opening
autocmd BufRead *.scad :silent !feh %:r.png&
