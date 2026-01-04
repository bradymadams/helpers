require("lualine").setup({
  options = {
    theme = "everforest",
    section_separators = "",
    component_separators = "|",
    icons_enabled = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { { "filename", path = 1 }, "diff", "diagnostics" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})

--
-- Usage of Lualine doesn't show notifications about macro recordings, so
-- the below shows those notifications via vim.notify
--

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    local msg = string.format("Register: %s", vim.fn.reg_recording())
    _MACRO_RECORDING_STATUS = true
    vim.notify(msg, vim.log.levels.INFO, {
      title = "Macro Recording",
      keep = function()
        return _MACRO_RECORDING_STATUS
      end,
    })
  end,
  group = vim.api.nvim_create_augroup("NoiceMacroNotfication", { clear = true }),
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    local msg = string.format("Finished recording: %s", vim.fn.reg_recording())
    _MACRO_RECORDING_STATUS = false
    vim.notify(msg, vim.log.levels.INFO, {
      title = "Macro Recording",
      timeout = 2000,
    })
  end,
  group = vim.api.nvim_create_augroup("NoiceMacroNotficationDismiss", { clear = true }),
})
