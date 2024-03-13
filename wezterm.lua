-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- config.color_scheme = 'flexoki-dark'
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'Inconsolata'
config.font_size = 20.0

-- and finally, return the configuration to wezterm
return config
