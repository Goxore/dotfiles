-- aliases
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.api.nvim_set_keymap
local o = vim.opt
local api = vim.api

-- options
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.relativenumber = true
o.wrap = false
-- o.clipboard = "unnamedplus"
o.encoding = "utf-8"
o.hidden = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.updatetime = 300
o.termguicolors = true
o.mouse = "a"
o.splitbelow = true
o.scrolloff = 5
o.langmap = [[ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>]]
g.OmniSharp_server_use_mono = 1
--o.invspell spelllang = ru_ru,en_us,uk_ua
--o.nospell = true

vim.cmd [[
colorscheme gruvbox8
set nobackup
set nowritebackup
vnoremap < <gv
vnoremap > >gv
set clipboard=unnamedplus

"nvim tree color
hi NvimTreeNormal guibg=#222222
hi AlphaHeader guifg=#fabd2f
hi AlphaButton guibg=#ebdbb2
set fillchars+=vert:\ 
]]

-- g.coc_snippet_next = '<tab>'
