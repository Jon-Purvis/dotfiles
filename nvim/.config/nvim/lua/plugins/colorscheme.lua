-- ~/.config/nvim/lua/plugins/theme.lua

return {
	-- Keep these if you like their specific implementations, or if they don't have a direct Base16 equivalent
	{
		"vim-scripts/newsprint.vim",
	},
	{
		"slugbyte/lackluster.nvim",
	},
	{
		"vim-scripts/zenesque.vim",
	},
	{
		"jaredgorski/fogbell.vim",
	},
	{
		"oahlen/iceberg.nvim",
	},
	{
		"Skardyy/makurai-nvim",
	},
	{
		"blazkowolf/gruber-darker.nvim",
		opts = {
			bold = false,
		},
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- config = function()
		--   require("zenbones").setup({
		--     italics = false,
		--   })
		-- end,
	},
	{
		"jnurmine/Zenburn",
	},

	-- Keep Kanagawa, as it's not a Base16 theme
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				compile = true,
				transparent = true,
				overrides = function(colors)
					local palette = colors.palette
					return {
						["@markup.link.url.markdown_inline"] = { link = "Special" },
						["@markup.link.label.markdown_inline"] = { link = "WarningMsg" },
						["@markup.italic.markdown_inline"] = { link = "Exception" },
						["@markup.raw.markdown_inline"] = { link = "String" },
						["@markup.list.markdown"] = { link = "Function" },
						["@markup.quote.markdown"] = { link = "Error" },
						["@markup.list.checked.markdown"] = { link = "WarningMsg" },
						EndOfBuffer = { link = "Normal" },
						LineNr = { fg = palette.grey, bg = "none" },
						SignColumn = { bg = "none" },
					}
				end,
			})
			-- vim.cmd("colorscheme kanagawa-dragon")
		end,
		build = function()
			vim.cmd("KanagawaCompile")
		end,
	},

	-- Keep Vague.nvim as its configuration is quite specific
	{
		"vague2k/vague.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("vague").setup({
				transparent = true,
				-- Merge the detailed style/color options here if desired
			})
			-- vim.cmd("colorscheme vague")
		end,
	},

	-- Keep Black Metal Theme as its configuration is quite specific
	{
		"metalelf0/black-metal-theme-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("black-metal").setup({
				theme = "taake",
				variant = "dark",
				-- Merge the code_style overrides here if desired
			})
			require("black-metal").load()
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
			-- vim.cmd("colorscheme black-metal-taake")
		end,
	},

	-- Keep Base16, and use it for Nord, Gruvbox, etc.
	{
		"RRethy/base16-nvim",
		lazy = true, -- Or false if you want it to always load all base16 schemes
		priority = 1000,
		-- config = function()
		--   -- Optional: Set a default base16 theme here if you wish
		--   -- vim.cmd("colorscheme base16-nord")
		-- end,
	},
}
