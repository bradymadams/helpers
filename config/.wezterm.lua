local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_workspace = "~"
config.color_scheme = "Dracula"
config.font_size = 10
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.tab_max_width = 32
config.xcursor_theme = "Yaru" -- https://github.com/wezterm/wezterm/issues/3751

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
  mods = "CTRL",
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
    key = "s",
    mods = "LEADER",
    --action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
    action = workspace_switcher.switch_workspace(),
  },
  {
    key = "s",
    mods = "CTRL",
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
