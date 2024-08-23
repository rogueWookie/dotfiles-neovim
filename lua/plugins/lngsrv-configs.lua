return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Lua

            lspconfig.lua_ls.setup({})

            -- C/C++/Rust

            lspconfig.clangd.setup({})

            -- Python
            -- TODO     Need to figure out a language server for python, I
            --          can't get pyright to work.

            vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {
                -- NOTE     Type :h for details (e.g. :h lsp.buf.hover)
                noremap = true,
                silent = true,
                desc = "lsp.buf.hover",
            })
            vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {
                noremap = true,
                silent = true,
                desc = "lsp.buf.definition",
            })
            vim.keymap.set({ "n", "v" }, "<leader>lc", vim.lsp.buf.code_action, {
                noremap = true,
                silent = true,
                desc = "lsp.buf.code_action",
            })
        end,
    },
}
