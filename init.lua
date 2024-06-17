-- map helper
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable yanking to go to system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Disable arrow keys for normal mode navigation
map('n', '<Up>', '<NOP>', { noremap = true, silent = true })
map('n', '<Down>', '<NOP>', { noremap = true, silent = true })
map('n', '<Left>', '<NOP>', { noremap = true, silent = true })
map('n', '<Right>', '<NOP>', { noremap = true, silent = true })

-- Show current & relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

vim.o.cursorline = true
vim.o.number = true
vim.o.termguicolors = true

-- Configure leader key to Space
map('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Configure CamelCaseMotion plugin leader key
vim.g.wordmotion_prefix = '<leader>'

-- Cycle through windows with <Leader>;
vim.api.nvim_set_keymap('n', '<Leader>;', '<C-W>w', { noremap = true })

-- Map leader + n to create a new empty tab
map('n', '<leader>n', ':tabnew<CR>', { noremap = true, silent = true })

-- Map leader + o to insert a line below the current line
map('n', '<leader>o', 'm`o<Esc>``', { noremap = true, silent = true })

-- Map leader + O to insert a line above the current line
map('n', '<leader>O', 'm`O<Esc>``', { noremap = true, silent = true })

-- Close the current buffer (file) with leader key + 'q'
map('n', '<leader>q', ':Bdelete<CR>', { noremap = true, silent = true })

-- Nvim-Tree keybinds
map('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Open nvim-tree with leader + x
map('n', '<leader>x', ':NvimTreeFocus<CR>', { noremap = true, silent = true })

-- Bufferline Keybinds
-- Switch between tabs using leader key + number keys (1-9)
for i = 1, 9 do
    local key = '<leader>' .. i
    local command = ':BufferLineGoToBuffer ' .. i .. '<CR>'
    map('n', key, command, { noremap = true, silent = true })
end

-- Cycle through tabs using leader key + tab
map('n', '<leader><Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

-- change the highlight style
vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'Visual' })

-- lazy nvim stuff
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('plugins')

require('neoscroll').setup()

require('bufferline').setup({
  options = {
    mode = 'buffers',
    offsets = {
      { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' }
    },
  },
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = { attribute = 'fg', highlight = 'Function' },
      italic = false
    }
  },
})

require('ibl').setup()

require('lualine').setup {
  options = {
    icons_enabled = true
  }
}

require('nvim-surround').setup()

require('illuminate').configure({
  providers = {
    'lsp',
    'treesitter',
    'regex',
  },
  delay = 100,
  under_cursor = true,
  case_insensitive_regex = false,
})

require('gitsigns').setup()

require('nvim-tree').setup()

require('mason').setup()
require('mason-lspconfig').setup()

vim.cmd('autocmd FileType cs setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- Set the colorscheme
vim.cmd('colorscheme gruvbox')

