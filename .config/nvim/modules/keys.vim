" map Ctrl[hjkl] to move between splits
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Always center the screen when looking for previous (N) / next (n) match
nnoremap n nzz
nnoremap N Nzz

" Ctrl+c Ctrl+v
vmap <C-c> "+yi
imap <C-v> <esc>"+gpi

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P

" Use <leader>ag to search for current word under cursor
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <leader>rg :Rg <C-R><C-W><CR>

" Move visual selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" i18n-rails mapping
vmap <Leader>z :call I18nTranslateString()<CR>
vmap <Leader>dt :call I18nDisplayTranslation()<CR>
nmap <Leader>tl ^v$h,z<CR>

" vim-which-key
nnoremap <silent> <leader> :WhichKey ','<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>
