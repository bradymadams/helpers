require("noice").setup({
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

-- This is to avoid an annoying warning about no background color on the first notification popup
require("notify").setup({
  background_colour = "#000000",
})
