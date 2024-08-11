-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		'git', 'clone', '--filter=blob:none',
		'https://github.com/echasnovski/mini.nvim', mini_path
	}
	vim.fn.system(clone_cmd)
	vim.cmd('packadd mini.nvim | helptags ALL')
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

local add = MiniDeps.add

add('dense-analysis/ale')
add(
{
	source = 'akinsho/bufferline.nvim',
	depends = { 'nvim-tree/nvim-web-devicons' },
})
require("bufferline").setup{}
add(
{
	source = 'nvim-telescope/telescope.nvim',
	depends = { 'nvim-lua/plenary.nvim' }
})
-- Add to current session (install if absent)
add('nvim-tree/nvim-web-devicons')
require('nvim-web-devicons').setup()

add('rebelot/kanagawa.nvim')

add({
	source = 'neovim/nvim-lspconfig',
	-- Supply dependencies near target plugin
	depends = { 'williamboman/mason.nvim' },
})

add({
	source = 'nvim-treesitter/nvim-treesitter',
	-- Use 'master' while monitoring updates in 'main'
	checkout = 'master',
	monitor = 'main',
	-- Perform action after every checkout
	hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})

add('echasnovski/mini.files')

require('nvim-treesitter.configs').setup({
	ensure_installed = { 'lua', 'python', 'java', 'kotlin' },
	highlight = { enable = true },
})
require('mini.files').setup()

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
vim.opt.guifont = "Iosevka Nerd Font Mono:h14"

-- vim globals
vim.g.ale_completion_enabled = 1
-- Keep the current directory and the browsing directory synced to avoid file move errors 
vim.g.netrw_keepdir = 0
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25

vim.cmd [[colorscheme kanagawa]]
-- mappings
local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<leader>x", "\"+x<CR>", opts)
vim.keymap.set("n", "<leader>y", "\"+y<CR>", opts)
vim.keymap.set("n", "<leader>p", "\"+p<CR>", opts)
vim.keymap.set("n", "<Tab>", ":bn<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", opts)
vim.keymap.set("n", "<C-b>", ":bp<CR>", opts)
local tbuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tbuiltin.find_files, {})
vim.keymap.set('n', '<leader>fg', tbuiltin.live_grep, {})
vim.keymap.set('n', '<leader>fb', tbuiltin.buffers, {})
vim.keymap.set('n', '<leader>fh', tbuiltin.help_tags, {})
local minifiles = require('mini.files')
vim.keymap.set('n', '<leader>o', minifiles.open, {})


