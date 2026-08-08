local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup("General", { clear = true })

-- Restore cursor position on file open
autocmd("BufReadPost", {
  group = general,
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 1 and last_pos <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, { last_pos, 0 })
    end
  end,
})

autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Skip LSP for large buffers (mirrors the treesitter guard) to avoid
-- spawning heavy servers (ts_ls, clangd, ...) on generated/minified files.
autocmd({ "BufReadPre", "BufNewFile" }, {
  group = general,
  callback = function()
    if vim.fn.getfsize(vim.api.nvim_buf_get_name(0)) > 100 * 1024 then
      vim.b.large_file = true
    end
  end,
})

autocmd("LspAttach", {
  group = general,
  callback = function(event)
    if vim.b[event.buf].large_file then
      vim.lsp.stop_client(event.data, true)
      return
    end
    local buffer_opts = { buffer = event.buf, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", buffer_opts, {
      desc = "Go to definition",
    }))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", buffer_opts, {
      desc = "Go to references",
    }))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", buffer_opts, {
      desc = "Hover documentation",
    }))
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", buffer_opts, {
      desc = "Rename symbol",
    }))
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", buffer_opts, {
      desc = "Code actions",
    }))
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend("force", buffer_opts, { desc = "Format buffer" }))
  end,
})

vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})
