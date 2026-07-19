
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "html",
          "cssls",
          "ts_ls",
          "jsonls",
          "emmet_ls",
        },
        automatic_installation = true,
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      -- Apply capabilities as a global default for all LSP servers.
      -- Per-server overrides can still be set below; they will be merged
      -- on top of the defaults loaded from lspconfig's lsp/*.lua files.
      vim.lsp.config("*", { capabilities = capabilities })

      -- Per-server overrides (filetypes, settings, etc.)
      vim.lsp.config("emmet_ls", {
        filetypes = { "html", "css", "scss", "javascript", "typescript", "vue" },
      })

      -- Enable all desired language servers.
      -- lspconfig's lsp/<name>.lua provides defaults (cmd, filetypes, root_markers)
      -- which are merged with the global "*" config and per-server overrides above.
      local servers = { "html", "cssls", "ts_ls", "jsonls", "emmet_ls" }
      for _, server_name in ipairs(servers) do
        vim.lsp.enable(server_name)
      end
    end,
  },
}
