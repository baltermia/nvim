-- map helper
local function map(modes, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(modes, lhs, rhs, options)
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable yanking to go to system clipboard
vim.opt.clipboard = 'unnamedplus'

-- use nerdfont
vim.g.have_nerd_font = true

-- minimum amount of lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- enable ctrl+s/S to save file/all
map({ "i", "x", "n", "s" }, '<C-s>', '<cmd>w<CR><esc>', { desc = "Save file" })
map({ "i", "x", "n", "s" }, '<C-S>', '<cmd>wa<CR><esc>', { desc = "Save all files" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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

-- toggle undotree
map('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })
vim.g.undotree_WindowLayout = 3

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

