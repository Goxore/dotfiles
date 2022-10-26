local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Better window navigation
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

keymap("n", "<C-Left>",  "<cmd>wincmd h <CR>", opts)
keymap("n", "<C-Right>", "<cmd>wincmd l <CR>", opts)
keymap("n", "<C-Up>",    "<cmd>wincmd k <CR>", opts)
keymap("n", "<C-Down>",  "<cmd>wincmd j <CR>", opts)

keymap("n", "<esc><esc>", "<cmd>:noh<return>", opts)

--folds
keymap("n", "z{", "zfi{", opts)
keymap("n", "z(", "zfi(", opts)

-- Tab navigation without bufferline
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
keymap("n", "<A-C-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-C-l>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-C-k>", ":resize -2<CR>", opts)
keymap("n", "<A-C-j>", ":resize +2<CR>", opts)


-- Nvim Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("t", "<C-n>", [[ <C-\><C-n>:NvimTreeToggle<CR>]], opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<leader>N", ":NvimTreeFindFile<CR>", opts)

-- ToggleTerm
keymap("t", "<esc>", [[<C-\><C-n>]], opts)
keymap("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
keymap("t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
keymap("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)

-- snippet
keymap("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/luasnipconf.lua<CR>", opts)

-- preview
keymap("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
keymap("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementationn()<CR>", opts)

-- git signs
keymap("n", "]c", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "ghp", "<cmd>Gitsigns preview_hunk<CR>", opts)
keymap("n", "ghu", "<cmd>Gitsigns reset_hunk<CR>", opts)
keymap("n", "ghb", "<cmd>Gitsigns blame_line<CR>", opts)
keymap("n", "vih", "<cmd>Gitsigns select_hunk<CR>", opts)

keymap("n", "<F2>", "<cmd>Lspsaga rename<CR>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
