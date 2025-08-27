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
require("config.sessions")
require("config.statusline")
require("config.telescope")
require("config.treesitter")
require("config.theme")
require("config.diffview")
require("config.undotree")

local home = os.getenv("HOME")
local devenv = dofile(home .. "/.devenv.lua")

-- Detect project name based on ~/dev/$PROJECT/
local cwd = vim.loop.cwd() or ""
local project_name = cwd:match("^" .. home .. "/dev/([^/]+)")
if project_name then
  project_name = project_name:lower()
else
  project_name = ""
end

-- Apply Neovim project-specific settings
devenv.setup_project(project_name, "neovim")
