-- vim.cmd[[
--   if exists('g:started_by_firenvim')
--     set laststatus=0
--   else
--     set laststatus=3
--   endif
-- ]]

if vim.api.nvim_eval('exists("g:started_by_firenvim")') == 1 then
  vim.cmd "set laststatus=0"
else
  vim.cmd "set laststatus=3"
end
