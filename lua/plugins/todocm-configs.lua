return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        keywords = { ABOUT = {icon="", color="info"}},
        highlight = {
            pattern = [[.*<(KEYWORDS)\s*]],
        },
    },
}
