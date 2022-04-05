" # Plugins
call plug#begin('~/.config/nvim/plugged')

source ~/.config/nvim/plugins.d/coc.vim
source ~/.config/nvim/plugins.d/fzf.vim
source ~/.config/nvim/plugins.d/scad.vim
source ~/.config/nvim/plugins.d/vim-airline.vim
source ~/.config/nvim/plugins.d/vim-gitgutter.vim
" source ~/.config/nvim/plugins.d/bitbucket.vim
" source ~/.config/nvim/plugins.d/vira.vim
source ~/.config/nvim/modules/plugins.vim
source ~/.config/nvim/modules/keys.vim
source ~/.config/nvim/modules/misc.vim

call plug#end()

Plug 'arcticicestudio/nord-vim'
source ~/.config/nvim/plugged/nord-vim/colors/nord.vim

" notes
let g:zettelkasten = "/$NOTES_DIR/Zettelkasten/"
nnoremap <leader>ni :e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
command! -nargs=1 NewSecureZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md.gpg"
nnoremap <leader>nz :NewZettel 
nnoremap <leader>nsz :NewSecureZettel

" Don't save backups of *.gpg files
set backupskip+=*.gpg
" To avoid that parts of the file is saved to .viminfo when yanking or
" deleting, empty the 'viminfo' option.
set viminfo=

augroup encrypted
  au!
  " Disable swap files, and set binary file format before reading the file
  autocmd BufReadPre,FileReadPre *.gpg
    \ setlocal noswapfile bin
  " Decrypt the contents after reading the file, reset binary file format
  " and run any BufReadPost autocmds matching the file name without the .gpg
  " extension
  autocmd BufReadPost,FileReadPost *.gpg
    \ execute "'[,']!gpg --decrypt --quiet --default-recipient 21B18424984E9EA8DE432BEF3E218C5431C2C594 " |
    \ setlocal nobin |
    \ execute "doautocmd BufReadPost " . expand("%:r")
  " Set binary file format and encrypt the contents before writing the file
  autocmd BufWritePre,FileWritePre *.gpg
    \ setlocal bin |
    \ '[,']!gpg --encrypt --default-recipient 21B18424984E9EA8DE432BEF3E218C5431C2C594
  " After writing the file, do an :undo to revert the encryption in the
  " buffer, and reset binary file format
  autocmd BufWritePost,FileWritePost *.gpg
    \ silent u |
    \ setlocal nobin
augroup END
