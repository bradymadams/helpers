local telescope = require("telescope")

-- Setup with defaults
require("telescope").setup({
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    -- optional extra filters
    file_ignore_patterns = { "node_modules", "%.git/", "dist", "build", ".venv" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob",
      "!.git/",
    },
    find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--exclude", ".git" },
  },
})

-- Load Telescope built-in pickers with keymaps
local keymap = vim.keymap.set

keymap("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find files" })
keymap("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Grep files" })
keymap("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "List open buffers" })
keymap("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "Show diagnostics" })
keymap("n", "<leader>fr", require("telescope.builtin").lsp_references, { desc = "LSP references" })
keymap("n", "<leader>fo", require("telescope.builtin").lsp_document_symbols, { desc = "Document symbols" })
keymap("n", "<leader>fw", require("telescope.builtin").lsp_workspace_symbols, { desc = "Workspace symbols" })
