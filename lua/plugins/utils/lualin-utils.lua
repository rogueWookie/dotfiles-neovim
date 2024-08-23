-- NOTE     Friendlier way to adjust lualine colors via keymaps

return {
    set_colorscheme = function(scheme)
        require("lualine").setup({
            options = {
                theme = scheme,
            },
        })
    end,

    setup = function()

        vim.api.nvim_set_keymap(
            "n",
            "<leader>un",
            ":lua require('plugins.utils.lualin-utils').set_colorscheme('nord')<CR>",
            { noremap = true, silent = true, desc = "nord dark" }
        )

        vim.api.nvim_set_keymap(
            "n",
            "<leader>ug",
            ":lua require('plugins.utils.lualin-utils').set_colorscheme('gruvbox')<CR>",
            { noremap = true, silent = true, desc = "gruvbox dark" }
        )

        vim.api.nvim_set_keymap(
            "n",
            "<leader>uc",
            ":lua require('plugins.utils.lualin-utils').set_colorscheme('dracula')<CR>",
            { noremap = true, silent = true, desc = "catppuccin frappe" }
        )
    end,
}
