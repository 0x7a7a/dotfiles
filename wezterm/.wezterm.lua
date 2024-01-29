-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- window max
-- local mux = wezterm.mux
-- wezterm.on('gui-startup', function(cmd)
--   local tab, pane, window = mux.spawn_window(cmd or {})
--   window:gui_window():maximize()
-- end)

-- font
-- config.font = wezterm.font('Fira Code', { weight = 450, stretch = 'Normal', style = 'Normal' })
config.font = wezterm.font_with_fallback({
  'Hack',
  {
    family = 'JetBrains Mono',
    weight = 'DemiBold',
  },
  {
    family = 'Fira Code',
    weight = 'Medium',
    harfbuzz_features = { 'cv01', 'cv02', 'cv27', 'cv29', 'ss01', 'ss03', 'ss05', 'zero' },
  },
  'PingFang SC',
  'Symbols Nerd Font Mono',
})
config.font_size = 13

-- tab bar
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- window
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

-- others
config.term = 'wezterm'

return config
