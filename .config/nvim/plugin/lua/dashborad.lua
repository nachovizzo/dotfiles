require("dashboard").setup({
	theme = "hyper",
	config = {
		shortcut = {
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Config",
				action = "e ~/.config/nvim/init.vim",
				key = "e",
			},
			{
				desc = " Last",
				action = ":edit #<1",
				key = "o",
			},
			{
				desc = " Apps",
				group = "DiagnosticHint",
				action = "Telescope app",
				key = "a",
			},
			{
				desc = " dotfiles",
				group = "Number",
				action = "Telescope dotfiles",
				key = "d",
			},
		},
	},
})
