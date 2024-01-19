local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  title = true,
  backup = false,
  clipboard = "unnamed",
  cmdheight = 2,
  completeopt = { "menu",  "menuone", "noselect" },
  conceallevel = 0,
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 300,
  undofile = true,
  updatetime = 1000,
  writebackup = false,
  shell = "fish",
  backupskip = { "/tmp/*", "/private/tmp/*" },
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = false,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = false,
  winblend = 0,
  wildoptions = "pum",
  pumblend = 5,
  background = "dark",
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "Fira Code Nerd Font:h16",
  splitbelow = false, -- オンのとき、ウィンドウを横分割すると新しいウィンドウはカレントウィンドウの下に開かれる
  splitright = false, -- オンのとき、ウィンドウを縦分割すると新しいウィンドウはカレントウィンドウの右に開かれる
  whichwrap= "b,s,<,>,[,]" -- enable moving toward lines with left-right cursor
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- opts append
vim.opt.shortmess:append("c")
vim.opt.path:append({ "**" })
vim.opt.formatoptions:append({ "r" })
vim.opt.wildignore:append({ "*/node_modules/*" })
