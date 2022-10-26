-- options
local opts = { noremap=true, silent=true }
local keymap = vim.api.nvim_set_keymap
local pid = vim.fn.getpid()

-- shit
keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', 'gE', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', 'ge', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- on attach hook
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gu', '<cmd>Telescope lsp_references<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>F', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end

-- changing lsp diagnostic icons
vim.cmd [[
autocmd! CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
sign define DiagnosticSignError text=▌ texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn text=▌ texthl=DiagnosticSignWarn linehl= numhl=
sign define DiagnosticSignInfo text=▌ texthl=DiagnosticSignInfo linehl= numhl=
sign define DiagnosticSignHint text=▌ texthl=DiagnosticSignHint linehl= numhl=
]]

local lsp_installer = require("nvim-lsp-installer")

capabilities = { textDocument = { completion = { completionItem = { snippetSupport = true } } } }

lsp_installer.on_server_ready(function(server)
    local servopts = {
        on_attach=on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        }
    }

    if server.name == "omnisharp" then
        -- if vim.loop.os_uname().sysname == "Linux" then
        --     server:setup {
        --         use_mono = true,
        --         -- cmd = {"mono", "/home/yurii/.local/share/nvim/lsp_servers/omnisharp/omnisharp-mono/OmniSharp.exe", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) },
        --         -- cmd = {"mono", "/home/yurii/.local/share/nvim/lsp_servers/omnisharp/omnisharp-mono/OmniSharp.exe", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) },
        --         filetypes = { "cs", "vb" },
        --         -- init_options = {},
        --         root_dir = require'lspconfig'.util.root_pattern("*.csproj","*.sln"),
        --         on_attach=on_attach,
        --         capabilities=capabilities,
        --     }
        -- else
            server:setup {
                -- use_mono = true,
                -- cmd = {"mono", "/home/yurii/.local/share/nvim/lsp_servers/omnisharp/omnisharp-mono/OmniSharp.exe", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) },
                -- cmd = {"mono", "/home/yurii/.local/share/nvim/lsp_servers/omnisharp/omnisharp-mono/OmniSharp.exe", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) },
                filetypes = { "cs", "vb" },
                -- init_options = {},
                root_dir = require'lspconfig'.util.root_pattern("*.csproj","*.sln"),
                on_attach=on_attach,
                capabilities=capabilities,
            }
        -- end
    elseif server.name == "sumneko_lua" then
        server:setup {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        path = {
                            '?/init.lua',
                            '?.lua'
                        }
                    },
                    workspace = {
                        library = {
                            '/usr/share/nvim/runtime/lua',
                            '/usr/share/nvim/runtime/lua/lsp',
                            '/usr/share/awesome/lib'
                        }
                    },
                    completion = {
                        enable = true,
                    },
                    diagnostics = {
                        enable = true,
                        globals = { 'vim', 'awesome', 'client', 'root' }
                    },
                    telemetry = {
                        enable = false
                    }
                }
            },
            on_attach=on_attach,
            capabilities=capabilities,
        }
    elseif server.name == "rust_analyzer" then
        local rust_opts = {
            tools = {
                autoSetHints = true,
                -- hover_with_actions = true,
                executor = require("rust-tools/executors").termopen,
                runnables = {
                    use_telescope = true
                },
                inlay_hints = {
                    show_parameter_hints = true,
                    parameter_hints_prefix = "<- ",
                    other_hints_prefix = "=> ",
                    max_len_align = false,
                    max_len_align_padding = 1,
                    right_align = false,
                    right_align_padding = 7
                },
                hover_actions = {
                    border = "single",
                    auto_focus = false
                }
            },

            server = vim.tbl_deep_extend("force", server:get_default_options(), {
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy"
                        }
                    }
                }
            })
        }

        require("rust-tools").setup(rust_opts)

        -- keymap('n', '<space>t', '<cmd>RustHoverActions<CR>', opts)
        -- keymap('n', '<space>f', '<cmd>!cargo fmt<CR>', opts)
        -- keymap('n', '<space>ca', '<cmd>vim.lsp.buf.code_action()<CR>', opts)
        server:attach_buffers()
    else
        server:setup(servopts)
        vim.cmd([[do User LspAttachBuffers]])
    end
end)
