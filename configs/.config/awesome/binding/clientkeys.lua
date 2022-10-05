-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")
local theme = require("themes.mytheme.theme")
-- Custom Local Library
-- local titlebar = require("anybox.titlebar")

local _M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
      function (c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
      {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey   }, "q",      function (c) c:kill()  awful.client.focus.byidx(1)     end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Shift" }, "f",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),

    -- Arrows 
    awful.key({ modkey, "Control" }, "Up", function (c)
      if c.floating then
        c:relative_move( 0, 0, 0, -10)
      else
        awful.client.incwfact(0.015)
      end
    end,
    {description = "Floating Resize Vertical -", group = "client"}),

    awful.key({ modkey, "Control" }, "Down", function (c)
      if c.floating then
        c:relative_move( 0, 0, 0,  10)
      else
        awful.client.incwfact(-0.015)
      end
    end,
    {description = "Floating Resize Vertical +", group = "client"}),

    awful.key({ modkey, "Control" }, "Left", function (c)
      if c.floating then
        c:relative_move( 0, 0, -10, 0)
      else
        awful.tag.incmwfact(-0.015)
      end
    end,
    {description = "Floating Resize Horizontal -", group = "client"}),

    awful.key({ modkey, "Control" }, "Right", function (c)
      if c.floating then
        c:relative_move( 0, 0,  10, 0)
      else
        awful.tag.incmwfact(0.015)
      end
    end,
    {description = "Floating Resize Horizontal +", group = "client"}),


    awful.key({ modkey, "Shift" }, "Up", function (c)
      if c.floating then
        c:relative_move( 0, -15, 0, 0)
      else
        awful.client.swap.bydirection("up")
      end
    end,
    {description = "floating move vertical -", group = "client"}),

    awful.key({ modkey, "Shift" }, "Down", function (c)
      if c.floating then
        c:relative_move( 0, 15, 0,  0)
      else
        awful.client.swap.bydirection("down")
      end
    end,
    {description = "floating move vertical +", group = "client"}),

    awful.key({ modkey, "Shift" }, "Left", function (c)
      if c.floating then
        c:relative_move( -15, 0, 0, 0)
      else
        awful.client.swap.bydirection("left")
      end
    end,
    {description = "floating move horizontal -", group = "client"}),

    awful.key({ modkey, "Shift" }, "Right", function (c)
      if c.floating then
        c:relative_move( 15, 0, 0, 0)
      else
        awful.client.swap.bydirection("right")
      end
    end,
    {description = "floating move horizontal +", group = "client"}),

    -- hjkl

    awful.key({ modkey, "Control" }, "k", function (c)
      if c.floating then
        c:relative_move( 0, 0, 0, -10)
      else
        awful.client.incwfact(0.015)
      end
    end,
    {description = "Floating Resize Vertical -", group = "client"}),

    awful.key({ modkey, "Control" }, "j", function (c)
      if c.floating then
        c:relative_move( 0, 0, 0,  10)
      else
        awful.client.incwfact(-0.015)
      end
    end,
    {description = "Floating Resize Vertical +", group = "client"}),

    awful.key({ modkey, "Control" }, "h", function (c)
      if c.floating then
        c:relative_move( 0, 0, -10, 0)
      else
        awful.tag.incmwfact(-0.015)
      end
    end,
    {description = "Floating Resize Horizontal -", group = "client"}),

    awful.key({ modkey, "Control" }, "l", function (c)
      if c.floating then
        c:relative_move( 0, 0,  10, 0)
      else
        awful.tag.incmwfact(0.015)
      end
    end,
    {description = "Floating Resize Horizontal +", group = "client"}),


    awful.key({ modkey, "Shift" }, "k", function (c)
      if c.floating then
        c:relative_move( 0, -15, 0, 0)
      else
        awful.client.swap.bydirection("up")
      end
    end,
    {description = "floating move vertical -", group = "client"}),

    awful.key({ modkey, "Shift" }, "j", function (c)
      if c.floating then
        c:relative_move( 0, 15, 0,  0)
      else
        awful.client.swap.bydirection("down")
      end
    end,
    {description = "floating move vertical +", group = "client"}),

    awful.key({ modkey, "Shift" }, "h", function (c)
      if c.floating then
        c:relative_move( -15, 0, 0, 0)
      else
        awful.client.swap.bydirection("left")
      end
    end,
    {description = "floating move horizontal -", group = "client"}),

    awful.key({ modkey, "Shift" }, "l", function (c)
      if c.floating then
        c:relative_move( 15, 0, 0, 0)
      else
        awful.client.swap.bydirection("right")
      end
    end,
    {description = "floating move horizontal +", group = "client"}),


    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey, "Control"   }, "t",      function (c) c.ontop  = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey, "Control"   }, "g",      function (c) c.maximized  = not c.maximized            end,
              {description = "toggle maximized", group = "client"}),
    awful.key({ modkey, "Control"   }, "s",      function (c)
        c.sticky = not c.sticky
        if c.sticky then
            c.border_color = theme.border_focus_sticky
        else
            c.border_color = theme.border_focus
        end
    end,
              {description = "toggle sticky", group = "client"})


    -- awful.key({ modkey,           }, "n",     function (c) c.minimized = true end ,
    --           {description = "minimize", group = "client"})

    -- awful.key({ modkey,           }, "m",
    --   function (c)
    --     c.maximized = not c.maximized
    --     c:raise()
    --   end ,
    --   {description = "(un)maximize", group = "client"}),
    -- awful.key({ modkey, "Control" }, "m",
    --   function (c)
    --     c.maximized_vertical = not c.maximized_vertical
    --     c:raise()
    --   end ,
    --   {description = "(un)maximize vertically", group = "client"}),
    -- awful.key({ modkey, "Shift"   }, "m",
    --   function (c)
    --     c.maximized_horizontal = not c.maximized_horizontal
    --     c:raise()
    --   end ,
    --   {description = "(un)maximize horizontally", group = "client"})
  )

  return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
