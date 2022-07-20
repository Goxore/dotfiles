--vim.cmd "source ~/.config/nvim/vim_colors/default.vim"
-- init.lua
-- requirements
vim.cmd "source ~/.config/nvim/vim_colors/default.vim"
require('packinit')
require('impatient')
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
require('other')
-- require('lspsagaconf')

require('Comment').setup()
-- vim.cmd "set laststatus=3"

-- There was firenvim
-- if vim.api.nvim_eval('exists("g:started_by_firenvim")') == 1 then
--   vim.cmd [[set laststatus=0
--   let g:timer_started = v:false
--   function! My_Write(timer) abort
--     let g:timer_started = v:false
--     write
--   endfunction
--
--   function! Delay_My_Write() abort
--     if g:timer_started
--       return
--     end
--     let g:timer_started = v:true
--     call timer_start(1000, 'My_Write')
--   endfunction
--
--   au TextChanged * ++nested call Delay_My_Write()
--   au TextChangedI * ++nested call Delay_My_Write()
--   ]]
-- else
  -- vim.cmd "set laststatus=3"
-- end
