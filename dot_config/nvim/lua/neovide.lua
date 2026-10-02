if not vim.g.neovide then
  return
end

-- Cmd キー（Neovide は Cmd+C/V/S を既定で割り当てない）
vim.keymap.set({ "n", "v" }, "<D-c>", '"+y')
vim.keymap.set({ "n", "v" }, "<D-v>", '"+p')
vim.keymap.set({ "i", "c" }, "<D-v>", "<C-r>+")
vim.keymap.set("n", "<D-s>", "<cmd>w<CR>")

-- 挿入・コマンドラインモード以外では IME を切る
local function set_ime(on)
  vim.g.neovide_input_ime = on
end
set_ime(false) -- 起動直後はノーマルモード
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  callback = function()
    set_ime(true)
  end,
})
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
  callback = function()
    set_ime(false)
  end,
})

-- フォント（guifont は options.lua。行間だけ Neovide 向けに足す）
vim.opt.linespace = 2

-- Cmd + = / - / 0 で拡大・縮小・リセット
local function scale(delta)
  vim.g.neovide_scale_factor = delta and vim.g.neovide_scale_factor * delta or 1.0
end
vim.keymap.set("n", "<D-=>", function()
  scale(1.1)
end)
vim.keymap.set("n", "<D-->", function()
  scale(1 / 1.1)
end)
vim.keymap.set("n", "<D-0>", function()
  scale()
end)

-- 左 Option を Meta に。右 Option は記号入力用に残す
vim.g.neovide_input_macos_option_key_is_meta = "only_left"

-- 見た目
vim.g.neovide_padding_top = 8
vim.g.neovide_padding_left = 8
vim.g.neovide_padding_right = 8
vim.g.neovide_floating_corner_radius = 0.3
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_proxy_icon = true
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_trail_size = 0.5
vim.g.neovide_cursor_vfx_mode = ""

-- Dock / Finder から引数なしで起動したとき（cwd が / か $HOME）は
-- ~/Documents に移動して空の新規バッファから始める。
-- ターミナルからプロジェクト内で `neovide` した場合やファイル指定時は cwd を変えない。
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    if vim.fn.argc() > 0 then
      return
    end
    local cwd = vim.fn.getcwd()
    if cwd == "/" or cwd == vim.env.HOME then
      vim.cmd.cd(vim.fn.expand("~/Documents"))
    end
  end,
})
