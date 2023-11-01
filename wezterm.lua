local wezterm = require('wezterm')

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

--config.color_scheme = 'AdventureTime'
config.color_scheme = 'Rosé Pine Moon (Gogh)'
config.force_reverse_video_cursor = true


config.window_frame = {
    font = wezterm.font { family = 'Roboto', weight = 'Bold' },
    font_size = 12.0,
}

--config.window_background_opacity = 0.95

--config.font = wezterm.font('JetBrainsMono Nerd Font')
--config.font = wezterm.font('FiraCode Nerd Font Mono')
config.font = wezterm.font_with_fallback({
    'JetBrainsMono Nerd Font',
    --'Noto Color Emoji',
    'Segoe UI Symbol',
})
config.font_size = 12.0
config.default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' }
config.adjust_window_size_when_changing_font_size = false
config.audible_bell = 'Disabled'
config.hide_tab_bar_if_only_one_tab = true
config.use_dead_keys = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

return config
