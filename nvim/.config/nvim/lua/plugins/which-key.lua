return {
    "folke/which-key.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
        delay = 600,
        plugins = {
            marks = true,
            registers = true,

            spelling = {
                enabled = true,
                suggestions = 10,
            },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "buffer local keymaps (which-key)",
        },
    },
}
