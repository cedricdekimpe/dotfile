" # Plugins
call plug#begin('~/.config/nvim/plugged')

" source ~/.config/nvim/plugins.d/coc.vim
"source ~/.config/nvim/plugins.d/scad.vim
source ~/.config/nvim/plugins.d/vim-airline.vim
source ~/.config/nvim/plugins.d/vim-gitgutter.vim
"" source ~/.config/nvim/plugins.d/bitbucket.vim
"" source ~/.config/nvim/plugins.d/vira.vim
source ~/.config/nvim/plugins.d/markdown.vim

source ~/.config/nvim/modules/plugins.vim
source ~/.config/nvim/modules/keys.vim
source ~/.config/nvim/modules/misc.vim
"
source ~/.config/nvim/plugins.d/fzf.vim

Plug 'arcticicestudio/nord-vim'
nnoremap <leader><leader> <c-^> # switch between last 2 buffers

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
call plug#end()

source ~/.config/nvim/plugins.d/lsp.vim
colorscheme nord
