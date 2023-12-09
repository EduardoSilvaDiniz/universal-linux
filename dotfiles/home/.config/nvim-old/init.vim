
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'ervandew/supertab'
Plug 'shougo/neocomplete.vim'
Plug 'nvie/vim-flake8'
Plug 'tell-k/vim-autopep8'
Plug 'yggdroot/indentline'
Plug 'm4xshen/autoclose.nvim'
call plug#end()

syntax enable

set tabstop=4
set shiftwidth=4
set expandtab
set number
set background=dark
set mouse=a
set showcmd
set cursorline
set hlsearch
set ignorecase
set autoindent
colorscheme gruvbox

let g:SuperTabDefaultCompletionType = "<c-n>"
nnoremap <C-o> :NERDTreeToggle <cr>
nnoremap <C-s> :w! <cr>
nnoremap <C-q> :q! <cr>
map <F4> :! librewolf "%" <CR>
map <F12> :PlugInstall <CR>
