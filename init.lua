-- map helper
local function map(modes, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(modes, lhs, rhs, options)
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable yanking to go to system clipboard
vim.opt.clipboard = 'unnamedplus'

-- use nerdfont
vim.g.have_nerd_font = true
vim.o.guifont = 'CaskaydiaCove NF'

-- open new splits on the right instead of on top
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L",
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable break indent
vim.opt.breakindent = true

-- since surround uses [s], replace the old s functionality with ss
map('n', 's', '', { noremap = true })
map('n', 'ss', 'xi', { noremap = true, silent = true })

-- neovide keybinds
if vim.g.neovide then
  map('n', '<C-+>', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>')
  map('n', '<C-->', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>')
  map('n', '<C-0>', ':lua vim.g.neovide_scale_factor = 1<CR>')
  map('n', '<C-ScrollWheelUp>', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>')
  map('n', '<C-ScrollWheelDown>', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>')
end

-- minimum amount of lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- enable ctrl+s/S to save file/all
map({ "i", "x", "n", "s" }, '<C-s>', '<cmd>w<CR><esc>', { desc = "Save file" })
map({ "i", "x", "n", "s" }, '<C-S>', '<cmd>wa<CR><esc>', { desc = "Save all files" })

-- quickref next/prev
map('n', '<C-j>', '<cmd>cnext<CR>')
map('n', '<C-k>', '<cmd>cprev<CR>')

-- Highlight when yanking (copying) text
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
map('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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

-- close current windows
map('n', '<leader>c', ':q<CR>', { noremap = true, silent = true })

-- Nvim-Tree keybinds
map('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })
map('n', '<leader>t', '<cmd>NvimTreeFocus<CR>', { noremap = true, silent = true })
-- open current buffer file in nvim tree
map('n', '<leader>f', '<cmd>NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Bufferline Keybinds
-- Switch between tabs using leader key + number keys (1-9)
for i = 0, 9 do
    local key = '<leader>' .. i
    local command = ':BufferLineGoToBuffer ' .. i .. '<CR>'
    map('n', key, command, { noremap = true, silent = true })
end

-- tells teh auto pair plugin to also move the opening bracket on a new line
vim.g.AutoPairsAutoLineBreak = { '{' }
vim.g.AutoPairsSyncAutoBreakOptions = 1

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
    close_command = 'bdelete %d',
    indicator = {
      style = 'icon',
      icon = ' ',
    },
    left_trunc_marker = '',
    modified_icon = '●',
    offsets = { 
      { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' },
      { filetype = 'Undotree', text = 'Undo Tree', text_align = 'center' },
    },
    right_mouse_command = 'bdelete! %d',
    right_trunc_marker = '',
    show_close_icon = false,
    show_tab_indicators = true,
  },
})

require('ibl').setup()

require('lualine').setup {
  extensions = { 'nvim-tree' },
  options = {
    theme = 'vscode',
    globalstatus = true,
  }
}

-- better around/inner and surround with s[acd] instead of [ycd]s
require('mini.ai').setup({ n_lines = 500 })
require('mini.surround').setup()
-- TODO: use sandwich.vim instead
-- also generally put all nvim extensions into vim?

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

require('Comment').setup()

local actions = require('telescope.actions')
local open_with_trouble = require('trouble.sources.telescope').open

-- configure telescope to show themes
require('telescope').setup({
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
  defaults = {
    mappings = {
      i = { ["<c-t>"] = open_with_trouble },
      n = { ["<c-t>"] = open_with_trouble },
    }
  }
})

map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
map('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics (Trouble)' })
map('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' })
map('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', { desc = 'LSP Definitions / references / ... (Trouble)' })
map('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
map('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' })

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require('telescope.builtin')
map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
map('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
map('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- search themes
vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- grep buffers
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

-- LSP stuff
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)

    -- keybinds
    map('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinition' })
    map('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
    map('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })
    map('n', 'go', require('telescope.builtin').lsp_type_definitions, { desc = 'Type [D]efinition' })
    map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
    map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
    map('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
    map('n', '<F2>', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
    map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
    map('n', '<leader>i', vim.lsp.buf.hover, { desc = 'Hover Documentation / [I]nfo' })
    map('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })

    -- highlights references
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    -- inlay hints
    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      map('<leader>ih', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, 'Toggle [I]nlay [H]ints')
    end
  end
})

local servers = {
  cmake,
  clangd,
  omnisharp,
}

local tools = {
  -- cmake
  "cmakelang",

  -- c++
  "cpptools",
  "sonarlint-language-server",
  "clang-format",

  -- c#
  "csharpier",
  "netcoredbg",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

-- mason
require('mason').setup()

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, tools)
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      require('lspconfig')[server_name].setup(server)
    end,
  },
})

local langs = { 
  'c', 
  'cpp', 
  'c_sharp', 
  'cmake' 
}

-- treesitter
require('nvim-treesitter.install').prefer_git = true
require('nvim-treesitter.configs').setup({
  ensure_installed = langs,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = { enable = true },
})

-- Customize LSP hover window borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    -- Define border style: "single", "double", "rounded", "solid", or "shadow"
    border = "rounded"
  }
)

-- cmp
cmp = require('cmp')
cmp.setup({
  completion = { completeopt = 'menu,menuone,noinsert' },
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete {},
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

require('gruvbox').setup({
  contrast = 'hard',
})

local colors = require('vscode.colors').get_colors()
require('vscode').setup({
  group_overrides = {
    ['@property'] = { fg = '#DCDADC', bg = colors.vscNone },
    ['@interface'] = { fg = '#B8D7A3', bg = colors.vscNone },
    ['@structure'] = { fg = '#86C691', bg = colors.vscNone },
  }
})

-- Set the colorscheme
vim.o.background = 'dark'
vim.cmd([[colorscheme vscode]])

