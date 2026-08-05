
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

      -- Global default for all servers; lspconfig's lsp/*.lua defaults and
      -- per-server configs below are merged on top of this.
      vim.lsp.config("*", { capabilities = capabilities })

      vim.lsp.config("emmet_ls", {
        filetypes = { "html", "css", "scss", "javascript", "typescript", "vue" },
      })

      local servers = { "html", "cssls", "ts_ls", "jsonls", "emmet_ls" }
      for _, server_name in ipairs(servers) do
        vim.lsp.enable(server_name)
      end
    end,
  },
}
