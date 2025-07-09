require("lsp_signature").setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered
  floating_window = true,
  floating_window_above_cur_line = true,
  hint_enable = true,
  hint_prefix = "⏩️ ", -- fancy prefix for hints
  handler_opts = {
    border = "rounded",
  },
  max_height = 12,
  max_width = 80,
})
