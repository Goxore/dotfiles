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
o.laststatus = 3
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
o.signcolumn = "yes"
-- o.langmap = [[ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>]]
-- g.laststatus = 3

--o.invspell spelllang = ru_ru,en_us,uk_ua
--o.nospell = true

vim.cmd [[
set nobackup
set nowritebackup
vnoremap < <gv
vnoremap > >gv
set clipboard=unnamedplus
nnoremap gx <CMD>execute '!xdg-open ' .. shellescape(expand('<cfile>'), v:true)<CR>
]]

-- g.coc_snippet_next = '<tab>'
