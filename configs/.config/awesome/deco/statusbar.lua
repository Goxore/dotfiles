-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local theme = require("themes.mytheme.theme")
local wibox = require("wibox")
local tray2 = require("deco.tray")
local scr_g = screen.primary.geometry
local wf = require("deco.widgetfactory")

-- Custom Local Library: Common Functional Decoration
local deco = {
    wallpaper = require("deco.wallpaper"),
    taglist   = require("deco.taglist"),
    tasklist  = require("deco.tasklist")
}

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

M = {}

-- M.status_text = wibox.widget{
--     align = "center",
--     text = " ",
--     widget = wibox.widget.textbox,
-- }
--
-- M.status = wf.barwidget({
--     value_module = {
--         margin_top = 10,
--         margin_bot = -5,
--         margin_left = 0,
--         margin_right = 0,
--         value_widget = M.status_text
--     },
--     icon_module = {
--         margin_top = -10,
--         margin_bot = 7,
--         margin_left = 0,
--         margin_right = 0,
--         icon = 'S'
--     },
--     color = theme.red
-- })
--
-- M.start_status = function (new_text)
--     M.status_text.text = new_text
--     M.status_timer:start()
-- end
--
-- M.status_timer = gears.timer({
-- 	timeout = 4,
-- 	callback = function()
--         M.status_text.text = " "
--         timer:stop()
-- 	end
-- })

M.mic = wf.barwidget({
    value_module = {
        margin_top = 10,
        margin_bot = -5,
        margin_left = 0,
        margin_right = 0,
        value_widget = awful.widget.watch('bash -c "/home/yurii/scripts/os/micscript.sh"')
    },
    icon_module = {
        margin_top = -10,
        margin_bot = 7,
        margin_left = 0,
        margin_right = 0,
        icon = ''
    },
    color = theme.red
})

M.bat = wf.barwidget({
    value_module = {
        margin_top = 10,
        margin_bot = -5,
        margin_left = 0,
        margin_right = 0,
        value_widget = awful.widget.watch('bash -c "/home/yurii/scripts/os/battery.sh"', 15)
    },
    icon_module = {
        margin_top = -10,
        margin_bot = 7,
        margin_left = 0,
        margin_right = 0,
        icon = ''
    },
    color = theme.green
})

M.keylay = wf.barwidget({
    value_module = {
        margin_top = 10,
        margin_bot = -5,
        margin_left = 0,
        margin_right = 4,
        value_widget = awful.widget.keyboardlayout
    },
    icon_module = {
        margin_top = 10,
        margin_bot = 7,
        margin_left = 0,
        margin_right = 8,
        icon = ''
    },
    color = theme.magenta
})

M.temp = wf.barwidget({
    value_module = {
        margin_top = 10,
        margin_bot = -5,
        margin_left = 0,
        margin_right = 0,
        value_widget = awful.widget.watch('bash -c "/home/yurii/scripts/os/cputemp.sh"', 5)
    },
    icon_module = {
        margin_top = -10,
        margin_bot = 7,
        margin_left = 0,
        margin_right = 0,
        icon = ''
    },
    color = theme.blue
})

M.hours = wibox.widget {
    format = "%H",
    valign = "center",
    widget = wibox.widget.textclock
}

M.minutes = wibox.widget {
    format = "%M",
    valign = "center",
    widget = wibox.widget.textclock
}

M.clock = wf.makewidget2(M.hours, M.minutes, theme.yellow, "", 0, 0, -5, 10)

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
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)
    ))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        layout  = { spacing = 0, layout = wibox.layout.fixed.vertical },
        margins = 5,
        style   = {
            shape = gears.shape.rectangle
        },
        valign  = "center",
        halign  = "center"
    }

    s.taglistcontainer = wibox.widget {
        s.mytaglist,
        top = 10,
        bottom = 10,
        left = 11,
        right = 9,
        align = "center",
        widget = wibox.container.margin
    }

    s.layoutboxcontainer = wibox.widget {
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
    s.mywibox = awful.wibar({
        position = "left",
        screen = s,
        width = 60,
        height = scr_g.height,
        valign = "center",
        type = "dock"
    })

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
            -- M.status,
            M.mic,
            M.bat,
            M.keylay,
            M.temp,
            -- mytextclock,
            M.clock,
            tray2.widget,
            s.layoutboxcontainer,
        },
    }

end)

return M
