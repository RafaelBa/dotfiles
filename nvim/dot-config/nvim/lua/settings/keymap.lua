vim.g.mapleader = " "
-- TODO: figure out if and what for I need local leader and what to configure it to
-- vim.g.maplocalleader = " "

-- Key binding inspired by lazyvim https://www.lazyvim.org/configuration/general#keymaps
-- Buffer controls
-- TODO: Write / use script to change buffer before deleting this buffer
-- deleting a buffer that is open in a window will close the window, too
vim.keymap.set(
	{ "n", "v" },
	"<leader>bd",
	"<cmd>bp<bar>sp<bar>bn<bar>bd<cr>",
	{ desc = "[d]elete Buffer (leave window open)" }
)
vim.keymap.set({ "n", "v" }, "<leader>bD", "<cmd>bdel<cr>", { desc = "[D]elete Buffer and close window" })
vim.keymap.set({ "n", "v" }, "[b", "<cmd>bprev<cr>", { desc = "Prev [b]uffer" })
vim.keymap.set({ "n", "v" }, "]b", "<cmd>bnext<cr>", { desc = "Next [b]uffer" })
vim.keymap.set({ "n", "v" }, "<leader>|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set({ "n", "v" }, "<leader>-", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Reset search highlight on <ESC>
vim.keymap.set("n", "<ESC>", "<cmd>noh<cr><esc>")

-- Window controls
-- TODO: add check that there is more than 1 window left, otherwise don't close
vim.keymap.set({ "n", "v" }, "<leader>wd", ":q<CR>")

-- TODO: I need to figure out how to remap "move window" to <C-W><uppercase-LHJK>

-- vim.keymap.set({ "n", "v" }, "<C-W>J", "<C-J>")
-- vim.keymap.del({ "n", "v" }, "<C-J>")
vim.keymap.set({ "n", "v" }, "<C-J>", "<C-W>j")

-- vim.keymap.set({ "n", "v" }, "<C-W>K", "<C-K>")
-- vim.keymap.del({ "n", "v" }, "<C-K>")
vim.keymap.set({ "n", "v" }, "<C-K>", "<C-W>k")

-- vim.keymap.set({ "n", "v" }, "<C-W>H", "<C-H>")
-- vim.keymap.del({ "n", "v" }, "<C-H>")
vim.keymap.set({ "n", "v" }, "<C-H>", "<C-W>h")

-- vim.keymap.set({ "n", "v" }, "<C-W>L", "<C-L>")
-- vim.keymap.del({ "n", "v" }, "<C-L>")
vim.keymap.set({ "n", "v" }, "<C-L>", "<C-W>l")

-- tab controls
vim.keymap.set({ "n", "v" }, "[t", "<cmd>tabprevious<cr>", { desc = "Previous [T]ab" })
vim.keymap.set({ "n", "v" }, "]t", "<cmd>tabnext<cr>", { desc = "Next [T]ab" })
vim.keymap.set({ "n", "v" }, "<leader>td", "<cmd>tabclose<cr>", { desc = "[D]elete Tab" })
vim.keymap.set({ "n", "v" }, "<leader>tn", "<cmd>tabnew<cr>", { desc = "[D]elete Tab" })

-- TODO: read current file path and open netrw at folder of file
-- either I'll get errors when there's no file open (yet or anymore), or undefined behaviour and a path that isn't useful at all
vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>vsplit .<cr>", { desc = "Open file [E]xplorer" })

vim.keymap.set("n", "<leader>qa", "<cmd>qa<cr>", { desc = "Quit [a]ll" })

-- Spelling
local addSpellingTo = function(lang)
	local current_spelllang = vim.o.spelllang
	vim.o.spelllang = lang
	vim.cmd("spellgood " .. vim.fn.expand("<cword>"))
	vim.o.spelllang = current_spelllang
end

-- Remap "add to internal word list"
vim.keymap.set({ "n", "v" }, "zGi", "zG", { desc = "Add to internal word list" })

-- TODO: > In Visual mode the selected characters are added as a word (including white space!).
-- This is why this is only set to normal-mode
vim.keymap.set({ "n" }, "zGg", function()
	addSpellingTo("de")
end, { desc = "[g]erman" })
vim.keymap.set({ "n" }, "zGe", function()
	addSpellingTo("en_gb")
end, { desc = "[e]nglish" })
