local cmd = vim.cmd

local fg = require("core").fg
local bg = require("core").bg
local hi = require("core").hi
local style = require("core").style

local M = {}

local function darker(color_value, darker_n)
    local result = "#"
    for s in color_value:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
        local bg_numeric_value = tonumber("0x"..s) - darker_n
        if bg_numeric_value < 0 then bg_numeric_value = 0 end
        if bg_numeric_value > 255 then bg_numeric_value = 255 end
        result = result .. string.format("%2.2x", bg_numeric_value)
    end
    return result
end

-- local colors = require("hl_themes.gruvbox8").get()

local bgcolor="#282828"
local fgcolor="#ebdbb2"
local red    ="#fb4934"
local blue   ="#83a598"
local green  ="#b8bb26"
local yellow ="#fadb2f"
local pink   ="#d3869b"
local orange ="#fe8019"


-- if not vim.s.gui00 then
--    print()
-- end

if vim.api.nvim_eval('exists("g:base16_gui00")') == 1 then
  bgcolor= "#"..vim.g.base16_gui00
  fgcolor= "#"..vim.g.base16_gui07
  red    = "#"..vim.g.base16_gui08
  blue   = "#"..vim.g.base16_gui0D
  green  = "#"..vim.g.base16_gui0B
  yellow = "#"..vim.g.base16_gui0A
  pink   = "#"..vim.g.base16_gui0E
  orange = "#"..vim.g.base16_gui09
else
  vim.cmd[[
    colorscheme gruvbox8
  ]]
end

vim.cmd [[
set laststatus=3
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
" set fillchars=fold:\ ,vert:\▎,eob:\ ,msgsep:‾
" set fillchars=fold:\ ,vert:\ ,eob:\ ,msgsep:\ 

]]

vim.api.nvim_create_user_command(
    'Sb16',
    function(opts)
      vim.cmd [[
        source ~/.config/nvim/vim_colors/default.vim
        source ~/.config/nvim/lua/colors.lua
      ]]
    end,
    { nargs = 0 }
)

fg("CmpItemAbbrMatch", blue)
fg("CmpItemAbbrMatchFuzzy", pink)

fg("CmpItemKindVariable", green)
fg("CmpItemKindInterface", yellow)
fg("CmpItemKindText", blue)

fg("CmpItemKindFunction", red)
fg("CmpItemKindMethod", yellow)

fg("CmpItemKindKeyword", orange)
fg("CmpItemKindProperty", pink)
fg("CmpItemKindUnit", pink)


bg("SignColumn", "transparent")
bg("WinSeparator", "transparent")

fg("WinSeparator", darker(bgcolor, -10))

-- nvimTree
bg("NvimTreeNormal", darker(bgcolor, -5))
bg("NvimTreeWinSeparator", darker(bgcolor, -5))
fg("NvimTreeWinSeparator", darker(bgcolor, -5))

fg("AlphaHeader", yellow)
fg("AlphaButtons", green)
fg("AlphaButtonsShortcut", bgcolor)
bg("AlphaButtonsShortcut", blue)

bg("BufferLineFill", darker(bgcolor, 20))

fg("Search", fgcolor)
bg("Search", darker(bgcolor, -20))

fg("DiagnosticWarn", darker(orange, 5))
fg("DiagnosticHint", darker(fgcolor, -5))
fg("DiagnosticError", darker(red, -5))
fg("DiagnosticInfo", darker(blue, -5))

hi('GitSignsAdd   ', green, bgcolor)
hi('GitSignsChange', blue, bgcolor)
hi('GitSignsDelete', red, bgcolor)

style("String", "italic")
style("Comment", "italic")
style("Function", "bold")

require("lsp-colors").setup({
  Error = red,
  Warning = yellow,
  Information = darker(fgcolor, 5),
  Hint = fgcolor
})

M.bgcolor = bgcolor
M.fgcolor = fgcolor
M.red     = red
M.blue    = blue
M.green   = green
M.yellow  = yellow
M.pink    = pink
M.orange  = orange
M.darker  = darker

return M
