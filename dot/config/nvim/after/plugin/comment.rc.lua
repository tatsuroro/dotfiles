local status, nvim_comment = pcall(require, "nvim_comment")
if not status then
	return
end

nvim_comment.setup({
	line_mapping = "<Leader>c",
	operator_mapping = "<Leader>c",
	comment_chunk_text_object = "ic"
})
