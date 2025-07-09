-- ~/.config/nvim/lua/core.lua

-- Basic Neovim settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 0

-- Remap navigation keys
-- 'l' to move left and ';' to move right
vim.keymap.set("n", "l", "h", { noremap = true })
vim.keymap.set("n", ";", "l", { noremap = true })

vim.g.mapleader = " "

--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Shortcuts to view diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Autocmd: reload file if changed outside
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})
