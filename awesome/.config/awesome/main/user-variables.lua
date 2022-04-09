-- {{{ Global Variable Definitions
-- moved here in module as local variable
-- }}}

local home = os.getenv("HOME")

local _M = {
  terminal = "alacritty",
  modkey = "Mod4",
  wallpaper = home .. "/dotfiles/wallpaper.jpg",
}

return _M

