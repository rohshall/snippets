-- lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- plug
require 'lazy'.setup({
	'neovim/nvim-lspconfig',
	'dense-analysis/ale',
	'nvim-tree/nvim-web-devicons',
	'akinsho/bufferline.nvim',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{ 'ibhagwan/fzf-lua', branch = 'main' },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	'rebelot/kanagawa.nvim'
})


-- nvim-treesitter
require 'nvim-treesitter.configs'.setup {
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	}
}

-- mason and mason-lspconfig
require 'mason'.setup()
require 'mason-lspconfig'.setup()

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
vim.opt.guifont = "FiraCode Nerd Font Mono:h14"
-- colorscheme
vim.cmd [[colorscheme kanagawa]]

-- vim globals
vim.g.ale_completion_enabled = 1

local opts = { noremap=true, silent=true }
-- fzf
vim.keymap.set('n', '<leader>f', "<CMD>lua require('fzf-lua').files()<CR>", opts)
vim.keymap.set('n', '<leader>b', "<CMD>lua require('fzf-lua').buffers()<CR>", opts)
-- buffers
vim.keymap.set("n", "<Tab>", ":bn<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", opts)
