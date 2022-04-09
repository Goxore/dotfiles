vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- File explorer
  -- use("scrooloose/nerdtree")
  -- use("tiagofumo/vim-nerdtree-syntax-highlight")
  -- use("jistr/vim-nerdtree-tabs")
  
  use("wbthomason/packer.nvim")


  -- autopairs
  use("Raimondi/delimitMate")
  
  -- Conqueror of completion autocomplete engine
--  use{"neoclide/coc.nvim", branch = 'release'}
  
  -- themes
  -- use("gruvbox-community/gruvbox")
  use("lifepillar/vim-gruvbox8")
  
  -- lines
  --use("itchyny/lightline.vim")
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  
  -- wide language support
--  use("sheerun/vim-polyglot")
  
  -- autocomplete option1
--  use("dense-analysis/ale")
  
  -- autocomplete option2
  --use("scrooloose/syntastic")
  
  -- c# support
  -- use("omnisharp/omnisharp-vim")
  
  -- vim developer icons
  use("ryanoasis/vim-devicons")
  --use("https://github.com/adelarsq/vim-devicons-emoji")
  
  -- Tabs
  --use("kyazdani42/nvim-web-devicons")
  --use("romgrk/barbar.nvim")
  
  -- Startup menu and dependencies
  use("nvim-telescope/telescope.nvim")
  use("nvim-lua/plenary.nvim")
  
  -- ReactJS plugin
  -- use("maxmellon/vim-jsx-pretty")
  
  --html helper
  use("mattn/emmet-vim")
  
  --snippets
  -- use("SirVer/ultisnips")
  -- use("mlaursen/vim-react-snippets")
  
  -- VimTeX
  use("lervag/vimtex")
  -- use({"xuhdev/vim-latex-live-preview",  ft = {'tex'}})
  use("xuhdev/vim-latex-live-preview")
  
  -- wiki
  use("vimwiki/vimwiki")
  
  -- git integration
  use("tpope/vim-fugitive")
  
  -- Paste image LaTeX/md
  use("ferrine/md-img-paste.vim")
  
  -- better comment
  use("tpope/vim-commentary")
  
  -- Dashboard
  --use("glepnir/dashboard-nvim")
  --use("liuchengxu/vim-clap")

  use {
      'goolord/alpha-nvim',
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
  }

  -- nvim tree
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup {} end
  }
 
  use("akinsho/toggleterm.nvim")

  --NEW
  use("nvim-treesitter/nvim-treesitter")

  use ("neovim/nvim-lspconfig")

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "kdheepak/cmp-latex-symbols" },
      { "L3MON4D3/LuaSnip" }
    },
    sources = {
      { name = "latex_symbols" },
    },
  })


  use ("rafamadriz/friendly-snippets")
  use ("saadparwaiz1/cmp_luasnip")
  use ("hrsh7th/cmp-nvim-lsp")
  use ("hrsh7th/cmp-nvim-lua")
  use ("hrsh7th/cmp-buffer")
  use ("hrsh7th/cmp-path")
  use ("hrsh7th/cmp-cmdline")
  -- use ("quangnguyen30192/cmp-nvim-ultisnips")
  use ("williamboman/nvim-lsp-installer")

  --yuck lang
  use("https://github.com/elkowar/yuck.vim")
  
  -- faster loading
  use 'lewis6991/impatient.nvim'
  
end)

