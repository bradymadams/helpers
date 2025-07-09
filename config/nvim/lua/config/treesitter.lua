require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "cpp", "python", "javascript", "typescript", "tsx", "lua", "vim", "bash", "json", "yaml"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      node_decremental = "grm",
    },
  },
})
