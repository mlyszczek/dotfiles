local m = {}

local function is_cstyle(ft)
	return ft == "c" or ft == 'h' or ft == 'c.doxygen'
end

local function is_shellstyle(ft)
	return ft == 'sh' or ft == 'python'
end

local function is_luastyle(ft)
	return ft == 'lua'
end

local function get_comment_char()
	if is_cstyle(vim.bo.filetype) then
		return " *"
	elseif is_shellstyle(vim.bo.filetype) then
		return "#"
	elseif is_luastyle(vim.bo.filetype) then
		return "--"
	end
end
local function print_current_pos(out)
	-- nvim_put cannot into newlines, it requires table and each element in
	-- table will be printed in new line, so we gotta split stdout to table
	-- by new line character
	local result = {};
	for l in out.stdout.gmatch(out.stdout .. "\n", "(.-)\n") do
		table.insert(result, l)
	end
	vim.api.nvim_put(result, "l", false, true)
end

local function print_comment_start()
	local c = ""
	if is_cstyle(vim.bo.filetype) then
		c = "/* =========================================================================="
	elseif is_shellstyle(vim.bo.filetype) then
		c = "## =========================================================================="
	elseif is_luastyle(vim.bo.filetype) then
		c = "---- ========================================================================"
	end
	vim.api.nvim_put({ c }, "l", false, true)
end

local function print_comment_finish()
	local c = ""
	if is_cstyle(vim.bo.filetype) then
		c = " * ========================================================================== */"
	elseif is_shellstyle(vim.bo.filetype) then
		c = "## =========================================================================="
	elseif is_luastyle(vim.bo.filetype) then
		c = "---- ========================================================================"
	end
	vim.api.nvim_put({ c }, "l", false, true)
end

function m.print_comment_block()
	local c = ""
	if is_cstyle(vim.bo.filetype) then
		c = " * "
	elseif is_shellstyle(vim.bo.filetype) then
		c = "# "
	elseif is_luastyle(vim.bo.filetype) then
		c = "--    "
	end

	print_comment_start()
	vim.api.nvim_put({ c }, "l", false, true)
	print_comment_finish()
	vim.cmd('norm! kk$')
end

function m.print_comment_separator()
	local c = ""
	if is_cstyle(vim.bo.filetype) then
		c = "\t/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/"
	elseif is_shellstyle(vim.bo.filetype) then
		c = "\t#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#"
	elseif is_luastyle(vim.bo.filetype) then
		c = "\t--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--"
	end
	vim.api.nvim_put({ c }, "l", false, true)
end


-- generate doxygen template for function declaration
function m.gen_doxygen()
	local line = vim.api.nvim_get_current_line()
	local out = vim.system({"/home/lm-/.config/nvim/scripts/print-function-def-doxygen.sh", line }):wait()
	print_current_pos(out);
end

function m.gen_figlet(text, font)
	print_comment_start()
	local c = get_comment_char()
	local out = vim.system({"/home/lm-/.config/nvim/scripts/figlet", text, font, c}):wait()
	print_current_pos(out);
	print_comment_finish()
end

return m
