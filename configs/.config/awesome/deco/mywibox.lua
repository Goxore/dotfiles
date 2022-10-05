-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Wibox handling library
local wibox = require("wibox")

-- Custom Local Library: Common Functional Decoration
local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()


local _M = {}

awful.screen.connect_for_each_screen(function(s)

  s.temperature = wibox.widget {
    -- widget = awful.widget.watch('sensors | grep Package | awk "{print $4}"', 5),
    widget = awful.widget.watch('bash -c "/home/yurii/scripts/os/cputemp.sh"', 5),
    valign = "center",
    halign = "center"
  }

  s.test = wibox.container.arcchart(s.temperature, {
    min_value = 1,
    max_value = 100,
    value = 50,

  })



end)
