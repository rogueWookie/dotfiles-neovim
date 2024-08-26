return
{
    'gen740/SmoothCursor.nvim',
    config = function()
        require('smoothcursor').setup({
            fancy =
            {
                enable = true,
                body =
                {
                    {cursor = "●", texthl = "SmoothCursorAqua"},
                    {cursor = "●", texthl = "SmoothCursorAqua"},
                    {cursor = "•", texthl = "SmoothCursorAqua"},
                    {cursor = ".", texthl = "SmoothCursorAqua"},
                    {cursor = ".", texthl = "SmoothCursorAqua"}
                }
            }
        })
    end
}
