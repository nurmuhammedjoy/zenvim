-- Core Neovim options and settings

local opt = vim.opt
local g = vim.g
local api = vim.api

-- Disable unused providers for performance
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0

-- Performance settings
opt.updatetime = 100
opt.timeoutlen = 300
opt.ttimeoutlen = 0
opt.lazyredraw = true
opt.synmaxcol = 200
opt.redrawtime = 1500

-- UI settings
opt.fillchars = { eob = " " }
opt.number = true
opt.relativenumber = true
opt.numberwidth = 1
opt.signcolumn = "yes"
opt.colorcolumn = "0"
opt.termguicolors = true
opt.scrolloff = 0
opt.breakindent = true
-- Encoding
opt.encoding = "utf-8"

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.cmdheight = 0



-- File handling
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.config/nvim/undodir")

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Input
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- Leader keys
g.mapleader = " "
g.maplocalleader = "\\"

-- linebreak
api.nvim_create_autocmd("VimEnter", {
  callback = function()
    opt.wrap = true
    opt.linebreak = true
    vim.opt.signcolumn = "no"
  end,
})


