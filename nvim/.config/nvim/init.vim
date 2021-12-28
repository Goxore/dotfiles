"
"_________________________________________________________________________________________
"_____/\\\\\\\\\\\\________________________________________________________________________        
" ___/\\\//////////_________________________________________________________________________       
"  __/\\\____________________________________________________________________________________      
"   _\/\\\____/\\\\\\\_____/\\\\\_____/\\\____/\\\_____/\\\\\_____/\\/\\\\\\\______/\\\\\\\\__     
"    _\/\\\___\/////\\\___/\\\///\\\__\///\\\/\\\/____/\\\///\\\__\/\\\/////\\\___/\\\/////\\\_    
"     _\/\\\_______\/\\\__/\\\__\//\\\___\///\\\/_____/\\\__\//\\\_\/\\\___\///___/\\\\\\\\\\\__   
"      _\/\\\_______\/\\\_\//\\\__/\\\_____/\\\/\\\___\//\\\__/\\\__\/\\\_________\//\\///////___  
"       _\//\\\\\\\\\\\\/___\///\\\\\/____/\\\/\///\\\__\///\\\\\/___\/\\\__________\//\\\\\\\\\\_ 
"        __\////////////_______\/////_____\///____\///_____\/////_____\///____________\//////////__
"         __________________________________________________________________________________________  

"Show line numbers
set relativenumber

" Automatically wrap to next line
set wrap

" Encoding
set encoding=utf-8

" Text Edit might fail if hidden is not set.
set hidden


" Insert 2 spaces for a tab
set tabstop=2

" Having longer update time (default is 4000 ms = 4 s) leads to noticeable delays
set updatetime=300


" true color
if has('nvim') || has('termguicolors')
  set termguicolors
endif

"language spelling support
"set invspell spelllang=ru_ru,en_us,uk_ua
"set nospell

"better tab editing for Visual mode
vnoremap < <gv
vnoremap > >gv

" map Ctrl+s to save and Ctrl+Q to write and writequit
"nnoremap <C-s> :w<CR
"nnoremap <C-Q> :wq<CR>

"someone said it was important 
" Always show the sign column, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge sign column and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" remove backups
set nobackup
set nowritebackup


" make splits below
set splitbelow


" ctrl+c ctrl+v to yank paste
set clipboard=unnamedplus

"better moving cursor up and down
set scrolloff=5

nnoremap <esc><esc> :noh<return>


call plug#begin()				
" nerdtree file explorer
Plug 'scrooloose/nerdtree'

" nerdtree tabs
Plug 'jistr/vim-nerdtree-tabs'




" Conqueror of completion autocomplete engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" themes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'gruvbox-community/gruvbox'


" line at the bottom
Plug 'itchyny/lightline.vim'


" wide language support
Plug 'sheerun/vim-polyglot'


" autocomplete option1
Plug 'dense-analysis/ale'

" autocomplete option2
"Plug 'scrooloose/syntastic'

" c# support
Plug 'omnisharp/omnisharp-vim'

" vim developer icons
Plug 'ryanoasis/vim-devicons'

" autoclose tag in html
Plug 'alvan/vim-closetag'

" Startup menu and dependencies
Plug 'startup-nvim/startup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

" ReactJS plugin
" Plug 'maxmellon/vim-jsx-pretty'

"html helper
Plug 'mattn/emmet-vim'

"snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

" VimTeX
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }


call plug#end()	
"use ':PlugInstall' to install Plugins

" press tab to choose next autocomplete option
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"                        
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



" use mono with c#
let g:OmniSharp_server_use_mono = 1


" Enable NERDtree at start
"autocmd VimEnter * NERDTree | wincmd p
" let g:nerdtree_tabs_open_on_console_startup = 1



" map leader to Space
" let mapleader =
" map <leader>h :wincmd h<CR>
" map <leader>l :wincmd l<CR>



" change splits 
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-w> <C-w>w

" tab to go to next snippet
let g:coc_snippet_next = '<tab>'


nnoremap <C-n> :NERDTreeTabsToggle<CR>

"LATEX
let g:livepreview_previewer = 'zathura'

filetype plugin indent on
syntax enable



" enable mouse
set mouse=a



" Themes
"colorscheme challenger_deep
"let g:lightline = { 'colorscheme': 'challenger_deep'}

set background=dark
set termguicolors
"let g:quantum_black=1
"colorscheme quantum
"let g:lightline = {'colorscheme': 'quantum',}

colorscheme gruvbox
let g:lightline = {'colorscheme': 'gruvbox',}


"colorscheme catppuccin
"let g:lightline = {'colorscheme': 'catppuccin'}

"hi Normal guibg=#1E1E1E

hi Directory guifg=#909090 ctermfg=red

autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained

"emmet settings
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

" remove 'press ? for help' in NERDTree
let NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



" Terminal function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        
        new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


nnoremap <C-t> :call TermToggle(12)<CR>
inoremap <C-t> <Esc>:call TermToggle(12)<CR>
tnoremap <C-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

"fast resize
nnoremap <C-Up>    :resize -2<CR>
nnoremap <C-Down>  :resize +2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" fast tab navigation
nnoremap <SPACE> :tabnext<CR>

map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt

"-----------------------------------------------------------


"Coc extensions to install ---------------------------------------------------
"
"coc-json             for  json
"coc-rls              for  Rust
"coc-omnisharp        for  c#
"coc-jedi             for Python
"coc-clangd           for c, c++, objective c
"coc-html             for html
"coc-html-css-support for css-html
"coc-css              for css
"coc-tsserver         for js/Typescript
"coc-snippets         for snippets
"coc-emmet            for html emmet
"coc-pairs            for autopairs
"
"use ':CocInstall coc-...' to install
"
"end--------------------------------------------------------------------------
