local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Dracula'
--config.font = wezterm.font('Fira Code')
config.font_size = 10

return config
