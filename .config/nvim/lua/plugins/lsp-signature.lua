return {
	"hrsh7th/cmp-nvim-lsp-signature-help",
	enabled = function() return vim.fn.hostname() == "hex" and vim.uv.getuid() ~= 0 end,
}
