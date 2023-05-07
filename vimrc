syntax on

set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set laststatus=2

colorscheme desert
set termguicolors

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/eleline.vim'

" Initialize plugin system
call plug#end()

set omnifunc=ale#completion#OmniFunc
" Give more space for displaying messages.
set cmdheight=2

set rtp+=/usr/pkg/share/fzf

nnoremap <C-p> :Files<CR>
nnoremap <silent> <S-h> :bn<CR>
nnoremap <silent> <S-l> :bp<CR>

let g:ale_completion_enabled = 1
let g:eleline_powerline_fonts = 1
let g:eleline_slim = 1

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1
let g:netrw_alto = 1

map <silent> <C-E> :Lexplore<CR>

