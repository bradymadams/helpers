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

-- Remap navigation keys
-- 'l' to move left and ';' to move right
--[[
vim.keymap.set('n', 'l', 'h', { noremap = true })
vim.keymap.set('n', ';', 'l', { noremap = true })

vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Enable line numbers with relative numbering
vim.opt.number = true
vim.opt.relativenumber = true
]]
