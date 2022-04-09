-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local theme = require("themes.xresources.theme")

-- Wibox handling library
local wibox = require("wibox")

local tray2 = require("deco.tray")

local wf = require("deco.widgetfactory")

local bp = require("deco.bigpanel")

-- Custom Local Library: Common Functional Decoration
local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()


local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  ))

  s.micval = awful.widget.watch('bash -c "/home/yurii/scripts/micscript.sh"')
  s.mic = wf.makewidget(s.micval,theme.red, "",0,0, 0, -15)

  s.batval = awful.widget.watch('bash -c "/home/yurii/scripts/battery.sh"', 15)
  s.bat = wf.makewidget(s.batval,theme.green, "",0,0, 0, -15)
  

  s.keybval = awful.widget.keyboardlayout
  s.keylay = wf.makewidget(s.keybval,theme.magenta, "",-5,-10, -9, 15)

  s.tempval = awful.widget.watch('bash -c "/home/yurii/scripts/cputemp.sh"', 5)
  s.temp = wf.makewidget(s.tempval,theme.blue, "", 0,0,0, -15)

  s.hours = awful.widget.watch('bash -c "date +%H"', 15)
  s.minutes = awful.widget.watch('bash -c "date +%M"', 15)
  

  s.clock = wf.makewidget2(s.hours, s.minutes,theme.yellow, "",0,0 ,-5 , -15)

  s.clock:connect_signal("button::press", function() bp.bigpanel.visible = not bp.bigpanel.visible end)
  -- s.battery = wibox.widget {
  --   -- widget = awful.widget.watch('sensors | grep Package | awk "{print $4}"', 5),
  --   widget = awful.widget.watch('bash -c "/home/yurii/scripts/battery.sh"', 15),
  --   valign = "center",
  --   halign = "center",
  -- }


  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
    layout = {spacing = 0, layout = wibox.layout.fixed.vertical},
    margins = 5,
    style   = {
        shape = gears.shape.rectangle
    },
    valign = "center",
    halign = "center"
  }
  
  s.taglistcontainer = wibox.widget{
    s.mytaglist,
    top = 10,
    bottom = 10,
    left = 11,
    right = 9,
    align = "center",
    widget = wibox.container.margin
  }

  s.layoutboxcontainer = wibox.widget{
    s.mylayoutbox,
    top = 10,
    bottom = 10,
    left = 14,
    right = 14,
    align = "center",
    widget = wibox.container.margin
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "left", screen = s, width = 60, valign = "center"})
  -- local buttons_example = wibox {
  --     visible = true,
  --     bg = '#2E3440',
  --     ontop = true,
  --     height = 250,
  --     width = 50,
  --     shape = function(cr, width, height)
  --         gears.shape.rounded_rect(cr, width, height, 9)
  --     end
  -- }

  -- buttons_example:setup {
  --     -- temperaturewidget,
  --     -- makegoodwidget(gettemp,""),
  --     concat,
  --     valigh = 'center',
  --     layout = wibox.container.place
  -- }

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.vertical,
    { -- Left widgets
      layout = wibox.layout.fixed.vertical,
      -- RC.launcher,
      s.taglistcontainer,
      s.mypromptbox,
    },
    -- s.mytasklist, -- Middle widget
    nil,
    { -- Right widgets
      layout = wibox.layout.fixed.vertical,
      s.mic,
      s.bat,
      s.keylay,
      s.temp,
      -- mytextclock,
      s.clock,
      tray2.widget,
      s.layoutboxcontainer,
    },
  }

end)
-- }}}
