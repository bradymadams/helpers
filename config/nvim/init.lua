-- Remap navigation keys
-- 'l' to move left and ';' to move right
vim.keymap.set('n', 'l', 'h', { noremap = true })
vim.keymap.set('n', ';', 'l', { noremap = true })

-- Enable line numbers with relative numbering
vim.opt.number = true      -- Show current line number
vim.opt.relativenumber = true  -- Show relative line numbers
