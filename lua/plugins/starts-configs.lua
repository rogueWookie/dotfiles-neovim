return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local alpha = require("alpha")
        local dashb = require("alpha.themes.dashboard")
        dashb.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "  ... this is the way!                               ",
        }
        dashb.section.buttons.val = {
            dashb.button("q", "󰩈  > Quit NVIM", ":qa<CR>"),
            dashb.button("t", "  > Neotree", ":Neotree filesystem reveal left<CR>"),
            dashb.button("n", "  > New file", ":ene <BAR> startinsert<CR>"),
            dashb.button("f", "  > Find file", ":Telescope find_files<CR>"),
            dashb.button("g", "  > Live grep", ":Telescope live_grep<CR>"),
        }

        local ver = vim.version()
        dashb.section.footer.val = {
            "Neovim Version: " .. ver.major .. "." .. ver.minor .. "." .. ver.patch,
        }
        alpha.setup(dashb.opts)
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
