-- ABOUT    Custom State Manipulation API used for saving off state values for
--          persistent loading if/when I should need this (e.g. colorscheme).
--
--          _load_state     private function for reading states.lua and
--                          creating one when it doesn't exist
--          _save_state     private function for saving state values to the
--                          states.lua file.
--          get_value       public function to grab a state from states.lua
--          set_value       public function to set a state in states.lua
--          delete_value    public function for removing a state in states.lua

return {

    -- ------------------------------------------------------------------------
    _load_state = function()
        local states = vim.fn.stdpath('config') .. '/states.lua'
        local state_table = {}

        local ok, loaded_states = pcall(dofile, states)
        if ok and type(loaded_states) == "table" then
            state_table = loaded_states
        else
            vim.notify("No states.lua, creating one.", vim.log.levels.WARN)
            require('plugins.utils.states-utils')._save_state(state_table)
        end

        return state_table
    end,

    -- ------------------------------------------------------------------------
    _save_state = function(state_table)
        local states = vim.fn.stdpath('config') .. '/states.lua'
        local file = io.open(states, "w")
        if file then
            file:write("return " .. vim.inspect(state_table) .. "\n")
            file:close()
        else
            vim.notify("Failed to save to " .. states, vim.log.levels.ERROR)
        end
    end,

    -- ------------------------------------------------------------------------
    get_value = function(key)
        local state_table = require('plugins.utils.states-utils')._load_state()
        return state_table[key]
    end,

    -- ------------------------------------------------------------------------
    set_value = function(key, value)
        local state_table = require('plugins.utils.states-utils')._load_state()
        state_table[key] = value
        require('plugins.utils.states-utils')._save_state(state_table)
    end,

    -- ------------------------------------------------------------------------
    delete_value = function(key)
        local state_table = require('plugins.utils.states-utils')._load_state()
        state_table[key] = nil
        require('plugins.utils.states-utils')._save_state(state_table)
    end,
}

