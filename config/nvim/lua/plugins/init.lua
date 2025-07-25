-- ~/.config/nvim/lua/plugins/init.lua

return {
  -- LSP Support
  { "neovim/nvim-lspconfig" },

  -- JS/TS LSP
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup({})
    end,
  },

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

  -- Telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- UI stuff
  { "Mofiqul/dracula.nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-tree/nvim-web-devicons" },
}
