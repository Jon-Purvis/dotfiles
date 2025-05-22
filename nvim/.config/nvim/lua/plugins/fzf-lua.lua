return {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    opts = {},
    keys={
        {
            "<leader>ff",
            function() 
                require('fzf-lua').files() 
            end,
            desc="Find Files in project directory"
        },
        {
            "<leader><leader>",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "[\" \"] Find existing buffers",
        },
        {
            "<leader>fg",
            function() 
                require('fzf-lua').live_grep() 
            end,
            desc="Find by grepping in project directory"
        },

        -- weird workaround solution to have fzf-lua.files run directly after fzf-lua.zoxide
        {
            "<leader>fd",
            function()
                require("fzf-lua").zoxide({
                    actions = {
                        ["default"] = function(selected)
                            local dir = selected[1]:match("%d+%.?%d*%s+(.+)")
                            vim.cmd("cd " .. dir)
                            require("fzf-lua").files({ cwd = dir })
                        end
                    }
                })
            end,
            desc = "Find file in recently used directory"
        },

        {
            "<leader>fc",
            function() require('fzf-lua').files({cwd=vim.fn.stdpath("config")}) end,
            desc="Find in neovim configuration"
        },
        {
            "<leader>fk",
            function()
                require("fzf-lua").keymaps()
            end,
            desc = "[F]ind [K]eymaps",
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").builtin()
            end,
            desc = "[F]ind builtin FZF ([E]xtra pickers)",
        }
    }
}
