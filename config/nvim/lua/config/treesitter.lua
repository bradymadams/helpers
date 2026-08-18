require("nvim-treesitter").install({
  "c",
  "cpp",
  "python",
  "javascript",
  "typescript",
  "tsx",
  "lua",
  "vim",
  "bash",
  "json",
  "yaml",
  "terraform",
  "pug",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "c",
    "cpp",
    "python",
    "javascript",
    "typescript",
    "typescriptreact",
    "lua",
    "vim",
    "bash",
    "sh",
    "json",
    "yaml",
    "terraform",
    "pug",
  },
  callback = function()
    vim.treesitter.start()
  end,
})

local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")

-- Selection Keymaps (Visual & Operator-pending modes)
vim.keymap.set({ "x", "o" }, "ff", function()
  select.select_textobject("@function.outer", "textobjects")
end, { desc = "Select outer function" })

vim.keymap.set({ "x", "o" }, "ip", function()
  select.select_textobject("@parameter.inner", "textobjects")
end, { desc = "Select inner parameter" })

--
-- Move between classes
--
vim.keymap.set({ "n", "x", "o" }, "]c", function()
  move.goto_next_start("@class.outer", "textobjects")
end, { desc = "Next class start" })

vim.keymap.set({ "n", "x", "o" }, "[c", function()
  move.goto_previous_start("@class.outer", "textobjects")
end, { desc = "Previous class start" })

vim.keymap.set({ "n", "x", "o" }, "]C", function()
  move.goto_next_end("@class.outer", "textobjects")
end, { desc = "Next class end" })

vim.keymap.set({ "n", "x", "o" }, "[C", function()
  move.goto_previous_end("@class.outer", "textobjects")
end, { desc = "Previous class end" })

--
-- Move between functions
--
vim.keymap.set({ "n", "x", "o" }, "]f", function()
  move.goto_next_start("@function.outer", "textobjects")
end, { desc = "Next function start" })

vim.keymap.set({ "n", "x", "o" }, "[f", function()
  move.goto_previous_start("@function.outer", "textobjects")
end, { desc = "Previous function start" })

vim.keymap.set({ "n", "x", "o" }, "]F", function()
  move.goto_next_end("@function.outer", "textobjects")
end, { desc = "Next function end" })

vim.keymap.set({ "n", "x", "o" }, "[F", function()
  move.goto_previous_end("@function.outer", "textobjects")
end, { desc = "Previous function end" })

--
-- Move between parameters
--
vim.keymap.set({ "n", "x", "o" }, "[p", function()
  move.goto_previous_start("@parameter.inner", "textobjects")
end, { desc = "Previous parameter start" })

vim.keymap.set({ "n", "x", "o" }, "]p", function()
  move.goto_next_start("@parameter.inner", "textobjects")
end, { desc = "Next parameter start" })

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99
