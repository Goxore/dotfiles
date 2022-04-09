local bling = require("bling")
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

require("awful.autofocus")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- Miscellanous awesome library
local menubar = require("menubar")

RC = {} -- global namespace, on top before require any modules
RC.vars = require("main.user-variables")

-- {{{ Error handling -- }}}
require("main.error-handling")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init("/home/yurii/.config/awesome/themes/xresources/theme.lua")
-- beautiful.init(RC.home .. ".config/awesome/themes/xresources/theme.lua")
-- beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/xresources/theme")
beautiful.wallpaper = RC.vars.wallpaper
-- }}}

modkey = RC.vars.modkey

-- Custom Local Library
local main = {
  layouts = require("main.layouts"),
  tags    = require("main.tags"),
  menu    = require("main.menu"),
  rules   = require("main.rules"),
}

-- Custom Local Library: Keys and Mouse Binding
local binding = {
  globalbuttons = require("binding.globalbuttons"),
  clientbuttons = require("binding.clientbuttons"),
  globalkeys    = require("binding.globalkeys"),
  bindtotags    = require("binding.bindtotags"),
  clientkeys    = require("binding.clientkeys")
}

-- {{{ Layouts
-- Table of layouts to cover with awful.layout.inc, order matters.
-- a variable needed in main.tags, and statusbar
-- awful.layout.layouts = { ... }
RC.layouts = main.layouts()
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
-- a variable needed in rules, tasklist, and globalkeys
RC.tags = main.tags()
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
RC.mainmenu = awful.menu({ items = main.menu() }) -- in globalkeys

-- a variable needed in statusbar (helper)
RC.launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = RC.mainmenu }
)

-- Menubar configuration
-- Set the terminal for applications that require it
menubar.utils.terminal = RC.vars.terminal

-- }}}

-- {{{ Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Statusbar: Wibar
require("deco.statusbar")
-- }}}
-- require("deco.test")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = main.rules(
  binding.clientkeys(),
  binding.clientbuttons()
)
-- }}}

-- {{{ Signals
require("main.signals")
-- }}}

-- awful.screen.connect_for_each_screen(function(s) -- that way the wallpaper is applied to every screen
--     bling.module.tiled_wallpaper("x", s, {       -- call the actual function ("x" is the string that will be tiled)
--         fg = "#ff0000", -- define the foreground color
--         bg = "#00ffff", -- define the background color
--         offset_y = 25,  -- set a y offset
--         offset_x = 25,  -- set a x offset
--         font = "Hack",  -- set the font (without the size)
--         font_size = 14, -- set the font size
--         padding = 100,  -- set padding (default is 100)
--         zickzack = true -- rectangular pattern or criss cross
--     })
-- end)

awful.screen.connect_for_each_screen(function(s) -- that way the wallpaper is applied to every screen
    bling.module.tiled_wallpaper("", s, {       -- call the actual function ("x" is the string that will be tiled)
        fg = "#323232", -- define the foreground color
        bg = "#282828", -- define the background color
        offset_y = 85,  -- set a y offset
        offset_x = 85,  -- set a x offset
        font = "Hack Nerd Font",  -- set the font (without the size)
        font_size = 25, -- set the font size
        padding = 100,  -- set padding (default is 100)
        zickzack = true -- rectangular pattern or criss cross
    })
end)
