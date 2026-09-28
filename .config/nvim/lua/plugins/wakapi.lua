return {
	{
		"wakatime/vim-wakatime",
		enabled = function() return vim.fn.hostname() == "hex" and vim.uv.getuid() ~= 0 end,
		lazy = false,
		opts = {
			status_bar_enabled = true,
		},
	}
}
