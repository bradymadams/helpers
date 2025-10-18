-- ~/.config/nvim/lua/plugins/init.lua

return {
  -- LSP Support
  { "neovim/nvim-lspconfig" },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "ray-x/lsp_signature.nvim" },
  { "L3MON4D3/LuaSnip" },

  -- Formatting and linting
  { "nvimtools/none-ls.nvim" },

  -- Treesitter for syntax highlighting and parsing
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },

  -- Telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Undotree
  { "mbbill/undotree" },

  -- Session management
  { "Shatur/neovim-session-manager" },

  -- UI stuff
  { "sindrets/diffview.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  {
    "folke/noice.nvim",
    --  event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
