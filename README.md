# Neovim Configuration for Termux

<p align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" alt="Neovim Logo" width="120" height="120">
</p>

<p align="center">
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT"></a>
  <a href="https://github.com/nurmuhammedjoy/zenvim"><img src="https://img.shields.io/github/last-commit/nurmuhammedjoy/zenvim?logo=github" alt="GitHub last commit"></a>
  <a href="https://termux.dev/"><img src="https://img.shields.io/badge/Termux-Android-green?logo=android" alt="Termux"></a>
  <a href="https://neovim.io/"><img src="https://img.shields.io/badge/Neovim-0.9+-57A143?logo=neovim" alt="Neovim"></a>
</p>

<p align="center">
  <em> A powerful yet lightweight Neovim configuration optimized for coding on Android </em>
</p>

## Preview 

<p align="center">
  <img src="preview/screenshot.jpg" alt="App Screenshot" width="400"/>
</p>


## Features

-  **Gorgeous UI** with Gruvbox theme and transparent background
-  **Intuitive File Navigation** with Neo-tree explorer  
-  **Powerful Search** with Telescope fuzzy finder
-  **Intelligent Code Assistance** with LSP and nvim-cmp
-  **AI Coding Partner** with GitHub Copilot integration
-  **Lightning Fast** with performance optimizations for mobile
-  **Touch-Friendly** key mappings designed for Termux
-  **Preconfigured** for web development

---

## Requirements

- **Neovim 0.9** or later
- **Unexpected Keyboard** but optional 

---

##  Quick Installation

If ~/.config/nvim doesn’t exist, create it first:

```bash
mkdir -p ~/.config/nvim
```
Make a backup of your current Neovim files:

```bash
mv ~/.config/nvim{,.bak}
```
downloaded the config: 

```bash
curl -fsSL https://raw.githubusercontent.com/nurmuhammedjoy/zenvim/refs/heads/main/config/init.lua -o ~/.config/nvim/init.lua
```
---

## Authorizing GitHub Copilot

To use GitHub Copilot with this configuration, you need to authorize it:

1. **Prerequisite**: 
   - Have an active GitHub Copilot subscription
   - Be signed in to your GitHub account

2. **Authentication process**:
   - Open Neovim
   - Run the command `:Copilot auth` in normal mode
   - Follow the on-screen instructions:
     - A one-time code will be displayed
     - Open the provided URL in your browser
     - Enter the code when prompted
     - Authorize GitHub Copilot to access your account

3. **Verification**:
   - After successful authentication, you should see a confirmation message
   - Restart Neovim to ensure Copilot is properly initialized
   - Start typing code, and Copilot suggestions should appear as ghost text

> **Note**: GitHub Copilot requires an internet connection to function

---

##  Key Bindings

> **Note:** The leader key is set to <kbd>Space</kbd>

### General

<div align="center">

| Key Combination | Mode | Action |
|:---------------:|:----:|--------|
| <kbd>Ctrl</kbd> + <kbd>s</kbd> | Normal/Insert | Save file        |
| <kbd>Space</kbd> + <kbd>nh</kbd> | Normal | Clear search highlights.            |

</div>

### File Explorer (Neo-tree)

<div align="center">

| Key Combination | Mode | Action |
|:---------------:|:----:|--------|
| <kbd>Space</kbd> + <kbd>e</kbd> | Normal | Toggle file explorer |

</div>

### Fuzzy Finder (Telescope)

<div align="center">

| Key Combination | Mode | Action |
|:---------------:|:----:|--------|
| <kbd>Space</kbd> + <kbd>ff</kbd> | Normal | Find files |
| <kbd>Space</kbd> + <kbd>fg</kbd> | Normal | Live grep (search in files) |
| <kbd>Space</kbd> + <kbd>fb</kbd> | Normal | Browse buffers |

</div>

### LSP Features

<div align="center">

| Key Combination | Mode | Action |
|:---------------:|:----:|--------|
| <kbd>gd</kbd> | Normal | Go to definition |
| <kbd>gr</kbd> | Normal | Find references |
| <kbd>K</kbd> | Normal | Show hover documentation |
| <kbd>Space</kbd> + <kbd>rn</kbd> | Normal | Rename symbol |
| <kbd>Space</kbd> + <kbd>ca</kbd> | Normal | Code actions |
| <kbd>Space</kbd> + <kbd>f</kbd> | Normal | Format file |

</div>

### GitHub Copilot

<div align="center">

| Key Combination | Mode | Action |
|:---------------:|:----:|--------|
| <kbd>Ctrl</kbd> + <kbd>g</kbd> | Insert | Accept suggestion |
| <kbd>Ctrl</kbd> + <kbd>\</kbd> | Insert | Dismiss suggestion |

</div>

### Buffer Navigation

<div align="center">

| Key Combination | Mode | Action |
|:---------------:|:----:|--------|
| <kbd>Space</kbd> + <kbd>bn</kbd> | Normal | Next buffer |
| <kbd>Space</kbd> + <kbd>bp</kbd> | Normal | Previous buffer |

</div>

---

# Neovim Shortcuts Guide

## Modes (Expanded)
- **Normal Mode**: Navigation and commands (default)
- **Insert Mode**: Typing text (press <kbd>i</kbd> to enter)
- **Visual Mode**: Selecting text (press <kbd>v</kbd> to enter)
- **Visual Line Mode**: Select entire lines (press <kbd>Shift</kbd> + <kbd>v</kbd> to enter)
- **Visual Block Mode**: Select blocks/columns (press <kbd>Ctrl</kbd> + <kbd>v</kbd> to enter)
- **Command Mode**: Enter commands (press <kbd>:</kbd> to enter)

## Visual Mode Operations
- <kbd>v</kbd>: Enter Visual mode
- <kbd>V</kbd>: Enter Visual Line mode
- <kbd>Ctrl</kbd> + <kbd>v</kbd>: Enter Visual Block mode
- Use <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd> to expand selection
- <kbd>d</kbd>: Delete selection
- <kbd>y</kbd>: Copy (yank) selection
- <kbd>></kbd>: Indent selection
- <kbd><</kbd>: Unindent selection
- <kbd>~</kbd>: Toggle case of selection
- <kbd>U</kbd>: Make selection uppercase
- <kbd>u</kbd>: Make selection lowercase

## Advanced Navigation
- <kbd>Ctrl</kbd> + <kbd>d</kbd>: Scroll half-page down
- <kbd>Ctrl</kbd> + <kbd>u</kbd>: Scroll half-page up
- <kbd>Ctrl</kbd> + <kbd>f</kbd>: Scroll page down
- <kbd>Ctrl</kbd> + <kbd>b</kbd>: Scroll page up
- <kbd>%</kbd>: Jump to matching parenthesis/bracket
- <kbd>{</kbd>: Jump to previous paragraph
- <kbd>}</kbd>: Jump to next paragraph
- <kbd>f</kbd> + <kbd>char</kbd>: Jump to next occurrence of character
- <kbd>t</kbd> + <kbd>char</kbd>: Jump just before next occurrence of character
- <kbd>;</kbd>: Repeat last f/t command
- <kbd>,</kbd>: Repeat last f/t command in opposite direction

## Advanced Editing
- <kbd>ciw</kbd>: Change inner word
- <kbd>ci"</kbd>: Change text inside quotes
- <kbd>ci(</kbd>: Change text inside parentheses
- <kbd>cc</kbd>: Change entire line
- <kbd>.</kbd>: Repeat last edit command
- <kbd>J</kbd>: Join line below with current line
- <kbd>r</kbd> + <kbd>char</kbd>: Replace character under cursor
- <kbd>~</kbd>: Toggle case of character under cursor

## Search and Replace
- <kbd>/</kbd> + pattern: Search forward
- <kbd>?</kbd> + pattern: Search backward
- <kbd>n</kbd>: Go to next search match
- <kbd>N</kbd>: Go to previous search match
- <kbd>*</kbd>: Search for word under cursor
- <kbd>:%s/old/new/g</kbd>: Replace all occurrences in file
- <kbd>:s/old/new/g</kbd>: Replace all occurrences in line

## Working with Multiple Files
- <kbd>:sp</kbd>: Horizontal split
- <kbd>:vsp</kbd>: Vertical split
- <kbd>Ctrl</kbd> + <kbd>w</kbd> + <kbd>h/j/k/l</kbd>: Navigate between splits
- <kbd>Ctrl</kbd> + <kbd>w</kbd> + <kbd>+/-</kbd>: Resize horizontal split
- <kbd>Ctrl</kbd> + <kbd>w</kbd> + <kbd>>/<<</kbd>: Resize vertical split
- <kbd>:tabnew</kbd>: Create new tab
- <kbd>gt</kbd>: Go to next tab
- <kbd>gT</kbd>: Go to previous tab

## Macros
- <kbd>q</kbd> + <kbd>letter</kbd>: Start recording macro to register
- <kbd>q</kbd>: Stop recording macro
- <kbd>@</kbd> + <kbd>letter</kbd>: Execute macro
- <kbd>@@</kbd>: Repeat last executed macro

## Marks
- <kbd>m</kbd> + <kbd>letter</kbd>: Set mark at current position
- <kbd>'</kbd> + <kbd>letter</kbd>: Jump to line of mark
- <kbd>`</kbd> + <kbd>letter</kbd>: Jump to exact position of mark

## Folding
- <kbd>zf</kbd>: Create fold
- <kbd>zo</kbd>: Open fold
- <kbd>zc</kbd>: Close fold
- <kbd>za</kbd>: Toggle fold
- <kbd>zR</kbd>: Open all folds
- <kbd>zM</kbd>: Close all folds

---

## Included Plugins

<div align="center">

| Plugin | Description |
|:-------|:------------|
| **[lazy.nvim](https://github.com/folke/lazy.nvim)** | Modern plugin manager |
| **[gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)** | Beautiful color scheme |
| **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** | File explorer with git integration |
| **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** | Fuzzy finder and searcher |
| **[copilot.vim](https://github.com/github/copilot.vim)** | GitHub Copilot AI integration |
| **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** | Language server configuration |
| **[mason.nvim](https://github.com/williamboman/mason.nvim)** | Package manager for LSP servers |
| **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** | Intelligent completion engine |
| **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** | Sleek status line |
| **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** | Automatic bracket pairs |
| **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** | Smart code commenting |

</div>

---
## Support & Contribute

### Star this repo
If you find this configuration useful, please consider giving it a star!

[![GitHub stars](https://img.shields.io/github/stars/nurmuhammedjoy/zenvim?style=social)](https://github.com/nurmuhammedjoy/zenvim)

### Report issues
Found a bug or have a feature request? 

[Open an issue](https://github.com/nurmuhammedjoy/zenvim/issues/new)

---
