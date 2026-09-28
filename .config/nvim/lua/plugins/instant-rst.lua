return {
	{
		"Rykka/InstantRst",
		lazy = false,
		enabled = function() return vim.fn.hostname() == "hex" and vim.uv.getuid() ~= 0 end,
	}
}
