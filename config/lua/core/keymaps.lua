local keymap = vim.keymap.set

local base_opts = { noremap = true, silent = true }

local function opts(desc)
  return vim.tbl_extend("force", base_opts, { desc = desc })
end

-- General
keymap("v", "d", '"_d', base_opts) -- delete without yanking (visual)
keymap({ "n", "v" }, "x", '"+y', { noremap = true, silent = true })
-- File operations
keymap({ "n", "i" }, "<C-s>", "<cmd>w<CR>", opts("Save file"))
keymap({ "n", "i" }, "<C-q>", "<cmd>q<CR>", opts("Quit Neovim"))

-- Buffer navigation
keymap("n", "<leader>bn", "<cmd>bnext<CR>", opts("Next buffer"))
keymap("n", "<leader>bp", "<cmd>bprev<CR>", opts("Previous buffer"))
keymap("n", "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", opts("Recent files"))

-- UI
keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts("Clear search highlights"))

-- LSP
keymap("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
keymap("n", "gr", vim.lsp.buf.references, opts("Go to references"))
keymap("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code actions"))
keymap("n", "<leader>f", function()
  vim.lsp.buf.format { async = true }
end, opts("Format buffer"))


function InteractiveSubstitute(confirm)
    local old = vim.fn.input("Old word: ")
    if old == "" then return end
    local new = vim.fn.input("New word: ")
    if new == "" then return end  
    local flags = confirm and "gc" or "g"
    vim.cmd("%s/"..old.."/"..new.."/"..flags)
end

vim.api.nvim_set_keymap('n', '<leader>r', ':lua InteractiveSubstitute(true)<CR>', { noremap = true, silent = false })

vim.api.nvim_set_keymap('n', '<leader>R', ':lua InteractiveSubstitute(false)<CR>', { noremap = true, silent = false })


