local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_workspace = "main"
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

-- Simple file existence check
local function file_exists(path)
  local f = io.open(path, "r")
  if f then
    f:close()
    return true
  end
  return false
end

function find_and_run_workspace_setup(window, pane)
  local workspace_setup_func
  local workspace_setup_file = wezterm.config_dir .. "/.wezterm-workspace-setup.lua"
  if file_exists(workspace_setup_file) then
    local setup_chunk, err = loadfile(workspace_setup_file)
    if not setup_chunk then
      wezterm.log_error("Failed to load " .. workspace_setup_file .. ": " .. err)
    else
      workspace_setup_func = setup_chunk()
      if type(workspace_setup_func) ~= "function" then
        wezterm.log_error(workspace_setup_file .. " did not return a function")
      else
        workspace_setup_func(window, pane)
      end
    end
  else
    wezterm.log_info("No wezterm workspace setup file found at " .. workspace_setup_file)
  end
end

config.keys = {
  -- Workspaces / Sessions
  {
    key = "s",
    mods = "LEADER",
    action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
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
