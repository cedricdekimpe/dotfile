" # Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
lua require('config/treesitter')
source ~/.config/nvim/plugins.d/vim-airline.vim
source ~/.config/nvim/plugins.d/vim-gitgutter.vim
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
Plug 'hrsh7th/nvim-compe'
Plug 'napmn/react-extract.nvim'

call plug#end()

source ~/.config/nvim/plugins.d/lsp.vim
colorscheme nord
