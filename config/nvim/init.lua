-- Remap navigation keys
-- 'l' to move left and ';' to move right
vim.keymap.set('n', 'l', 'h', { noremap = true })
vim.keymap.set('n', ';', 'l', { noremap = true })

vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.winhl = "CursorLine:CursorLine,CursorColumn:CursorColumn"
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3a3a3a" })    -- 243 in cterm colors
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#3a3a3a" })  -- 243 in cterm colors

-- Enable line numbers with relative numbering
vim.opt.number = true
vim.opt.relativenumber = true
