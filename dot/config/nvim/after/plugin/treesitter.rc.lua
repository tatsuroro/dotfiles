local status, treesitter = pcall(require, "nvim-treesitter")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = "all",
	autotag = {
		enable = true,
	},
})