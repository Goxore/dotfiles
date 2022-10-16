local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
      indent_markers = {
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = true,
      },
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
    mappings = {
       list = {
         { key = "a",                            action = "rename" },
         { key = "g<CR>",                        action = "system_open" },
         { key = "r",                            action = "refresh" },
         { key = "g?",                           action = "toggle_help" },
         { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
         { key = "<gd>",                         action = "cd" },
         { key = "P",                            action = "parent_node" },
         { key = "c",                            action = "create" },
         { key = "D",                            action = "remove" },
         { key = "dd",                           action = "cut" },
         { key = "y",                            action = "copy" },
         { key = "p",                            action = "paste" },
         { key = "zy",                           action = "copy_name" },
         { key = "zY",                           action = "copy_path" },
         { key = "gy",                           action = "copy_absolute_path" },
         { key = "[c",                           action = "prev_git_item" },
         { key = "]c",                           action = "next_git_item" },
         { key = "u",                            action = "dir_up" },
         { key = "q",                            action = "close" },
         { key = 'C',                            action = "collapse_all" },
         { key = "$",                            action = "run_file_command" },
         { key = "i",                        action = "toggle_file_info" }
       }
    },
  },
}
