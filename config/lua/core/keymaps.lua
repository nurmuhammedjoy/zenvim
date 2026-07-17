local keymap = vim.keymap.set

local base_opts = { noremap = true, silent = true }

local function opts(desc)
  return vim.tbl_extend("force", base_opts, { desc = desc })
end

keymap("v", "d", '"_d', base_opts) -- delete without yanking (visual)
keymap("v", "x", '"+y', { noremap = true, silent = true })

keymap({ "n", "i" }, "<C-s>", "<cmd>w<CR>", opts("Save file"))
keymap({ "n", "i" }, "<C-q>", "<cmd>q<CR>", opts("Quit Neovim"))


keymap("n", "<leader>bn", "<cmd>bnext<CR>", opts("Next buffer"))
keymap("n", "<leader>bp", "<cmd>bprev<CR>", opts("Previous buffer"))
keymap("n", "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", opts("Recent files"))


keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts("Clear search highlights"))


keymap("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
keymap("n", "gr", vim.lsp.buf.references, opts("Go to references"))
keymap("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code actions"))
keymap("n", "<leader>f", function()
  vim.lsp.buf.format { async = true }
end, opts("Format buffer"))


function InteractiveSubstitute(confirm)
  local old = vim.fn.input("Old: ")
  if old == "" then return end
  local new = vim.fn.input("New: ")
  if new == "" then return end
  local flags = confirm and "gc" or "g"
  -- Escape regex and separator characters to avoid breaking :s
  local escaped_old = vim.pesc(old)
  vim.cmd(string.format("%%s/%s/%s/%s", escaped_old, new, flags))
end

vim.keymap.set("n", "<leader>r", function()
  InteractiveSubstitute(true)
end, { desc = "Substitute in buffer (with confirmation)" })

vim.keymap.set("n", "<leader>R", function()
  InteractiveSubstitute(false)
end, { desc = "Substitute in buffer (no confirmation)" })


