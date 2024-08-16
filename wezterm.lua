-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- config.color_scheme = 'flexoki-dark'
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 16.0
config.front_end = 'OpenGL'
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'

-- and finally, return the configuration to wezterm
return config
