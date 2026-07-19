
return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "FelipeLema/cmp-async-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      local function border(hl_name)
        return {
          { "╭", hl_name },
          { "─", hl_name },
          { "╮", hl_name },
          { "│", hl_name },
          { "╯", hl_name },
          { "─", hl_name },
          { "╰", hl_name },
          { "│", hl_name },
        }
      end

      local window_opts = {
        border = border("CmpBorder"),
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        scrollbar = true,
        side_padding = 1,
        max_width = 20,
        col_offset = 0,
      }

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          completion = window_opts,
          documentation = {
            border = border("CmpBorder"),
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            max_width = 60,
            scrollbar = true,
          },
        },

        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "",
              luasnip  = "",
              buffer   = "",
              async_path = "",
            })[entry.source.name] or ""
            vim_item.abbr = vim_item.abbr:sub(1, 50)
            return vim_item
          end,
        },
         
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          

          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "async_path" },
        }),
        performance = {
          max_view_entries = 15,
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "cmdline" },
        }, {
          { name = "path" },
        }),
        window = { completion = window_opts },
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
        window = { completion = window_opts },
      })

      vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#d5c4a1", bold = true })
      vim.api.nvim_set_hl(0, "CmpPmenu", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "CmpSel", { bg = "#3c3836", fg = "#ebdbb2", bold = true })
      vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#fe8019", bold = true })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#fe8019", bold = true })
      vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#928374", italic = true })
      vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#282828" })
      vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#d3869b", bold = true })
      
    end,
  },
}
