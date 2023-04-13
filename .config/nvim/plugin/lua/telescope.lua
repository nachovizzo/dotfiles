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
      initial_mode = "normal",
    },
    find_files = {
      theme = "dropdown",
    }
  },
}
