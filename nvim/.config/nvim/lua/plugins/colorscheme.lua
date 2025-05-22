return {
	-- Kanagawa (default)
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

	-- Vague.nvim
	-- Lazy
	{
		"vague2k/vague.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("vague").setup({
				transparent = true,
			})
			-- vim.cmd("colorscheme vague")
		end,
	},

	-- Black Metal Theme (Gorgoroth)
	{
		"metalelf0/black-metal-theme-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("black-metal").setup({
				theme = "taake",
				variant = "dark",
			})
			require("black-metal").load()
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
		end,
	},
}
