local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Left>",  "<cmd>wincmd h <CR>", opts)
keymap("n", "<C-Right>", "<cmd>wincmd l <CR>", opts)
keymap("n", "<C-Up>",    "<cmd>wincmd k <CR>", opts)
keymap("n", "<C-Down>",  "<cmd>wincmd j <CR>", opts)

keymap("n", "<esc><esc>", "<cmd>:noh<return>", opts)

-- Tab navigation
-- keymap("n", "<A-1>", "1gt", opts)
-- keymap("n", "<A-2>", "2gt", opts)
-- keymap("n", "<A-3>", "3gt", opts)
-- keymap("n", "<A-4>", "4gt", opts)
-- keymap("n", "<A-5>", "5gt", opts)
-- keymap("n", "<A-6>", "6gt", opts)
-- keymap("n", "<A-7>", "7gt", opts)
-- keymap("n", "<A-8>", "8gt", opts)
-- keymap("n", "<A-9>", "9gt", opts)

-- Buffers

keymap("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<A-6>", "<cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<A-7>", "<cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<A-8>", "<cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<A-9>", "<cmd>BufferLineGoToBuffer 9<CR>", opts)

--close Buffer
keymap("n", "<C-w>", "<cmd>bd<CR>", opts)

-- Resize windows
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)


-- Nvim Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
--keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
vim.cmd([[tnoremap <silent> <C-n> <C-\><C-n>:NvimTreeToggle<CR>]])
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<leader>N", ":NvimTreeFindFile<CR>", opts)

-- keymap("n", "<leader>t", ":ToggleTerm<CR>", opts)
-- keymap("t", "<leader>t", ":ToggleTerm<CR>", opts)

-- ToggleTerm
keymap('t', '<esc>', [[<C-\><C-n>]], opts)
keymap('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
keymap('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
keymap('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
