-- ==========================================================================
--                             ┏━┓┏━┓╺┳╸╻┏━┓┏┓╻┏━┓
--                             ┃ ┃┣━┛ ┃ ┃┃ ┃┃┗┫┗━┓
--                             ┗━┛╹   ╹ ╹┗━┛╹ ╹┗━┛
-- ==========================================================================
vim.g.have_nerd_font = true -- some candy for the eyes
vim.opt.cursorline = true -- show which line your cursor is on
vim.opt.ignorecase = true -- case insensitive search (for thos stupid camels)
vim.opt.inccommand = "split" -- preview substitutions live, as you type!
vim.opt.list = true -- print some non-visible characters
vim.opt.listchars = { tab = "▸", trail = "•", nbsp = "␣" }
vim.opt.mouse = "n" -- enable mouse, might be faster for resizing
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
vim.opt.cindent = true --
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.cmd("let g:doxygen_enhanced_color=1")

-- I just cannot get this 24bit working in nvim. Terminal clearly displays
-- nice 24bit colors, but nvim simply cannot.
vim.o.termguicolors = false
vim.cmd("colorscheme lm")
vim.cmd("set notermguicolors")

vim.cmd("let g:tmpl_author_name='Michał Łyszczek'")
vim.cmd("let g:tmpl_author_email='michal.lyszczek@bofc.pl'")


-- ==========================================================================
--                              ╻┏ ┏━╸╻ ╻┏┳┓┏━┓┏━┓
--                              ┣┻┓┣╸ ┗┳┛┃┃┃┣━┫┣━┛
--                              ╹ ╹┗━╸ ╹ ╹ ╹╹ ╹╹
-- ==========================================================================
-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("i", "<leader><leader>", "<ESC>")
vim.keymap.set("n", "<leader>fe", function() vim.cmd(":NvimTreeToggle") end, { desc = "show file explorer" })

vim.keymap.set("n", "gh", function() vim.cmd(":ClangdSwitchSourceHeader") end, { desc = "toggle header c file" })
vim.keymap.set("n", "<leader>mj", function() vim.cmd(":make -j") end, { desc = "build project with -j" })
vim.keymap.set("n", "<leader>mc", function() vim.cmd(":make -j1") end, { desc = "build project with -j1" })
vim.keymap.set("n", "<leader>mp", function() vim.cmd(":make clean"); vim.cmd(":make -j") end, { desc = "make clean and then build" })

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

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local function gen_doxygen()
	local line = vim.api.nvim_get_current_line()
	local out = vim.system({"/home/lm-/.vim/tools/print-function-def-doxygen.sh", line }):wait()
	-- nvim_put cannot into newlines, it requires table and each element in
	-- table will be printed in new line, so we gotta split stdout to table
	-- by new line character
	local result = {};
	for l in out.stdout.gmatch(out.stdout .. "\n", "(.-)\n") do
		table.insert(result, l);
	end
	vim.api.nvim_put(result, "l", false, true)
end
vim.keymap.set("n", "<leader>fd", gen_doxygen)

local function eq_text(width)
	local wsave = vim.opt.textwidth
	vim.opt.textwidth = width
	vim.cmd('normal gw')
	vim.opt.textwidth = wsave
end
vim.keymap.set("v", "<leader>el", function() eq_text(76) end, { desc = "equalize text to 76 width" })
vim.keymap.set("v", "<leader>en", function() eq_text(67) end, { desc = "equalize text to 67 width" })
vim.keymap.set("v", "<leader>es", function() eq_text(50) end, { desc = "equalize text to 50 width" })

local function smart_tab()
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
	--vim.api.nvim_put({match}, "", false, false)
    --let sts=exists("b:insidetabs")?(b:insidetabs):((&sts==0)?&sw:&sts)
    --let sp=(virtcol('.') % sts)
    --return strpart("                                     ",0,1+sts-sp)
end
vim.keymap.set("i", "<S-TAB>", "<TAB>")
vim.keymap.set("i", "<TAB>", smart_tab)

--  To check the current status of your plugins, run
--    :Lazy
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{ "miikanissi/modus-themes.nvim", priority = 1000 },
	{ "zootedb0t/citruszest.nvim", lazy = false, priority = 1000, },
	{ "kdheepak/monochrome.nvim", lazy = false, priority = 1000, },
	{ "tibabit/vim-templates", lazy = false, priority = 1000 },
	{ "phaazon/hop.nvim", lazy = false, priority = 1000 },
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

require'hop'.setup()
vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>HopWordBC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>w", "<cmd>HopWordAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>j", "<cmd>HopLineAC<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>k", "<cmd>HopLineBC<CR>", {noremap=true})
