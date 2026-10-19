# Zenvim: Neovim Configuration for Termux (Android)

<p align="center">
  <a href="https://nurmuhammedjoy.github.io/zenvim/">
    <img src="https://neovim.io/logos/neovim-mark-flat.png" alt="Zenvim logo: Neovim mark, a lightweight Neovim IDE configuration for Termux on Android" width="120" height="120">
  </a>
</p>

<p align="center">
  <a href="https://nurmuhammedjoy.github.io/zenvim/"><img src="https://img.shields.io/badge/Website-zenvim-blue?logo=githubpages" alt="Zenvim official website"></a>
  <a href="https://www.gnu.org/licenses/gpl-3.0.html"><img src="https://img.shields.io/badge/License-GPLv3-blue.svg" alt="License: GPL-3.0"></a>
  <a href="https://github.com/nurmuhammedjoy/zenvim"><img src="https://img.shields.io/github/last-commit/nurmuhammedjoy/zenvim?logo=github" alt="GitHub last commit"></a>
  <a href="https://termux.dev/"><img src="https://img.shields.io/badge/Termux-Android-green?logo=android" alt="Termux on Android"></a>
  <a href="https://neovim.io/"><img src="https://img.shields.io/badge/Neovim-0.11%2B-57A143?logo=neovim" alt="Neovim 0.11+"></a>
</p>

<p align="center">
  <strong>Zenvim is a fast, modular Neovim config (IDE setup) for coding on Android with Termux.</strong><br>
  One-command install · LSP · autocompletion · Telescope · touch-friendly keybindings
</p>

<p align="center">
  <a href="https://nurmuhammedjoy.github.io/zenvim/">Official Website</a> ·
  <a href="#installation">Install</a> ·
  <a href="#key-bindings">Key Bindings</a> ·
  <a href="#included-plugins">Plugins</a> ·
  <a href="#faq">FAQ</a>
</p>

---

## What is Zenvim?

**Zenvim** is an open-source **Neovim configuration for Termux** that turns Neovim into a lightweight, modern code editor on Android phones and tablets. It uses `lazy.nvim` for lazy-loaded plugins (fast startup), the native Neovim 0.11+ LSP API for language servers, `blink.cmp` for autocompletion, `telescope.nvim` for fuzzy finding, and `mini.files` as a file explorer. Its keybindings are designed for touch keyboards.

Official website: **<https://nurmuhammedjoy.github.io/zenvim/>**
Source code: **<https://github.com/nurmuhammedjoy/zenvim>**

## Quick Facts

| | |
| :--- | :--- |
| **Name** | Zenvim |
| **Type** | Neovim configuration / IDE setup (Lua) |
| **Platform** | Termux on Android |
| **Requires** | Neovim 0.11.0+, Git, Curl |
| **Plugin manager** | `lazy.nvim` |
| **LSP** | Native `vim.lsp.config` / `vim.lsp.enable`, servers via `mason.nvim` |
| **Completion** | `blink.cmp` + LuaSnip + friendly-snippets |
| **Fuzzy finder** | `telescope.nvim` |
| **File explorer** | `mini.files` |
| **Theme** | Gruvbox (transparent) + `lualine.nvim` |
| **Leader key** | `Space` |
| **License** | GPL-3.0 |
| **Author** | [nurmuhammedjoy](https://github.com/nurmuhammedjoy) |

## Table of Contents

- [Key Features](#key-features)
- [Preview](#preview)
- [Installation](#installation)
- [Key Bindings](#key-bindings)
- [Included Plugins](#included-plugins)
- [Supported Languages](#supported-languages-lsp)
- [FAQ](#faq)
- [Contributing](#contributing)
- [License](#license)

---

## Key Features

- **Fast startup**: plugins are lazy-loaded with [`lazy.nvim`](https://github.com/folke/lazy.nvim), which also handles automatic updates and management.
- **Language Server Protocol (LSP)**: HTML, CSS, TypeScript, JSON, Emmet and Bash via [`mason.nvim`](https://github.com/williamboman/mason.nvim). `clangd` and `lua_ls` are picked up from `$PATH`.
- **Autocompletion and snippets**: [`blink.cmp`](https://github.com/Saghen/blink.cmp) with LuaSnip and friendly-snippets.
- **Clean UI**: transparent Gruvbox theme, [`lualine`](https://github.com/nvim-lualine/lualine.nvim) status line and `bufferline` tabs.
- **Navigation**: [`mini.files`](https://github.com/echasnovski/mini.files) for file management and [`telescope`](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding files, text and buffers.
- **Termux-friendly**: keybindings designed for touch keyboards and mobile constraints.

---

## Preview

<p align="center">
  <img src="preview/preview.png?v=2" alt="Zenvim screenshot: Neovim running in Termux on Android with Gruvbox theme, lualine status bar and file explorer" width="1200"/>
  <img src="preview/preview2.png?v=2" alt="Zenvim screenshot: code editing with LSP completion and Telescope fuzzy finder in Termux" width="1200"/>
</p>

---

## Installation

### Prerequisites

- **Termux** installed on Android
- **Neovim v0.11.0 or newer** (the config uses the native `vim.lsp.config` / `vim.lsp.enable` API)
- **Git** and **Curl**

### Automatic Install (recommended)

Run this single command in Termux. An existing `~/.config/nvim` is automatically backed up to `~/.config/nvim.bak`.

```bash
curl -fsSL https://raw.githubusercontent.com/nurmuhammedjoy/zenvim/main/build | bash
```

> **Note:** the installer is designed for Termux on Android only.

**First launch:** plugins and (via Mason) the language servers are fetched on first start. This needs internet access and can take a few minutes. Later launches are fast. If a server is missing, run `:Mason` to install it manually.

### Manual Install

1. **Back up your existing config:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```
2. **Clone the repository:**
   ```bash
   git clone https://github.com/nurmuhammedjoy/zenvim.git
   ```
3. **Copy the configuration files:**
   ```bash
   mkdir -p ~/.config/nvim
   cp -r zenvim/config/* ~/.config/nvim/
   ```
4. **Clean up:**
   ```bash
   rm -rf zenvim
   ```

---

## Key Bindings

**Leader key:** <kbd>Space</kbd>

### General and File Management

| Key | Mode | Action |
| :--- | :---: | :--- |
| <kbd>Ctrl</kbd> + <kbd>s</kbd> | `n/i` | Save file |
| <kbd>Ctrl</kbd> + <kbd>q</kbd> | `n/i` | Quit Neovim |
| <kbd>Ctrl</kbd> + <kbd>e</kbd> or <kbd>Ctrl</kbd> + <kbd>n</kbd> | `n` | Toggle file explorer (mini.files) |
| <kbd>Tab</kbd> / <kbd>Shift</kbd> + <kbd>Tab</kbd> | `n` | Next / previous buffer |
| <kbd>Space</kbd> + <kbd>nh</kbd> | `n` | Clear search highlights |
| <kbd>Space</kbd> + <kbd>bn</kbd> | `n` | Next buffer |
| <kbd>Space</kbd> + <kbd>bp</kbd> | `n` | Previous buffer |
| <kbd>Ctrl</kbd> + <kbd>t</kbd> | `n/t` | Toggle terminal |

### Search (Telescope)

| Key | Action |
| :--- | :--- |
| <kbd>Space</kbd> + <kbd>ff</kbd> | Find files |
| <kbd>Space</kbd> + <kbd>fg</kbd> | Live grep (search text in files) |
| <kbd>Space</kbd> + <kbd>fb</kbd> | Find open buffers |
| <kbd>Space</kbd> + <kbd>fo</kbd> | Recent files (oldfiles) |

### LSP and Coding

| Key | Action |
| :--- | :--- |
| <kbd>gd</kbd> | Go to definition |
| <kbd>gr</kbd> | Go to references |
| <kbd>K</kbd> | Show hover documentation |
| <kbd>Space</kbd> + <kbd>rn</kbd> | Rename symbol |
| <kbd>Space</kbd> + <kbd>ca</kbd> | Code actions |
| <kbd>Space</kbd> + <kbd>f</kbd> | Format file |
| <kbd>Space</kbd> + <kbd>r</kbd> | Search and replace (confirm) |
| <kbd>Space</kbd> + <kbd>R</kbd> | Search and replace (all) |

### Line Moving

| Key | Action |
| :--- | :--- |
| <kbd>Alt</kbd> + <kbd>h</kbd> / <kbd>Alt</kbd> + <kbd>l</kbd> | Move line/selection left/right |
| <kbd>Alt</kbd> + <kbd>j</kbd> / <kbd>Alt</kbd> + <kbd>k</kbd> | Move line/selection down/up |

---

## Included Plugins

| Category | Plugins |
| :--- | :--- |
| **Core** | `lazy.nvim`, `plenary.nvim` |
| **UI** | `gruvbox.nvim` (theme), `lualine.nvim` (status line), `bufferline.nvim` (buffer tabs), `dressing.nvim` (input/select), `indent-blankline.nvim` (indent guides), `which-key.nvim` (key hints) |
| **Editor** | `mini.files` (explorer), `telescope.nvim` (finder), `nvim-treesitter` (syntax), `nvim-autopairs`, `Comment.nvim`, `nvim-surround`, `mini.move` (line moving) |
| **LSP and Completion** | `nvim-lspconfig`, `mason.nvim`, `mason-lspconfig.nvim`, `blink.cmp`, `LuaSnip`, `friendly-snippets` |
| **Tools** | `toggleterm.nvim` (terminal) |

## Supported Languages (LSP)

| Language | Server source |
| :--- | :--- |
| HTML, CSS, TypeScript, JSON, Emmet, Bash | Installed automatically through `mason.nvim` |
| C / C++ (`clangd`), Lua (`lua_ls`) | Picked up from your `$PATH` |

---

## FAQ

### What is Zenvim?
Zenvim is a Neovim configuration made for Termux on Android. It gives you LSP, autocompletion, fuzzy finding, a file explorer and a themed UI with a single install command.

### How do I install Neovim with an IDE-like setup on Termux?
Run `curl -fsSL https://raw.githubusercontent.com/nurmuhammedjoy/zenvim/main/build | bash`. See [Installation](#installation) for the manual method.

### Which Neovim version does Zenvim need?
Neovim 0.11.0 or newer, because it uses the native `vim.lsp.config` and `vim.lsp.enable` API.

### Will Zenvim overwrite my existing Neovim config?
No. The installer backs up your current `~/.config/nvim` to `~/.config/nvim.bak` first.

### Why is the first launch slow?
Plugins and language servers are downloaded on first start, which needs internet access and can take a few minutes. Later launches are fast thanks to lazy-loading.

### A language server is missing. What should I do?
Run `:Mason` inside Neovim and install it manually.

### Does Zenvim work on desktop Linux, macOS or Windows?
The automatic installer is for Termux on Android only. You can still copy the `config/` folder into `~/.config/nvim` by hand, but only Termux is officially targeted.

### What is the leader key?
<kbd>Space</kbd>.

### Where is the official website?
<https://nurmuhammedjoy.github.io/zenvim/>

---

## Contributing

Contributions are welcome. If you find a bug or want to add a feature, open an issue or submit a pull request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Zenvim is released under the [GNU GPL v3.0](https://www.gnu.org/licenses/gpl-3.0.html).

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/nurmuhammedjoy"><strong>nurmuhammedjoy</strong></a> ·
  <a href="https://nurmuhammedjoy.github.io/zenvim/">Website</a> ·
  <a href="https://github.com/nurmuhammedjoy/zenvim">GitHub</a>
</p>

<!--
Keywords: Zenvim, Neovim Termux, Neovim Android, Termux IDE, Neovim config, Neovim configuration,
lazy.nvim, blink.cmp, mason.nvim, Telescope, mini.files, LSP, Gruvbox, Lua, mobile coding,
code on Android, Termux Neovim setup, lightweight Neovim, dotfiles
-->

