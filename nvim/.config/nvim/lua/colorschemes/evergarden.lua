return {
  'comfysage/evergarden',
  -- enalbed = false,
  lazy = true,
  priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
  opts = {
    transparent_background = false,
    contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
    overrides = {}, -- add custom overrides
  },
}
