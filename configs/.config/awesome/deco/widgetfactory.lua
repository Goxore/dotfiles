local gears = require("gears")
-- local awful = require("awful")
local wibox = require("wibox")
local theme = require("themes.mytheme.theme")

local M = {}

M.nicewidget = {
    value = '00',
    icon = 'n',
    color = theme.green,
    icon_top = 0,
    icon_bottom = 0,
    icon_left = 0,
    icon_right = 0,
    val_top = 0,
    val_bottom = 0,
    val_right = 0,
}

function M.nicewidget:createWidget()

  local widget = wibox.widget{
    {
      {
        {
          {
            widget = self.value,
            align = "center",
          },
          top    = self.val_top,
          bottom = self.val_bottom,
          left   = self.val_left,
          right  = self.val_right,
          align = "center",
          widget = wibox.container.margin
        },
        {
          {
            align = "center",
            text = self.icon,
            widget = wibox.widget.textbox,
            -- font = "Hack Nerd Font 25"
          },
          top    = self.icon_top,
          bottom = self.icon_bottom,
          left   = self.icon_left,
          right  = self.icon_right,
          widget = wibox.container.margin
        },
        layout = wibox.layout.fixed.vertical,
      },
      bg = theme.lighter, -- basic
      fg = self.color,
      -- shape_border_width = 1, shape_border_color = '#4C566A', -- outline
      shape = function(cr, width, height)
          gears.shape.rounded_rect(cr, width, height, 4)
      end,
      widget = wibox.container.background
    },
    top = 0, bottom = 10, left = 8, right = 8,
    widget = wibox.container.margin,
  }

  return widget
end


M.makewidget = function (value, fgcolor , icon, textleftmargin, textrightmargin, iconleftmargin, textbotmargin)
  local returned = {}

  returned.widget = wibox.widget{
    {
      {
        {
          {
            widget = value,
            align = "center",
          },
          top = 10,
          bottom = textbotmargin,
          left = textleftmargin,
          right = textrightmargin,
          align = "center",
          widget = wibox.container.margin
        },
        {
          {
            align = "center",
            text = icon,
            widget = wibox.widget.textbox,
            -- font = "Hack Nerd Font 25"
          },
          top = 0, bottom = 10, left = iconleftmargin, right = 0,
          widget = wibox.container.margin
        },
        layout = wibox.layout.fixed.vertical,
      },
      bg = theme.lighter, -- basic
      fg = fgcolor,
      -- shape_border_width = 1, shape_border_color = '#4C566A', -- outline
      shape = function(cr, width, height) 
          gears.shape.rounded_rect(cr, width, height, 4) 
      end,
      widget = wibox.container.background
    },
    top = 0, bottom = 10, left = 8, right = 8,
    widget = wibox.container.margin,
  }

  return returned.widget
end

M.makewidget2 = function (value, value2,fgcolor, icon, textleftmargin,textrightmargin,iconleftmargin, textbotmargin)
  local returned = {}

  returned.widget = wibox.widget{
    {
      {
        {
          {
            widget = value,
            align = "center",
          },
          top = 10,
          bottom = textbotmargin,
          left = textleftmargin,
          right = textrightmargin,
          align = "center",
          widget = wibox.container.margin
        },
        {
          {
            widget = value2,
            align = "center",
          },
          top = -10,
          bottom = textbotmargin,
          left = textleftmargin,
          right = 0,
          align = "center",
          widget = wibox.container.margin
        },
        {
          {
            align = "center",
            text = icon,
            widget = wibox.widget.textbox
          },
          top = 0, bottom = 10, left = iconleftmargin, right = 0,
          widget = wibox.container.margin
        },
        layout = wibox.layout.fixed.vertical,
      },
      bg = theme.lighter, -- basic
      fg = fgcolor,
      -- shape_border_width = 1, shape_border_color = '#4C566A', -- outline
      shape = function(cr, width, height)
          gears.shape.rounded_rect(cr, width, height, 4)
      end,
      widget = wibox.container.background
    },
    top = 0, bottom = 10, left = 8, right = 8,
    widget = wibox.container.margin,
  }

  return returned.widget
end


M.makewidgetdouble = function (value, value2, fgcolor, textleftmargin,textrightmargin,iconleftmargin, textbotmargin)
  local returned = {}

  returned.widget = wibox.widget{
    {
      {
        {
          {
            widget = value,
            align = "center",
          },
          top = 10,
          bottom = textbotmargin,
          left = textleftmargin,
          right = textrightmargin,
          align = "center",
          widget = wibox.container.margin
        },
        {
          {
            widget = value2,
            align = "center",
          },
          top = -10,
          bottom = textbotmargin,
          left = textleftmargin,
          right = 0,
          align = "center",
          widget = wibox.container.margin
        },
        layout = wibox.layout.fixed.vertical,
      },
      bg = theme.lighter, -- basic
      fg = fgcolor,
      -- shape_border_width = 1, shape_border_color = '#4C566A', -- outline
      shape = function(cr, width, height)
          gears.shape.rounded_rect(cr, width, height, 4)
      end,
      widget = wibox.container.background
    },
    top = 0, bottom = 10, left = 8, right = 8,
    widget = wibox.container.margin,
  }

  return returned.widget
end

return M
