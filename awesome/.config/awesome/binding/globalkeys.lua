-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require("awful.hotkeys_popup")
-- Menubar library
local menubar = require("menubar")

local bling = require("bling")
-- Resource Configuration
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal

local bp = require("deco.bigpanel")

local _M = {}

-- reading
-- https://awesomewm.org/wiki/Global_Keybindings


local calculator_scratchpad = bling.module.scratchpad {
    command = "alacritty -e qalc",           -- How to spawn the scratchpad
    rule = { instance = "qalc" },                     -- The rule that the scratchpad will be searched by
    sticky = true,                                    -- Whether the scratchpad should be sticky
    autoclose = true,                                 -- Whether it should hide itself when losing focus
    floating = true,                                  -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
    geometry = {x=360, y=90, height=450, width=600}, -- The geometry in a floating state
    reapply = true,                                   -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
    dont_focus_before_close  = true,                 -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
}

local music_scratchpad = bling.module.scratchpad {
    command = "alacritty -e ncmpcpp",           -- How to spawn the scratchpad
    rule = { instance = "music" },                     -- The rule that the scratchpad will be searched by
    sticky = true,                                    -- Whether the scratchpad should be sticky
    autoclose = true,                                 -- Whether it should hide itself when losing focus
    floating = true,                                  -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
    geometry = {x=360, y=90, height=850, width=1100}, -- The geometry in a floating state
    reapply = true,                                   -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
    dont_focus_before_close  = true,                 -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
}
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local globalkeys = gears.table.join(
    awful.key({ modkey,           }, "b",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Tag browsing
    -- awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
    --           {description = "view previous", group = "tag"}),
    -- awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
    --           {description = "view next", group = "tag"}),
    -- awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
    --           {description = "go back", group = "tag"}),
      
        awful.key({"Mod4"}, "Left", function()
          awful.client.focus.bydirection("left")
        end, {description = "Focus left", group = "client"}),

        awful.key({"Mod4"}, "Right", function()
          awful.client.focus.bydirection("right")
        end, {description = "Focus left", group = "client"}),

        awful.key({"Mod4"}, "Up", function()
          awful.client.focus.bydirection("up")
        end, {description = "Focus left", group = "client"}),

        awful.key({"Mod4"}, "Down", function()
          awful.client.focus.bydirection("down")
        end, {description = "Focus left", group = "client"}),

        awful.key({"Mod4"}, "c", function()
          calculator_scratchpad:toggle()   -- toggles the scratchpads visibility
        end, {description = "toggle calculator scratchpad", group = "scratchpads"}),

        awful.key({"Mod4"}, "m", function()
          music_scratchpad:toggle()   -- toggles the scratchpads visibility
        end, {description = "toggle music scratchpad", group = "scratchpads"}),

    -- awful.key({ modkey,           }, "j",
    --     function ()
    --         awful.client.focus.byidx( 1)
    --     end,
    --     {description = "focus next by index", group = "client"}
    -- ),

    -- awful.key({ modkey,           }, "k",
    --     function ()
    --         awful.client.focus.byidx(-1)
    --     end,
    --     {description = "focus previous by index", group = "client"}
    -- ),

    -- awful.key({ modkey,           }, "w", function () RC.mainmenu:show() end,
    --           {description = "show main menu", group = "awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Layout manipulation


    awful.key({ modkey, "Shift"   }, "Left", function () awful.client.swap.bydirection("left")    end,
              {description = "swap with left", group = "client"}),
    awful.key({ modkey, "Shift"   }, "Right", function () awful.client.swap.bydirection("right")    end,
              {description = "swap with right", group = "client"}),
    awful.key({ modkey, "Shift"   }, "Up", function () awful.client.swap.bydirection("up")    end,
              {description = "swap with up", group = "client"}),
    awful.key({ modkey, "Shift"   }, "Down", function () awful.client.swap.bydirection("down")    end,
              {description = "swap with down", group = "client"}),

    -- awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
    --           {description = "swap with next client by index", group = "client"}),
    -- awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
    --           {description = "swap with previous client by index", group = "client"}),
    -- awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
    --           {description = "focus the next screen", group = "screen"}),
    -- awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
    --           {description = "focus the previous screen", group = "screen"}),
    -- awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
    --           {description = "jump to urgent client", group = "client"}),
    -- awful.key({ modkey,           }, "Tab",
    --     function ()
    --         awful.client.focus.history.previous()
    --         if client.focus then
    --             client.focus:raise()
    --         end
    --     end,
    --     {description = "go back", group = "client"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),

    awful.key({ modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

    awful.key({ modkey, "Shift"   }, "x", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Layout manipulation
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Resize
    --awful.key({ modkey, "Control" }, "Left",  function () awful.client.moveresize( 20,  20, -40, -40) end),
    --awful.key({ modkey, "Control" }, "Right", function () awful.client.moveresize(-20, -20,  40,  40) end),
    awful.key({ modkey, "Control" }, "Down",  
              function () awful.client.moveresize( 0, 0, 0, -20) end),
    awful.key({ modkey, "Control" }, "Up",    
              function () awful.client.moveresize( 0, 0, 0,  20) end),
    awful.key({ modkey, "Control" }, "Left",  
              function () awful.client.moveresize( 0, 0, -20, 0) end),
    awful.key({ modkey, "Control" }, "Right", 
              function () awful.client.moveresize( 0, 0,  20, 0) end),

    awful.key({ }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc 10") end,
      {description = "+10%", group = "hotkeys"}),
    awful.key({ }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec 10") end,
      {description = "-10%", group = "hotkeys"}),

    -- Left panel
    awful.key({"Mod4"}, "Tab", function()
      bp.bigpanel.visible = not bp.bigpanel.visible
    end, {description = "left panel", group = "Widgets"}),

    -- Move
    awful.key({ modkey, "Shift"   }, "Down",  
              function () awful.client.moveresize(  0,  20,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Up",    
              function () awful.client.moveresize(  0, -20,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Left",  
              function () awful.client.moveresize(-20,   0,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Right", 
              function () awful.client.moveresize( 20,   0,   0,   0) end)

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Menubar
    -- awful.key({ modkey }, "p", function() menubar.show() end,
    --           {description = "show the menubar", group = "launcher"})

  )

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
