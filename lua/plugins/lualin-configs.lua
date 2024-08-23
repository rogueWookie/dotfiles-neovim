return
{
    "nvim-lualine/lualine.nvim",
    dependencies =
    {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local lua_utils = require("plugins.utils.lualin-utils")
        lua_utils.setup()

        require('lualine').setup({
            options =
            {
                theme = "nord"
            }
        })
    end
}
