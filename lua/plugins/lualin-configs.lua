-- TODO     Need to find a better way to sync lualine theme to nvim theme
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
                -- theme = "dracula",
            }
        })
    end
}
