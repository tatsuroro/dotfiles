local status, alpha = pcall(require, "alpha")
if not status then
	return
end

local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("t", "  Neotree", ":Neotree toggle<Return>"),
	dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  Recent file", ":Telescope oldfiles <CR>"),
	dashboard.button("f", "󰥨  Find file", ":Telescope find_files <CR>"),
	dashboard.button("g", "󰱼  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("x", "  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
	dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
