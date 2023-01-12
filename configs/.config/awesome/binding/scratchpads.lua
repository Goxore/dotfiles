local bling = require('packages.bling')

local M = {}

local create_scratchpad = function(settings)

    local scr = screen.primary.geometry;

    return bling.module.scratchpad {
        command                 = settings.cmd, -- How to spawn the scratchpad
        rule                    = { instance = "qalc" }, -- The rule that the scratchpad will be searched by
        sticky                  = true, -- Whether the scratchpad should be sticky
        autoclose               = false, -- Whether it should hide itself when losing focus
        floating                = true, -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
        geometry                = {
            height = settings.y,
            width = settings.x,
            x = scr.width / 2 - settings.x / 2,
            y = scr.height / 2 - settings.y / 2
        },
        reapply                 = true, -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
        dont_focus_before_close = true, -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
    }
end

M.calculator_scratchpad = create_scratchpad { cmd = "alacritty -e qalc", x = 700, y = 550 }
M.sound_scratchpad = create_scratchpad { cmd = "alacritty -e pulsemixer", x = 700, y = 550 }
M.wiki_scratchpad = create_scratchpad { cmd = "sleep 0.1 && alacritty -e nvim $HOME/vimwiki/index.md", x = 1200, y = 950 }

M.toggleWiki = function()
    M.wiki_scratchpad:toggle()
end

return M
