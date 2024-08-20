return
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            -- NOTE     I don't think ensure_installed is needed here if I have
            --          auto_install to true ... ?
            auto_install = true,
            highlight = {enable = true},
            indent = {enable = true}
        })
    end
}
