return {
	"echasnovski/mini.surround",
	opts = {
		custom_surroundings = nil,
		highlight_duration = 500,
		mappings = {
			add = "gsa", -- [g]o [s]urround [a]dd
			delete = "gsd", -- [g]o [s]urround [d]elete
			find = "gsf", -- [g]o [s]urround [f]ind (right)
			find_left = "gsF", -- [g]o [s]urround [F]ind (left)
			highlight = "gsh", -- [g]o [s]urround [h]ighlight
			replace = "gsr", -- [g]o [s]urround [r]eplace
			update_n_lines = "gsn", -- [g]o [s]urround [n] lines

			suffix_last = "l", -- Suffix to search with "prev" method
			suffix_next = "n", -- Suffix to search with "next" method
		},
		n_lines = 20,
		respect_selection_type = false,
		search_method = "cover",
		silent = false,
	},
}
