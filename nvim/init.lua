-- Load packer.nvim
local lspconfig = require('lspconfig')
local packer = require('packer')
local builtin = require('telescope.builtin')
require'nvim-tree'.setup{}
-- Java LSP settings
require('lspconfig').jdtls.setup{
  cmd = {'jdtls'},
  root_dir = require('lspconfig/util').root_pattern(".git", "pom.xml"),
}
lspconfig.pylsp.setup{}
lspconfig.tsserver.setup{}

-- Enable auto-completion and set the source options
local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
	{ name = 'luasnip' },
  },
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
})

-- Define the plugins you want to install
packer.startup(function()
    -- Example plugin
	use 'tjdevries/colorbuddy.nvim'
    use 'svrana/neosolarized.nvim'
	use 'shaunsingh/nord.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'maxmx03/solarized.nvim'
	use 'morhetz/gruvbox'
	use 'neovim/nvim-lspconfig' 
	use 'ThePrimeagen/vim-be-good'
	-- Completion plugin
	use {
	  'hrsh7th/nvim-cmp',
	  requires = {
	    'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
	    'hrsh7th/cmp-nvim-lua',
	  }
	}
	use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
}
--	use { 'kabouzeid/nvim-lspinstall', requires = 'neovim/nvim-lspconfig' }
    use { 'mfussenegger/nvim-dap' }
	use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
}
	use {
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons'
}
    use 'nvim-lua/plenary.nvim'
end)

packer.install()

--General Vim stuff
vim.opt.termguicolors = true
vim.api.nvim_command('set nowrap')
vim.o.tabstop = 4
vim.o.shiftwidth = 4
--vim.cmd('set cursorline')
--
---- Set the color scheme
---- Enable line numbers
-- Set relative numbers
vim.cmd('set rnu')

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Enable the theme
--vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.cmd('hi Normal guibg=none')

-- Move between splits using CTRL-l and CTRL-h
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})

-- End of General Vim Stuff

-- Telescope stuff
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--vim.keymap.set('n', '<leader>fj', lua vim.diagnostic.open_float(), {})

-- Nvim Tree 
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

---- Goto definitions, types, implementations, references
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fj', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

--   equivilant for lsp server of the above command
vim.api.nvim_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})

---- note to select a word form the dropdown menu you can use arrows and then use ctrl + y as for yes 
require("mason").setup()
-- Set yanking to copy to clipboard
vim.cmd('set clipboard+=unnamedplus')
-- Restore cursor to vertical cursor after exiting vim
vim.cmd('au VimLeave * set guicursor=a:ver100')
