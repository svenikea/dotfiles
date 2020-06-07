call plug#begin('~/.vim/plugged')
" <--- Themes --->
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kblin/vim-fountain'
Plug 'morhetz/gruvbox' 
Plug 'jackguo380/vim-lsp-cxx-highlight'  
" <--- Code completion --->
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" <--- Fonts and icons --->
Plug 'ryanoasis/vim-devicons'

" <--- Basic setting --->
Plug 'jreybert/vimagit'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
Plug 'vifm/vifm.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vimlab/split-term.vim'

" <--- Syntax highlight --->
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()
