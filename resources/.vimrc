set tabstop=2
set shiftwidth=2
set expandtab
set number
set hlsearch
set nocompatible 

call plug#begin()
Plug 'junegunn/fzf'
Plug 'preservim/nerdtree'
Plug 'nordtheme/vim'
call plug#end()

filetype indent off
syntax on

" NERDTree setup
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" colorscheme setup
"colorscheme nord


