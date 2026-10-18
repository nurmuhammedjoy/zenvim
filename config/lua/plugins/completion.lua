return {
  {
    "Saghen/blink.cmp",

    version = "1.10.2",
    -- loaded on insert so startup stays fast on Termux
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Completion popup background/opacity.
      -- Transparent by default so the popup matches a transparent terminal
      -- (kitty `background_opacity`, Termux). To change it:
      --   popup_bg = "#1c2021", blend = 0 -> fully opaque
      --   popup_bg = "#1c2021", blend = 20 -> semi-transparent
      local popup_bg = "NONE"
      local blend = 0

      vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = popup_bg, fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = popup_bg, fg = "#d5c4a1", bold = true })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#504945", fg = "#ebdbb2", bold = true })
      vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = "#83a598" })
      vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = "#fe8019", bold = true })
      vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { fg = "#928374", italic = true })
      vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = "#a89984", italic = true })
      vim.api.nvim_set_hl(0, "BlinkCmpSource", { fg = "#a89984", bold = true })
      vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = popup_bg, fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = popup_bg, fg = "#d5c4a1", bold = true })
      -- generic fallbacks for the cmdline popup and any non-blink popups
      vim.api.nvim_set_hl(0, "Pmenu", { bg = popup_bg, fg = "#ebdbb2" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#504945", fg = "#ebdbb2", bold = true })


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


      require("blink.cmp").setup({
        keymap = {
          preset = "default",

          -- Termux doesn't transmit <C-Space>; bind the toggle to <C-d> instead
          ["<C-d>"] = {
            function(cmp)
              if not cmp.is_visible() then return end
              if cmp.is_documentation_visible() then
                return cmp.hide_documentation()
              end
              return cmp.show_documentation()
            end,
          },

          ["<CR>"] = {
            function(cmp)
              if not cmp.is_visible() then return end
              local list = require("blink.cmp.completion.list")
              if list.is_explicitly_selected then return cmp.accept() end
            end,
            "fallback",
          },
          ["<Tab>"] = {
            function(cmp)
              if cmp.is_visible() then return cmp.select_next() end
              if cmp.snippet_active() then return cmp.snippet_forward() end
            end,
            "fallback",
          },

          ["<S-Tab>"] = {
            function(cmp)
              if cmp.is_visible() then return cmp.select_prev() end
              if cmp.snippet_active() then return cmp.snippet_backward() end
            end,
            "fallback",
          },
        },

        appearance = {
          nerd_font_variant = "mono",
        },

        completion = {
          -- don't preview the item inside the buffer while navigating
          list = { selection = { preselect = true, auto_insert = false } },

          menu = {
            border = "single",
            max_height = 15,
            scrollbar = false,
            winblend = blend,
          },

          documentation = {
            auto_show = false,

            window = {
              border = border("BlinkCmpDocBorder"),
              max_width = 60,
              winblend = blend,
            },
          },

          ghost_text = { enabled = true },
        },

        -- LSP and snippets always preferred; buffer/path only as fallback
        sources = {
          default = { "lsp", "snippets" },
          providers = {
            buffer = { fallbacks = { "lsp", "snippets" } },
            path = { fallbacks = { "lsp", "snippets" } },
          },
        },

        snippets = { preset = "luasnip" },

        cmdline = {
          enabled = true,
          keymap = { preset = "cmdline" },
          -- mirror the old nvim-cmp behavior: buffer-only for search, cmdline+path for commands
          sources = function()
            local type = vim.fn.getcmdtype()
            if type == "/" or type == "?" then return { "buffer" } end
            return { "cmdline", "path" }
          end,
          completion = {
            menu = { auto_show = true },
          },
        },
      })
    end,
  },
}
