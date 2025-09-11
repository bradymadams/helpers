require("nvim-treesitter.configs").setup({
  ensure_installed = {
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
  textobjects = {
    move = {
      enable = true,
      set_jumps = false,
      goto_next_start = {
        ["]p"] = "@parameter.inner",
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]C"] = "@class.outer",
      },
      goto_previous_start = {
        ["[p"] = "@parameter.inner",
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[C"] = "@class.outer",
      },
    },
    select = {
      enable = true,
      lookahead = true,
      selection_modes = {
        ["@parameter.inner"] = "v",
      },
      keymaps = {
        ["ff"] = "@function.outer",
        ["ip"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = true,
      floating_preview_opts = {
        border = "rounded",
      },
      peek_definition_code = {
        ["<leader>pf"] = "@function.outer",
      },
    },
  },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99
