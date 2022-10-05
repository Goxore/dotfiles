local theme = require("themes.mytheme.theme")

local _M = {}

function _M.checkClientState (c)
    if c.sticky then
        c.border_color = theme.border_focus_sticky
    else
        c.border_color = theme.border_focus
    end
end

return _M
