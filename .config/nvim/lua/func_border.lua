local M = {}

local ns = vim.api.nvim_create_namespace("func_border")

function M.clear_borders(bufnr)
	vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
end

function M.render_borders()
	local bufnr = vim.api.nvim_get_current_buf()
	M.clear_borders(bufnr)

	local parser = vim.treesitter.get_parser(bufnr, "c")
	local tree = parser:parse()[1]
	local root = tree:root()

	local query = vim.treesitter.query.parse("c", [[
		(function_declarator) @func_decl
	]])

	for _, node in query:iter_captures(root, bufnr, 0, -1) do
		local start_row, _, end_row, _ = node:range()
		local line_top = vim.api.nvim_buf_get_lines(bufnr, start_row -1, start_row, false)[1] or ""
		local line_top2 = vim.api.nvim_buf_get_lines(bufnr, start_row -2, start_row, false)[1] or ""
		local line_bot = vim.api.nvim_buf_get_lines(bufnr, end_row + 1, end_row + 2, false)[1] or ""
		local width = 80

		if (string.find(line_top, "*/") or string.find(line_top2, "*/")) then
			goto cont
		end

		local border_top = ""
		border_top = " " .. string.rep("─", width - string.len(line_top) - 4)
		vim.api.nvim_buf_set_extmark(bufnr, ns, start_row - 1, string.len(line_top), {
			virt_text = {{border_top, "Comment"}},
			virt_text_pos = "overlay",
		})


		local border_bot = ""
		border_bot = " " .. string.rep("─", width - string.len(line_bot) - 4)

		vim.api.nvim_buf_set_extmark(bufnr, ns, end_row + 1, string.len(line_bot), {
			virt_text = {{border_bot, "Comment"}},
			virt_text_pos = "overlay",
		})

		::cont::
	end
end

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold" }, {
	pattern = "*.c",
	callback = function()
		require("func_border").render_borders()
	end,
})

return M
