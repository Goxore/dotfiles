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
    use({"nvim-lua/popup.nvim"})


    -- luasnip
    use("l3mon4d3/luasnip")

    -- cmp
    use("hrsh7th/nvim-cmp")
    use ("rafamadriz/friendly-snippets")
    use ("saadparwaiz1/cmp_luasnip")
    use ("hrsh7th/cmp-nvim-lsp")
    use ("hrsh7th/cmp-nvim-lua")
    use ("hrsh7th/cmp-buffer")
    use ("hrsh7th/cmp-path")
    use ("hrsh7th/cmp-cmdline")

    -- null-ls
    use ("jose-elias-alvarez/null-ls.nvim")

    -- autopairs
    use ("windwp/nvim-autopairs")

    use {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    }

    use {
        "ahmedkhalf/lsp-rooter.nvim",
        config = function()
            require("lsp-rooter").setup {}
        end
    }

    use {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("symbols-outline").setup {}
        end
    }

    use {
        'karb94/neoscroll.nvim',
        -- config = function ()
        --     -- require('neoscroll').setup()
        --
        --     local t = {}
        --     -- Syntax: t[keys] = {function, {function arguments}}
        --     -- Use the "sine" easing function
        --     t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '50', 'circular'}}
        --     t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '50', 'circular'}}
        --     -- Use the "circular" easing function
        --     t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '50', [['circular']]}}
        --     t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '50', [['circular']]}}
        --     -- Pass "nil" to disable the easing animation (constant scrolling speed)
        --     t['<C-y>'] = {'scroll', {'-0.10', 'false', '50', nil}}
        --     t['<C-e>'] = {'scroll', { '0.10', 'false', '50', nil}}
        --     -- When no easing function is provided the default easing function (in this case "quadratic") will be used
        --     t['zt']    = {'zt', {'100'}}
        --     t['zz']    = {'zz', {'100'}}
        --     t['zb']    = {'zb', {'100'}}
        --     require('neoscroll.config').set_mappings(t)
        -- end
    }

    use("rcarriga/nvim-notify")

    use("lifepillar/vim-gruvbox8")

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

    use("ryanoasis/vim-devicons")

    use("nvim-telescope/telescope.nvim")

    use("mattn/emmet-vim")

    use("lervag/vimtex")
    use("xuhdev/vim-latex-live-preview")

    use("vimwiki/vimwiki")

    use("tpope/vim-fugitive")

    use("ferrine/md-img-paste.vim")

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }


    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
        },
        config = function() require'nvim-tree'.setup {} end
    }

    use("akinsho/toggleterm.nvim")

    use("nvim-treesitter/nvim-treesitter")

    use ("neovim/nvim-lspconfig")

    -- use({
        --     "hrsh7th/nvim-cmp",
        --     requires = {
            --         { "kdheepak/cmp-latex-symbols" },
            --         { "l3mon4d3/luasnip" }
            --     },
            --     sources = {
                --         { name = "latex_symbols" },
                --     },
                -- })
                --
                -- use ("rafamadriz/friendly-snippets")
                -- use ("saadparwaiz1/cmp_luasnip")
                -- use ("hrsh7th/cmp-nvim-lsp")
                -- use ("hrsh7th/cmp-nvim-lua")
                -- use ("hrsh7th/cmp-buffer")
                -- use ("hrsh7th/cmp-path")
                -- use ("hrsh7th/cmp-cmdline")
                use ("williamboman/nvim-lsp-installer")

                use("https://github.com/elkowar/yuck.vim")

                use 'lewis6991/impatient.nvim'

                use ("ray-x/lsp_signature.nvim")
                use ("glepnir/lspsaga.nvim")

                use ("mfussenegger/nvim-dap")

                use ("simrat39/rust-tools.nvim")
                use ("shurizzle/inlay-hints.nvim")

                use ('folke/lsp-colors.nvim')

                use {
                    'glacambre/firenvim',
                    run = function() vim.fn['firenvim#install'](0) end
                }

                use ("vim-autoformat/vim-autoformat")

                if PACKER_BOOTSTRAP then
                    require("packer").sync()
                end
            end)
