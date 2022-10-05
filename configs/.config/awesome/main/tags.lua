-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- function _M.get ()
--   local tags = {}

--   awful.screen.connect_for_each_screen(function(s)
--     -- Each screen has its own tag table.
--     tags[s] = awful.tag(
--       { "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, RC.layouts[1]
--     )
--   end)

--   return tags
-- end


function _M.get ()
  local tags = {}

  local tagpairs = {
    names  = { " ", " ", " ", " ", " ", " ", " ", " ", " ", " "},

    layout = {
      RC.layouts[1], RC.layouts[1], RC.layouts[1],
      RC.layouts[1], RC.layouts[1], RC.layouts[1],
      RC.layouts[1], RC.layouts[1], RC.layouts[1],
      RC.layouts[1]
    }
  }

  awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)
  end)

  return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
