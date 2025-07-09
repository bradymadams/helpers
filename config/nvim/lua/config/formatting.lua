local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- C++ formatting with clang-format
    null_ls.builtins.formatting.clang_format,
    -- Python formatting and linting
    --null_ls.builtins.formatting.black,
    --null_ls.builtins.diagnostics.ruff,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
