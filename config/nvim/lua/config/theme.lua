require("dracula").setup({
  transparent_bg = true,
})

vim.cmd.colorscheme("dracula")

-- customize diffview highlight groups
vim.cmd([[
  highlight DiffAdd guifg=none guibg=#47593d
  highlight DiffChange guifg=none guibg=none
  highlight DiffDelete guifg=none guibg=#593d47
  highlight DiffText guifg=none guibg=#44475A
]])

vim.o.cursorline = true
vim.o.cursorcolumn = true

vim.cmd("highlight CursorLine guibg=#202020")
vim.cmd("highlight CursorColumn guibg=#202020")
