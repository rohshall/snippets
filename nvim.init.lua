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
-- vim.opt.rtp:append('/opt/local/share/fzf/vim')
-- mappings
local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<leader>x", "\"+x<CR>", opts)
vim.keymap.set("n", "<leader>y", "\"+y<CR>", opts)
vim.keymap.set("n", "<leader>p", "\"+p<CR>", opts)
vim.keymap.set("n", "<Tab>", ":bn<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", opts)
vim.keymap.set("n", "<C-p>", ":Files<CR>", opts)


local plugins = {
    'dense-analysis/ale',
    'junegunn/fzf.vim',
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup{}
        end,
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    'tpope/vim-eunuch',
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
            { "<C-e>", "<cmd>Neotree<cr>", desc = "NeoTree" },
            { "<leader>b", "<cmd>Neotree buffers<cr>", desc = "NeoTree" },
            { "<leader>g", "<cmd>Neotree git_status<cr>", desc = "NeoTree" },
        },
        config = function()
            require("neo-tree").setup()
        end,
    }
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

require("lazy").setup(plugins, {})
