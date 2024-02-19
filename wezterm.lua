-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- config.color_scheme = 'Builtin Pastel Dark'
config.color_scheme = 'Broadcast'
config.font = wezterm.font 'Inconsolata Nerd Font Mono'
config.font_size = 28.0

-- and finally, return the configuration to wezterm
return config
