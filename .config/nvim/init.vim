"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimplug for Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/local/share/nvim/plugged')
" {{ Productivity }} 
  Plug 'scrooloose/nerdtree' 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
" {{ Colors & Themes }}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tomasiser/vim-code-dark'
  Plug 'vim-python/python-syntax' 
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  

" {{ Icons }}
  Plug 'ryanoasis/vim-devicons'
call plug#end()
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Vim NERDTREE settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"syntax on                   " autocmd vimenter * NERDTree

"autocmd vimenter * NERDTree

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Basic Vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set splitbelow
colorscheme codedark
set encoding=UTF-8
let g:python_highlight_all = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

