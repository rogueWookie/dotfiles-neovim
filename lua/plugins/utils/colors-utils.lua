-- NOTE     Friendlier way to adjust colors via keymaps

return {
    set_colorscheme = function(scheme)
        vim.cmd("colorscheme " .. scheme)
    end,

    setup = function()
        vim.api.nvim_set_keymap(
            "n",
            "<leader>cn",
            ":lua require('plugins.utils.colors-utils').set_colorscheme('nord')<CR>",
            { noremap = true, silent = true, desc = "nord dark" }
        )

        vim.api.nvim_set_keymap(
            "n",
            "<leader>cg",
            ":lua require('plugins.utils.colors-utils').set_colorscheme('gruvbox')<CR>",
            { noremap = true, silent = true, desc = "gruvbox dark" }
        )

        vim.api.nvim_set_keymap(
            "n",
            "<leader>cc",
            ":lua require('plugins.utils.colors-utils').set_colorscheme('catppuccin')<CR>",
            { noremap = true, silent = true, desc = "catppuccin frappe" }
        )
    end,
}
