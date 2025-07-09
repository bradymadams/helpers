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


vim.cmd("colorscheme dracula")
