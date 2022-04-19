local cmd = vim.cmd

local fg = require("core").fg
local bg = require("core").bg

-- local colors = require("hl_themes.gruvbox8").get()

local bgcolor="#282828"
local fgcolor="#ebdbb2"
local red    ="#fb4934"
local blue   ="#83a598"
local green  ="#b8bb26"
local yellow ="#fadb2f"
local pink   ="#d3869b"
local orange ="#fe8019"

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


bg("NvimTreeNormal", "#222222")
bg("SignColumn", "transparent")

fg("AlphaHeader", yellow)
fg("AlphaButtons", green)
fg("AlphaButtonsShortcut", bgcolor)
bg("AlphaButtonsShortcut", blue)

fg("Search", "#454545")
bg("Search", "#ebdbb2")
