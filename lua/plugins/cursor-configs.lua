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
                    {cursor = "●", texthl = "SmoothCursorOrange"},
                    {cursor = "●", texthl = "SmoothCursorOrange"},
                    {cursor = "•", texthl = "SmoothCursorOrange"},
                    {cursor = ".", texthl = "SmoothCursorOrange"},
                    {cursor = ".", texthl = "SmoothCursorOrange"}
                }
            }
        })
    end
}
