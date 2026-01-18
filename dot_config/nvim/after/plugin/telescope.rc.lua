local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["<C-c>"] = actions.close,
			},
		},
	},
})

vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "lg", builtin.live_grep, {})
vim.keymap.set("n", "fb", builtin.buffers, {})
vim.keymap.set("n", "fh", builtin.help_tags, {})