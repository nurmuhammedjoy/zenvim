# Zenvim: Neovim for Termux

<p align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" alt="Neovim Logo" width="120" height="120">
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-GPLv3-blue.svg" alt="License: GPL v3"></a>
  <a href="https://github.com/nurmuhammedjoy/zenvim"><img src="https://img.shields.io/github/last-commit/nurmuhammedjoy/zenvim?logo=github" alt="GitHub last commit"></a>
  <a href="https://termux.dev/"><img src="https://img.shields.io/badge/Termux-Android-green?logo=android" alt="Termux"></a>
  <a href="https://neovim.io/"><img src="https://img.shields.io/badge/Neovim-0.9+-57A143?logo=neovim" alt="Neovim"></a>
</p>

<p align="center">
  <em>A lightweight, modular Neovim configuration optimized for coding on Android via Termux.</em>
</p>

---

## Introduction

A lightweight Neovim configuration optimized for Termux with lazy-loading for fast startup, modern LSP support, and keybindings designed for mobile touch keyboards.

### Key Features

- **Fast Startup**: Lazy-loaded plugins via [`lazy.nvim`](https://github.com/folke/lazy.nvim).
- **Intelligent Coding**: Full LSP support (HTML, CSS, TS/JS, JSON, Emmet) via [`mason.nvim`](https://github.com/williamboman/mason.nvim), autocompletion with [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp), and AI assistance via GitHub Copilot.
- **Beautiful UI**: Gruvbox theme (transparent), [`lualine`](https://github.com/nvim-lualine/lualine.nvim) statusline, [`bufferline`](https://github.com/akinsho/bufferline.nvim) tabs, and [`indent-blankline`](https://github.com/lukas-reineke/indent-blankline.nvim) guides.
- **Navigation**: [`mini.files`](https://github.com/echasnovski/mini.files) file explorer, [`telescope`](https://github.com/nvim-telescope/telescope.nvim) fuzzy finder.
- **Termux Friendly**: Keybindings avoid complex chords; installs all system deps (ripgrep, fzf, gh, etc.) automatically.

---

## Preview

<p align="center">
  <img src="preview/screenshot.jpg" alt="App Screenshot" width="1200"/>
</p>

---

## Installation

### Prerequisites

- **Termux** app installed on Android.
- At least **1 GB** free storage (for Neovim, deps, and plugins).

### Automatic Install

Run this single command in Termux:

```bash
curl -fsSL https://raw.githubusercontent.com/nurmuhammedjoy/zenvim/main/build | sh
```

The installer will:
1. Update Termux packages and install dependencies: `clang`, `git`, `ripgrep`, `gh` (GitHub CLI), `fzf`, `python`, `nodejs`, `neovim`.
2. Back up any existing `~/.config/nvim` to `~/.config/nvim.bak`.
3. Clone and copy the configuration.
4. On first `nvim` launch, lazy.nvim automatically installs all plugins.

> **Note:** The installer only runs on Termux (Android). It exits with an error on other platforms. To use a fork, set `REPO_URL`:
> ```bash
> REPO_URL=https://github.com/your-username/zenvim.git curl -fsSL https://raw.githubusercontent.com/nurmuhammedjoy/zenvim/main/build | sh
> ```

### Manual Install

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
git clone https://github.com/nurmuhammedjoy/zenvim.git /tmp/zenvim
cp -r /tmp/zenvim/config ~/.config/nvim
rm -rf /tmp/zenvim
```

---

## Key Bindings

**Leader key:** <kbd>Space</kbd>

### General

| Key | Mode | Action |
| :--- | :---: | :--- |
| <kbd>Ctrl</kbd> + <kbd>s</kbd> | `n/i` | Save file |
| <kbd>Ctrl</kbd> + <kbd>q</kbd> | `n/i` | Quit |
| <kbd>Ctrl</kbd> + <kbd>n</kbd> / <kbd>Ctrl</kbd> + <kbd>e</kbd> | `n` | Toggle file explorer (mini.files) |
| <kbd>Space</kbd> + <kbd>nh</kbd> | `n` | Clear search highlights |
| <kbd>Space</kbd> + <kbd>bn</kbd> | `n` | Next buffer |
| <kbd>Space</kbd> + <kbd>bp</kbd> | `n` | Previous buffer |
| <kbd>Tab</kbd> / <kbd>Shift</kbd> + <kbd>Tab</kbd> | `n` | Cycle buffer tabs |

### File Explorer (mini.files)

| Key | Action |
| :--- | :--- |
| <kbd>l</kbd> | Open entry |
| <kbd>L</kbd> | Open entry & close explorer |
| <kbd>h</kbd> | Go to parent |
| <kbd>H</kbd> | Go to parent & trim right |
| <kbd>m</kbd> | Set bookmark |
| <kbd>'</kbd> | Go to bookmark |
| <kbd>=</kbd> | Synchronize view |
| <kbd>g?</kbd> | Show help |

### Search (Telescope)

| Key | Action |
| :--- | :--- |
| <kbd>Space</kbd> + <kbd>ff</kbd> | Find files |
| <kbd>Space</kbd> + <kbd>fg</kbd> | Live grep |
| <kbd>Space</kbd> + <kbd>fb</kbd> | Open buffers |
| <kbd>Space</kbd> + <kbd>fo</kbd> | Recent files |

### LSP & Coding

| Key | Action |
| :--- | :--- |
| <kbd>gd</kbd> | Go to definition |
| <kbd>gr</kbd> | Go to references |
| <kbd>K</kbd> | Hover documentation |
| <kbd>Space</kbd> + <kbd>rn</kbd> | Rename symbol |
| <kbd>Space</kbd> + <kbd>ca</kbd> | Code actions |
| <kbd>Space</kbd> + <kbd>f</kbd> | Format file |
| <kbd>Space</kbd> + <kbd>r</kbd> | Search & replace (confirm) |
| <kbd>Space</kbd> + <kbd>R</kbd> | Search & replace (all) |

### GitHub Copilot

| Key | Mode | Action |
| :--- | :---: | :--- |
| <kbd>Ctrl</kbd> + <kbd>g</kbd> | `i` | Accept suggestion |
| <kbd>Ctrl</kbd> + <kbd>\</kbd> | `i` | Dismiss suggestion |

### Terminal

| Key | Action |
| :--- | :--- |
| <kbd>Ctrl</kbd> + <kbd>t</kbd> | Toggle terminal 1 |
| <kbd>Space</kbd> + <kbd>t1</kbd> | Toggle terminal 1 |
| <kbd>Space</kbd> + <kbd>t2</kbd> | Toggle terminal 2 |
| <kbd>Space</kbd> + <kbd>t3</kbd> | Toggle terminal 3 |

### Line Moving

| Key | Mode | Action |
| :--- | :---: | :--- |
| <kbd>Ctrl</kbd> + <kbd>↑</kbd> / <kbd>↓</kbd> | `n/v` | Move line/selection up/down |
| <kbd>Ctrl</kbd> + <kbd>←</kbd> / <kbd>→</kbd> | `n/v` | Move line/selection left/right |

---

## Included Plugins

| Category | Plugins |
| :--- | :--- |
| **Core** | `lazy.nvim`, `plenary.nvim` |
| **UI** | `gruvbox.nvim` (transparent theme), `lualine.nvim` (statusline), `bufferline.nvim` (tabs), `dressing.nvim` (better prompts), `indent-blankline.nvim` (guides), `nvim-web-devicons` |
| **Editor** | `mini.files` (explorer), `telescope.nvim` (finder), `nvim-treesitter` (syntax), `nvim-autopairs`, `Comment.nvim`, `which-key.nvim`, `nvim-surround`, `mini.move` |
| **LSP & Completion** | `nvim-lspconfig`, `mason.nvim`, `mason-lspconfig.nvim`, `nvim-cmp`, `cmp-nvim-lsp`, `cmp-buffer`, `cmp-async-path`, `LuaSnip`, `cmp_luasnip`, `friendly-snippets` |
| **Tools** | `copilot.vim` (AI), `toggleterm.nvim` (terminal) |

**LSP servers installed automatically:** `html`, `cssls`, `ts_ls`, `jsonls`, `emmet_ls`.

---

## Contributing

Contributions welcome! Open an issue or submit a pull request.

1. Fork the repo
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes
4. Push and open a PR

---

<p align="center">
  Made with ❤️ by <strong>nurmuhammedjoy</strong>
</p>
