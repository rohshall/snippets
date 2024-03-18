local plugins = {
    'dense-analysis/ale',
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup{}
        end,
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
}


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)

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
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.clipboard = "unnamedplus"
vim.opt.modeline = false
-- vim globals
vim.g.ale_completion_enabled = 1
-- Keep the current directory and the browsing directory synced to avoid file move errors 
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

vim.cmd [[colorscheme slate]]
vim.opt.guifont = "Inconsolata:h18"
-- mappings
local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<leader>x", "\"+x<CR>", opts)
vim.keymap.set("n", "<leader>y", "\"+y<CR>", opts)
vim.keymap.set("n", "<leader>p", "\"+p<CR>", opts)
vim.keymap.set("n", "<Tab>", ":bn<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", opts)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

