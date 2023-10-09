syntax on

set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set laststatus=2

colorscheme slate
set termguicolors
set encoding=UTF-8

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'lambdalisue/fern.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'bagrat/vim-buffet'

" Initialize plugin system
call plug#end()

set omnifunc=ale#completion#OmniFunc
" Give more space for displaying messages.
set cmdheight=2

set rtp+=/opt/local/share/fzf
set guifont=Inconsolata\ Nerd\ Font\ Mono\ 13

nnoremap <C-p> :Files<CR>
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
nnoremap <C-e> :Fern . -drawer<CR>
nnoremap ]a :ALENextWrap<CR>
nnoremap [a :ALEPreviousWrap<CR>

let g:ale_completion_enabled = 1
let g:fern#renderer = "nerdfont"
let g:fern#renderer = "devicons"
let g:buffet_use_devicons = 1
