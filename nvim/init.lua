local Plug = vim.fn['plug#']

vim.call('plug#begin')
    Plug 'tanvirtin/monokai.nvim'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdcommenter'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-surround'

    -- LSP Support
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    -- Autocompletion Engine
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'hrsh7th/cmp-nvim-lua'

    -- Snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'rafamadriz/friendly-snippets'

    Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v1.x'})

    -- Linter
    Plug 'mfussenegger/nvim-lint'

vim.call('plug#end')

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

local lsp = require('lsp-zero').preset({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
})

lsp.setup()

require('lint').linters_by_ft = {
    python = {'pylint',},
    yaml = {'yamllint',},
    shell = {'shellcheck',}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

vim.cmd.syntax("on")

vim.opt.mouse = ""

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.hidden = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.listchars = { eol = '$', tab = '->', space = '·', extends = '>', precedes = '<' }
vim.opt.list = true

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showcmd = true

vim.opt.spelllang = 'en_us'

vim.g.lightline = {
        colorscheme = 'solarized',
        active = {
            left = { 
                { 'mode', 'paste' },
                { 'readonly', 'absolutepath', 'modified' }
            },
        }
    }

vim.opt.background = dark

vim.cmd.highlight({"ColorColumn", "ctermbg=Red"})

vim.opt.laststatus = 2
vim.opt.colorcolumn = '90'

vim.cmd.colorscheme("monokai")

-- Custom mappings

vim.keymap.set(
    'v',
    '<C-c>',
    '"+y',
    {remap = false}
)

vim.keymap.set(
    'n',
    '<leader>cf',
    ':let @+=expand(\'%\')<CR>',
    {remap = false}
)

vim.keymap.set(
    'n',
    '<leader>caf',
    ':let @+=expand(\'%:p\')<CR>',
    {remap = false}
)

vim.keymap.set(
    'n',
    '<C-Up>',
    ':m -2<CR>',
    {remap = false}
)

vim.keymap.set(
    'n',
    '<C-Down>',
    ':m +1<CR>',
    {remap = false}
)

vim.keymap.set(
    'n',
    '<leader>tt',
    ':NvimTreeToggle<CR>',
    {remap = false}
)

vim.keymap.set(
    'n',
    '<leader>ct',
    ':NvimTreeCollapse<CR>',
    {remap = false}
)

vim.keymap.set(
    'n',
    '<leader>ff',
    ':NvimTreeFindFile<CR>:NvimTreeFocus<CR>',
    {remap = false}
)

vim.keymap.set(
    'n',
    '<M-Left>',
    ':b#<CR>',
    {remap = false}
)

vim.keymap.set(
    'n',
    '<leader>ww',
    ':set wrap!<CR>',
    {remap = false}
)

vim.keymap.set(
    'n',
    '<leader>sch',
    ':setlocal spell!<CR>',
    {remap = false}
)
