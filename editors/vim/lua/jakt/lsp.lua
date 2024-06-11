-- Set per Neovim *instance*, so that opening another Jakt file (buffer)
-- in the same instance reuses the already spawned client.
local function setup(config)
    local server_path = "Build/bin/jakt" -- default for build directory
    if config ~= nil and config.server_path ~= nil then
        server_path = config.server_path
    end

  local ls_path = vim.fn.resolve(server_path)
  local is_file_readable = vim.fn.filereadable(ls_path) ~= 0

  if not is_file_readable then
      -- NOTE: We use a starting `\n` because currently Neovim displays
      -- this warning with some indent. This newline serves a workaround.
      -- FIXME: Remove newline workaround once Neovim properly displays warnings
      vim.notify_once("\nCouldn't find Jakt language server.\nPlease make sure you follow the documentation at https://github.com/SerenityOS/jakt/blob/main/editors/vim/README.md",  
      vim.log.levels.WARN)
end

    local client = vim.lsp.start_client {
        name = "Jakt LSP Server",
        cmd = { ls_path, '--lsp' },
    }

  -- Attach our LSP client handle to the current buffer. 
  -- See :help lsp and search for `buf_attach_client` for more info.
  vim.api.nvim_create_autocmd("FileType", {
        pattern = "jakt",
        callback = function()
            vim.lsp.buf_attach_client(0, client)
        end,
    })
end


return {
  setup = setup
}


