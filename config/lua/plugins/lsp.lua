
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

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local servers = {
        html = {},
        cssls = {},
        ts_ls = {},
        jsonls = {},
        emmet_ls = {
          filetypes = { "html", "css", "scss", "javascript", "typescript", "vue" },
        },
      }

      for server_name, server_config in pairs(servers) do
        server_config.capabilities = capabilities
        vim.lsp.config(server_name, server_config)
      end
    end,
  },
}
