local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- Setup with defaults
require("telescope").setup({
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    -- optional extra filters
    file_ignore_patterns = { "node_modules/", "%.git/", "dist/", "build/", ".venv/", "3rd/" },
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

function doc_symbols()
  builtin.lsp_document_symbols({ symbol_width = 60, ignore_symbols = { "field", "namespace", "property", "variable" } })
end

function workspace_symbols()
  builtin.lsp_dynamic_workspace_symbols({ symbol_width = 60 })
end

-- Load Telescope built-in pickers with keymaps
local keymap = vim.keymap.set

keymap("n", "<leader>ff", builtin.git_files, { desc = "Find files (git only)" })
keymap("n", "<leader>fF", builtin.find_files, { desc = "Find files" })
keymap("n", "<leader>fg", builtin.live_grep, { desc = "Grep files" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "List open buffers" })
keymap("n", "<leader>fd", builtin.diagnostics, { desc = "Show diagnostics" })
keymap("n", "<leader>fr", builtin.lsp_references, { desc = "LSP references" })
keymap("n", "<leader>fo", doc_symbols, { desc = "Document symbols" })
keymap("n", "<leader>fw", workspace_symbols, { desc = "Workspace symbols" })
