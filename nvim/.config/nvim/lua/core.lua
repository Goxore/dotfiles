local cmd = vim.cmd

local M = {}
M.bg = function(group, col)
   cmd("highlight! " .. group .. " guibg=" .. col)
end

M.fg = function(group, col)
   cmd("highlight! " .. group .. " guifg=" .. col)
end

return M
