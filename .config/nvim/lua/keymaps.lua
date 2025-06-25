comments = require("comments")

---- ========================================================================
--              ░█░█░█▀▀░█░█░░░█▀▀░█░█░█▀█░█▀▀░▀█▀░▀█▀░█▀█░█▀█░█▀▀
--              ░█▀▄░█▀▀░░█░░░░█▀▀░█░█░█░█░█░░░░█░░░█░░█░█░█░█░▀▀█
--              ░▀░▀░▀▀▀░░▀░░░░▀░░░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀
---- ========================================================================
local function eq_text(width)
	local wsave = vim.opt.textwidth
	vim.opt.textwidth = width
	vim.cmd('normal gw')
	vim.opt.textwidth = wsave
end

---- ========================================================================
--                         ░█░█░█▀▀░█░█░█▄█░█▀█░█▀█░█▀▀
--                         ░█▀▄░█▀▀░░█░░█░█░█▀█░█▀▀░▀▀█
--                         ░▀░▀░▀▀▀░░▀░░▀░▀░▀░▀░▀░░░▀▀▀
---- ========================================================================

-- movement remap for colemak layout
vim.keymap.set("n", "h", "<Right>")
vim.keymap.set("n", "j", "<Down>")
vim.keymap.set("n", "k", "<Left>")
vim.keymap.set("n", "l", "<Up>")
vim.keymap.set("v", "h", "<Right>")
vim.keymap.set("v", "j", "<Down>")
vim.keymap.set("v", "k", "<Left>")
vim.keymap.set("v", "l", "<Up>")

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-Left>",  "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Move focus to the right window" })


vim.keymap.set("n", "<leader>amj", function() vim.cmd(":make -j") end, { desc = "[A]pp [M]ake [J]obs (-j)" })
vim.keymap.set("n", "<leader>amc", function() vim.cmd(":make -j1") end, { desc = "[A]pp [M]ake [C]ompile (-j1)" })
vim.keymap.set("n", "<leader>amp", function() vim.cmd(":make clean"); vim.cmd(":make -j") end, { desc = "[A]pp [M]ake [P]ristine" })
vim.keymap.set("n", "<leader>afe", function() vim.cmd(":NvimTreeToggle") end, { desc =   "[A]pp [F]ile [E]xplorer" })
vim.keymap.set("n", "<leader>afc", function() vim.cmd(":NvimTreeFindFile") end, { desc = "[A]pp [F]ile Explorer [C]urrent file" })

vim.keymap.set("n", "<leader>ccd", comments.gen_doxygen, { desc = "doxygen template" })
vim.keymap.set("n", "<leader>ccb", comments.print_comment_block, { desc = "block comment" })
vim.keymap.set("n", "<leader>ccs", comments.print_comment_separator, { desc = "separator comment" })
vim.keymap.set("n", "<leader>ccF", function() local text = vim.fn.input("Text: "); comments.gen_figlet(text, "pagga")  end, { desc = "big figlet comment" })
vim.keymap.set("n", "<leader>ccf", function() local text = vim.fn.input("Text: "); comments.gen_figlet(text, "future") end, { desc = "smol figlet comment" })

vim.keymap.set('n', '<leader>ft', [[:%s/\s\+$//e<cr>]], { desc = "[F]ormat [T]rim whitespaces" })
vim.keymap.set('n', '<leader>fl', function() vim.lsp.buf.format() end, { desc = "[F]ormat [L]SP" })
vim.keymap.set("v", "<leader>fel", function() eq_text(76) end, { desc = "[F]ormat [E]qualize [L]ong 76 width" })
vim.keymap.set("v", "<leader>fen", function() eq_text(67) end, { desc = "[F]ormat [E]qualize [N]orm 67 width" })
vim.keymap.set("v", "<leader>fes", function() eq_text(50) end, { desc = "[F]ormat [E]qualize [S]hrt 50 width" })

vim.keymap.set("n", "<leader>gh", function() vim.cmd(":ClangdSwitchSourceHeader") end, { desc = "[G]oto [H]eader (and back)" })
vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>HopWordAC<CR>", {desc = "Easy Motion Right", noremap=true})
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>HopWordBC<CR>", {desc = "Easy Motion Left", noremap=true})
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>HopLineAC<CR>", {desc = "Easy Motion Down", noremap=true})
vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>HopLineBC<CR>", {desc = "Easy Motion Up", noremap=true})

vim.keymap.set("n", "<leader>Gtr", function() vim.cmd(":Octo thread resolve") end, { desc = "[G]it [t]hread [r]esolve" })
