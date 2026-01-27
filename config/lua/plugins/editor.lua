return {
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<C-n>", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
      { "<C-e>", ":NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    },
    config = function()
      local nvim_tree = require("nvim-tree")
      local ui = vim.api.nvim_list_uis()[1]
      local width = math.floor(ui.width * 0.85)
      local height = math.floor(ui.height * 0.60)
      local row = math.floor((ui.height - height) * 0.5)
      local col = math.floor((ui.width - width) * 0.5)

      nvim_tree.setup({
        disable_netrw = true,
        hijack_netrw = true,
        update_cwd = true,
        view = {
          float = {
            enable = true,
            open_win_config = {
              relative = "editor",
              border = "rounded",
              width = width,
              height = height,
              row = row,
              col = col,
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = { ".git", "node_modules", ".cache" },
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
      })
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", ":Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", ":Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", ":Telescope buffers<CR>", desc = "Find buffers" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules/.*",
            "%.git/.*",
            "%.DS_Store",
            "package%-lock%.json",
          },
          layout_strategy = "horizontal",
          layout_config = {
            width = 0.87,
            height = 0.80,
          },
        },
      })
    end,
  },

  -- Treesitter 
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        return
      end

      configs.setup({
        ensure_installed = { "lua", "bash", "python", "json", "html", "css", "vim", "vimdoc" },
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
      })
    end,
  },
  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Comment plugin
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
}
