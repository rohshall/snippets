syntax on

set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set laststatus=2

colorscheme desert
set termguicolors

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim'
Plug 'ap/vim-buftabline'

" Initialize plugin system
call plug#end()

set omnifunc=ale#completion#OmniFunc
" Give more space for displaying messages.
set cmdheight=2

set rtp+=/opt/local/share/fzf
set guifont=Inconsolata-Regular:h18

nnoremap <C-p> :Files<CR>
nnoremap <C-e> :Fern . -drawer<CR>
nnoremap <silent> <S-h> :bn<CR>
nnoremap <silent> <S-l> :bp<CR>
nnoremap ]a :ALENextWrap<CR>
nnoremap [a :ALEPreviousWrap<CR>

let g:ale_completion_enabled = 1
