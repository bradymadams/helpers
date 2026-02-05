local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_workspace = "~"
config.color_scheme = "Everforest Dark (Gogh)"
config.font_size = 10
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.tab_max_width = 32
config.xcursor_theme = "Yaru" -- https://github.com/wezterm/wezterm/issues/3751
config.font = wezterm.font_with_fallback({
  { family = "Maple Mono Normal NL", weight = "Regular" },
  { family = "JetBrains Mono", weight = "Regular" },
})
config.warn_about_missing_glyphs = false

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

workspace_switcher.get_choices = function(opts)
  -- omits zoxide from workspace_switcher usage
  return workspace_switcher.choices.get_workspace_elements({})
end

workspace_switcher.workspace_formatter = function(label)
  return wezterm.format({
    { Text = "🔷 " .. label },
  })
end

wezterm.on("smart_workspace_switcher.workspace_switcher.chosen", function(window, workspace)
  local gui_win = window:gui_window()
  local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
end)

wezterm.on("update-status", function(window, pane)
  window:set_right_status(window:active_workspace() .. " 🟢")
end)

-- Local setup
local home = os.getenv("HOME")
local devenv = dofile(home .. "/.devenv.lua")

devenv.setup_local_config(config)

function find_and_run_workspace_setup(window, pane)
  devenv.setup_wezterm_workspaces(window, pane)
end

-- Default key mappings
config.leader = {
  key = "a",
  mods = "SUPER",
  timeout_milliseconds = 2000,
}

config.keys = {
  {
    key = "F",
    mods = "LEADER|SHIFT",
    action = wezterm.action.ToggleFullScreen,
  },
  -- Workspaces / Sessions
  {
    key = "w",
    mods = "SUPER",
    --action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
    action = workspace_switcher.switch_workspace(),
  },
  {
    key = "s",
    mods = "SUPER",
    action = workspace_switcher.switch_to_prev_workspace(),
  },
  {
    key = "W",
    mods = "LEADER|SHIFT",
    action = wezterm.action_callback(function(window, pane)
      find_and_run_workspace_setup(window, pane)
    end),
  },
  -- Tab management
  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "o",
    mods = "SUPER",
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = "i",
    mods = "SUPER",
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
    mods = "SUPER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "SUPER",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "h",
    mods = "SUPER",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "l",
    mods = "SUPER",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  -- Vertical split
  {
    -- |
    key = "5",
    mods = "SUPER",
    action = wezterm.action.SplitPane({
      direction = "Right",
      size = { Percent = 50 },
    }),
  },
  -- Horizontal split
  {
    -- -
    key = "'",
    mods = "SUPER",
    action = wezterm.action.SplitPane({
      direction = "Down",
      size = { Percent = 50 },
    }),
  },
}

return config
