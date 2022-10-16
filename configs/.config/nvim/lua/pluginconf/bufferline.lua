require('bufferline').setup {
    -- options = {
    -- numbers = "ordinal",
    -- indicator_icon = '▎',
    -- show_buffer_close_icons = false,
    -- modified_icon = '●',
    -- close_icon = '',
    -- left_trunc_marker = '',
    -- right_trunc_marker = '',
    -- offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "center"}},
    -- always_show_bufferline = false,
    -- diagnostics = "coc"
    -- }
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                padding = 0
            }
        },

        indicator = {
            -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'none',
        },
        numbers = "ordinal",
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        show_close_icon = false,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = false,
        separator_style = { '', '' },
        always_show_bufferline = false,
        diagnostics = false,
        custom_filter = function(buf_number)
            -- Func to filter out our managed/persistent split terms
            local present_type, type = pcall(function()
                return vim.api.nvim_buf_get_var(buf_number, "term_type")
            end)

            if present_type then
                if type == "vert" then
                    return false
                elseif type == "hori" then
                    return false
                end
                return true
            end

            return true
        end,
    }
}
