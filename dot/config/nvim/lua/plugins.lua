local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Plugins
return packer.startup(function(use)
  use "wbthomason/packer.nvim"

  -- Common utilities
  use "nvim-lua/plenary.nvim"
  use "kkharji/sqlite.lua"

  -- repeat util
  use "tpope/vim-repeat"

  -- surrounding
  use "tpope/vim-surround"

  -- input mode handler
  use "brglng/vim-im-select"

  -- Colorschemes
  use "jacoborus/tender.vim"
  use "folke/tokyonight.nvim"

  -- File icons
  use "kyazdani42/nvim-web-devicons"

  -- Colorize color code
  use {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end
  }
  use "RRethy/vim-illuminate"

  -- Close buffer without break window layout
  use "famiu/bufdelete.nvim"

  -- autoclose and autorename html tag
  use {
    "windwp/nvim-ts-autotag",
    config = function()
      require"nvim-treesitter.configs".setup {
        autotag = {
          enable = true,
        }
      }
    end
  }

  -- Auto close parentheses
  use "cohama/lexima.vim"

  -- f move customize
  use "ggandor/lightspeed.nvim"

  -- Restrict edit history jump to only one buffer
  use "osyo-manga/vim-milfeulle"

  -- comment handler
  use {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({
        line_mapping = "<leader>cc",
        operator_mapping = "<leader>c",
        comment_chunk_text_object = "ic"
      })
    end
  }

  -- Session manager
  use {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  }

  -- git utils
  use "tyru/open-browser.vim"
  use "tyru/open-browser-github.vim"

  --
  -- UI Parts
  --

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight"
        }
      })
    end
  }

  -- Show buffers and handle them
	use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("bufferline").setup() end
  }

  -- Custom startup view
  use {
    "goolord/alpha-nvim",
    config = function ()
        require"alpha".setup(require"alpha.themes.dashboard".config)
    end
  }

  -- fancy notification ui
  use {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end
  }

  -- Customize indent line
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append "space:⋅"
      vim.opt.listchars:append "eol:↴"
      require("indent_blankline").setup {
         show_end_of_line = true,
         space_char_blankline = " ",
      }
    end
  }

  -- hl search results
  use {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()

      local kopts = {noremap = true, silent = true}

      vim.api.nvim_set_keymap("n", "n",
          [[<Cmd>execute("normal! " . v:count1 . "n")<CR><Cmd>lua require("hlslens").start()<CR>]],
          kopts)
      vim.api.nvim_set_keymap("n", "N",
          [[<Cmd>execute("normal! " . v:count1 . "N")<CR><Cmd>lua require("hlslens").start()<CR>]],
          kopts)
      vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require("hlslens").start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require("hlslens").start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require("hlslens").start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require("hlslens").start()<CR>]], kopts)
    end
  }

  -- status bar
  use {
    "petertriho/nvim-scrollbar",
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("scrollbar").setup({
        handle = {
          color = colors.bg_highlight,
        },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        }
      })
      require("scrollbar.handlers.search").setup()
    end
  }

  -- List the troubles
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end
  }

  -- git decorations
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
      })
    end
  }

  -- Lock a buffer to a window (must for filer drawer!!)
  use "stevearc/stickybuf.nvim"

  --
  -- Syntax Highligts: Treesitter
  --
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  }

  --
  -- Fuzzy finder: Telescope
  --
	use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "ff", builtin.find_files, {})
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "lg", builtin.live_grep, {})
      vim.keymap.set("n", "fb", builtin.buffers, {})
      vim.keymap.set("n", "fh", builtin.help_tags, {})
    end
  }

  -- frequency file browser
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
      vim.api.nvim_set_keymap("n", "<leader><leader>", ":Telescope frecency<CR>", {noremap = true, silent = true})
    end,
    requires = {"kkharji/sqlite.lua"}
  }

  -- file browser extension for telescope
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension "file_browser"
      vim.api.nvim_set_keymap("n", "fl", ":Telescope file_browser<CR>", { noremap = true })
    end,
  }

  --
  -- Filer: Fern
  --
  use {
    "lambdalisue/fern.vim",
    config = function()
      vim.api.nvim_set_keymap("n", "<Leader>b",  ":<C-u>Fern . -drawer -reveal=%<CR>", { noremap = true })
      vim.cmd([[
        let g:fern#renderer = "nerdfont"

        function! FernInit() abort
          nmap <buffer> v <Plug>(fern-action-open:side)
          nmap <buffer> M <Plug>(fern-action-new-dir)
          nmap <buffer> ! <Plug>(fern-action-hidden:toggle)
          nmap <buffer> - <Plug>(fern-action-mark:toggle)
          vmap <buffer> - <Plug>(fern-action-mark:toggle)
          nmap <buffer> C <Plug>(fern-action-clipboard-copy)
          nmap <buffer> X <Plug>(fern-action-clipboard-move)
          nmap <buffer> P <Plug>(fern-action-clipboard-paste)
          nmap <buffer> h <Plug>(fern-action-collapse)
          nmap <buffer> c <Plug>(fern-action-copy)
          nmap <buffer> <leader>h <Plug>(fern-action-leave)
          nmap <buffer> m <Plug>(fern-action-move)
          nmap <buffer> N <Plug>(fern-action-new-file)
          nmap <buffer> <cr> <Plug>(fern-action-open-or-enter)
          nmap <buffer> l <Plug>(fern-action-open-or-expand)
          nmap <buffer> t <Plug>(fern-action-open:tabedit)
          nmap <buffer> <C-l> <Plug>(fern-action-reload)
          nmap <buffer> r <Plug>(fern-action-rename)
          nmap <buffer> i <Plug>(fern-action-reveal)
          nmap <buffer> D <Plug>(fern-action-trash)
          nmap <buffer> y <Plug>(fern-action-yank)
          nmap <buffer> gr <Plug>(fern-action-grep)
          nmap <buffer> d <Plug>(fern-action-remove)
          nmap <buffer> B <Plug>(fern-action-save-as-bookmark)
          nmap <buffer> cd <Plug>(fern-action-tcd)
          nmap <buffer> <C-h> <C-w>h
          nmap <buffer> <C-l> <C-w>l
        endfunction

        augroup FernEvents
          autocmd!
          autocmd FileType fern call FernInit()
        augroup END

        let g:fern#disable_default_mappings = 1
      ]])
    end
  }
  use "lambdalisue/fern-git-status.vim"
  use "lambdalisue/nerdfont.vim"
  use "lambdalisue/fern-renderer-nerdfont.vim"
  use {
    "lambdalisue/glyph-palette.vim",
    config = function ()
      vim.cmd([[
        augroup my-glyph-palette
          autocmd! *
          autocmd FileType fern call glyph_palette#apply()
          autocmd FileType nerdtree,startify call glyph_palette#apply()
        augroup END
      ]])
    end
  }

  --
  -- LSP
  --
  local on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false

    local set = vim.keymap.set
    set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    -- set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    set("n", "<Leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
    set("n", "<Leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
    set("n", "<Leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
    set("n", "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    -- set("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    -- set("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    set("n", "<Leader>r", "<cmd>lua vim.lsp.buf.references()<CR>")
    -- set("n", "<Leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
    -- set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
    -- set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
    set("n", "<Leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
    set("n", "<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  end

  use "neovim/nvim-lspconfig"
  use {
    "williamboman/mason.nvim",
    config = function() require("mason").setup() end
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {
        function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
          }
        end
      }
    end
  }

  -- lsp ui
  use {
    'kkharji/lspsaga.nvim',
    config = function()
      local map = vim.api.nvim_buf_set_keymap
      map(0, "n", "gr", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
      map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
      map(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
      map(0, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
      map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
      map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
      map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
      map(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
      map(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})

      vim.cmd([[
        augroup lspsaga_filetypes
          autocmd!
          autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
        augroup END
      ]])
    end
  }
  use 'folke/lsp-colors.nvim'
  use {
    'j-hui/fidget.nvim',
    config = function() require("fidget").setup() end
  }

  -- Formatter
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require "null-ls"
      sources = {
        null_ls.builtins.formatting.prettier.with {
          prefer_local = "node_modules/.bin",
        },
      }
    end
  }

  --
  -- Completions
  --
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-a>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
        }, {
          { name = 'buffer' },
        })
      })
      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        })
      })
      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use 'hrsh7th/cmp-cmdline'

  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/vim-vsnip"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
