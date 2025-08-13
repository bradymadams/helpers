local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Dracula"
--config.font = wezterm.font('Fira Code')
config.font_size = 10
config.window_background_opacity = 0.9
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_max_width = 32

config.leader = {
  key = "a",
  mods = "CTRL",
  timeout_milliseconds = 2000,
}

config.keys = {
  -- Workspaces / Sessions
  {
    key = "s",
    mods = "LEADER",
    action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
  },
  -- Tab management
  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "n",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = "p",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = "z",
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState,
  },
  -- Pane management
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = ";",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  -- Vertical split
  {
    -- |
    key = "%",
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitPane({
      direction = "Right",
      size = { Percent = 50 },
    }),
  },
  -- Horizontal split
  {
    -- -
    key = '"',
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitPane({
      direction = "Down",
      size = { Percent = 50 },
    }),
  },
}

return config
