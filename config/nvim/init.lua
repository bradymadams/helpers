-- Remap navigation keys
-- 'l' to move left and ';' to move right
vim.keymap.set('n', 'l', 'h', { noremap = true })
vim.keymap.set('n', ';', 'l', { noremap = true })

vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Enable line numbers with relative numbering
vim.opt.number = true
vim.opt.relativenumber = true
