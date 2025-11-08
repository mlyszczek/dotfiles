---- ========================================================================
--                         ░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
--                         ░█░█░█▀▀░░█░░░█░░█░█░█░█░▀▀█
--                         ░▀▀▀░▀░░░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀
---- ========================================================================

vim.g.have_nerd_font = true -- some candy for the eyes
vim.opt.cursorline = true -- show which line your cursor is on
vim.opt.ignorecase = true -- case insensitive search (for thos stupid camels)
vim.opt.inccommand = "split" -- preview substitutions live, as you type!
vim.opt.list = true -- print some non-visible characters
vim.opt.listchars = { tab = "▸", trail = "•", nbsp = "␣" }
vim.opt.mouse = "" -- mouse is more trouble than it's worth
vim.opt.number = true -- show line number to the left
vim.opt.relativenumber = true -- show relative line number to the current one
vim.opt.scrolloff = 10-- always show this n of lines when scrolling
vim.opt.showmode = false -- do not show current mode
vim.opt.signcolumn = "yes" -- aka gutter
vim.opt.smartcase = true -- unless we use capitals in search
vim.opt.splitbelow = true -- and bottom
vim.opt.splitright = true -- new split default right
vim.opt.timeoutlen = 300 -- wait this [ms] for keymap sequence
vim.opt.undofile = true -- can't live without undo, can you?
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.encoding = "utf-8" -- any questions?
vim.opt.fileencoding = "utf-8" -- there is only
vim.opt.tabstop = 4 -- tab character is 4 spaces wide
vim.opt.shiftwidth = 4 -- hitting ">>" will move line by 4 spaces
vim.opt.softtabstop = 4 -- when <tab> is hit, produce 4 spaces
vim.opt.expandtab = false -- produce tabs when <tab> is hit
vim.opt.autoindent = true -- when <enter> is hit, stay in the same column
vim.opt.wrap = false -- don't wrap long lines, just trim them
vim.opt.textwidth = 80 -- lines should not be longer than 80ch
vim.opt.colorcolumn = "+1,+41" -- lines
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.cmd("let g:doxygen_enhanced_color=1")

vim.opt.spelllang = 'en_us'
vim.opt.spell = true

vim.opt.cindent = true -- enable c code auto indent
vim.opt.cinoptions = ":0,=s,l1,(s,U1,m1"

-- I just cannot get this 24bit working in nvim. Terminal clearly displays
-- nice 24bit colors, but nvim simply cannot.
vim.o.termguicolors = false
vim.cmd("colorscheme lm")
vim.cmd("set notermguicolors")

vim.cmd("let g:tmpl_author_name='Michał Łyszczek'")
vim.cmd("let g:tmpl_author_email='michal.lyszczek@bofc.pl'")
vim.cmd("let g:c_syntax_for_h = 1")
vim.cmd("let g:c_no_curly_error = 1")

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

---- ========================================================================
--                         ░█░░░█▀█░▀▀█░█░█░█▀▀░▀█▀░▀█▀
--                         ░█░░░█▀█░▄▀░░░█░░█░█░░█░░░█░
--                         ░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░░▀░
---- ========================================================================
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
----  To check the current status of your plugins, run
--    :Lazy
--
--  To update plugins you can run
--    :Lazy update
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{ "miikanissi/modus-themes.nvim", priority = 1000 },
	{ "zootedb0t/citruszest.nvim", lazy = false, priority = 1000, },
	{ "kdheepak/monochrome.nvim", lazy = false, priority = 1000, },
	{ "tibabit/vim-templates", lazy = false, priority = 1000 },
	{ "smoka7/hop.nvim", lazy = false, priority = 1000 },
	{ 'onsails/lspkind.nvim', lazy = false, priority = 1000 },

	{ import = 'user.plugins' },
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- easy motion like movement
require'hop'.setup({ keys = 'arstwfpzxcd/.,hyuloien'  })
require('mini.sessions').setup({ autoread = true })

---- ========================================================================
--                         ░▀█▀░█▄█░█▀█░█▀█░█▀▄░▀█▀░█▀▀
--                         ░░█░░█░█░█▀▀░█░█░█▀▄░░█░░▀▀█
--                         ░▀▀▀░▀░▀░▀░░░▀▀▀░▀░▀░░▀░░▀▀▀
---- ========================================================================
require("comments")
require("keymaps")
require("func_border")
