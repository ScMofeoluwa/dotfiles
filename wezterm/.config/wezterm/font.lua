local wezterm = require("wezterm")

local M = {}

function M.update_config(config)
	config.line_height = 1.3
	config.cell_width = 1
	config.font = wezterm.font_with_fallback({
		{
			family = "OperatorMonoLig Nerd Font",
			-- family = "GeistMono Nerd Font",
			weight = "Regular",
		},
	})
	config.font_size = 12
end

return M
