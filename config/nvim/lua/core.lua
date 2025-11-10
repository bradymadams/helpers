-- ~/.config/nvim/lua/core.lua

-- Basic Neovim settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 0
vim.opt.mouse = ""

for i, s in ipairs({ "n", "i" }) do
  vim.keymap.set(s, "<C-h>", ":wincmd h<CR>", { noremap = true })
  vim.keymap.set(s, "<C-j>", ":wincmd j<CR>", { noremap = true })
  vim.keymap.set(s, "<C-k>", ":wincmd k<CR>", { noremap = true })
  vim.keymap.set(s, "<C-l>", ":wincmd l<CR>", { noremap = true })
end

vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

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
  pattern = { "lua", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    vim.bo.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
    vim.bo.shiftwidth = 2 -- Number of spaces used for autoindent
    vim.bo.softtabstop = 2 -- Number of spaces for <Tab> when editing
  end,
})

vim.keymap.set("i", "{}", "{}<Esc>ha<CR><CR><Up><Tab>", { noremap = true })
vim.keymap.set("i", "{};", "{};<Esc>hha<CR><CR><Up><Tab>", { noremap = true })
