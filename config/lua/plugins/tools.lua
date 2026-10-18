
return {

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
