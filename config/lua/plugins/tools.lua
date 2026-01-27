
return {
  -- GitHub Copilot
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""

      vim.g.copilot_filetypes = {
        ["*"] = false,
        ["javascript"] = true,
        ["typescript"] = true,
        ["html"] = true,
        ["css"] = true,
        ["scss"] = true,
        ["json"] = true,
        ["yaml"] = true,
        ["markdown"] = true,
        ["lua"] = true,
        ["python"] = true,
        ["vue"] = true,
        ["php"] = true,
      }

      -- Copilot keymaps
      vim.keymap.set("i", "<C-g>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        silent = true,
        desc = "Accept Copilot",
      })
      vim.keymap.set("i", "<C-\\>", "copilot#Dismiss()", {
        expr = true,
        silent = true,
        desc = "Dismiss Copilot",
      })
    end,
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<c-\\>", desc = "Toggle terminal" },
    },
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        shade_terminals = true,
        shading_factor = 2,
        direction = "float",
        float_opts = {
          border = "curved",
          width = function()
            return math.floor(vim.o.columns * 0.85)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.6)
          end,
          winblend = 0,
        },
        persist_size = false,
      })
    end,
  },
  {
  "echasnovski/mini.move",
    config = function()
    require("mini.move").setup({
     mappings = {
      left  = "<C-Left>",
      right = "<C-Right>",
      down  = "<C-Down>",
      up    = "<C-Up>",
      },
    })
  end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "FelipeLema/cmp-async-path",
    dependencies = { "hrsh7th/nvim-cmp" },
  }
}
