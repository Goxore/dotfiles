local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return require('packer').startup(function(use)
    -- packer
    use("wbthomason/packer.nvim")

    -- main dependencies
    use("nvim-lua/plenary.nvim")
    use({ "nvim-lua/popup.nvim" })


    -- luasnip
    use("l3mon4d3/luasnip")

    -- cmp
    use("hrsh7th/nvim-cmp")
    use("rafamadriz/friendly-snippets")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")

    -- null-ls
    use("jose-elias-alvarez/null-ls.nvim")

    -- autopairs
    use("windwp/nvim-autopairs")

    -- peek definition
    use {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    }

    -- CDs into root folder of the project
    use {
        "ahmedkhalf/lsp-rooter.nvim",
        config = function()
            require("lsp-rooter").setup {}
        end
    }

    -- Symbols
    use {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("symbols-outline").setup {}
        end
    }

    -- nice git signs
    use("lewis6991/gitsigns.nvim")

    -- notifications
    use("rcarriga/nvim-notify")

    -- oh yes!
    use("lifepillar/vim-gruvbox8")
    use("tomasiser/vim-code-dark")
    use("folke/tokyonight.nvim")

    -- lua line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- bufferline
    use { 'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons' }

    -- icons
    use("ryanoasis/vim-devicons")

    -- Telescope
    use("nvim-telescope/telescope.nvim")

    -- sticky context
    use 'nvim-treesitter/nvim-treesitter-context'

    -- LaTeX
    use("lervag/vimtex")
    use("xuhdev/vim-latex-live-preview")
    use("ferrine/md-img-paste.vim")

    -- Vim viki
    use("vimwiki/vimwiki")

    -- more git
    use("tpope/vim-fugitive")

    -- comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- menu
    use {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    }

    -- file manager
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
        },
        config = function() require 'nvim-tree'.setup {} end
    }

    -- Toggle terminal
    use("akinsho/toggleterm.nvim")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter")

    -- Lsp
    use("neovim/nvim-lspconfig")

    -- Lsp additional features
    use("glepnir/lspsaga.nvim")

    -- generate documentation
    use{
        "danymat/neogen",
        config = function ()
            require("neogen").setup{
                enabled = true,
                languages = {
                    cs = {
                        template = {
                            annotation_convention = "xmldoc"
                        }
                    }
                }
            }
        end
    }

    -- lsp installer
    use("williamboman/nvim-lsp-installer")

    -- syntax oy .yuck
    use("elkowar/yuck.vim")

    -- lazy loading that i don't really use although probably should
    use('lewis6991/impatient.nvim')

    -- lsp signatures
    use("ray-x/lsp_signature.nvim")

    -- lsp and debugging
    use("mfussenegger/nvim-dap")

    -- rust language server improvements
    use("simrat39/rust-tools.nvim")

    -- inlay hints that somewhat work sometimes
    use("shurizzle/inlay-hints.nvim")

    -- lsp colors
    use('folke/lsp-colors.nvim')

    -- vim autoformatter
    use("vim-autoformat/vim-autoformat")

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
