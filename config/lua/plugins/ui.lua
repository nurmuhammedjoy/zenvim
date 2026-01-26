return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = false,
        underline = false,
        bold = false,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
        strikethrough = false,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false,
        contrast = "hard",
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox-material",
          icons_enabled = true,
          section_separators = "",
          component_separators = "",
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
          disabled_filetypes = {
            statusline = { "NvimTree", "neo-tree", "alpha" },
          },
        },
        sections = {
          lualine_a = { { "mode", fmt = function(s) return s:sub(1, 1) end } },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "filename",
              path = 0,
              symbols = { modified = "+", readonly = "", unnamed = "[New]" },
            },
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              sections = { "error", "warn" },
              symbols = { error = "E:", warn = "W:" },
              colored = false,
              update_in_insert = false,
            },
          },
          lualine_y = { "filetype" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {},
      })
    end,
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.buttons.val = {
        dashboard.button("e", "󰈔  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "󰮗  Find file", function() require('telescope.builtin').find_files() end),
        dashboard.button("r", "󰛔  Recent files", function() require('telescope.builtin').oldfiles() end),
        dashboard.button("c", "󱁺  Config", ":e $MYVIMRC<CR>"),
        dashboard.button("q", "󰈆  Quit", ":qa<CR>"),
      }

      for _, btn in ipairs(dashboard.section.buttons.val) do
        btn.opts.hl = "AlphaButtons"
        btn.opts.hl_shortcut = "AlphaShortcut"
      end

      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"

      dashboard.opts.layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.opts)

      vim.defer_fn(function()
        local stats = require("lazy").stats()
        dashboard.section.footer.val = "⚡ " .. stats.loaded .. " plugins loaded in " .. string.format("%.2f", stats.startuptime) .. "ms"
        pcall(alpha.redraw)
      end, 1)
    end,
  },

{
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup({
      input = {
        enabled = true,
        insert_only = false,
        relative = "editor",   
        anchor = "CENTER",     
        border = "rounded",
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:Normal",
        },
      },
    })
  end,
},

{
  "gelguy/wilder.nvim",
  event = "CmdlineEnter",
  disable = true,
  config = function()
    local wilder = require("wilder")
    wilder.setup({ modes = { ":", "/", "?" } })

    
    wilder.set_option("renderer", wilder.popupmenu_renderer(
      wilder.popupmenu_palette_theme({
        border = "rounded",
        max_height = "50%",
        min_height = 0,
        prompt_position = "top",
        reverse = 0,
        pumblend = 0,
        highlighter = wilder.basic_highlighter(),
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
        show_prompt = true,
      })
    ))

    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.cmdline_pipeline({ fuzzy = 1 }),
        wilder.vim_search_pipeline()
      ),
    })
  end,
},
}

