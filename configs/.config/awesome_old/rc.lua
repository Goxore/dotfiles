pcall(require, "luarocks.loader")
require("awful.autofocus")

local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local theme = require("themes.mytheme.theme")
local menubar = require("menubar")

RC = {} -- global namespace, on top before require any modules
RC.vars = require("main.user-variables")

require("main.error-handling")

beautiful.init("/home/yurii/.config/awesome/themes/mytheme/theme.lua")
beautiful.wallpaper = RC.vars.wallpaper

modkey = RC.vars.modkey

local main = {
  layouts = require("main.layouts"),
  tags    = require("main.tags"),
  menu    = require("main.menu"),
  rules   = require("main.rules"),
}

local binding = {
  globalbuttons = require("binding.globalbuttons"),
  clientbuttons = require("binding.clientbuttons"),
  globalkeys    = require("binding.globalkeys"),
  bindtotags    = require("binding.bindtotags"),
  clientkeys    = require("binding.clientkeys")
}

RC.layouts = main.layouts()
RC.tags = main.tags()
RC.mainmenu = awful.menu({ items = main.menu() })

RC.launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = RC.mainmenu }
)

menubar.utils.terminal = RC.vars.terminal

RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

mykeyboardlayout = awful.widget.keyboardlayout()

require("deco.statusbar")

awful.rules.rules = main.rules(
  binding.clientkeys(),
  binding.clientbuttons()
)

require("main.signals")

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

-- awful.screen.connect_for_each_screen(function(s) -- that way the wallpaper is applied to every screen
--     bling.module.tiled_wallpaper("", s, {       -- call the actual function ("x" is the string that will be tiled)
--         fg = theme.dark10, -- define the foreground color
--         bg = theme.dark15, -- define the background color
--         offset_y = 85,  -- set a y offset
--         offset_x = 85,  -- set a x offset
--         font = "Hack Nerd Font",  -- set the font (without the size)
--         font_size = 25, -- set the font size
--         padding = 100,  -- set padding (default is 100)
--         zickzack = true -- rectangular pattern or criss cross
--     })
-- end)

-- Unity repaint fix
last_focus = nil
unity_force_repaint = true
client.connect_signal('focus', function(c)
    if not c then return end -- that can happen :/
 
    -- This is needed to have Unity on one screen and some utility panels on another
    -- without constantly repainting whenever the user switches back and forth
    if not unity_force_repaint and last_focus and last_focus.valid and last_focus.tag == c.tag and awful.rules.match(last_focus, { class = "Unity" }) then
        last_focus = c
        return
    end
    last_focus = c
    unity_force_repaint = false
 
    if not awful.rules.match(c, { class = "Unity" }) then return end
    if awful.rules.match(c, { rule_any = {type = { "dialog", "popup", "popup_menu" }}}) then return end -- Ignore these types of windows
    if awful.rules.match(c, { name = "Select" }) then return end
 
    -- The workaround
    -- note: gears.timer.delayed_call doesn't not seem to work for this
   c.maximized = false
   gears.timer.start_new(1/60, function() -- 0 doesn't always work in every case
        c.maximized = true
    end)
end)
 
tag.connect_signal('property::selected', function ()
    unity_force_repaint = true
end)
