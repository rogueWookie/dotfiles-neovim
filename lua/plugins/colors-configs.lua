return {
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nord").setup({
            })
            vim.cmd("colorscheme nord")
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
            })
            -- vim.cmd("colorscheme gruvbox")
        end
    },
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                -- flavour = "frappe"
            })
            -- vim.cmd("colorscheme catppuccin")
        end,
    },
}
