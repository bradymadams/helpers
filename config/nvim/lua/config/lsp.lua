-- Setup LSP servers for Python, TypeScript, and C++

-- Attach function to set keymaps and capabilities
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  local keymap = vim.keymap.set
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)

  --[[ See formatting.lua
  keymap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
  ]]
end

-- Common capabilities (optional: for completion integration)
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Python (using pyright)
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("ruff", {
  init_options = {
    settings = {
      logLevel = "error",
    },
  },
})

-- C++ (using clangd)
local clangd_on_attach = vim.lsp.config["clangd"].on_attach

vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    clangd_on_attach(client, bufnr)
    on_attach(client, bufnr)
    local keymap = vim.keymap.set
    -- Switch between source and header in C++ files
    keymap("n", "<leader>h", "<Cmd>LspClangdSwitchSourceHeader<CR>", { buffer = bufnr })
  end,
  capabilities = capabilities,
})

-- JS/TS
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("eslint", {})

vim.lsp.config("terraformls", {})

vim.lsp.enable({ "pyright", "ruff", "clangd", "ts_ls", "eslint", "terraformls" })
