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

  -- Telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- UI stuff
  { "Mofiqul/dracula.nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-tree/nvim-web-devicons" },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
