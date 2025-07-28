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
vim.opt.mouse = ""

-- Remap navigation keys
-- 'l' to move left and ';' to move right
for i, s in ipairs({ "n", "v", "o" }) do
  vim.keymap.set(s, "l", "h", { noremap = true })
  vim.keymap.set(s, ";", "l", { noremap = true })
  vim.keymap.set(s, "<C-w>l", "<C-w>h", { noremap = true })
  vim.keymap.set(s, "<C-w>;", "<C-w>l", { noremap = true })
end

vim.keymap.set("n", "-", ":bprevious<CR>", { noremap = true })
vim.keymap.set("n", "=", ":bnext<CR>", { noremap = true })

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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    vim.bo.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
    vim.bo.shiftwidth = 2 -- Number of spaces used for autoindent
    vim.bo.softtabstop = 2 -- Number of spaces for <Tab> when editing
  end,
})

-- Switch between source and header in C++ files
vim.keymap.set("n", "<leader>h", "<Cmd>ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
