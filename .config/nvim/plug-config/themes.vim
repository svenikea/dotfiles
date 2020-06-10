"colorscheme codedark
colorscheme gruvbox
set background=dark
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" Separators can be configured independently for the tabline, so here is how you can define "straight" tabs:
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:lsp_cxx_h1_use_text_props = 1

" set transparency on nvim 
hi Normal guibg=NONE ctermbg=NONE
