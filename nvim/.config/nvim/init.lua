--vim.cmd "source ~/.config/nvim/vim_colors/default.vim"
-- init.lua
-- requirements
vim.cmd "source ~/.config/nvim/vim_colors/default.vim"
-- require('plugins')
require('impatient')
require('packinit')
require('nvim-treeconf')
require('lspconf')
require('settings')
require('keymaps')
require('toggletermconf')
require('lualineconf')
require('bufferlineconf')
require('luasnipconf')
require('cmpconf')
require('alphaconf')
require('colors')
require('treesitterconf')
require('latex')
-- require('lspsagaconf')

require('Comment').setup()
vim.cmd "set laststatus=3"
