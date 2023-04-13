local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
	},
	pickers = {
		live_grep = {
			prompt_prefix = "🔍 ",
		},
		grep_string = {
			initial_mode = "normal",
			results_title = false,
			prompt_title = false,
			previewer_title = false,
		},
		find_files = {
			theme = "dropdown",
			prompt_title = "",
			previewer = false,
			prompt_prefix = "Files> ",
			layout_config = {
				width = 0.8,
				height = 0.8,
			},
		},
	},
})
