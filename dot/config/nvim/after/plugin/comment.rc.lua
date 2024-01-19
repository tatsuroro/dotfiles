local status, nvim_comment = pcall(require, "nvim_comment")
if not status then
	return
end

nvim_comment.setup({
	line_mapping = "gcc",
	operator_mapping = "gc",
	comment_chunk_text_object = "ic"
})