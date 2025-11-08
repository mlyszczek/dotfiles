return {
	{
		"wakatime/vim-wakatime",
		enabled = function() return vim.fn.hostname() == "hex" end,
		lazy = false,
	}
}
