local fn = vim.fn

-- Automatically install and bootstrap pckr
local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

-- Plugins
require('pckr').add{
  -- Common utilities
  "nvim-lua/plenary.nvim";
  "kkharji/sqlite.lua";

  -- ui lib
  "MunifTanjim/nui.nvim";

  -- Custom startup view
  "goolord/alpha-nvim";

  -- repeat util
  "tpope/vim-repeat";

  -- surrounding
  "tpope/vim-surround";

  -- input mode handler
  "brglng/vim-im-select";

  -- Close buffer without break window layout
  "famiu/bufdelete.nvim";

  -- Auto close parentheses
  "cohama/lexima.vim";

  -- f move customize
  "ggandor/lightspeed.nvim";

  -- Restrict edit history jump to only one buffer
  "osyo-manga/vim-milfeulle";

  -- comment handler
  "terrortylor/nvim-comment";

  -- copilot
  "github/copilot.vim";

  --
  -- UI Parts
  --
  -- Colorschemes
  "jacoborus/tender.vim";
  "neanias/everforest-nvim";
  "folke/tokyonight.nvim";

  -- File icons
  "kyazdani42/nvim-web-devicons";

  -- Colorize color code
  {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end
  };
  "RRethy/vim-illuminate";

  -- Statusline
  "nvim-lualine/lualine.nvim";

  -- Show buffers and handle them
  "akinsho/bufferline.nvim";

  -- Customize indent line
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("ibl").setup() end
  };

  -- status bar
  "petertriho/nvim-scrollbar";

  -- notification; search, and cmdline
  "folke/noice.nvim";

  -- git decorations
  "lewis6991/gitsigns.nvim";

  -- Lock a buffer to a window (must for filer drawer!!)
  {
    "stevearc/stickybuf.nvim",
    config = function() require("stickybuf").setup() end
  };

  --
  -- Syntax Highlights: Treesitter
  --
  "nvim-treesitter/nvim-treesitter";

  -- autoclose and autorename html tag
  {
    "windwp/nvim-ts-autotag",
    requires = {"nvim-treesitter/nvim-treesitter"},
    config = function() require("nvim-ts-autotag").setup() end
  };

  --
  -- Filer
  --
  "s1n7ax/nvim-window-picker";
  "nvim-neo-tree/neo-tree.nvim";

  --
  -- Fuzzy finder: Telescope
  --
  "nvim-telescope/telescope.nvim";

  --
  -- LSP
  --
  -- lsp server handling
  "neovim/nvim-lspconfig";
  "williamboman/mason.nvim";
  "williamboman/mason-lspconfig.nvim";

  -- lsp completions
  "hrsh7th/nvim-cmp";
  "hrsh7th/cmp-nvim-lsp";
  "hrsh7th/cmp-buffer";
  "hrsh7th/cmp-path";
  'hrsh7th/cmp-cmdline';
  "hrsh7th/cmp-vsnip";
  "hrsh7th/vim-vsnip";
  "onsails/lspkind.nvim";

  -- lsp ui
  'kkharji/lspsaga.nvim';

  -- Linter / Formatter
  "jay-babu/mason-null-ls.nvim";
  "nvimtools/none-ls.nvim"; -- replace null-ls

  -- Extensible UI for Neovim notifications and LSP progress messages
  {
    'j-hui/fidget.nvim',
    config = function() require("fidget").setup() end
  };
}
