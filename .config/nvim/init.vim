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
