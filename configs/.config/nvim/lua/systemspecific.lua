if (vim.loop.os_uname().sysname == "Linux") then
    vim.opt.guifont = {"Hack Nerd Font", ":h11.5"}
else
    vim.opt.guifont = {"Hack NF", ":h15"}
end

if (vim.fn.exists("g:neovide") == 1) then
    vim.g.neovide_refresh_rate = 220
    vim.g.neovide_scroll_animation_length = 0.3
end
