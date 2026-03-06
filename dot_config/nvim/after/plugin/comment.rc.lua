local status, comment = pcall(require, "Comment")
if not status then
	return
end

comment.setup({
	toggler = {
		line = "<Leader>cc",
		block = "<Leader>cb",
	},
	opleader = {
		line = "<Leader>c",
		block = "<Leader>b",
	},
})
