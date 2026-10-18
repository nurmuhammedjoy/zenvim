return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- blink is lazy-loaded; forced as a dep so it's ready for get_lsp_capabilities()
      "Saghen/blink.cmp",
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        -- clangd and lua_ls are installed via `pkg install clang lua-language-server`
        -- (Mason has no prebuilt binaries for Termux), so they're excluded here but
        -- still enabled below from PATH.
        ensure_installed = {
          "html",
          "cssls",
          "ts_ls",
          "jsonls",
          "emmet_ls",
          "bashls",
        },
      })


      local capabilities = require("blink.cmp").get_lsp_capabilities(nil, true)

      -- Global default for all servers; lspconfig's lsp/*.lua defaults and
      -- per-server configs below are merged on top of this.
      vim.lsp.config("*", { capabilities = capabilities })

      vim.lsp.config("emmet_ls", {
        filetypes = { "html", "css", "scss", "vue" },
      })

      -- clangd and lua_ls come from $PATH (pkg), not Mason; skip them if the
      -- binary is missing so startup doesn't log "check log for errors".
      local servers = { "html", "cssls", "ts_ls", "jsonls", "emmet_ls", "bashls" }
      if vim.fn.executable("clangd") == 1 then
        table.insert(servers, "clangd")
      end
      if vim.fn.executable("lua-language-server") == 1 then
        table.insert(servers, "lua_ls")
      end

      for _, server_name in ipairs(servers) do
        vim.lsp.enable(server_name)
      end
    end,
  },
}
