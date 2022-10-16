local fg = require("core").fg
local bg = require("core").bg
local hi = require("core").hi
local syscolors = require("systemcolors")
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

local b00 = '#'..syscolors.base00
local b01 = '#'..syscolors.base01
local b02 = '#'..syscolors.base02
local b03 = '#'..syscolors.base03
local b04 = '#'..syscolors.base04
local b05 = '#'..syscolors.base05
local b06 = '#'..syscolors.base06
local b07 = '#'..syscolors.base07
local b08 = '#'..syscolors.base08
local b09 = '#'..syscolors.base09
local b0A = '#'..syscolors.base0A
local b0B = '#'..syscolors.base0B
local b0C = '#'..syscolors.base0C
local b0D = '#'..syscolors.base0D
local b0E = '#'..syscolors.base0E
local b0F = '#'..syscolors.base0F
local trs = "transparent"

hi("Normal",        b05, b00)
hi("Bold",          trs, trs)
hi("Debug",         b08, trs)
hi("Directory",     b0D, trs)
hi("Error",         b00, b08)
hi("ErrorMsg",      b08, b00)
hi("Exception",     b08, trs)
hi("FoldColumn",    b0C, b01)
hi("Folded",        b03, b01)
hi("IncSearch",     b01, b09)
hi("Italic",        trs, trs)
hi("Macro",         b08, trs)
hi("MatchParen",    trs, b03)
hi("ModeMsg",       b0B, trs)
hi("MoreMsg",       b0B, trs)
hi("Question",      b0D, trs)
hi("Search",        b01, b0A)
hi("Substitute",    b01, b0A)
hi("SpecialKey",    b03, trs)
hi("TooLong",       b08, trs)
hi("Underlined",    b08, trs)
hi("Visual",        trs, b02)
hi("VisualNOS",     b08, trs)
hi("WarningMsg",    b08, trs)
hi("WildMenu",      b08, b0A)
hi("Title",         b0D, trs)
hi("Conceal",       b0D, b00)
hi("Cursor",        b00, b05)
hi("NonText",       b03, trs)
hi("LineNr",        b03, b00)
hi("SignColumn",    b03, b00)
hi("StatusLine",    b04, b02)
hi("StatusLineNC",  b03, b01)
hi("VertSplit",     b02, b02)
hi("ColorColumn",   trs, b01)
hi("CursorColumn",  trs, b01)
hi("CursorLine",    trs, b01)
hi("CursorLineNr",  b04, b01)
hi("QuickFixLine",  trs, b01)
hi("PMenu",         b05, b01)
hi("PMenuSel",      b01, b05)
hi("TabLine",       b03, b01)
hi("TabLineFill",   b03, b01)
hi("TabLineSel",    b0B, b01)

hi("Boolean",       b0E, trs)
hi("Character",     b0E, trs)
hi("Comment",       b03, trs)
hi("Conditional",   b08, trs)
hi("Constant",      b0E, trs)
hi("Define",        b0C, trs)
hi("Delimiter",     b09, trs)
hi("Float",         b0E, trs)
hi("Function",      b0B, trs)
hi("Identifier",    b0C, trs)
hi("Include",       b0C, trs)
hi("Keyword",       b08, trs)
hi("Label",         b08, trs)
hi("Number",        b0E, trs)
hi("Operator",      b0C, trs)
hi("PreProc",       b0C, trs)
hi("Repeat",        b08, trs)
hi("Special",       b09, trs)
hi("SpecialChar",   b08, trs)
hi("Statement",     b08, trs)
hi("StorageClass",  b09, trs)
hi("String",        b0B, trs)
hi("Structure",     b0C, trs)
hi("Tag",           b09, trs)
hi("Todo",          b0A, b01)
hi("Type",          b0A, trs)
hi("Typedef",       b0A, trs)

hi("DiffAdd",       b0B, b01)
hi("DiffChange",    b03, b01)
hi("DiffDelete",    b08, b01)
hi("DiffText",      b0D, b01)
hi("DiffAdded",     b0B, b00)
hi("DiffFile",      b08, b00)
hi("DiffNewFile",   b0B, b00)
hi("DiffLine",      b0D, b00)
hi("DiffRemoved",   b08, b00)
