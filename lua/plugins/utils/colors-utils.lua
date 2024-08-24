-- ABOUT    Custom Colorscheme Toggling use for implementing key mappings for 
--          changing the colorscheme and updating states.lua. All key maps are
--          then assigned to a group so whichkey can play a role.
--
--          set_colorscheme     Calls into our custom state manipulation api to
--                              set a colorscheme that has been passed in.
--          load_colorscheme    Attempts to load a colorscheme using custom 
--                              state manipulation api, if there's an error, it
--                              defaults to using the nord colorscheme
--          setup               Called by colors-configs.lua such that key maps
--                              are setup and ready to use.

local states_utils = require('plugins.utils.states-utils')
return {

    -- ------------------------------------------------------------------------
    set_colorscheme = function(scheme)
        vim.cmd("colorscheme " .. scheme)
        states_utils.set_value("colorscheme", scheme)
    end,

    load_colorscheme = function()
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                local color = states_utils.get_value("colorscheme") or "nord"
                vim.cmd("colorscheme " .. color)
            end
        })
    end,

    setup = function()
        local utils = require('plugins.utils.colors-utils')
        utils.load_colorscheme()

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

