" <--- NerdCommenter --->
let g:NERDSpaceDelims = 1
filetype plugin on
syntax on
syntax enable

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set language to use its alternative delimiters by default
let g:NERDAltDelims_jav = 1

" Add your own custom formats or overwrite the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**', 'right': '*/' } }

" Allow commenting and inverting empty lines
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting 
let g:NERDTrimTrailingWhiteSpace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

set splitbelow
set cursorline
set spelllang=en_us
set spell
set mouse=a
set clipboard=unnamedplus
autocmd BufEnter * silent! lcd %:p:h   
