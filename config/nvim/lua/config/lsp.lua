-- Setup LSP servers for Python, TypeScript, and C++
local lspconfig = require("lspconfig")

-- Attach function to set keymaps and capabilities
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  local keymap = vim.keymap.set
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

-- Common capabilities (optional: for completion integration)
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Python (using pyright)
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

--[[
-- TypeScript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
]]

-- C++ (using clangd)
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
