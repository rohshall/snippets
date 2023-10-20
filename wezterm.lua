-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = wezterm.config_builder()
config.color_scheme = 'Banana Blueberry'
config.font = wezterm.font 'Inconsolata Nerd Font Mono'
config.font_size = 16.0

-- and finally, return the configuration to wezterm
return config
