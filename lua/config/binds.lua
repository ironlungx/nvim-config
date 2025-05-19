vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>fs", ":w <CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { silent = true, desc = "Remove Highlights" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Easier window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- Resize window (normal)
vim.keymap.set("n", "<M-,>", "<c-w>5<")
vim.keymap.set("n", "<M-.>", "<c-w>5>")
vim.keymap.set("n", "<M-t>", "<C-W>3+")
vim.keymap.set("n", "<M-s>", "<C-W>3-")

-- Resize window (fast)
vim.keymap.set("n", "<M-C-,>", "<c-w>7<")
vim.keymap.set("n", "<M-C-.>", "<c-w>7>")
vim.keymap.set("n", "<M-C-t>", "<C-W>5+")
vim.keymap.set("n", "<M-C-s>", "<C-W>5-")

-- Resize window (slow)
vim.keymap.set("n", "<M-S-,>", "<c-w>2<")
vim.keymap.set("n", "<M-S-.>", "<c-w>2>")
vim.keymap.set("n", "<M-S-t>", "<C-W>+")
vim.keymap.set("n", "<M-S-s>", "<C-W>-")


vim.keymap.set("n", "<leader>ww", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle Word Wrap" })

vim.keymap.set("n", "<M-j>", ":bprev<CR>", { silent = true, desc = "Goto previous buffer"})
vim.keymap.set("n", "<M-k>", ":bnext<CR>", { silent = true, desc = "Goto next buffer"})

vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
