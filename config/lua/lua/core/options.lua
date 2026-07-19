local opt = vim.opt
local g = vim.g
local api = vim.api

-- disable providers we don't use (saves a bit of startup time)
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0

opt.updatetime = 100
opt.timeoutlen = 1500
opt.ttimeoutlen = 0
opt.synmaxcol = 200
opt.redrawtime = 1500

opt.fillchars = { eob = " " }
opt.number = true
opt.relativenumber = true
opt.numberwidth = 1
opt.signcolumn = "yes"
opt.colorcolumn = "0"
opt.termguicolors = true
opt.scrolloff = 0
opt.breakindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.cmdheight = 0



opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.config/nvim/undodir")

opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildoptions = "pum"

opt.mouse = "a"
opt.clipboard = "unnamedplus"

g.mapleader = " "
g.maplocalleader = "\\"

-- word wrap only after startup so it doesn't affect the welcome screen or
-- one-shot editors (e.g. `git commit`)
api.nvim_create_autocmd("VimEnter", {
  callback = function()
    opt.wrap = true
    opt.linebreak = true
    vim.opt.signcolumn = "no"
  end,
})

api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "WildMenu", { bg = "#3c3836", fg = "#ebdbb2", bold = true })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "#282828", fg = "#ebdbb2" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3c3836", fg = "#ebdbb2", bold = true })
    vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#d5c4a1", bold = true })
  end,
})


