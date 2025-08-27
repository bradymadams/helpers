local Path = require("plenary.path")
local config = require("session_manager.config")
require("session_manager").setup({
  sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"),
  autoload_mode = config.AutoloadMode.GitSession,
  autosave_ignore_filetypes = {
    "gitcommit",
    "gitrebase",
  },
  autosave_ignore_buftypes = {},
  load_include_current = true,
})
