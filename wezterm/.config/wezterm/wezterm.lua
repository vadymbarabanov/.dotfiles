local wezterm = require("wezterm")
local config = wezterm.config_builder()

local font = wezterm.font({ family = "Iosevka Fixed" })

config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
    font = font,
    font_size = 16,
}

config.font = font
config.font_size = 18

config.window_padding = { top = 0, right = 0, bottom = 0, left = 0 }

return config
