return {
	{
		"Rykka/riv.vim",
		enabled = function() return vim.fn.hostname() == "hex" and vim.uv.getuid() ~= 0 end,
		lazy = false,
	}
}
