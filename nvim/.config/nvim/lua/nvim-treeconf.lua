local present, nvimtree = pcall(require, "nvim-tree")

if not present then
   return
end

local g = vim.g

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_git_hl = 0
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

g.nvim_tree_show_icons = {
   folders = 1,
   files = 1,
   git = 1,
}

g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
   },
   folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}

local default = {
   filters = {
      dotfiles = false,
   },
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   auto_close = false,
   open_on_tab = false,
   hijack_cursor = true,
   hijack_unnamed_buffer_when_opening = false,
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = false,
   },
   view = {
      width = 25,
      height = 30,
      hide_root_folder = false,
      side = 'left',
      preserve_window_proportions = true,
      mappings = {
      custom_only = true,
      list = {
        { key = "a",                            action = "rename" },
        { key = "g<CR>",                        action = "system_open" },
        { key = "r",                            action = "refresh" },
        { key = "g?",                           action = "toggle_help" },
        { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
        { key = "<gd>",                         action = "cd" },
        { key = "P",                            action = "parent_node" },
        { key = "c",                            action = "create" },
        -- { key = "D",                            action = "trash" },
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
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
   git = {
      enable = true,
      ignore = false,
   },
   actions = {
      open_file = {
         resize_window = true,
      },
   },
}

local M = {}

nvimtree.setup(default)

return M
