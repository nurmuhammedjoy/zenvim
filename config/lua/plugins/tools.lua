
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

  -- bottom-split terminal with multiple named instances
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-t>", desc = "Toggle terminal 1" },
      { "<leader>t1", "<cmd>1ToggleTerm<CR>", desc = "Toggle terminal 1" },
      { "<leader>t2", "<cmd>2ToggleTerm<CR>", desc = "Toggle terminal 2" },
      { "<leader>t3", "<cmd>3ToggleTerm<CR>", desc = "Toggle terminal 3" },
    },
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-t>]],
        shade_terminals = true,
        shading_factor = 2,
        direction = "horizontal",
        persist_size = false,
          -- enter insert mode immediately when toggling the terminal open
        start_in_insert = true,
      })
      -- cycle between open terminal instances; escape to normal mode first
      local term_keys = {
        ["t"] = function()
          local Term = require("toggleterm.terminal")
          local terms = Term.get_all()
          -- skip the current terminal so we actually cycle
          local current = vim.api.nvim_get_current_win()
          for _, t in ipairs(terms) do
            if t:is_open() and t.window ~= current then
              vim.api.nvim_set_current_win(t.window)
              return
            end
          end
          -- Fall back to terminal 1
          vim.cmd("1ToggleTerm")
        end,
      }
      for key, cb in pairs(term_keys) do
        vim.keymap.set("n", key, cb, { buffer = true, desc = "Cycle terminals" })
      end
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
    end,
  },
}
