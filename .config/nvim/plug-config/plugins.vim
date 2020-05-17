call plug#begin('~/.vim/plugged')
" <--- Themes --->
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" <--- Code completion --->
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" <--- Fonts and icons --->
Plug 'ryanoasis/vim-devicons'

" <--- Basic setting --->
Plug 'jreybert/vimagit'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder

" <--- Syntax highlight --->
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()
