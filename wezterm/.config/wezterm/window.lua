local M = {}

function M.update_config(config)
	config.initial_rows = 40
	config.initial_cols = 140

	config.scrollback_lines = 10000
	config.enable_tab_bar = false
	config.use_fancy_tab_bar = true
	config.tab_bar_at_bottom = true
	config.hide_tab_bar_if_only_one_tab = true
	config.show_tab_index_in_tab_bar = false
	config.show_new_tab_button_in_tab_bar = true
	config.show_close_tab_button_in_tabs = true
	config.tab_max_width = 50
	config.window_decorations = "RESIZE"
	config.audible_bell = "Disabled"
	config.window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 20,
	}
end

return M
