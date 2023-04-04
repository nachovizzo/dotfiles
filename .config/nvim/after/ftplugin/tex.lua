-- Make it white
vim.api.nvim_command("colorscheme xcodelight")

-- Some stuff, like disabling the bar and enabling spell check
vim.opt.textwidth= 0
vim.opt.colorcolumn= ""
vim.opt.spell = true

-- vimtex options
vim.g.vimtex_imaps_enabled = false
vim.g.vimtex_quickfix_open_on_warning = false
