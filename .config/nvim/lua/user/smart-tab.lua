local st = {}

function st.smart_tab()
	local spc = "                                                          "
	local line = vim.api.nvim_get_current_line()
	local _, column = unpack(vim.api.nvim_win_get_cursor(0))
	local before_cursor = string.sub(line, 0, column)
	local match = string.match(before_cursor, "^\t*$")
	if (match ~= nil and string.len(match) > 0) or column == 0 then
		vim.api.nvim_put({"\t"}, "", false, true)
	else
		-- local virtcolumn = vim.fn.virtcol(".")
		-- local nspc = virtcolumn % vim.opt.tabstop:get()
		-- nspc = 1 + vim.opt.tabstop:get() - nspc
		-- vim.api.nvim_put({tostring(virtcolumn) .. tostring(nspc)}, "", false, true)

		local sts = vim.opt.tabstop:get()
		local sp = vim.fn.virtcol(".") % sts
		local nspc = (1 + sts - sp) % sts
		if nspc == 0 then nspc = sts end
		local s = string.sub(spc, 0, nspc)
		vim.api.nvim_put({s}, "", false, true)
	end
end

return st
