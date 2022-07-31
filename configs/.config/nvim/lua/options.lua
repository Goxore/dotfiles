-- aliases
local g = vim.g
local o = vim.opt

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
o.clipboard = "unnamedplus"
o.encoding = "utf-8"
o.hidden = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.updatetime = 300
o.termguicolors = true
o.mouse = "a"
o.splitbelow = true
o.splitright = true
o.scrolloff = 5
o.signcolumn = "yes"
g.OmniSharp_server_use_mono = 1
-- g.laststatus = 3

-- vim.lsp.set_log_level("debug")

-- cmds
vim.cmd [[
set nobackup
set nowritebackup
vnoremap < <gv
vnoremap > >gv
nnoremap gx <CMD>execute '!xdg-open ' .. shellescape(expand('<cfile>'), v:true)<CR>
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
]]
