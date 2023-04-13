local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  pickers = {
    grep_string = {
			prompt_prefix = "🔍 ",
      initial_mode = "normal",
    },
    find_files = {
      theme = "dropdown",
      prompt_title = '';
      previewer = false,
      prompt_prefix = 'Files> ';
      layout_config = {
        width = 0.8,
      },
    }
  },
}
