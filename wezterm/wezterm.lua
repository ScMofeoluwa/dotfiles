local wezterm = require("wezterm")
local color_scheme = require("color_scheme")
local font = require("font")
local mappings = require("mappings")
local window = require("window")
local shell = require("shell")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

window.update_config(config)
color_scheme.update_config(config)
font.update_config(config)
mappings.update_config(config)
shell.update_config(config)

return config
