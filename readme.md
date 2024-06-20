# Keybinds and Configurations

## Plugin Management

- `:Lazy` manages general plugins
- `:Mason` manages LSP servers

## General Keybinds

The `<leader>` key is set to `<Space>`. 

| Keybind         | Action                                      |
|-----------------|---------------------------------------------|
| `s`             | Disabled in favor of surround functionality |
| `ss`            | Replaces `s` functionality                  |
| `<Esc>`         | Clears highlight on search                  |
| `<C-s>`         | Save file in all modes                      |
| `<C-S>`         | Save all files in all modes                 |
| `<C-j>`         | Go to next quickfix item                    |
| `<C-k>`         | Go to previous quickfix item                |
| `<Arrow Keys>`  | Disabled in normal mode                     |
| `<Leader>;`     | Cycle through windows                       |
| `<Leader>n`     | Create a new empty bufferline tab           |
| `<Leader>o`     | Insert a line below the current line        |
| `<Leader>O`     | Insert a line above the current line        |
| `<Leader>q`     | Close the current buffer (file)             |
| `<Leader>t`     | Toggle Nvim-Tree                            |
| `<Leader>x`     | Focus on Nvim-Tree                          |
| `<Leader>u`     | Toggle UndoTree                             |
| `<Leader>c`     | Close current window                        |

## Plugin Specific Keybinds

### Bufferline

| Keybind         | Action                                |
|-----------------|---------------------------------------|
| `<Leader>1` to `<Leader>9` | Switch between tabs 1 to 9 |
| `<Leader><Tab>` | Cycle through tabs                    |

### Diagnostic

| Keybind         | Action                                          |
|-----------------|-------------------------------------------------|
| `[d`            | Go to **previous** **d**iagnostic message       |
| `]d`            | Go to **next** **d**iagnostic message           |
| `<Leader>e`     | Show diagnostic **e**rror messages              |
| `<Leader>q`     | Open diagnostic **q**uickfix list               |

### Telescope

| Keybind         | Action                                      |
|-----------------|---------------------------------------------|
| `<Leader>sh`    | **S**earch **h**elp tags                    |
| `<Leader>sk`    | **S**earch **k**eymaps                      |
| `<Leader>sf`    | **S**earch **f**iles                        |
| `<Leader>ss`    | **S**earch Tele**s**cope built-in functions |
| `<Leader>sw`    | **S**earch the current **w**ord             |
| `<Leader>sg`    | **S**earch by **g**rep                      |
| `<Leader>sd`    | **S**earch **d**iagnostics                  |
| `<Leader>sr`    | **R**esume last Telescope **s**earch        |
| `<Leader>s.`    | Search recent files                         |
| `<Leader><Leader>` | Find existing buffers                    |
| `<Leader>/`     | Fuzzily search in the current buffer        |
| `<Leader>s/`    | Live grep in open files                     |
| `<Leader>sn`    | **S**earch **N**eovim configuration files   |

### LSP

| Keybind               | Action                              |
|-----------------------|-------------------------------------|
| `gd`                  | **G**o to **d**efinition            |
| `gr`                  | **G**o to **r**eferences            |
| `gI`                  | **G**o to **i**mplementation        |
| `go`                  | **G**o to type definition           |
| `<Leader>ds`          | Search **d**ocument **s**ymbols     |
| `<Leader>ws`          | Search **w**orkspace **s**ymbols    |
| `<Leader>rn` & `<F2>` | **R**ename **s**ymbol               |
| `<Leader>ca`          | Show **c**ode **a**ctions           |
| `<leader>i`                   | Show hover documentation / **I**nfo |
| `gD`                  | **G**o to **d**eclaration           |
| `<Leader>ih`          | Toggle **i**nlay **h**ints          |

### Neovide

| Keybind                         | Action                              |
|---------------------------------|-------------------------------------|
| `<C-+>` & `<C-ScrollWheelUp>`   | Increase Neovide scale factor       |
| `<C-->` & `<C-ScrollWheelDown>` | Decrease Neovide scale factor       |
| `<C-0>`                         | Reset Neovide scale factor to 1     |

### Word Motions

| Motion       | Description                                        |
|--------------|----------------------------------------------------|
| `leader + b` | Move to the beginning of the current/previous word |
| `leader + w` | Move to the beginning of the next word             |
| `leader + e` | Move to the end of the current/next word           |

### CMP

| Keybind      | Action                                      |
|--------------|---------------------------------------------|
| `<Tab>`      | Cycle through the completion suggestions    |
| `<S-Tab>`    | Cycle backwards through the suggestions     |
| `<Enter>`    | Select the highlighted completion item      |
| `<C-Space>`  | Trigger completion manually                 |
| `<C-e>`      | Close the completion menu                   |
| `<C-f>`      | Scroll down in the documentation window     |
| `<C-b>`      | Scroll up in the documentation window       |

### Diagnostics

| Motion       | Description                               |
|--------------|-------------------------------------------|
| `[d`         | Go to **previous** **D**iagnostic message |
| `**d`        | Go to **next** **D**iagnostic message     |
| `<leader>de` | Show **d**iagnostic **E**rror messages    |
| `<leader>dq` | Open **d**iagnostic **Q**uickfix list     |


## Inbuilt Plugin Keybinds Reference

- [Comment.nvim](https://github.com/numToStr/Comment.nvim?tab=readme-ov-file#-usage)
- [mini.surround](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md#features)
- [mini.ai](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md#features)

