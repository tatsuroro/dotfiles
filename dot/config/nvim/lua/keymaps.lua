local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Normal --

-- Do not yank with x
keymap('n', 'x', '"_x', opts)

-- ;でコマンド入力( ;と:を入れ替)
keymap('n', ';', ':', opts)
keymap('n', ':', ';', opts)

-- 行末までのヤンクにする
keymap('n', 'Y', 'y$', opts)

-- 0 register paste
keymap('n', 'P', '0p', opts)

-- disable ex mode
keymap('n', 'Q', '<Nop>', opts)

-- disable shortcut exit without save
keymap('n', 'ZQ', '<Nop>', opts)

-- esc * 2 -> cancel search highlight
keymap('n', '<Esc>', '<Esc><Esc>:<C-u>nohlsearch<CR>', opts)

-- cancel search highlight and refresh screen
keymap('n', '<C-l>', ':nohlsearch<CR>', opts)

-- delete buffer without close split view
keymap('n', '<C-w>w', ':Bdelete<CR>', opts)

-- quick save
keymap('n', '<Leader>w', ':w<CR>', opts)

-- Force quit
keymap('n', 'sq', ':<C-u>:bd<CR>', opts)
keymap('n', 'sQ', ':<C-u>q!<CR>', opts)

-- back to editted cursor pos
keymap('n', 'g<CR>', 'g;', opts)

-- window and tab controls
keymap('n', 's', '<Nop>', opts)
keymap('n', 'sj', '<C-w>j', opts)
keymap('n', 'sk', '<C-w>k', opts)
keymap('n', 'sl', '<C-w>l', opts)
keymap('n', 'sh', '<C-w>h', opts)
keymap('n', 'sJ', '<C-w>J', opts)
keymap('n', 'sK', '<C-w>K', opts)
keymap('n', 'sL', '<C-w>L', opts)
keymap('n', 'sH', '<C-w>H', opts)
keymap('n', 'sr', '<C-w>r', opts)
keymap('n', 's=', '<C-w>=', opts)
keymap('n', 'so', '<C-w>_<C-w>|', opts)
keymap('n', 'sO', '<C-w>=', opts)
keymap('n', 'sn', ':bn<CR>', opts)
keymap('n', 'sp', ':bp<CR>', opts)
keymap('n', 'st', ':tabnew<CR>', opts)
keymap('n', 'ss', ':sp<CR>', opts)
keymap('n', 'sv', ':vs<CR>', opts)

-- switch tab
keymap('n', '<Tab>', 'gt', opts)
keymap('n', '<S-Tab>', 'gT', opts)

-- change buf size
keymap('n', '<S-Left>', '<C-w><<CR>', opts)
keymap('n', '<S-Right>', '<C-w>><CR>', opts)
keymap('n', '<S-Up>', '<C-w>-<CR>', opts)
keymap('n', '<S-Down>', '<C-w>+<CR>', opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'jj', '<ESC>', opts)

-- コンマの後に自動的にスペースを挿入
keymap('i', ',', ',<Space>', opts)

-- cursor controls in insert mode
keymap('i', '<C-e>', '<END>', opts)
keymap('i', '<C-a>', '<HOME>', opts)
keymap('i', '<C-b>', '<Left>', opts)
keymap('i', '<C-f>', '<Right>', opts)
keymap('i', '<C-d>', '<Del>', opts)

-- Visual --
-- ;でコマンド入力( ;と:を入れ替)
keymap('v', ';', ':', opts)
keymap('v', ':', ';', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- ビジュアルモード時vで行末まで選択
keymap('v', 'v', '$h', opts)

-- Command line --
-- cursor controls in command line mode
keymap('c', '<C-p>', '<Up>', opts)
keymap('c', '<C-n>', '<Down>', opts)
keymap('c', '<C-b>', '<Left>', opts)
keymap('c', '<C-f>', '<Right>', opts)
keymap('c', '<C-a>', '<HOME>', opts)
keymap('c', '<C-e>', '<END>', opts)
keymap('c', '<C-d>', '<Del>', opts)
