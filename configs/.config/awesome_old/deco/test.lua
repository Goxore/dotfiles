local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local M = {}

local buttons_example = wibox {
    visible = true,
    bg = '#2E3440',
    ontop = true,
    -- height = 1E00,
    height = 250,
    width = 50,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 9)
    end
}

local button = wibox.widget{
    {
        {
            text = "I'm a button!",
            widget = wibox.widget.textbox
        },
        top = 4, bottom = 4, left = 8, right = 8,
        widget = wibox.container.margin
    },
    bg = '#4C566A', -- basic
    shape_border_width = 1, shape_border_color = '#4C566A', -- outline
    shape = function(cr, width, height) 
        gears.shape.rounded_rect(cr, width, height, 4) 
    end,
    widget = wibox.container.background
}


local gettemp = awful.widget.watch('bash -c "/home/yurii/scripts/cputemp.sh"', 5)

function makegoodwidget(value, icon)
  local returned = {}
  
  returned.widget = wibox.widget{
    {
      {
        {
          widget = value,
          align = "center",
        },
        top = 10, bottom = -10, left = 8, right = 8,
        widget = wibox.container.margin
      },
      {
        {
          align = "center",
          text = icon,
          widget = wibox.widget.textbox
        },
        top = 0, bottom = 10, left = 8, right = 8,
        widget = wibox.container.margin
      },
      layout = wibox.layout.fixed.vertical,
    },
    bg = '#4C566A', -- basic
    fg = '#00FF00',
    shape_border_width = 1, shape_border_color = '#4C566A', -- outline
    shape = function(cr, width, height) 
        gears.shape.rounded_rect(cr, width, height, 4) 
    end,
    widget = wibox.container.background
  }
  
  return returned.widget
end

local temperaturewidget = wibox.widget{
    {
      {
        {
          widget = gettemp,
          align = "center",
        },
        top = 10, bottom = -10, left = 8, right = 8,
        widget = wibox.container.margin
      },
      {
        {
          align = "center",
          text = "",
          widget = wibox.widget.textbox
        },
        top = 0, bottom = 10, left = 8, right = 8,
        widget = wibox.container.margin
      },
      layout = wibox.layout.fixed.vertical,
    },
    bg = '#4C566A', -- basic
    fg = '#00FF00',
    shape_border_width = 1, shape_border_color = '#4C566A', -- outline
    shape = function(cr, width, height) 
        gears.shape.rounded_rect(cr, width, height, 4) 
    end,
    widget = wibox.container.background
}

local concat = wibox.widget
{
  makegoodwidget(gettemp,""),
	layout = wibox.layout.fixed.vertical
}

button:connect_signal("mouse::enter", function(c) c:set_bg("#00000066") end)
button:connect_signal("mouse::leave", function(c) c:set_bg('#4C566A') end)
-- button:connect_signal("button::press", function(c) c:set_bg("#000000") end)
button:connect_signal("button::release", function(c) c:set_bg('#00000066') end)

button:connect_signal("button::press", function(c) c.widget.widget:set_text("hi") end)


-- local test2 = wibox.container.arcchart(
--   temperature, 
--   {
--     value = 50,
--     border_color = "#FF0000",
--     bg = "#FF0000",
--     min_value = 1,
--     max_value = 100
--   })


buttons_example:setup {
    -- temperaturewidget,
    -- makegoodwidget(gettemp,""),
    concat,
    valigh = 'center',
    layout = wibox.container.place
}

-- awful.placement.top(buttons_example, { margins = {top = 40 }, parent = awful.screen.focused()})
awful.placement.left(
  buttons_example,
  { 
    margins = {top = 0, right = 0},
    parent = awful.screen.focused()
  }
)

return makegoodwidget
