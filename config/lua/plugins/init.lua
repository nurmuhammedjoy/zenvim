
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.ui" },
  { import = "plugins.editor" },
  { import = "plugins.lsp" },
  { import = "plugins.completion" },
  { import = "plugins.tools" },
}, {
  -- lazy's cache avoids re-processing specs on restart
  performance = {
    cache = { enabled = true },
    -- let lazy manage the full runtimepath instead of merging
    reset_packpath = true,
    rtp = {
      -- these ship with neovim but lazy handles loading for us
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
