local cmd = vim.cmd

local M = {}
M.bg = function(group, col)
   cmd("highlight! " .. group .. " guibg=" .. col)
end

M.fg = function(group, col)
   cmd("highlight! " .. group .. " guifg=" .. col)
end

M.hi = function(group, fgcol, bgcol)
   cmd("highlight! " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

M.style = function(group, value)
   cmd("highlight! " .. group .. " gui=" .. value)
end

return M
