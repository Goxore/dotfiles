-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get ()
  local layouts = {
    awful.layout.suit.tile,             -- 1:
    awful.layout.suit.tile,             -- 2:
    awful.layout.suit.tile,             -- 3:
    awful.layout.suit.tile,             -- 4:
    awful.layout.suit.tile,             -- 5:
    awful.layout.suit.tile,             -- 6:
    awful.layout.suit.tile,             -- 7:
    awful.layout.suit.tile,             -- 8:
    awful.layout.suit.tile,             -- 9:
    awful.layout.suit.tile,             -- 0:
  }

  return layouts
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
