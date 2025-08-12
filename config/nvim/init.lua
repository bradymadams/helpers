-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("core")
require("lazy").setup("plugins")
require("config.lsp")
require("config.completion")
require("config.lsp_signature")
require("config.formatting")
require("config.statusline")
require("config.telescope")
require("config.treesitter")
require("config.theme")
require("config.diffview")

-- Last step is to load a project specific lua module, if requested
-- This checks for a module path by first checking $NVIM_MODULE_PATH
-- If that isn't set then the presence of a .lua directory is checked.
-- Then the presence of init.lua in the module dir is checked and if it exists
-- it is loaded and if a setup() function exists, it is called.
local uv = vim.uv or vim.loop -- Neovim compatibility: `vim.uv` for newer versions, fallback to `vim.loop`

-- 1. Determine module path
local project_init = vim.env.NVIM_MODULE_PATH

-- 2. Fallback: if .lua/ exists in the current directory, use that
if not project_init or project_init == "" then
  local cwd = uv.cwd()
  local dot_lua_path = cwd .. "/.lua"
  local stat = uv.fs_stat(dot_lua_path)
  if stat and stat.type == "directory" then
    project_init = dot_lua_path
  end
end

-- 3. If we found a valid module path, update package.path and try to load init.lua
if project_init and project_init ~= "" then
  -- Add to Lua module search path
  package.path = project_init .. "/?.lua;" .. project_init .. "/?/init.lua;" .. package.path

  -- Try to require 'init' from the module path
  local ok, proj = pcall(require, "init")
  if not ok then
    vim.notify("Failed to require 'init' from " .. project_init .. ": " .. proj, vim.log.levels.ERROR)
  elseif type(proj) == "table" and type(proj.setup) == "function" then
    local ok2, err = pcall(proj.setup)
    if not ok2 then
      vim.notify("Error running init.setup(): " .. err, vim.log.levels.ERROR)
    end
  else
    vim.notify("init.lua loaded but no setup() function found", vim.log.levels.WARN)
  end
end
