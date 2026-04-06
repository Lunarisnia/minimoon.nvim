-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Yank path variants — all write to both + (system clipboard) and " (default) registers
vim.keymap.set("n", "<leader>yp", function()
	local path = vim.fn.expand("%:.")
	vim.fn.setreg("+", path)
	vim.fn.setreg('"', path)
	vim.notify("Yanked: " .. path)
end, { desc = "[Y]ank relative [P]ath" })

vim.keymap.set("n", "<leader>yd", function()
	local path = vim.fn.expand("%:.:h")
	vim.fn.setreg("+", path)
	vim.fn.setreg('"', path)
	vim.notify("Yanked: " .. path)
end, { desc = "[Y]ank [D]irectory of current file" })

vim.keymap.set("n", "<leader>yf", function()
	local path = vim.fn.expand("%:t")
	vim.fn.setreg("+", path)
	vim.fn.setreg('"', path)
	vim.notify("Yanked: " .. path)
end, { desc = "[Y]ank [F]ilename only" })

vim.keymap.set("n", "<leader>ya", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.fn.setreg('"', path)
	vim.notify("Yanked: " .. path)
end, { desc = "[Y]ank [A]bsolute path" })
