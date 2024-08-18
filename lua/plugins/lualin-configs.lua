return
{
    "nvim-lualine/lualine.nvim",
    dependencies =
    {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require('lualine').setup({
            options =
            {
                theme = "nord",
                -- Best for catpupuccin
                -- theme = "dracula",
            }
        })
    end
}
