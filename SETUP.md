# Manjaro System Dependencies for This Neovim Config

1. Core CLI & Search Tools:
   sudo pacman -S neovim git ripgrep fd fzf unzip curl base-devel

2. Language Runtimes (for Mason LSPs/Formatters):
   sudo pacman -S python python-pip rustup go luarocks
   # Plus nvm (Node.js) for vtsls, biome, prettierd, tailwindcss, svelte

3. Offline Docs (Zeal):
   sudo pacman -S zeal
