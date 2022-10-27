local gears = require("gears")
-- local awful = require("awful")
local wibox = require("wibox")
local theme = require("themes.mytheme.theme")

local M = {}


M.barwidgetopts = {
    value_module = {
        margin_top = 0,
        margin_bot = 0,
        margin_left = 0,
        margin_right = 0,
        value_widget = wibox.widget
    },
    icon_module = {
        margin_top = 0,
        margin_bot = 0,
        margin_left = 0,
        margin_right = 0,
        icon = 'i'
    },
    color = theme.red
}

M.barwidget = function(barwidgetopts)
    local result = wibox.widget {
        {
            {
                {
                    {
                        widget = barwidgetopts.value_module.value_widget,
                        align = "center",
                    },
                    top = barwidgetopts.value_module.margin_top,
                    bottom = barwidgetopts.value_module.margin_bot,
                    left = barwidgetopts.value_module.margin_left,
                    right = barwidgetopts.value_module.margin_right,
                    align = "center",
                    widget = wibox.container.margin
                },
                {
                    {
                        align = "center",
                        text = barwidgetopts.icon_module.icon,
                        widget = wibox.widget.textbox,
                    },
                    top = barwidgetopts.icon_module.margin_top,
                    bottom = barwidgetopts.icon_module.margin_bot,
                    left = barwidgetopts.icon_module.margin_left,
                    right = barwidgetopts.icon_module.margin_right,
                    widget = wibox.container.margin
                },
                layout = wibox.layout.fixed.vertical,
            },
            bg = theme.lighter,
            fg = barwidgetopts.color,
            shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 4)
            end,
            widget = wibox.container.background
        },
        top = 0, bottom = 10, left = 8, right = 8,
        widget = wibox.container.margin,
    }

    return result
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
