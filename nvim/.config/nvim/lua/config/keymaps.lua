vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "open parent directory in Oil" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clears search highlight with escape" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "move to next search result with cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "move to previous search result with cursor centered" })
vim.keymap.set("v", "<", "<gv", opts, { desc = "keep selection after indenting" })
vim.keymap.set("v", ">", ">gv", opts, { desc = "keep selection after indenting" })

vim.keymap.set("n", "<leader>y", [["+y]], opts, { desc = "yanks to system clipboard" })
vim.keymap.set("v", "<leader>y", [["+y]], opts, { desc = "yanks to system clipboard" })

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ async = true })
end, { desc = "[c]ode [f]ormat" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
