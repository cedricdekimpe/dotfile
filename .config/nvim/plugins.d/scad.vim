" syntax colors
Plug 'sirtaj/vim-openscad'

" Compile openscad image on save
autocmd BufWritePost *.scad :silent !openscad -o %:r.png %
" Automatically open png version of a scad file with feh on opening
autocmd BufRead *.scad :silent !feh %:r.png&
