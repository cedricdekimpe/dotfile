" # Plugins
call plug#begin('~/.config/nvim/plugged')

source ~/.config/nvim/plugins.d/coc.vim
source ~/.config/nvim/plugins.d/fzf.vim
source ~/.config/nvim/plugins.d/scad.vim
source ~/.config/nvim/plugins.d/vim-airline.vim
source ~/.config/nvim/plugins.d/jira-vim.vim
source ~/.config/nvim/modules/plugins.vim
source ~/.config/nvim/modules/keys.vim
source ~/.config/nvim/modules/misc.vim

call plug#end()

colorscheme gruvbox
