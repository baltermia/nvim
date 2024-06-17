return require('lazy').setup({
  -- Highlights current line
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = { } },

  -- smooth scrolling
  'karb94/neoscroll.nvim',

  -- color theme
  { 'ellisonleao/gruvbox.nvim', priority = 1000 , config = true },

  -- bufferline (the tabs above)
  { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' },

  -- status line at the bottom
  { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } },

  -- motion with leader + [wbe] within a word
  'chaoren/vim-wordmotion',

  'kylechui/nvim-surround',

  -- highlights other uses of a word that's under the cursor
  'RRethy/vim-illuminate',
  
  -- shows the git status line on the left of a file to show changes/additions etc
  'lewis6991/gitsigns.nvim',

  -- file explorer
  'nvim-tree/nvim-tree.lua',

  -- use to close buffers (the tabs above) 
  'moll/vim-bbye',

  -- lsp stuff
  {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },

  -- show undo history in a tree
  'mbbill/undotree',

  -- automatically detect tabstop and shiftwidth
  'tpope/vim-sleuth',

  -- comment with gc
  { 'numToStr/Comment.nvim' },
})

