return require('lazy').setup({
  -- Highlights current line
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = { } },

  -- smooth scrolling
  'karb94/neoscroll.nvim',

  -- color theme
  { 'ellisonleao/gruvbox.nvim', priority = 1000 , config = true },
  { 'Mofiqul/vscode.nvim', priority = 1000 , config = true },

  -- bufferline (the tabs above)
  { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' },

  -- status line at the bottom
  { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } },

  -- motion with leader + [wbe] within a word
  'chaoren/vim-wordmotion',

  -- better way to add brackets around stuff
  'echasnovski/mini.nvim',

  -- highlights other uses of a word that's under the cursor
  'RRethy/vim-illuminate',
  
  -- shows the git status line on the left of a file to show changes/additions etc
  'lewis6991/gitsigns.nvim',

  -- file explorer
  'nvim-tree/nvim-tree.lua',

  -- use to close buffers (the tabs above) 
  'moll/vim-bbye',

  -- lsp stuff
  { 'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
  },

  -- show undo history in a tree
  'mbbill/undotree',

  -- automatically detect tabstop and shiftwidth
  'tpope/vim-sleuth',

  -- comment with gc
  { 'numToStr/Comment.nvim' },

  -- telescope
  { 'nvim-telescope/telescope.nvim', 
    dependencies = { 
      'nvim-lua/plenary.nvim', 
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- auto cmplete
  { 'hrsh7th/nvim-cmp',
    dependencies = { 
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'neovim/nvim-lspconfig',
    }
  },

  -- treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  'LunarWatcher/auto-pairs',

  'folke/trouble.nvim',
})

