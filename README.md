# Neovim (LazyVim) — Low-RAM Developer Configuration

A fast, lightweight, and fully featured **LazyVim** configuration tuned specifically for low-RAM hardware (**3.7 GiB RAM**, Acer One 14 on **Manjaro Linux XFCE**), achieving **~59–77ms cold startup** without sacrificing full-stack IDE capabilities.

---

## Key Highlights & Performance Tuning

- **Fast Startup (~59–77ms):** Built-in legacy plugins (`netrwPlugin`, `matchit`, `matchparen`) disabled in `lua/config/lazy.lua`.
- **Modern Completion Engine:** Migrated from `nvim-cmp` + `LuaSnip` to **`blink.cmp`** (`coding.blink`) with `Enter` reserved for newlines and `<C-y>` for accepting completions.
- **Memory-Capped LSPs (`lua/plugins/performance.lua`):**
  - **`vtsls` (TypeScript/JS):** Capped at `maxTsServerMemory = 1024` MB.
  - **`pyright` (Python):** `useLibraryCodeForTypes = false` and `diagnosticMode = "openFilesOnly"` to prevent indexing massive libraries into RAM.
  - **`rustaceanvim` (Rust):** Uses `cargo check` on save with `cachePriming.enable = false`.
  - **`nvim-lint`:** Triggered only on `BufWritePost`, `BufReadPost`, and `InsertLeave` (no constant typing overhead).
- **Offline Documentation (`Zeal` + `zeavim.lua`):** Lazy-loaded on `<leader>z` with mapped docset prefixes (`python3`, `django`, `rust`, `svelte`, `react`, `typescript`, `javascript`, `tailwindcss`, `html`, `css`, `bootstrap`, `docker`).

---

## Language & Tooling Stack

| Domain | LSP / Linter / Debugger | Formatter (`conform.nvim`) |
| :--- | :--- | :--- |
| **Python / Django** | `pyright`, `ruff`, `djlsp`, `debugpy` | `ruff_format`, `ruff_organize_imports` |
| **Rust** | `rust-analyzer`, `codelldb` | `rustfmt` (via `rustaceanvim`) |
| **JS / TS / React** | `vtsls`, `oxlint` | `biome` |
| **Svelte / Web** | `svelte-language-server`, `tailwindcss`, `emmet_language_server`, `html-lsp`, `css-lsp` | `prettierd` |
| **Lua / Shell / JSON** | `lua-language-server`, `json-lsp` | `stylua`, `shfmt`, `biome` |

---

## Fresh System Restore Guide (Manjaro / Arch Linux)

Follow these steps to restore this exact editor environment on a clean Manjaro installation:

### 1. Install System Dependencies
Install core CLI tools, compilers, and language runtimes required by Mason and Treesitter:
```bash
sudo pacman -S neovim git ripgrep fd fzf unzip curl base-devel python python-pip rustup zeal
```

*(Optional)* Set up Node.js via `nvm` (needed for `vtsls`, `biome`, `prettierd`, `tailwindcss`, and `svelte-language-server`):
```bash
# Install nvm and latest LTS Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install --lts
```

### 2. Clone This Configuration
Clone directly into `~/.config/nvim` (replace `<your-username>` with your GitHub username):
```bash
git clone https://github.com/<your-username>/nvim-config.git ~/.config/nvim
```

### 3. Bootstrap Plugins & Mason Tools
Launch Neovim:
```bash
nvim
```
- **`lazy.nvim`** will automatically read `lazyvim.json` and `lazy-lock.json` to restore all enabled `:LazyExtras` (`coding.blink`, `dap.core`, `lang.python`, `lang.rust`, `lang.svelte`, `lang.tailwind`, `lang.typescript`, etc.) at their exact pinned commits.
- **`mason.nvim`** will automatically download and configure all LSPs, formatters, linters, and debug adapters (`pyright`, `ruff`, `debugpy`, `rust-analyzer`, `codelldb`, `vtsls`, `biome`, `prettierd`, `oxlint`, etc.).

---

## Useful Keybindings Reference

- **Completions (`blink.cmp`):** `<C-y>` to accept, `<C-n>` / `<C-p>` to cycle items, `<CR>` inserts newline.
- **Offline Docs (`Zeal`):** `<leader>z` to look up word under cursor in Zeal.
- **Debugging (`nvim-dap`):**
  - `<leader>db` — Toggle breakpoint
  - `<leader>da` — Start debugging / run with arguments (`:RustLsp debuggables` for Rust)
  - `<leader>dt` — Terminate debug session
  - `<leader>du` — Toggle debugger UI
