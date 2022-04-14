local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local naughty = require("naughty")

local theme = require("themes.xresources.theme")

local wibox = require("wibox")

local wf = require("deco.widgetfactory")

local scr_g = screen.primary.geometry

local M = {}

local noisy = [[bash -c '
-- while mpc status "%percenttime%" | rev | cut -b 2- | rev | xargs; do sleep 5; done
echo 50
']]

M.tempval = awful.widget.watch('bash -c "/home/yurii/scripts/cputemp.sh"', 5)
M.temp = wf.makewidget(M.tempval,theme.blue, "", 0,0,0,0)

M.bigpanel = wibox {
    visible = false,
    bg = theme.wibar_bg,
    ontop = true,
    -- height = 1E00,
    height = scr_g.height,
    width = 400,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 9)
    end
}

function Makecircle(insides, value, color)
  return wibox.widget
  {
    {
      insides,
      widget = wibox.container.arcchart,
      max_value = 100,
      min_value = 0,
      value = value,
      -- border_width = 5
      thickness = 10,
      rounded_edge = true,
      start_angle = 0,
      colors = {color,}
    },
    widget = wibox.container.margin,
    -- forced_height=80,
    -- forced_width=80,
    top = 15,
    bottom = 10,
    left = 25,
    right = 25
  }
end

function Makeprogress(value, color)
  return wibox.widget
  {
    {
      max_value     = 100,
      value         = value,
      -- forced_height = 20,
      forced_width  = 10,
      shape         = gears.shape.rounded_bar,
      border_width  = 0,
      color         = color,
      background_color = theme.wibar_bg,
      widget        = wibox.widget.progressbar,
    },
    widget = wibox.container.margin,
    -- forced_height=20,
    -- forced_width=80,
    top = 20,
    bottom = 20,
    left = 25,
    right = 25
  }
end


M.concat1 = wibox.widget
{
  {
    {
      Makecircle(M.tempval, 60 , theme.red),
      Makecircle(M.tempval, 80, theme.green),
      -- Makecircle(M.tempval, 80),
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
  top = 8, bottom = 8, left = 8 , right = 8,
}


local prwidget = Makeprogress(10, theme.green)

awful.spawn.with_line_callback(noisy, {
    stdout = function(line)
      if tonumber(line) ~= nil then
        prwidget.widget.value = tonumber(line)
      end
    end,
    stderr = function(line)
      if tonumber(line) ~= nil then
        prwidget.widget.value = tonumber(line)
      end
    end,
})

M.concat6 = wibox.widget
{
  {
    {
      prwidget,
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
      text = "Welcome!",
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

M.concat3 = wibox.widget
{
  {
    {
      {
        widget = wibox.widget.textbox,
        text = " 玲 ",
        align = "center",
        valigh = "center",
        font = "Hack Nerd Font 30"
      },
      {
        widget = wibox.widget.textbox,
        text = "",
        align = "center",
        valigh = "center",
        font = "Hack Nerd Font 30"
      },
      {
        widget = wibox.widget.textbox,
        text = " 怜 ",
        align = "center",
        valigh = "center",
        font = "Hack Nerd Font 30"
      },
      layout = wibox.layout.flex.vertical
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

M.concat4 = wibox.widget
{
  {
    {
      {
      widget = awful.widget.watch('bash -c "mpc | head -1"', 3),
      align = "center"
      },
      widget = wibox.container.margin,
      top = 20
    },
    bg = '#323232', -- basic
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 4)
    end,
    widget = wibox.container.background
  },
  widget = wibox.container.margin,
  top = 8, bottom = 8, left = 8 , right = 8
}

M.concat5 = wibox.widget
{
  M.concat3,
  M.concat4,
  layout = wibox.layout.ratio.horizontal
}

M.concat5:ajust_ratio(2,0.25,0.75,0)

M.megaconcat = wibox.widget
{
    M.concat2,
    M.concat5,
    M.concat6,
    M.concat1,
    forced_height = scr_g.height-16,
    layout = wibox.layout.ratio.vertical
}

M.bigpanel:setup {
    -- M.temp,{
    M.megaconcat,
    valigh = 'center',
    layout = wibox.container.place
}

-- M.megaconcat:ajust_ratio(2,0.5,0.2,0.3)
-- M.megaconcat:ajust_ratio(3,0.3,0.3,0.3)
M.megaconcat:set_ratio(1,0.4)
M.megaconcat:set_ratio(2,0.33)
M.megaconcat:set_ratio(3,0.07)
M.megaconcat:set_ratio(4,0.2)


awful.placement.left(
  M.bigpanel,
  {
    margins = {top = 0, left = 60},
    parent = awful.screen.focused()
  }
)


return M
