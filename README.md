# minimoon.nvim

A Neovim configuration that prioritizes a minimal footprint and small window size, while providing a fully-featured editing environment.

## Features

- LSP support with automatic server installation via Mason
- Autocompletion (nvim-cmp)
- Fuzzy finding (Telescope)
- File explorer (Neo-tree)
- Syntax highlighting (Tree-sitter)
- Auto-formatting (conform.nvim)
- Autopairs
- Kanagawa color scheme
- Todo comments highlighting
- Mini.nvim utilities

## Language Support

The following LSP servers and tools are installed automatically via Mason:

| Language | LSP Server |
|----------|------------|
| Go | gopls |
| Python | pyright |
| TypeScript/JavaScript | ts_ls |
| Lua | lua_ls |
| CSS | cssls |
| GLSL | glsl_analyzer |
| C# | omnisharp_mono |
| C/C++ | clangd |

## Requirements

The following tools must be installed before running Neovim.

### System dependencies

**macOS (Homebrew)**

```sh
brew install fd ripgrep
```

**Nerd Font**

A [Nerd Font](https://www.nerdfonts.com/) must be installed and set as your terminal font for icons to render correctly.

### Node.js

Required for `tree-sitter-cli`:

```sh
npm install -g tree-sitter-cli
```

## Installation

Clone the repository into your Neovim config directory:

```sh
git clone https://github.com/Lunarisnia/minimoon.nvim ~/.config/nvim
```

Then launch Neovim:

```sh
nvim
```

On first launch, [lazy.nvim](https://github.com/folke/lazy.nvim) will automatically bootstrap itself and install all plugins. Mason will then install the configured LSP servers and tools. Wait for all installations to complete before editing files.
