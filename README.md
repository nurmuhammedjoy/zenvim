# Zenvim: Neovim for Termux

<p align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" alt="Neovim Logo" width="120" height="120">
</p>

<p align="center">
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT"></a>
  <a href="https://github.com/nurmuhammedjoy/zenvim"><img src="https://img.shields.io/github/last-commit/nurmuhammedjoy/zenvim?logo=github" alt="GitHub last commit"></a>
  <a href="https://termux.dev/"><img src="https://img.shields.io/badge/Termux-Android-green?logo=android" alt="Termux"></a>
  <a href="https://neovim.io/"><img src="https://img.shields.io/badge/Neovim-0.11%2B-57A143?logo=neovim" alt="Neovim 0.11+"></a>
</p>

<p align="center">
  <em>A powerful, lightweight, and modular Neovim configuration optimized for coding on Android via Termux.</em>
</p>

---

##  Introduction

A powerful yet lightweight Neovim configuration optimized for coding on Termux


###  Key Features

- **Performance Optimized**: Fast startup time with lazy-loading plugins.
- **Modern Package Management**: Powered by [`lazy.nvim`](https://github.com/folke/lazy.nvim) for automatic updates and management.
- **Intelligent Coding**: 
  - **LSP** support (HTML, CSS, TS, JSON, Emmet, Bash) via [`mason.nvim`](https://github.com/williamboman/mason.nvim); `clangd` and `lua_ls` are picked up from `$PATH`.
  - Autocompletion with [`blink.cmp`](https://github.com/Saghen/blink.cmp) and LuaSnip snippets.
- **Beautiful UI**: Gruvbox theme (transparent) and sleek [`lualine`](https://github.com/nvim-lualine/lualine.nvim).
- **Enhanced Navigation**: 
  - [`mini.files`](https://github.com/echasnovski/mini.files) for file management.
  - [`telescope`](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding.
- **Termux Friendly**: Keybindings designed for touch keyboards and mobile constraints.

---

## Preview

<p align="center">
  <img src="preview/preview.png" alt="App Screenshot" width="1200"/>
  <img src="preview/preview2.png" alt="App Screenshot" width="1200"/>
  <br>
</p>

---

##  Installation

### Prerequisites
- **Termux** app installed on Android.
- **Neovim** (v0.11.0 or newer — the config uses the native `vim.lsp.config` / `vim.lsp.enable` API).
- **Git** and **Curl**.

### Automatic Install
Run this single command in Termux to install Zenvim (existing `~/.config/nvim` is automatically backed up to `~/.config/nvim.bak`):

```bash
curl -fsSL https://raw.githubusercontent.com/nurmuhammedjoy/zenvim/main/build | bash
```

**Note:** The installer is designed for Termux on Android only.

**First launch:** plugins and (via Mason) the language servers are fetched on first start, so it needs internet access and can take a few minutes. Later launches are fast. If a server is missing, run `:Mason` to install it manually.

### Manual Install
If you prefer to install manually:

1. **Backup existing config:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```
2. **Clone the repository:**
   ```bash
   git clone https://github.com/nurmuhammedjoy/zenvim.git
   ```
3. **Move configuration files:**
   ```bash
   mkdir -p ~/.config/nvim
   cp -r zenvim/config/* ~/.config/nvim/
   ```
4. **Clean up:**
   ```bash
   rm -rf zenvim
   ```

---

##  Key Bindings

**Leader Key:** <kbd>Space</kbd>

###  General & File Management

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

###  Search (Telescope)

| Key | Action |
| :--- | :--- |
| <kbd>Space</kbd> + <kbd>ff</kbd> | Find files |
| <kbd>Space</kbd> + <kbd>fg</kbd> | Live Grep (search text in files) |
| <kbd>Space</kbd> + <kbd>fb</kbd> | Find open buffers |
| <kbd>Space</kbd> + <kbd>fo</kbd> | Recent files (Oldfiles) |

###  LSP & Coding

| Key | Action |
| :--- | :--- |
| <kbd>gd</kbd> | Go to Definition |
| <kbd>gr</kbd> | Go to References |
| <kbd>K</kbd> | Show Hover Documentation |
| <kbd>Space</kbd> + <kbd>rn</kbd> | Rename Symbol |
| <kbd>Space</kbd> + <kbd>ca</kbd> | Code Actions |
| <kbd>Space</kbd> + <kbd>f</kbd> | Format File |
| <kbd>Space</kbd> + <kbd>r</kbd> | Search & Replace (Confirm) |
| <kbd>Space</kbd> + <kbd>R</kbd> | Search & Replace (All) |

###  Line Moving

| Key | Action |
| :--- | :--- |
| <kbd>Alt</kbd> + <kbd>h</kbd> / <kbd>Alt</kbd> + <kbd>l</kbd> | Move line/selection left/right |
| <kbd>Alt</kbd> + <kbd>j</kbd> / <kbd>Alt</kbd> + <kbd>k</kbd> | Move line/selection down/up |

---

##  Included Plugins

Zenvim comes pre-configured with these essential plugins:

- **Core**: `lazy.nvim`, `plenary.nvim`
- **UI**: `gruvbox.nvim` (theme), `lualine.nvim` (status), `bufferline.nvim` (buffer tabs), `dressing.nvim` (input/select), `indent-blankline.nvim` (indent guides), `which-key.nvim` (key hints)
- **Editor**: `mini.files` (explorer), `telescope.nvim` (finder), `nvim-treesitter` (syntax), `nvim-autopairs`, `Comment.nvim`, `nvim-surround`, `mini.move` (line moving)
- **LSP & Completion**: `nvim-lspconfig`, `mason.nvim`, `mason-lspconfig.nvim`, `blink.cmp`, `LuaSnip`, `friendly-snippets`
- **Tools**: `toggleterm.nvim` (terminal)

---

##  Contributing

Contributions are welcome! If you find a bug or want to add a feature, feel free to open an issue or submit a pull request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

<p align="center">
  Made with ❤️ by <strong>nurmuhammedjoy</strong>
</p>
