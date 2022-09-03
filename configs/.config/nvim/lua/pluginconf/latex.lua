local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.api.nvim_set_keymap
local o = vim.opt
local api = vim.api

g.livepreview_previewer = 'zathura'

-- filetype plugin indent on
-- syntax enable

g.livepreview_cursorhold_recompile = 0

vim.cmd([[
function! g:LatexPasteImageLatex(relpath)
   execute "normal! i\\includegraphics[width=1\\linewidth]{" . a:relpath . "}"
   "let ipos = getcurpos()
   "execute "normal! a" . "mage}"
   "call setpos('.', ipos)
   "execute "normal! ve\<C-g>"
endfunction

let g:livepreview_engine = 'lualatex -shell-escape -interaction=nonstopmode'

autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImageLatex'
autocmd FileType markdown,tex nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
]])

g.tex_flavor='latex'
g.vimtex_view_method='zathura'
g.vimtex_quickfix_mode=0
o.conceallevel=2
g.tex_conceal='abdmg'
