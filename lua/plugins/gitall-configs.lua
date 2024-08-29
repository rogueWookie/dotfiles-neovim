return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()
        vim.keymap.set("n", "<leader>gd", ":Gitsigns preview_hunk_inline<CR>", {
            noremap = true,
            silent = true,
            desc = "diff",
        })
        vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {
            noremap = true,
            silent = true,
            desc = "blame",
        })
    end,
}
