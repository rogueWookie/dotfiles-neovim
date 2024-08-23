return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({

            -- TODO     Go figure out if "ensure_installed" has any value if
            --          if "auto_install" is defined.

            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
