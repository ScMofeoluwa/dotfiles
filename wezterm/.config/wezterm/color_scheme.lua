local wezterm = require("wezterm")

local M = {}

function M.update_config(config)
	config.colors = {
		foreground = '#ffffff',
		background = '#101010',

		cursor_bg = '#ffffff',
		cursor_fg = '#101010',
		cursor_border = '#ffffff',

		selection_fg = '#101010',
		selection_bg = '#ffffff',

		ansi = {
			'#101010',
			'#f5a191',
			'#90b99f',
			'#e6b99d',
			'#aca1cf',
			'#e29eca',
			'#ea83a5',
			'#a0a0a0',
		},

		brights = {
			'#7e7e7e',
			'#ff8080',
			'#99ffe4',
			'#ffc799',
			'#b9aeda',
			'#ecaad6',
			'#f591b2',
			'#ffffff',
		},

		tab_bar = {
			background = '#101010',
			active_tab = {
				bg_color = '#1a1a1a',
				fg_color = '#ffffff',
				intensity = 'Normal',
			},
			inactive_tab = {
				bg_color = '#101010',
				fg_color = '#7e7e7e',
			},
			inactive_tab_hover = {
				bg_color = '#1a1a1a',
				fg_color = '#a0a0a0',
			},
			new_tab = {
				bg_color = '#101010',
				fg_color = '#7e7e7e',
			},
			new_tab_hover = {
				bg_color = '#1a1a1a',
				fg_color = '#ffffff',
			},
		},
	}

	config.window_frame = {
		font = wezterm.font('OperatorMonoLig Nerd Font'),
		font_size = 12,
		active_titlebar_bg = '#101010',
		inactive_titlebar_bg = '#101010',
	}
end

return M
