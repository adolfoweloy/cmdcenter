
set shiftwidth=2
set expandtab
set number
set hlsearch
set nocompatible 

call plug#begin()
Plug 'junegunn/fzf'
Plug 'preservim/nerdtree'
Plug 'nordtheme/vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jlcrochet/vim-ruby'
call plug#end()

filetype indent off
syntax on

set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set relativenumber                " show relative line numbers
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set timeoutlen=500                " decrease timeout for 'jk' mapping
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set splitbelow                    " naturally split panes to bottom
set splitright                    " naturally split panes to right

" NERDTmee setup
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Split navigations
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Keymap for insert mode
inoremap <C-d> <C-o>x

" colorscheme setup
"colorscheme nord


