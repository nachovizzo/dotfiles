-- Buffer line setup
require'bufferline'.setup{
	options = {
    indicator = { style = 'icon', icon = ' '},
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    close_command = "bdelete %d",
    right_mouse_command = "bdelete! %d",
    left_trunc_marker = '',
    right_trunc_marker = '',
    offsets = {{filetype = "NvimTree", text = "EXPLORER", text_align = "center"}},
    show_tab_indicators = true,
    show_close_icon = false
	},
}
