return { -- Highlight todo, notes, etc in comments
	"folke/todo-comments.nvim",
	enabled = function() return vim.fn.hostname() == "hex" and vim.uv.getuid() ~= 0 end,
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
}
