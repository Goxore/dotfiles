local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

local theme = require("themes.xresources.theme")

local wibox = require("wibox")

local wf = require("deco.widgetfactory")

local M = {}

M.tempval = awful.widget.watch('bash -c "/home/yurii/scripts/cputemp.sh"', 5)
M.temp = wf.makewidget(M.tempval,theme.blue, "", 0,0,0,0)

M.bigpanel = wibox {
    visible = false,
    bg = theme.wibar_bg,
    ontop = true,
    -- height = 1E00,
    height = 400,
    width = 400,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 9)
    end
}

function makecircle(insides, value)
  return wibox.widget
  {
    {
      insides,
      widget = wibox.container.arcchart,
      max_value = 100,
      min_value = 0,
      value = value,
    },
    widget = wibox.container.margin,
    -- forced_height=80,
    -- forced_width=80,
    top = 15,
    bottom = 10,
    left = 15,
    right = 15
  }
end

M.concat1 = wibox.widget
{
  {
    {
      makecircle(M.tempval, 90),
      makecircle(M.tempval, 80),
      makecircle(M.tempval, 80),
      layout = wibox.layout.flex.horizontal
    },
    bg = '#323232', -- basic
    -- shape_border_width = 1, shape_border_color = '#4C566A', -- outline
    shape = function(cr, width, height) 
        gears.shape.rounded_rect(cr, width, height, 4) 
    end,
    widget = wibox.container.background
  },
  widget = wibox.container.margin,
  top = 8, bottom = 8, left = 8 , right = 8
}

M.concat2 = wibox.widget
{
  {
    {
      widget = wibox.widget.textbox,
      text = "Welcome",
      align = "center",
      valigh = "center",
      font = "Hack Nerd Font 40"
    },
    bg = theme.wibar_bg, -- basic
    -- shape_border_width = 1, shape_border_color = '#4C566A', -- outline
    shape = function(cr, width, height) 
        gears.shape.rounded_rect(cr, width, height, 4) 
    end,
    widget = wibox.container.background
  },
  widget = wibox.container.margin,
  top = 8, bottom = 8, left = 8 , right = 8
}

M.bigpanel:setup {
    -- M.temp,
    M.concat2,
    M.concat1,
    valigh = 'center',
    -- layout = wibox.container.place
	layout = wibox.layout.flex.vertical,
}


awful.placement.left(
  M.bigpanel,
  {
    margins = {top = 0, right = 0},
    parent = awful.screen.focused()
  }
)

return M
