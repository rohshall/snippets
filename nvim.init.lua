local function load_plugins()
    require('packer').startup(function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        use "neovim/nvim-lspconfig"
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
        use 'ojroques/nvim-hardline'
        use 'junegunn/fzf.vim'
        use 'dyng/ctrlsf.vim'
        use 'mfussenegger/nvim-jdtls'
    end)
end

local load_config = function()
    -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = false
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
    vim.opt.rtp:append('/opt/local/share/fzf/vim')
    vim.cmd('colorscheme desert')

    -- mappings
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<C-p>', ':Files<CR>', opts)
    vim.keymap.set('n', '<C-o>', ':NvimTreeToggle<CR>', opts)
    vim.keymap.set("n", "<S-h>", ":bp<CR>", opts)
    vim.keymap.set("n", "<S-l>", ":bn<CR>", opts)
    vim.keymap.set('n', '<C-f>f', ':CtrlSFPrompt', opts)
    vim.keymap.set('n', '<C-f>n', ':CtrlSFCwordPath', opts)
    vim.keymap.set('n', '<C-f>p', ':CtrlSFPwordPath', opts)
    vim.keymap.set('n', '<C-f>o', ':CtrlSFOpen<CR>', opts)
    vim.keymap.set('n', '<C-f>t', ':CtrlSFToggle<CR>', opts)

    -- Set up plugins
    require("nvim-tree").setup {}
    require("hardline").setup {
        bufferline = true
    }
    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local lspconfig_on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    end
    -- # Set up individual LSP servers
    require('lspconfig').pylsp.setup {
        on_attach = lspconfig_on_attach
    }
    require('lspconfig').tsserver.setup {
        on_attach = lspconfig_on_attach
    }
    local jdtls_config = {
        -- The command that starts the language server
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        cmd = {
            'java',  '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xms1g',
            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
            '-jar', '/Users/swadnerkar/Workspace/Java/jdt-language-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
            '-configuration', '/Users/swadnerkar/Workspace/Java/jdt-language-server/config_mac',
            '-data', '/Users/swadnerkar/Workspace/Java/jdt-language-server/data'
        },
        root_dir = require('jdtls.setup').find_root({'pom.xml', 'mvnw', 'gradlew'}),
        on_attach = lspconfig_on_attach
    }
    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    require('jdtls').start_or_attach(jdtls_config)

end

load_plugins()
load_config()
