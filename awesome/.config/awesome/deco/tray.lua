local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local notify = require("naughty").notify

local tray = {}

-- For checking if cursor is around tray
local scr_g = screen.primary.geometry
-- Coordinates of upper right corner (where the widget should be)
-- local corner = {
--     x = scr_g.x + scr_g.width,
--     y = scr_g.y
-- }
local corner = {
    x = scr_g.x,
    y = scr_g.y + scr_g.height
}
local max_dist = (scr_g.width^2 + scr_g.height^2) ^ 0.5 / 5

local tray_widget = wibox.widget {
	widget = wibox.widget.systray(),
	visible = false,
}

-- button:connect_signal("button::press", function(c) c:set_bg("#000000") end)
-- button:connect_signal("button::release", function(c) c:set_bg('#00000066') end)

local tray_button = wibox.widget {
  align = "center",
  text = "  ",
  widget = wibox.widget.textbox,
}

tray.widget = wibox.widget {
	-- {
	-- 	align = "center",
	-- 	text = "  ",
	-- 	widget = wibox.widget.textbox,
	-- },
	tray_widget,
  tray_button,
	layout = wibox.layout.fixed.vertical
}

-- tray.widget:connect_signal("mouse::enter", function(c) tray_button:set_text(" hi ") end)

function tray.toggle()
	if tray_widget:get_visible() then
        tray_widget:set_visible(false)
        tray_button:set_text("  ")
        tray.timer:stop()
    else 
        tray_widget:set_visible(true)
        tray_button:set_text("  ")
        tray.timer:start()
    end
end

tray.timer = gears.timer({
	timeout = 5,
	callback = function()
        -- Get coordinates of the cursor
        -- and hide tray if mouse is far from it
        local mg = mouse.coords()
        local dist = ((mg.x - corner.x)^2 + (mg.y - corner.y)^2)^0.5
        if dist > max_dist then
            tray_widget:set_visible(false)
            tray_button:set_text("  ")
            tray.timer:stop()
        end
	end
})

tray.widget:buttons(gears.table.join(
	awful.button({ }, 1, function () 
		tray.toggle()
	end)))

return tray
