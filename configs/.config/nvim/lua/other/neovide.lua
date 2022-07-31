local g = vim.g
local map = vim.api.nvim_set_keymap
local o = vim.opt

if vim.api.nvim_eval('exists("g:neovide")') == 1 then
g.neovide_refresh_rate=144
g.neovide_scroll_animation_length = 0.3
end
