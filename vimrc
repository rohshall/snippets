syntax on

set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set laststatus=2

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'dense-analysis/ale'
Plug 'ap/vim-buftabline'
Plug 'Donaldttt/fuzzyy'

" Initialize plugin system
call plug#end()

set omnifunc=ale#completion#OmniFunc
" Give more space for displaying messages.
set cmdheight=2

" set rtp+=/opt/local/share/fzf
set guifont=InconsolataNF-Regular:h20

nnoremap <silent> <S-h> :bn<CR>
nnoremap <silent> <S-l> :bp<CR>
nnoremap <leader>b :ls<cr>:b<space>
nnoremap ]a :ALENextWrap<CR>
nnoremap [a :ALEPreviousWrap<CR>

let g:ale_completion_enabled = 1

colorscheme slate
set termguicolors
