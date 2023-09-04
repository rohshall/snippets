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
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim'
Plug 'rbong/vim-crystalline'

" Initialize plugin system
call plug#end()

set omnifunc=ale#completion#OmniFunc
" Give more space for displaying messages.
set cmdheight=2

" set rtp+=/usr/pkg/share/fzf
" set guifont=Inconsolata\ Medium\ 14

nnoremap <C-p> :Files<CR>
nnoremap <C-e> :Fern . -drawer<CR>
nnoremap <silent> <S-h> :bn<CR>
nnoremap <silent> <S-l> :bp<CR>
nnoremap ]a :ALENextWrap<CR>
nnoremap [a :ALEPreviousWrap<CR>

let g:ale_completion_enabled = 1

set tabline=%!crystalline#bufferline()
set showtabline=2
set guioptions-=e
function! StatusLine(...)
  return crystalline#mode() . ' %f%h%w%m%r '
endfunction
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'nord'
