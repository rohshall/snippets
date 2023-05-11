local function load_plugins()
    require('packer').startup(function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use 'dense-analysis/ale'
        use 'junegunn/fzf.vim'
        use {
            'ojroques/nvim-hardline',
            requires = {
                bufferline = true
            }
        }
    end)
end

local load_config = function()
    vim.opt.omnifunc = 'ale#completion#OmniFunc'
    vim.opt.termguicolors = true
    vim.opt.syntax = 'on'
    vim.opt.hidden = true
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.smartindent = true
    vim.opt.number = false
    vim.opt.completeopt = 'menu,menuone,noselect'
    vim.opt.cmdheight = 2
    vim.opt.linebreak = true
    -- vim globals
    vim.g.ale_completion_enabled = 1
    -- Keep the current directory and the browsing directory synced to avoid file move errors 
    vim.g.netrw_keepdir = 0
    vim.g.netrw_banner = 0
    vim.g.netrw_liststyle = 3
    vim.g.netrw_browse_split = 4
    vim.g.netrw_altv = 1
    vim.g.netrw_winsize = 33

    vim.cmd('colorscheme desert')
    vim.opt.rtp:append('/opt/local/share/fzf/vim')

    -- mappings
    local opts = { noremap=true, silent=true }
    vim.keymap.set("n", "<S-h>", ":bp<CR>", opts)
    vim.keymap.set("n", "<S-l>", ":bn<CR>", opts)
    vim.keymap.set("n", "<C-e>", ":Lexplore<CR>", opts)
end

load_plugins()
load_config()

