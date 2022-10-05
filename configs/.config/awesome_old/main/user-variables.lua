-- {{{ Global Variable Definitions
-- moved here in module as local variable
-- }}}

local home = os.getenv("HOME")
local wallpaper = os.getenv("WALLPAPER")

local _M = {
  terminal = "alacritty",
  modkey = "Mod4",
  -- wallpaper = home .. "/.cache/lastwallpaper",
  wallpaper = wallpaper,
}

return _M

