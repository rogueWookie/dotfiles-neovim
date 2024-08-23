return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({

            -- NOTE     Unmap <space> so that whichkey will work in neo-tree.
            --          Because <space> defaults to toggle node but <enter> 
            --          still achieves toggle node we don't lose anything of
            --          value.

            window = {
                mappings = {
                    ["<space>"] = "none",
                },
            },
        })

        vim.keymap.set("n", "<leader>nt", ":Neotree filesystem reveal left<CR>", {
            noremap = true,
            silent = true,
            desc = "Open Neotree",
        })

        vim.keymap.set("n", "<leader>ne", ":Neotree close<CR>", {
            noremap = true,
            silent = true,
            desc = "Close Neotree",
        })
    end,
}
