-- Neovim 0.11+ native LSP configuration

-- Global LSP settings (applied to all servers)
vim.lsp.config("*", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- Mason setup
require("mason").setup({
	ui = {
		border = "single",
	},
})

-- mason-lspconfig v2.0+: automatic_enable is on by default
-- Installed servers are automatically enabled via vim.lsp.enable()
require("mason-lspconfig").setup()

-- Manual server configuration (if needed for flow)
vim.lsp.enable("flow")