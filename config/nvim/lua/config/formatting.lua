local null_ls = require("null-ls")
local methods = require("null-ls.methods")
local helpers = require("null-ls.helpers")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1286
local function ruff_formatter()
  return helpers.make_builtin({
    name = "ruff",
    meta = {
      url = "https://github.com/charliermarsh/ruff/",
      description = "An extremely fast Python linter, written in Rust.",
    },
    method = methods.internal.FORMATTING,
    filetypes = { "python" },
    generator_opts = {
      command = "ruff",
      --args = { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" },
      args = { "format", "-n", "--stdin-filename", "$FILENAME", "-" },
      to_stdin = true,
    },
    factory = helpers.formatter_factory,
  })
end

null_ls.setup({
  sources = {
    -- C++ formatting with clang-format
    null_ls.builtins.formatting.clang_format,
    -- Python formatting and linting
    ruff_formatter(),
    --null_ls.builtins.formatting.ruff,
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
