
return {
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
      local function cycle_terminals()
        local Term = require("toggleterm.terminal")
        local terms = Term.get_all()
        local current = vim.api.nvim_get_current_win()
        for _, terminal in ipairs(terms) do
          if terminal:is_open() and terminal.window ~= current then
            vim.api.nvim_set_current_win(terminal.window)
            return
          end
        end
        vim.cmd("1ToggleTerm")
      end

      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-t>]],
        shade_terminals = true,
        shading_factor = 2,
        direction = "horizontal",
        persist_size = false,
        start_in_insert = true,
        on_open = function(term)
          -- buffer-local so it can't shadow normal-mode `t` outside terminals
          vim.keymap.set("n", "t", cycle_terminals, {
            buffer = term.bufnr,
            desc = "Cycle terminals",
          })
        end,
      })
    end,
  },
  {
  "echasnovski/mini.move",
    config = function()
    require("mini.move").setup({
      mappings = {
       left  = "<M-h>",
       right = "<M-l>",
       down  = "<M-j>",
       up    = "<M-k>",

       line_left  = "<M-h>",
       line_right = "<M-l>",
       line_down  = "<M-j>",
       line_up    = "<M-k>",
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
