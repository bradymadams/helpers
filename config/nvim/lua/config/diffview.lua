require("diffview").setup({
  --[[
        Setting this to true results in additions only highlighting the bg on the new file
        and deletions only highlighting the bg on the old file.
    ]]
  enhanced_diff_hl = true,
})

local keymap = vim.keymap.set

keymap("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "Diffview open" })
keymap("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Diffview close" })
keymap("n", "<leader>df", "<cmd>DiffviewToggleFiles<CR>", { desc = "Diffview toggle files" })
keymap("n", "<leader>dh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview file history" })
