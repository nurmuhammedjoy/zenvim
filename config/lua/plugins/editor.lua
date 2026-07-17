return {
  -- File explorer
  {
    "echasnovski/mini.files",
    version = "*",
    keys = {
      { "<C-n>", ":lua MiniFiles.open()<CR>", desc = "Toggle file explorer" },
      { "<C-e>", ":lua MiniFiles.open()<CR>", desc = "Toggle file explorer" },
    },
    config = function()
      require("mini.files").setup({
        windows = {
          preview = true,
          width_preview = 40,
        },
        options = {
          use_as_default_explorer = true,
        },
      })

      -- mini.files sets its own buffer mappings after the FileType event,
      -- so we defer with vim.schedule to override them with desc-enriched ones
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "minifiles",
        callback = function()
          vim.schedule(function()
            local map = function(lhs, rhs, desc)
              vim.keymap.set("n", lhs, rhs, { buffer = true, desc = desc })
            end

            local function go_in(n)
              for _ = 1, n do MiniFiles.go_in() end
            end
            local function go_in_close(n)
              for _ = 1, n do MiniFiles.go_in({ close_on_file = true }) end
            end
            local function go_out(n)
              for _ = 1, n do MiniFiles.go_out() end
            end

            map("q",  function() MiniFiles.close() end, "Close explorer")
            map("l",  function() go_in(vim.v.count1) end, "Go into entry")
            map("L",  function() go_in_close(vim.v.count1) end, "Go into entry & close")
            map("h",  function() go_out(vim.v.count1) end, "Go out to parent")
            map("H",  function() go_out(vim.v.count1) MiniFiles.trim_right() end, "Go out & trim right")
            map("'",  function() MiniFiles.mark_goto() end, "Go to bookmark")
            map("m",  function() MiniFiles.mark_set() end, "Set bookmark")
            map("<BS>", function() MiniFiles.reset() end, "Reset view")
            map("@",  function() MiniFiles.reveal_cwd() end, "Reveal cwd")
            map("g?", function() MiniFiles.show_help() end, "Show help")
            map("=",  function() MiniFiles.synchronize() end, "Synchronize view")
            map("<",  function() MiniFiles.trim_left() end, "Trim left branch")
            map(">",  function() MiniFiles.trim_right() end, "Trim right branch")

            map("?", function()
              require("which-key").show({ global = false, keys = "" })
            end, "Show keymaps")
          end)
        end,
      })
    end,
  },

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

  -- skip treesitter highlighting for files over 100 KB to avoid freezes
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
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        preset = "helix",
        delay = vim.o.timeoutlen,
        icons = { group = "󰌌" },
        spec = {
          { "<leader>b", group = "Buffer" },
          { "<leader>t", group = "Terminal" },
        },
      })
    end,
  },

}
