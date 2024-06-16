return require('lazy').setup({
  'lukas-reineke/indent-blankline.nvim',

  'karb94/neoscroll.nvim',

  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true },

  { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' },

  { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } },

  'chaoren/vim-wordmotion',

  'kylechui/nvim-surround',

  'RRethy/vim-illuminate',
  
  'lewis6991/gitsigns.nvim',

  'nvim-tree/nvim-tree.lua',

  'moll/vim-bbye',

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "neovim/nvim-lspconfig",
})

