local status_ok, toggleterm = pcall(require, "toggleterm")

local colors = require("colors")

local keymap = vim.api.nvim_set_keymap

if not status_ok then
    return
end

require("toggleterm").setup{
  -- direction = "float",
  direction = "horizontal",
  shade_terminals = false,
  persist_size = false,
  highlights = {
    Normal = {
      guibg = colors.darker(colors.bgcolor, 10)
    },
    NormalFloat = {
      link = 'Normal'
    },
    FloatBorder = {
      guifg = colors.darker(colors.bgcolor, 10),
      guibg = colors.darker(colors.bgcolor, 10)
    },
  },
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true, silent = true}
  keymap('t', '<esc>', '<cmd>lua _MYTERM_TOGGLE()<CR>', opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local opts = { noremap = true, silent = true }

local close_terminal = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", opts)
end

local myterm = Terminal:new({
    hidden = true,
    on_open = function(term)
        close_terminal(term)
    end,
})

function _MYTERM_TOGGLE()
    myterm:toggle()
end

vim.api.nvim_set_keymap(
    "n",
    "<C-t>",
    "<cmd>lua _MYTERM_TOGGLE()<CR>",
    opts
)

vim.api.nvim_set_keymap(
    "t",
    "<C-t>",
    "<cmd>lua _MYTERM_TOGGLE()<CR>",
    opts
)


